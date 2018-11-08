# -*- coding: utf-8 -*-

'''
python3 body_update_edsm.py --development

This will get a list of system id64s 
it will also stream the bodies dump from EDSM

ech system it recognises fromn the list it will do an update or insert on the body


'''

import argparse
import json
import requests
import os
import pymysql.cursors
import time
import urllib
import csv

from datetime import datetime

"""
Running anywhere needs the following:
pip3 install PyMySQL
pip3 install requests
"""
cwd = os.getcwd()
config_file_path = '../../config/environments/{}/database.json'

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


# Add an argument to set a maximum batch amount before stopping
parser.add_argument(
    '-seedfile',
    help='path to the seed file',
    dest='seed_file',
    type=str,
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

if not args.seed_file:
    print('You need to specify the path of a seedfile with -seedfile')
    quit()


file_exists = os.path.isfile(args.seed_file)
if not file_exists:
    print('Seed file at path: {} does not exist. Please double check that the directory is correct'.format(actual_config_file_path))

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

table_name=os.path.basename(args.seed_file).split("-")[0]
seed_path=os.path.abspath(args.seed_file)

print("Loading data for {}".format(table_name))

schema_sql='''
    select 
    column_name from information_schema.columns 
    where lower(table_name) = {} 
    order by ordinal_position asc
'''

truncate_sql="truncate table {}";

# filename tablename columnslist
load_sql='insert into {} ({}) values ({})'


columns=[]
colstr=""
placestr=""

try:
    print('Opening connection to MySQL DB')
    with connection.cursor() as cursor:
        
        cursor.execute(schema_sql.format('%s'),(table_name))
        result = cursor.fetchall()
        for row in result:
            columns.append(row["column_name"])
            colstr=colstr+","+row["column_name"]
            placestr=placestr+",%s"
	   
        print(colstr[1:])    
        placestr=placestr[1:]

        cursor.execute(truncate_sql.format(table_name))

        with open(seed_path) as csvfile:
            reader = csv.reader(csvfile, delimiter = ',')
	    #skip first row
            next(reader,None)
            for row in reader:
                print("inserting")
                cursor.execute(load_sql.format(table_name,colstr[1:],placestr),row)

        connection.commit()

finally:
    print('Closing connection to MySQL DB')
    connection.commit()
    connection.close()

