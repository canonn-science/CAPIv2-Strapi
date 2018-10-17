#/bin/bash

# get the csv output from the spreadheet and 
# strip the first column and first row
# then remove duplicates (there will be many) 

wget --output-file=wget.log  --output-document=- 'https://docs.google.com/spreadsheets/d/e/2PACX-1vR8J04FrEoJ_a4nPI6rIyIsH2X41iQmICUaxK_SwdvL8PVq1-CBDynCF1vo3oFNM5krjwotkaIrH5Al/pub?gid=1871731906&single=true&output=csv' | cut -d"," -f1-9 | tail -n +2  > ../CSV/factionkills.csv

wget --output-file=wget.log  --output-document=- 'https://docs.google.com/spreadsheets/d/e/2PACX-1vSNTBQY-VlPzT9O6qLaKeC8Fgfhnbbca_BFm7koYJZsJBPLLGvIu88SQZeonqTIIeC-LYRcAywXpabY/pub?gid=1871731906&single=true&output=csv' | cut -d"," -f1-9 | tail -n +2  >> ../CSV/factionkills.csv

# damnit google why don't you put the final \r at the end!
dos2unix ../CSV/factionkills.csv

# load that sucka!
echo Database Root Password
mysql -u root -p < ../SQL/factionkills.sql

