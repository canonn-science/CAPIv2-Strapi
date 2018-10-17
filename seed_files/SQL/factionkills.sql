use capiv2;

truncate table factionkillreports;

load data infile '/srv/CAPI/CAPIv2/seed_files/CSV/factionkills.csv' 
into table factionkillreports
fields terminated by "," lines terminated by '\n'
(@edTimestamp,cmdrName,@isBeta,@systemName,@dummy,@dummy,@reward,rewardingFaction,victimFaction)
set edTimestamp  = STR_TO_DATE(nullif(@edTimestamp,''),'%d/%m/%Y %k:%i:%s'),
 isBeta = case when @isBeta = 'Y' then true else false end
;

select count(*) from factionkillreports;

