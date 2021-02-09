#!/bin/bash
DATA_USER=$1
DATA_PASS=$2
DATA_TABLE=$3

USER_USER=$4
USER_PASS=$5
USER_TABLE=$6

# Run SQL Migration
echo "Running data migration"
mysql --user=$DATA_USER --password=$DATA_PASS $DATA_TABLE < scripts/Migration/migrate_v3.4.x_data.sql
sleep 10

echo "Running user migration"
mysql --user=$USER_USER --password=$USER_PASS $USER_TABLE < scripts/Migration/migrate_v3.4.x_user.sql
sleep 10

echo "Dumping user tables to import to data"
mysqldump --user=$USER_USER --password=$USER_PASS $USER_TABLE cmdrs users-permissions_permission users-permissions_role users-permissions_user users-permissions_user__cmdrs > dump_v3.4.x_user.sql
sleep 10

echo "Restoring user tables to data"
mysql --user=$DATA_USER --password=$DATA_PASS $DATA_TABLE < dump_v3.4.x_user.sql
sleep 10

echo "Deleting dump"
rm dump_v3.4.x_user.sql
sleep 10

# Import Admin Perm dump
echo "Running perm migration"
mysql --user=$DATA_USER --password=$DATA_PASS $DATA_TABLE < scripts/Migration/migrate_v3.4.x_admin.sql
sleep 10

# Import core dump
echo "Running core migration"
yarn strapi config:restore -f core_dump/dump_3.4.x.json -s replace
sleep 10

# Strapi Migration Guide Script
echo "Running Strapi migration guide script"
node scripts/Migration/migrate_v3.4.x_strapi.js ./
sleep 10

echo "Migration done!"
