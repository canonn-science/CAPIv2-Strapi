DELETE from capiv2_dev.gvreports where
	id like 2904
	or id like 2909
	or id like 2918
	or id like 2922
	or id like 2924
	or id like 2928;
DELETE from capiv2_dev.gvsites where
	id like 1813
	or id like 1815
	or id like 1828
	or id like 1829
	or id like 1835
	or id like 1839
	or id like 1843
	or id like 1845
	or id like 1858;
UPDATE capiv2_dev.apsites set verified = 0 where verified IS NULL;
UPDATE capiv2_dev.bmsites set verified = 0 where verified IS NULL;
UPDATE capiv2_dev.btsites set verified = 0 where verified IS NULL;
UPDATE capiv2_dev.cssites set verified = 0 where verified IS NULL;
UPDATE capiv2_dev.fgsites set verified = 0 where verified IS NULL;
UPDATE capiv2_dev.fmsites set verified = 0 where verified IS NULL;
UPDATE capiv2_dev.grsites set verified = 0 where verified IS NULL;
UPDATE capiv2_dev.gssites set verified = 0 where verified IS NULL;
UPDATE capiv2_dev.gvsites set verified = 0 where verified IS NULL;
UPDATE capiv2_dev.gysites set verified = 0 where verified IS NULL;
UPDATE capiv2_dev.lssites set verified = 0 where verified IS NULL;
UPDATE capiv2_dev.tbsites set verified = 0 where verified IS NULL;
UPDATE capiv2_dev.tssites set verified = 0 where verified IS NULL;
UPDATE capiv2_dev.twsites set verified = 0 where verified IS NULL;
