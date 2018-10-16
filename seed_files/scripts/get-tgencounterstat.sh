#/bin/bash

# get the csv output from the spreadheet and 
# strip the first column and first row
# then remove duplicates (there will be many) 

wget --output-file=wget.log  --output-document=- 'https://docs.google.com/spreadsheets/d/e/2PACX-1vRuK1E9ZKJhAQRAY7vutoc0KWcsIOi-h9hWD-EOy7Qlk2UGDj2qupuw3W99yg_iZuW0M4_J3Limf9OS/pub?gid=1611826950&single=true&output=csv' | tail -n +2 | cut -d"," -f2- | sort | uniq > ../CSV/tgencounterstat.csv

# damnit google why don't you put the final \r at the end!
dos2unix ../CSV/tgencounterstat.csv

# load that sucka!
echo Database Root Password
mysql -u root -p < ../SQL/tgencounterstat.sql

