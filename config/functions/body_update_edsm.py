# -*- coding: utf-8 -*-
import argparse
import json
import requests
import os
import pymysql.cursors
import time
import urllib

from datetime import datetime

"""
Running anywhere needs the following:
pip3 install PyMySQL
pip3 install requests
"""
cwd = os.getcwd()
#config_file_path = cwd + '/config/environments/{}/database.json'
config_file_path = '../environments/{}/database.json'

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

# Add an argument to set a maximum batch amount before stopping
parser.add_argument(
    '-batch-limit',
    help='Customise the number of batches to run before stopping to prevent large updates',
    dest='batch_limit',
    type=int,
    default=10
)

# Add an argument to set a maximum batch amount before stopping
parser.add_argument(
    '-day-limit',
    help='number of days between updates',
    dest='day_difference_threshold',
    type=int,
    default=1
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

day_difference_threshold=args.day_difference_threshold

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


insert_sql = '''insert into bodies (
    system,
    bodyName,
    edsmID,
    edsmID64,
    edsmBodyID,
    edsmType,
    edsmSubtype,
    edsmOffset,
    edsmDistanceToArrival,
    edsmIsMainStar,
    edsmIsScoopable,
    edsmIsLandable,
    edsmAge,
    edsmLuminosity,
    edsmAbsoluteMagnitude,
    edsmSolarMasses,
    edsmSolarRadius,
    edsmGravity,
    edsmEarthMasses,
    edsmRadius,
    edsmSurfaceTemperature,
    edsmSurfacePressure,
    edsmVolcanismType,
    edsmAtmosphereType,
    edsmTerraformingState,
    edsmOrbitalPeriod,
    edsmSemiMajorAxis,
    edsmOrbitalEccentricity,
    edsmOrbitalInclination,
    edsmArgOfPeriapsis,
    edsmRotationalPeriod,
    edsmRotationalPeriodTidallyLocked,
    edsmAxialTilt,
    edsmSolidComposition,
    edsmAtmosphere,
    edsmMaterial
    ) values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
'''

update_sql = '''
update bodies
set 
    bodyName = %s,
    edsmID = %s,
    edsmID64 = %s,
    edsmBodyID = %s,
    edsmType = %s,
    edsmSubtype = %s,
    edsmOffset = %s,
    edsmDistanceToArrival = %s,
    edsmIsMainStar = %s,
    edsmIsScoopable = %s,
    edsmIsLandable = %s,
    edsmAge = %s,
    edsmLuminosity = %s,
    edsmAbsoluteMagnitude = %s,
    edsmSolarMasses = %s,
    edsmSolarRadius = %s,
    edsmGravity = %s,
    edsmEarthMasses = %s,
    edsmRadius = %s,
    edsmSurfaceTemperature = %s,
    edsmSurfacePressure = %s,
    edsmVolcanismType = %s,
    edsmAtmosphereType = %s,
    edsmTerraformingState = %s,
    edsmOrbitalPeriod = %s,
    edsmSemiMajorAxis = %s,
    edsmOrbitalEccentricity = %s,
    edsmOrbitalInclination = %s,
    edsmArgOfPeriapsis = %s,
    edsmRotationalPeriod = %s,
    edsmRotationalPeriodTidallyLocked = %s,
    edsmAxialTilt = %s,
    edsmSolidComposition = %s,
    edsmAtmosphere = %s,
    edsmMaterial = %s
    where edsmID64 = %s and system=%s
'''

def insert_body(cursor,body_data,system_id):
    print("insert_body")
    try:
        cursor.execute(
            insert_sql,
            (
                system_id,
                bodyname(body_data.get("systemName"),body_data.get("name")),
                body_data.get("id"),
                body_data.get("id64"),
                body_data.get("bodyId"),
                body_data.get("type"),
                body_data.get("subType"),
                body_data.get("offset"),
                body_data.get("distanceToArrival"),
                body_data.get("isMainStar"),
                body_data.get("isScoopable"),
                body_data.get("isLandable"),
                body_data.get("age"),
                #body_data.get("spectralClass"),
                body_data.get("luminosity"),
                body_data.get("absoluteMagnitude"),
                body_data.get("solarMasses"),
                body_data.get("solarRadius"),
                body_data.get("gravity"),
                body_data.get("earthMasses"),
                body_data.get("radius"),
                body_data.get("surfaceTemperature"),
                body_data.get("surfacePressure"),
                body_data.get("volcanismType"),
                body_data.get("atmosphereType"),
                body_data.get("terraformingState"),
                body_data.get("orbitalPeriod"),
                body_data.get("semiMajorAxis"),
                body_data.get("orbitalEccentricity"),
                body_data.get("orbitalInclination"),
                body_data.get("argOfPeriapsis"),
                body_data.get("rotationalPeriod"),
                body_data.get("rotationalPeriodTidallyLocked"),
                body_data.get("axialTilt"),
                json.dumps(body_data.get("solidComposition"), sort_keys=True, indent=4),
                json.dumps(body_data.get("atmosphere"), sort_keys=True, indent=4),
                json.dumps(body_data.get("material"), sort_keys=True, indent=4),
            )
        )
        connection.commit()
        #
        # We arent bothering with rings for now.
        #
        # ring type is a foreign key to the ringTYpe model so would need to be loked up before storing
        #
        #if body_data.get("rings"):
        #    for ring in body_data.get("rings"):
        #        cursor.execute(insert_ring,(body_id,ring.get("name"),ring.get("type"),ring.get("mass"),ring.get("innerRadius"),ring.get("outerRadius")))
        #        print(json.dumps(ring))
    except connection.ProgrammingError as err:
        connection.commit()
        print("Something went wrong: {}".format(err))
        quit()


def update_body(cursor,body_data,system_id):
    print("update_body")
    try:
        cursor.execute(
            update_sql,
            (
                bodyname(body_data.get("systemName"),body_data.get("name")),
                body_data.get("id"),
                body_data.get("id64"),
                body_data.get("bodyId"),
                body_data.get("type"),
                body_data.get("subType"),
                body_data.get("offset"),
                body_data.get("distanceToArrival"),
                body_data.get("isMainStar"),
                body_data.get("isScoopable"),
                body_data.get("isLandable"),
                body_data.get("age"),
                #body_data.get("spectralClass"),
                body_data.get("luminosity"),
                body_data.get("absoluteMagnitude"),
                body_data.get("solarMasses"),
                body_data.get("solarRadius"),
                body_data.get("gravity"),
                body_data.get("earthMasses"),
                body_data.get("radius"),
                body_data.get("surfaceTemperature"),
                body_data.get("surfacePressure"),
                body_data.get("volcanismType"),
                body_data.get("atmosphereType"),
                body_data.get("terraformingState"),
                body_data.get("orbitalPeriod"),
                body_data.get("semiMajorAxis"),
                body_data.get("orbitalEccentricity"),
                body_data.get("orbitalInclination"),
                body_data.get("argOfPeriapsis"),
                body_data.get("rotationalPeriod"),
                body_data.get("rotationalPeriodTidallyLocked"),
                body_data.get("axialTilt"),
                json.dumps(body_data.get("solidComposition"), sort_keys=True, indent=4),
                json.dumps(body_data.get("atmosphere"), sort_keys=True, indent=4),
                json.dumps(body_data.get("material"), sort_keys=True, indent=4),
                body_data.get("id64"),
                system_id
            )
        )
        #
        # We arent bothering with rings for now.
        #
        # ring type is a foreign key to the ringTYpe model so would need to be loked up before storing
        #
        #if body_data.get("rings"):
        #    for ring in body_data.get("rings"):
        #        cursor.execute(insert_ring,(body_id,ring.get("name"),ring.get("type"),ring.get("mass"),ring.get("innerRadius"),ring.get("outerRadius")))
        #        print(json.dumps(ring))
    except connection.ProgrammingError as err:
        connection.commit()
        print("Something went wrong: {}".format(err))
        quit()

def bodyname(system,body):
    if system in body:
        l=len(system)-len(body)
        return body[l:].strip()
    else:
        return body



def refresh_body(cursor,body):
    sql_select='select s.id,b.edsmID64 from systems s left join bodies b on s.id = b.system and b.edsmID64 = {} where s.edsmId64 = {}'
    print(sql_select.format(body.get("id64"),body.get("systemId64")))
    cursor.execute(sql_select.format('%s','%s'),(body.get("id64"),body.get("systemId64")))
    result = cursor.fetchone()
    if result:
        system_id=result.get("id")
        if result.get("edsmID64"):
            update_body(cursor,body,system_id)
        else:
            insert_body(cursor,body,system_id)
    else:
        print ("This result is not possible, the system must exist")
        print(body)

# we are going to populate an array with edsmId64
# this wont take a lot of memory unless we have millions of systems so no limit
get_systems_sql = 'select edsmID64 from systems where edsmID64 is not null';

systemids=[]

try:
    print('Opening connection to MySQL DB')
    with connection.cursor() as cursor:
        
        cursor.execute(get_systems_sql)
        result = cursor.fetchall()
        for row in result:
            systemids.append(int(row['edsmID64']))
    
        #we now have a set of system ids
        # we can download the edsm bodies update and look for our bodies

        url="https://www.edsm.net/dump/bodies7days.json"
        r=requests.get(url,stream=True)
        #print(r.headers)

        for txt in r.iter_lines():
            
            line=txt.decode('utf-8')
            if line not in ('[',']'):
                try:
                    if line[-1:] == ",":
                        d=json.loads(line[:-1])
                    else:
                        d=json.loads(line)
                    
                    if d["systemId64"] in systemids:
                        refresh_body(cursor,d) 
                except:
                    print("ERROR")
                    print(line)
                    raise

finally:
    print('Closing connection to MySQL DB')
    connection.close()

'''
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
            for chunk_index, chunk in enumerate(list(chunks(names_to_update, args.batch_size))):
                # add the params manually since they're duplicates
                print('Processing Chunk #{}, {} to {}'.format(chunk_index + 1, chunk[0], chunk[-1]))
                for index, name in enumerate(chunk):
                    if not index == 0:
                        url = edsm_api_bodies_url
                        url += '?systemName={}'.format(urllib.parse.quote_plus(name))
                        response = requests.get(url)
                        print(url) 
                        all_body_data = response.json()
                        for body_data in all_body_data["bodies"]:
                            print(body_data)
                            #cursor.execute(
                            #    insert_sql,
                            #    (
                            #        system_data['coords']['x'],
                            #        system_data['coords']['y'],
                            #        system_data['coords']['z'],
                            #        system_data['id'],
                            #        system_data['id64'],
                            #        1 if system_data['coordsLocked'] else 0,
                            #        system_data['name']
                            #    )
                            #)
                time.sleep(args.delay_seconds)
        else:
            print('No systems to update')
    connection.commit()
finally:
    print('Closing connection to MySQL DB')
    connection.close()

'''
