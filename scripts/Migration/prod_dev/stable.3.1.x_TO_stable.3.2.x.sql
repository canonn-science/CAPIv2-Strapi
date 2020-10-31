/* Cleanup of bad GV data */
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
/* fix verified data */
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
/* fix discovered by data, set to zzz anon cmdr */
UPDATE capiv2_dev.apsites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE capiv2_dev.bmsites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE capiv2_dev.btsites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE capiv2_dev.cssites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE capiv2_dev.fgsites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE capiv2_dev.fmsites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE capiv2_dev.grsites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE capiv2_dev.gssites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE capiv2_dev.gvsites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE capiv2_dev.gysites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE capiv2_dev.lssites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE capiv2_dev.tbsites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE capiv2_dev.tssites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE capiv2_dev.twsites set discoveredBy = 618 where discoveredBy IS NULL;
/* fix visible data */
UPDATE capiv2_dev.apsites set visible = 1 where visible IS NULL;
UPDATE capiv2_dev.bmsites set visible = 1 where visible IS NULL;
UPDATE capiv2_dev.btsites set visible = 1 where visible IS NULL;
UPDATE capiv2_dev.cssites set visible = 1 where visible IS NULL;
UPDATE capiv2_dev.fgsites set visible = 1 where visible IS NULL;
UPDATE capiv2_dev.fmsites set visible = 1 where visible IS NULL;
UPDATE capiv2_dev.grsites set visible = 1 where visible IS NULL;
UPDATE capiv2_dev.gssites set visible = 1 where visible IS NULL;
UPDATE capiv2_dev.gvsites set visible = 1 where visible IS NULL;
UPDATE capiv2_dev.gysites set visible = 1 where visible IS NULL;
UPDATE capiv2_dev.lssites set visible = 1 where visible IS NULL;
UPDATE capiv2_dev.tbsites set visible = 1 where visible IS NULL;
UPDATE capiv2_dev.tssites set visible = 1 where visible IS NULL;
UPDATE capiv2_dev.twsites set visible = 1 where visible IS NULL;
/* AP Sites */
ALTER TABLE capiv2_dev.apsites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE capiv2_dev.apsites MODIFY COLUMN latitude double NOT NULL;
ALTER TABLE capiv2_dev.apsites MODIFY COLUMN longitude double NOT NULL;
ALTER TABLE capiv2_dev.apsites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE capiv2_dev.apsites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* BM Sites */
ALTER TABLE capiv2_dev.bmsites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE capiv2_dev.bmsites MODIFY COLUMN latitude double NOT NULL;
ALTER TABLE capiv2_dev.bmsites MODIFY COLUMN longitude double NOT NULL;
ALTER TABLE capiv2_dev.bmsites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE capiv2_dev.bmsites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* BT Sites */
ALTER TABLE capiv2_dev.btsites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE capiv2_dev.btsites MODIFY COLUMN latitude double NOT NULL;
ALTER TABLE capiv2_dev.btsites MODIFY COLUMN longitude double NOT NULL;
ALTER TABLE capiv2_dev.btsites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE capiv2_dev.btsites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* CS Sites */
ALTER TABLE capiv2_dev.cssites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE capiv2_dev.cssites MODIFY COLUMN latitude double NOT NULL;
ALTER TABLE capiv2_dev.cssites MODIFY COLUMN longitude double NOT NULL;
ALTER TABLE capiv2_dev.cssites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE capiv2_dev.cssites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* FG Sites */
ALTER TABLE capiv2_dev.fgsites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE capiv2_dev.fgsites MODIFY COLUMN latitude double NOT NULL;
ALTER TABLE capiv2_dev.fgsites MODIFY COLUMN longitude double NOT NULL;
ALTER TABLE capiv2_dev.fgsites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE capiv2_dev.fgsites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* FM Sites */
ALTER TABLE capiv2_dev.fmsites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE capiv2_dev.fmsites MODIFY COLUMN latitude double NOT NULL;
ALTER TABLE capiv2_dev.fmsites MODIFY COLUMN longitude double NOT NULL;
ALTER TABLE capiv2_dev.fmsites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE capiv2_dev.fmsites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* GR Sites */
ALTER TABLE capiv2_dev.grsites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE capiv2_dev.grsites MODIFY COLUMN latitude double NOT NULL;
ALTER TABLE capiv2_dev.grsites MODIFY COLUMN longitude double NOT NULL;
ALTER TABLE capiv2_dev.grsites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE capiv2_dev.grsites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* GS Sites */
ALTER TABLE capiv2_dev.gssites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE capiv2_dev.gssites MODIFY COLUMN latitude double NOT NULL;
ALTER TABLE capiv2_dev.gssites MODIFY COLUMN longitude double NOT NULL;
ALTER TABLE capiv2_dev.gssites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE capiv2_dev.gssites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* GY Sites */
ALTER TABLE capiv2_dev.gysites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE capiv2_dev.gysites MODIFY COLUMN latitude double NOT NULL;
ALTER TABLE capiv2_dev.gysites MODIFY COLUMN longitude double NOT NULL;
ALTER TABLE capiv2_dev.gysites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE capiv2_dev.gysites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* GV Sites */
ALTER TABLE capiv2_dev.gvsites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE capiv2_dev.gvsites MODIFY COLUMN latitude double NOT NULL;
ALTER TABLE capiv2_dev.gvsites MODIFY COLUMN longitude double NOT NULL;
ALTER TABLE capiv2_dev.gvsites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE capiv2_dev.gvsites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* LS Sites */
ALTER TABLE capiv2_dev.lssites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE capiv2_dev.lssites MODIFY COLUMN latitude double NOT NULL;
ALTER TABLE capiv2_dev.lssites MODIFY COLUMN longitude double NOT NULL;
ALTER TABLE capiv2_dev.lssites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE capiv2_dev.lssites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* TB Sites */
ALTER TABLE capiv2_dev.tbsites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE capiv2_dev.tbsites MODIFY COLUMN latitude double NOT NULL;
ALTER TABLE capiv2_dev.tbsites MODIFY COLUMN longitude double NOT NULL;
ALTER TABLE capiv2_dev.tbsites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE capiv2_dev.tbsites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
ALTER TABLE capiv2_dev.tbsites CHANGE `type` `type` int(11) DEFAULT NULL NULL AFTER longitude;
ALTER TABLE capiv2_dev.tbsites CHANGE subtype subtype int(11) DEFAULT NULL NULL AFTER `type`;
ALTER TABLE capiv2_dev.tbsites CHANGE frontierID frontierID int(11) DEFAULT NULL NULL AFTER `cycle`;
UPDATE capiv2_dev.tbsites set subtype = 1 where subtype IS NULL;
UPDATE capiv2_dev.tbsites set cycle = 1 where cycle IS NULL;
/* TS Sites */
ALTER TABLE capiv2_dev.tssites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE capiv2_dev.tssites MODIFY COLUMN latitude double NOT NULL;
ALTER TABLE capiv2_dev.tssites MODIFY COLUMN longitude double NOT NULL;
ALTER TABLE capiv2_dev.tssites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE capiv2_dev.tssites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* TW Sites */
ALTER TABLE capiv2_dev.twsites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE capiv2_dev.twsites MODIFY COLUMN latitude double NOT NULL;
ALTER TABLE capiv2_dev.twsites MODIFY COLUMN longitude double NOT NULL;
ALTER TABLE capiv2_dev.twsites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE capiv2_dev.twsites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
