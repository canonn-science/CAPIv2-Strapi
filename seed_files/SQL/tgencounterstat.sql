use capiv2;

truncate table tgencounterstat;

load data infile '/srv/CAPI/CAPIv2/seed_files/CSV/tgencounterstat.csv' 
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

