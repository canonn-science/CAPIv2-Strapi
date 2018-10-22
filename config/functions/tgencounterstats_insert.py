import argparse
import json
import requests
import os
import pymysql.cursors
import time
import urllib

"""
Running anywhere needs the following:
pip3 install PyMySQL
pip3 install requests
"""
cwd = os.getcwd()
config_file_path = cwd + '/config/environments/{}/database.json'
#config_file_path = '../environments/{}/database.json'



# Initialising the Argument Parser and adding the three arguments required:
# 1. Development
# 2. Staging
# 3. Production
parser = argparse.ArgumentParser(description='Script to perform actions on insert of Thargoid Stats')


parser.add_argument(
    '--development',
    help='Run script in development mode',
    action='store_true',
    dest='is_dev'
)

parser.add_argument(
    '--staging',
    help='Run script in staging mode',
    dest='is_staging',
    action='store_true'
)

parser.add_argument(
    '--production',
    help='Run script in production mode',
    dest='is_prod',
    action='store_true'
)

# Add an argument to enable passing a non-default config file path
parser.add_argument(
    '-config-file-path',
    help='Pass a specific config file path. If not provided, one according to the running mode (dev/stage/prod) will be used',
    dest='config_path',
    type=str,
    default=config_file_path
)

# Add an argument to enable passing a non-default config file path
parser.add_argument(
    '-system',
    help='The name of the system where the commander was last hyperdicted',
    dest='systemName',
    type=str,
    default=None
)

args = parser.parse_args()

def get_status_string():
    if args.is_prod:
        return 'production'
    if args.is_staging:
        return 'staging'
    if args.is_dev:
        return 'development'
    return None

status_string = get_status_string()
if not status_string:
    print('Unable to run without specifying an environment type (pass --development, --staging or --production')
    quit()

actual_config_file_path = args.config_path.format(status_string)

print('Reading in environment data from path: {}'.format(actual_config_file_path))
file_exists = os.path.isfile(actual_config_file_path)
if not file_exists:
    print('Config file at path: {} does not exist. Please double check that the directory is correct'.format(actual_config_file_path))
    quit()

# Extract required config data
with open(actual_config_file_path, 'r') as config_file:
    data = json.loads(config_file.read())

host = data['connections']['default']['settings']['host']
port = data['connections']['default']['settings']['port']
database = data['connections']['default']['settings']['database']
username = data['connections']['default']['settings']['username']
password = data['connections']['default']['settings']['password']

# Initialise connection to MySQL
connection = pymysql.connect(
    host=host,
    port=port,
    user=username,
    password=password,
    db=database,
    charset='utf8',
    cursorclass=pymysql.cursors.DictCursor
)

edsm_api_systems_url = 'https://www.edsm.net/api-v1/systems?systemName={}&showCoordinates=1&showId=1'
system_sql="select * from systems where systemName = %s"
update_sql = 'UPDATE `systems` SET edsmCoordX=%s, edsmCoordY=%s, edsmCoordZ=%s, edsmID=%s, edsmID64=%s, edsmCoordLocked=%s WHERE id = %s'

def update_misscount(cursor,key,table):
    print("Bumping up missingSkipCount")
    try:
        cursor.execute("update {} set missingSkipCount = ifnull(missingSkipCount,0) +1 where id = %s".format(table),(key))
    except connection.ProgrammingError as err:
        print("Something went wrong: {}".format(err))
        quit()


print('Opening connection to MySQL DB')
with connection.cursor() as cursor:

    print ("Check if the system is already loaded")
    print (args.systemName)

    cursor.execute(system_sql,(args.systemName))
    result = cursor.fetchone()
    
    if not result:
        print("The system is missing")
        try:
            cursor.execute("insert into systems (systemName) values(%s)",(args.systemName))
            systemId=connection.insert_id()
        except connection.ProgrammingError as err:
            print("Something went wrong: {}".format(err))
            quit()
    else:
        systemId=result["id"]
            

    print ("if system needs EDSM data fetch from EDSM and update")
    
    if  not result or not result.get("esdmId"):
        print("fetch and update EDSM data")
        url = edsm_api_systems_url.format(urllib.parse.quote_plus(args.systemName))
        response = requests.get(url)
        systems_data = response.json()
        if systems_data:
            system_data=systems_data[0]

            print(json.dumps(system_data))
            try:
              cursor.execute(
                  update_sql,
                  (
                      system_data['coords']['x'],
                      system_data['coords']['y'],
                      system_data['coords']['z'],
                      system_data['id'],
                      system_data['id64'],
                      1 if system_data['coordsLocked'] else 0,
                      systemId
                  )
              )
            except connection.ProgrammingError as err:
              connection.commit()
              print("Something went wrong: {}".format(err))
              quit()
        else:
            print("no system data from edsm")
            update_misscount(cursor,systemId,'systems')
        

    connection.commit()
print ("Write to aggregation models")


