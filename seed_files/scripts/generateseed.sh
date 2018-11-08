#!/bin/bash
status=${1-development} ;  shift

echo "---"
pwd
echo "---"

#echo "Downloading updated seed CSVs before loading into database" && sleep 1 && ./get-sheetdata.sh
sleep 1
echo "Seed files updated, pushing all data into current database"

sleep 1
echo "Strapi Core Files..."
sleep 1

###
# Error with core_store is likely the schema entry being fucking huge
###
#python3 loadseed.pl --development -seedfile ../CSV/core_store.csv

python3 loadseed.pl --development -seedfile ../CSV/upload_file_morph.csv
python3 loadseed.pl --development -seedfile ../CSV/upload_file.csv

###
# Error on the 3 user files is python is ignoring the `users-` part of the table name so it is trying to load into '-permissions_permission'
# I think there is an issue with the - char
###

#python3 loadseed.pl --development -seedfile ../CSV/users-permissions_permission.csv
#python3 loadseed.pl --development -seedfile ../CSV/users-permissions_role.csv
#python3 loadseed.pl --development -seedfile ../CSV/users-permissions_user.csv
sleep 1
echo "Canonn Data Files..."
sleep 1

###
# Error with all these files is `TypeError: not enough arguments for format string`
# I modified the bmsites export to include the missing created_at & updated_at but still getting the error
###
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/bmsites.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/bodies.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/btsites.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/cmdrs.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/fgsites.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/fmsites.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/fmtypes.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/gbmessages.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/gbsites.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/gractivegroups.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/gractiveobelisks.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/grartifacts.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/grcodexcategories.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/grcodexdata.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/grgroups.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/grobelisks.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/grsites.csv
python3 loadseed.pl --development -seedfile ../CSV/exampleData/grtypes.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/gsactivegroups.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/gsactiveobelisks.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/gsartifacts.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/gscodexcategories.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/gscodexdata.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/gsgroups.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/gsobelisks.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/gssites.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/gstypes.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/gysites.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/gytypes.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/lssites.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/mstypes.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/ringtypes.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/systems.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/tbcycles.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/tbsites.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/tbtypes.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/tssites.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/tsstatuses.csv
#python3 loadseed.pl --development -seedfile ../CSV/exampleData/usstypes.csv
