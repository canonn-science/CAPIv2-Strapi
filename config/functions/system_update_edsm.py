import argparse
import json
import requests
import os
import pymysql.cursors
import time

from datetime import datetime

"""
Running anywhere needs the following:
pip3 install PyMySQL
pip3 install requests
"""

config_file_path = '../environments/{}/database.json'
# config_file_path = '../environments/{}/database.json'

# Initialising the Argument Parser and adding the three arguments required:
# 1. Development
# 2. Staging
# 3. Production
parser = argparse.ArgumentParser(description='Update script to retrieve missing stellar system information from EDSM')

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

# Add an argument to force checking for all systems with a missing edsmId rather than according to how long ago they were updated
parser.add_argument(
    '--update-missing',
    help='Update systems with missing EDSM IDs rather than according to their last updated timestamp',
    dest='update_missing_mode',
    action='store_true',
)

# Add an argument to set a custom number of seconds waited between batches of updates
parser.add_argument(
    '-delay-seconds',
    help='Customise number of seconds between update batches. Default is 1',
    dest='delay_seconds',
    type=int,
    default=1
)

# Add an argument to set a maximum batch size of systems to be retrieved at once
parser.add_argument(
    '-batch-size',
    help='Customise number of systems retrieved at once. Default is 25',
    dest='batch_size',
    type=int,
    default=25
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

day_difference_threshold = 1
edsm_api_systems_url = 'https://www.edsm.net/api-v1/systems'
current_date = datetime.now()
names_to_update = []

updated_at_select_sql = 'SELECT systemName, updated_at FROM systems'
null_edsm_id_select_sql = 'SELECT systemName FROM systems WHERE edsmID is NULL'
insert_sql = 'UPDATE `systems` SET edsmCoordX=%s, edsmCoordY=%s, edsmCoordZ=%s, edsmID=%s, edsmID64=%s, edsmCoordLocked=%s WHERE systemName LIKE \'{}\''


# Reference:
# https://stackoverflow.com/questions/312443/how-do-you-split-a-list-into-evenly-sized-chunks
def chunks(l, n):
    # Yield successive n-sized chunks from l
    for i in range(0, len(l), n):
        yield l[i:i + n]


print('Running in update missing mode' if args.update_missing_mode else 'Running in last updated mode')
try:
    print('Opening connection to MySQL DB')
    with connection.cursor() as cursor:
        if args.update_missing_mode:
            cursor.execute(null_edsm_id_select_sql)
            result = cursor.fetchall()
            for row in result:
                systemName = row['systemName']
                names_to_update.append(systemName)
        else:
            cursor.execute(updated_at_select_sql)
            result = cursor.fetchall()
            for row in result:
                systemName = row['systemName']
                date = row['updated_at']
                elapsed_time = current_date - date
                if elapsed_time.days >= day_difference_threshold:
                    names_to_update.append(systemName)
        print('Updating {} rows'.format(len(names_to_update)))
        if len(names_to_update) > 0:
            # add the params manually since they're duplicates
            url = edsm_api_systems_url + '?showId=1&showCoordinates=1&showPermit=1&'
            for chunk in list(chunks(names_to_update, args.batch_size)):
                for index, name in enumerate(chunk):
                    if not index == 0:
                        url += '&'
                    url += 'systemName[]={}'.format(name)
                response = requests.get(url)
                all_systems_data = response.json()
                for system_data in all_systems_data:
                    print('Updating: {}'.format(system_data['name']))
                    cursor.execute(
                        insert_sql.format(system_data['name']),
                        (
                            system_data['coords']['x'],
                            system_data['coords']['y'],
                            system_data['coords']['z'],
                            system_data['id'],
                            system_data['id64'],
                            1 if system_data['coordsLocked'] else 0
                        )
                    )
                time.sleep(args.delay_seconds)
        else:
          print('No systems to update')
    connection.commit()
finally:
    print('Closing connection to MySQL DB')
    connection.close()
