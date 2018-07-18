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

insert_sql = """ 
insert into nhsstopcommandersbykills (
	CommanderName,
	scout_kills,
	cyclops_kills,
	basilisk_kills,
	medusa_kills,
	unknown_kills,
        total_kills,
	scout_rewards,
	cyclops_rewards,
	basilisk_rewards,
	medusa_rewards,
	unknown_rewards,
	total_rewards
) 
select 
    commander,
    sum(case when reward = 10000 then 1 else 0 end) as scout_kills,
    sum(case when reward = 2000000 then 1 else 0 end) as cyclops_kills,
    sum(case when reward = 6000000 then 1 else 0 end) as basilsk_kills,
    sum(case when reward = 10000000 then 1 else 0 end) as medusa_kills,
    sum(case when reward not in (10000,2000000,6000000,10000000) then 1 else 0 end) as unknown_kills,
    count(*) as total_kills,
     sum(case when reward = 10000 then reward else 0 end) as scout_reward,
    sum(case when reward = 2000000 then reward else 0 end) as cyclops_reward,
    sum(case when reward = 6000000 then reward else 0 end) as basilsk_reward,
    sum(case when reward = 10000000 then reward else 0 end) as medusa_reward,
    sum(case when reward not in (10000,2000000,6000000,10000000) then reward else 0 end) as unknown_reward,
    count(*) as total_reward
from factionkillbondreport 
where victimFaction = %s
group by commander order by count(*) desc
limit 10
"""

c = connection.cursor()
#connection.start_transaction();
        # Create a new record
try:
    c.execute('delete from nhsstopcommandersbykills');
    c.execute(insert_sql,('$faction_Thargoid;'))
    connection.commit()
except:
    connection.rollback() 

connection.close()
