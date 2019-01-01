# -*- coding: utf-8 -*-

'''
python3 loadseed.pl --development -seedfile ../path/to/seed/csv/file

Script used to load example data from CSV format into the development database

'''

'''
Running anywhere needs the following:
pip3 install PyMySQL
pip3 install requests
'''

import argparse
import json
import requests
import os
import pymysql.cursors
import time
import urllib
import csv
import subprocess

from datetime import datetime


cwd = os.getcwd()
config_file_path = '../../config/environments/{}/database.json'

# Initialising the Argument Parser and adding the three arguments required:
# 1. Development
# 2. Staging
# 3. Production
parser = argparse.ArgumentParser(description='Script used to load example data from CSV format into the development database')

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


# Path to seed CSV File
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
path = '../CSV/exampleData/bmsites.csv'

# Use mysqlimport to load the seedfile into the database

subprocess.call([
  "mysqlimport",
  "--ignore-lines=1",
  "--fields-terminated-by=,",
  "--verbose",
  "--local",
  "--replace",
  "--host", host,
  "--port", port,
  "--user", username,
  "--password", password,
  database,
  path
  ],
  shell=True
)

