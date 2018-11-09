#/bin/bash

# get the csv output from the spreadheet and 
# strip the first column and first row
# then remove duplicates (there will be many) 
echo Getting the sheet data. it will take ages.
wget --output-file=wget.log  --output-document=- 'https://docs.google.com/spreadsheets/d/e/2PACX-1vRuK1E9ZKJhAQRAY7vutoc0KWcsIOi-h9hWD-EOy7Qlk2UGDj2qupuw3W99yg_iZuW0M4_J3Limf9OS/pub?gid=1611826950&single=true&output=csv' | tail -n +2 | cut -d"," -f2- | sort | uniq > /tmp/tgencounterstat.csv

# damnit google why don't you put the final \r at the end!
dos2unix /tmp/tgencounterstat.csv

# load that sucka!
echo Database Root Password
mysql -u root -p << endmysql
use capiv2;

truncate table tgencounterstat;

load data infile '/tmp/tgencounterstat.csv' 
into table tgencounterstat
fields terminated by "," lines terminated by '\n'
(CmdrName,@WakesScanned,@ThargoidSites,@Hyperdictions,@dummy,@ThargoidScans,@HyperdictionSystemName,@dummy,@HyperdictionTimestamp)
set HyperdictionTimestamp = STR_TO_DATE(nullif(@HyperdictionTimestamp,''),'%Y-%m-%d %k:%i'),
 WakesScanned = nullif(@WakesScanned,''),
 ThargoidSites = nullif(@ThargoidSites,''),
 Hyperdictions = nullif(@Hyperdictions,''),
 HyperdictionSystemName = nullif(@HyperdictionSystemName,''),
 ThargoidScans = nullif(@ThargoidScans,'')
;

select count(*) from tgencounterstat;
endmysql


