#!/bin/bash
MYSQL_USER=$1
MYSQL_PASS=$2
DATA_TABLE=$3
USER_TABLE=$4

# Run SQL Migration
echo "Running data migration"
mysql --user=$MYSQL_USER --password=$MYSQL_PASS $DATA_TABLE < scripts/Migration/migrate_v3.3.x_data.sql
sleep 10

echo "Running user migration"
mysql --user=$MYSQL_USER --password=$MYSQL_PASS $USER_TABLE < scripts/Migration/migrate_v3.3.x_user.sql
sleep 10

# Import Admin Perm dump
echo "Running perm migration"
mysql --user=$MYSQL_USER --password=$MYSQL_PASS $DATA_TABLE < scripts/Migration/migration_v3.3.x_admin.sql
sleep 10

# Import core dump
echo "Running core migration"
yarn strapi config:restore -f core_dump/dump_3.3.3.json -s replace
