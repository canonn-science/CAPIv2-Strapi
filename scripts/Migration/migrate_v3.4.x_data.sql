/* Cleanup of bad GV data */
DELETE from gvreports where
	id like 2904
	or id like 2909
	or id like 2918
	or id like 2922
	or id like 2924
	or id like 2928;
DELETE from gvsites where
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
UPDATE apsites set verified = 0 where verified IS NULL;
UPDATE bmsites set verified = 0 where verified IS NULL;
UPDATE btsites set verified = 0 where verified IS NULL;
UPDATE cssites set verified = 0 where verified IS NULL;
UPDATE fgsites set verified = 0 where verified IS NULL;
UPDATE fmsites set verified = 0 where verified IS NULL;
UPDATE grsites set verified = 0 where verified IS NULL;
UPDATE gssites set verified = 0 where verified IS NULL;
UPDATE gvsites set verified = 0 where verified IS NULL;
UPDATE gysites set verified = 0 where verified IS NULL;
UPDATE lssites set verified = 0 where verified IS NULL;
UPDATE tbsites set verified = 0 where verified IS NULL;
UPDATE tssites set verified = 0 where verified IS NULL;
UPDATE twsites set verified = 0 where verified IS NULL;
/* fix discovered by data, set to zzz anon cmdr */
UPDATE apsites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE bmsites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE btsites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE cssites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE fgsites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE fmsites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE grsites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE gssites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE gvsites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE gysites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE lssites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE tbsites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE tssites set discoveredBy = 618 where discoveredBy IS NULL;
UPDATE twsites set discoveredBy = 618 where discoveredBy IS NULL;
/* fix visible data */
UPDATE apsites set visible = 1 where visible IS NULL;
UPDATE bmsites set visible = 1 where visible IS NULL;
UPDATE btsites set visible = 1 where visible IS NULL;
UPDATE cssites set visible = 1 where visible IS NULL;
UPDATE fgsites set visible = 1 where visible IS NULL;
UPDATE fmsites set visible = 1 where visible IS NULL;
UPDATE grsites set visible = 1 where visible IS NULL;
UPDATE gssites set visible = 1 where visible IS NULL;
UPDATE gvsites set visible = 1 where visible IS NULL;
UPDATE gysites set visible = 1 where visible IS NULL;
UPDATE lssites set visible = 1 where visible IS NULL;
UPDATE tbsites set visible = 1 where visible IS NULL;
UPDATE tssites set visible = 1 where visible IS NULL;
UPDATE twsites set visible = 1 where visible IS NULL;
/* AP Sites */
ALTER TABLE apsites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE apsites MODIFY COLUMN latitude double NULL;
ALTER TABLE apsites MODIFY COLUMN longitude double NULL;
ALTER TABLE apsites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE apsites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* BM Sites */
ALTER TABLE bmsites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE bmsites MODIFY COLUMN latitude double NULL;
ALTER TABLE bmsites MODIFY COLUMN longitude double NULL;
ALTER TABLE bmsites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE bmsites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* BT Sites */
ALTER TABLE btsites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE btsites MODIFY COLUMN latitude double NULL;
ALTER TABLE btsites MODIFY COLUMN longitude double NULL;
ALTER TABLE btsites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE btsites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* CS Sites */
ALTER TABLE cssites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE cssites MODIFY COLUMN latitude double NULL;
ALTER TABLE cssites MODIFY COLUMN longitude double NULL;
ALTER TABLE cssites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE cssites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* FG Sites */
ALTER TABLE fgsites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE fgsites MODIFY COLUMN latitude double NULL;
ALTER TABLE fgsites MODIFY COLUMN longitude double NULL;
ALTER TABLE fgsites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE fgsites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* FM Sites */
ALTER TABLE fmsites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE fmsites MODIFY COLUMN latitude double NULL;
ALTER TABLE fmsites MODIFY COLUMN longitude double NULL;
ALTER TABLE fmsites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE fmsites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* GR Sites */
ALTER TABLE grsites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE grsites MODIFY COLUMN latitude double NULL;
ALTER TABLE grsites MODIFY COLUMN longitude double NULL;
ALTER TABLE grsites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE grsites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* GS Sites */
ALTER TABLE gssites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE gssites MODIFY COLUMN latitude double NULL;
ALTER TABLE gssites MODIFY COLUMN longitude double NULL;
ALTER TABLE gssites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE gssites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* GY Sites */
ALTER TABLE gysites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE gysites MODIFY COLUMN latitude double NULL;
ALTER TABLE gysites MODIFY COLUMN longitude double NULL;
ALTER TABLE gysites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE gysites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* GV Sites */
ALTER TABLE gvsites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE gvsites MODIFY COLUMN latitude double NULL;
ALTER TABLE gvsites MODIFY COLUMN longitude double NULL;
ALTER TABLE gvsites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE gvsites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* LS Sites */
ALTER TABLE lssites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE lssites MODIFY COLUMN latitude double NULL;
ALTER TABLE lssites MODIFY COLUMN longitude double NULL;
ALTER TABLE lssites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE lssites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* TB Sites */
ALTER TABLE tbsites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE tbsites MODIFY COLUMN latitude double NOT NULL;
ALTER TABLE tbsites MODIFY COLUMN longitude double NOT NULL;
ALTER TABLE tbsites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE tbsites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
ALTER TABLE tbsites CHANGE `type` `type` int(11) DEFAULT NULL NULL AFTER longitude;
ALTER TABLE tbsites CHANGE subtype subtype int(11) DEFAULT NULL NULL AFTER `type`;
ALTER TABLE tbsites CHANGE frontierID frontierID int(11) DEFAULT NULL NULL AFTER `cycle`;
UPDATE tbsites set subtype = 1 where subtype IS NULL;
UPDATE tbsites set cycle = 1 where cycle IS NULL;
/* TS Sites */
ALTER TABLE tssites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE tssites MODIFY COLUMN latitude double NOT NULL;
ALTER TABLE tssites MODIFY COLUMN longitude double NOT NULL;
ALTER TABLE tssites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE tssites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* TW Sites */
ALTER TABLE twsites MODIFY COLUMN siteID int(11) NOT NULL;
ALTER TABLE twsites MODIFY COLUMN latitude double NULL;
ALTER TABLE twsites MODIFY COLUMN longitude double NULL;
ALTER TABLE twsites MODIFY COLUMN verified tinyint(1) DEFAULT 0 NOT NULL;
ALTER TABLE twsites MODIFY COLUMN visible tinyint(1) DEFAULT 1 NOT NULL;
/* Cleanup */
DROP TABLE if exists apiupdates;
DROP TABLE if exists cmdrkills;
DROP TABLE if exists cmdrs;
/* Restrict Admins */
UPDATE strapi_administrator SET blocked = 0 where blocked IS NULL;
UPDATE strapi_administrator SET isActive = 1 where id = 1;
/* UPDATE strapi_administrator SET isActive = 0 where isActive IS NULL; */
