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

#day_difference_threshold = 0
edsm_api_bodies_url = 'https://www.edsm.net/api-system-v1/bodies'
current_date = datetime.now()
names_to_update = []

no_bodies_select_sql = 'SELECT * FROM systems s where not exists (select 1 from bodies b where b.system = s.id) limit '+str(args.batch_size * args.batch_limit)

insert_ring = '''
    insert into rings (body, ringName, ringtype, edsmMass, edsmInnerRadius, edsmOuterRadius)
    values (%s, %s, %s, %s, %s, %s)
'''

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

    

# Reference:
# https://stackoverflow.com/questions/312443/how-do-you-split-a-list-into-evenly-sized-chunks
def chunks(l, n):
    # Yield successive n-sized chunks from l
    for i in range(0, len(l), n):
        yield l[i:i + n]

def bodyname(system,body):
    if system in body:
        l=len(system)-len(body)
        return body[l:].strip()
    else:
        return body

print('Running in insert missing mode')
try:
    print('Opening connection to MySQL DB')
    with connection.cursor() as cursor:
        cursor.execute(no_bodies_select_sql)
        result = cursor.fetchall()
        for row in result:
            systemName = row['systemName']
            id= row["id"]
            names_to_update.append((systemName,id))

        print('Inserting {} rows'.format(len(names_to_update)))
        if len(names_to_update) > 0:
            for chunk_index, chunk in enumerate(list(chunks(names_to_update, args.batch_size))):
                # add the params manually since they're duplicates
                print('Processing Chunk #{}, {} to {}'.format(chunk_index + 1, chunk[0], chunk[-1]))
                for index, system in enumerate(chunk):
                    name,id=system
                    url = edsm_api_bodies_url
                    url += '?systemName={}'.format(urllib.parse.quote_plus(name))
                    response = requests.get(url)
                    print(url) 
                    all_body_data = response.json()
                    for body_data in all_body_data["bodies"]:
                        #print(json.dumps(body_data, sort_keys=True, indent=4))
                        try:
                            cursor.execute(
                                insert_sql,
                                (
                                    id, 
                                    bodyname(name,body_data.get("name")),
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
                                    json.dumps(body_data.get("material"), sort_keys=True, indent=4)
                                )
                            )
                            body_id=connection.insert_id()
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
                time.sleep(args.delay_seconds)
        else:
            print('No systems to update')
    connection.commit()
finally:
    print('Closing connection to MySQL DB')
    connection.close()
