-- MySQL dump 10.17  Distrib 10.3.17-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: capiv2_base
-- ------------------------------------------------------
-- Server version	10.3.17-MariaDB-1:10.3.17+maria~bionic-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `alertLevel` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `tldr` varchar(255) DEFAULT NULL,
  `alertURL` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `alertImage` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_ALERTS` (`title`,`body`,`tldr`,`alertURL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `apiupdates`
--

DROP TABLE IF EXISTS `apiupdates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apiupdates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `updateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `error` tinyint(1) DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `updateLog` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_APIUPDATES` (`notes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `apreports`
--

DROP TABLE IF EXISTS `apreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  `reportType` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) NOT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) NOT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_APREPORTS` (`systemName`,`bodyName`,`type`,`cmdrName`,`cmdrComment`,`clientVersion`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `apsites`
--

DROP TABLE IF EXISTS `apsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) NOT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `type` int(11) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aptypes`
--

DROP TABLE IF EXISTS `aptypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aptypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `journalName` varchar(255) DEFAULT NULL,
  `journalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_APTYPES` (`type`,`journalName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `axczfssreports`
--

DROP TABLE IF EXISTS `axczfssreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `axczfssreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmdrName` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `signalName` varchar(255) DEFAULT NULL,
  `signalNameLocalised` varchar(255) DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `rawJson` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_AXCZFSSREPORTS` (`cmdrName`,`systemName`,`signalName`,`signalNameLocalised`,`clientVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bmreports`
--

DROP TABLE IF EXISTS `bmreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bmreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) DEFAULT NULL,
  `reportType` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_BMREPORTS` (`systemName`,`bodyName`,`type`,`cmdrName`,`cmdrComment`,`clientVersion`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bmsites`
--

DROP TABLE IF EXISTS `bmsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bmsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `bmsites_UN_siteID` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bmtypes`
--

DROP TABLE IF EXISTS `bmtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bmtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `journalName` varchar(255) DEFAULT NULL,
  `journalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_BMTYPES` (`type`,`journalName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bodies`
--

DROP TABLE IF EXISTS `bodies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `id64` bigint(53) DEFAULT NULL,
  `edsmID` int(11) DEFAULT NULL,
  `bodyID` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `subType` varchar(255) DEFAULT NULL,
  `offset` int(11) DEFAULT NULL,
  `distanceToArrival` int(11) DEFAULT NULL,
  `isMainStar` tinyint(1) DEFAULT NULL,
  `isScoopable` tinyint(1) DEFAULT NULL,
  `isLandable` tinyint(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `luminosity` varchar(255) DEFAULT NULL,
  `absoluteMagnitude` double DEFAULT NULL,
  `solarMasses` double DEFAULT NULL,
  `solarRadius` double DEFAULT NULL,
  `gravity` double DEFAULT NULL,
  `earthMasses` double DEFAULT NULL,
  `radius` double DEFAULT NULL,
  `surfaceTemperature` double DEFAULT NULL,
  `surfacePressure` double DEFAULT NULL,
  `volcanismType` varchar(255) DEFAULT NULL,
  `atmosphereType` varchar(255) DEFAULT NULL,
  `terraformingState` varchar(255) DEFAULT NULL,
  `orbitalPeriod` double DEFAULT NULL,
  `semiMajorAxis` double DEFAULT NULL,
  `orbitalEccentricity` double DEFAULT NULL,
  `orbitalInclination` double DEFAULT NULL,
  `argOfPeriapsis` double DEFAULT NULL,
  `rotationalPeriod` double DEFAULT NULL,
  `rotationalPeriodTidallyLocked` tinyint(1) DEFAULT NULL,
  `axialTilt` double DEFAULT NULL,
  `solidComposition` longtext DEFAULT NULL,
  `atmosphere` longtext DEFAULT NULL,
  `material` longtext DEFAULT NULL,
  `missingSkipCount` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_BODIES` (`bodyName`,`type`,`subType`,`luminosity`,`volcanismType`,`atmosphereType`,`terraformingState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `btreports`
--

DROP TABLE IF EXISTS `btreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `btreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) DEFAULT NULL,
  `reportType` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_BTREPORTS` (`systemName`,`bodyName`,`type`,`cmdrName`,`cmdrComment`,`clientVersion`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `btsites`
--

DROP TABLE IF EXISTS `btsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `btsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `btsites_UN_siteID` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bttypes`
--

DROP TABLE IF EXISTS `bttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `journalName` varchar(255) DEFAULT NULL,
  `journalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_BTTYPES` (`type`,`journalName`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientreports`
--

DROP TABLE IF EXISTS `clientreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmdrName` varchar(255) DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `autoUpdateDisabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_CLIENTREPORTS` (`cmdrName`,`clientVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientroutes`
--

DROP TABLE IF EXISTS `clientroutes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientroutes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientVersion` varchar(255) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_CLIENTROUTES` (`clientVersion`,`route`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmdrkills`
--

DROP TABLE IF EXISTS `cmdrkills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdrkills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmdr` int(11) DEFAULT NULL,
  `scoutKills` int(11) DEFAULT NULL,
  `cyclopsKills` int(11) DEFAULT NULL,
  `basiliskKills` int(11) DEFAULT NULL,
  `medusaKills` int(11) DEFAULT NULL,
  `unknownKills` int(11) DEFAULT NULL,
  `scoutRewards` int(11) DEFAULT NULL,
  `cyclopsRewards` int(11) DEFAULT NULL,
  `basiliskRewards` int(11) DEFAULT NULL,
  `medusaRewards` int(11) DEFAULT NULL,
  `unknownRewards` int(11) DEFAULT NULL,
  `totalRewards` int(11) DEFAULT NULL,
  `totalKills` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmdrs`
--

DROP TABLE IF EXISTS `cmdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmdrName` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cmdrkill` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cmdrs_UN_cmdrName` (`cmdrName`),
  FULLTEXT KEY `SEARCH_CMDRS` (`cmdrName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `core_store`
--

DROP TABLE IF EXISTS `core_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_CORE_STORE` (`key`,`value`,`type`,`environment`,`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csreports`
--

DROP TABLE IF EXISTS `csreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) DEFAULT NULL,
  `reportType` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_CSREPORTS` (`systemName`,`bodyName`,`cmdrName`,`cmdrComment`,`clientVersion`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cssites`
--

DROP TABLE IF EXISTS `cssites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cssites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cstypes`
--

DROP TABLE IF EXISTS `cstypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cstypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `journalName` varchar(255) DEFAULT NULL,
  `journalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_CSTYPES` (`type`,`journalName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `excludeclients`
--

DROP TABLE IF EXISTS `excludeclients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `excludeclients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(255) DEFAULT NULL,
  `reason` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_EXCLUDECLIENTS` (`version`,`reason`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `excludecmdrs`
--

DROP TABLE IF EXISTS `excludecmdrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `excludecmdrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmdrName` varchar(255) DEFAULT NULL,
  `reason` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_EXCLUDECMDRS` (`cmdrName`,`reason`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `excludecodices`
--

DROP TABLE IF EXISTS `excludecodices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `excludecodices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codexName` varchar(255) DEFAULT NULL,
  `reason` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_EXCLUDECODICES` (`codexName`,`reason`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `excludeevents`
--

DROP TABLE IF EXISTS `excludeevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `excludeevents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventName` varchar(255) DEFAULT NULL,
  `reason` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_EXCLUDEEVENTS` (`eventName`,`reason`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `excludefss`
--

DROP TABLE IF EXISTS `excludefss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `excludefss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fssName` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_EXCLUDEFSS` (`fssName`,`reason`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `excludeusses`
--

DROP TABLE IF EXISTS `excludeusses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `excludeusses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ussType` varchar(255) DEFAULT NULL,
  `reason` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_EXCLUDEUSSES` (`ussType`,`reason`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fgreports`
--

DROP TABLE IF EXISTS `fgreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fgreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) DEFAULT NULL,
  `reportType` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_FGREPORTS` (`systemName`,`bodyName`,`type`,`cmdrName`,`cmdrComment`,`clientVersion`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fgsites`
--

DROP TABLE IF EXISTS `fgsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fgsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `fgsites_UN_siteID` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fgtypes`
--

DROP TABLE IF EXISTS `fgtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fgtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `journalName` varchar(255) DEFAULT NULL,
  `journalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_FGTYPES` (`type`,`journalName`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fmreports`
--

DROP TABLE IF EXISTS `fmreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fmreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) DEFAULT NULL,
  `reportType` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_FMREPORTS` (`systemName`,`bodyName`,`type`,`cmdrName`,`cmdrComment`,`clientVersion`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fmsites`
--

DROP TABLE IF EXISTS `fmsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fmsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `fmsites_UN_siteID` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fmtypes`
--

DROP TABLE IF EXISTS `fmtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fmtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `journalName` varchar(255) DEFAULT NULL,
  `journalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_FMTYPES` (`type`,`journalName`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gbmessages`
--

DROP TABLE IF EXISTS `gbmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gbmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gbsite` int(11) DEFAULT NULL,
  `messageSystem` int(11) DEFAULT NULL,
  `messageBody` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gbreports`
--

DROP TABLE IF EXISTS `gbreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gbreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) DEFAULT NULL,
  `reportType` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `messageSystem` varchar(255) DEFAULT NULL,
  `messageBody` varchar(255) DEFAULT NULL,
  `messageLatitude` double DEFAULT NULL,
  `messageLongitude` double DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GBREPORTS` (`systemName`,`bodyName`,`messageSystem`,`messageBody`,`cmdrName`,`cmdrComment`,`clientVersion`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gbsites`
--

DROP TABLE IF EXISTS `gbsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gbsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `gssite` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `gbmessage` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `gbsites_UN_siteID` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genlogs`
--

DROP TABLE IF EXISTS `genlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genlogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gensite` int(11) DEFAULT NULL,
  `logNumber` int(11) DEFAULT NULL,
  `logTitle` varchar(255) DEFAULT NULL,
  `logBody` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GENLOGS` (`logTitle`,`logBody`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genreports`
--

DROP TABLE IF EXISTS `genreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) DEFAULT NULL,
  `reportType` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `orbitBody` varchar(255) DEFAULT NULL,
  `shipName` varchar(255) DEFAULT NULL,
  `directionSystem` varchar(255) DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GENREPORTS` (`systemName`,`orbitBody`,`shipName`,`directionSystem`,`cmdrName`,`cmdrComment`,`clientVersion`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gensites`
--

DROP TABLE IF EXISTS `gensites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gensites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `shipName` varchar(255) DEFAULT NULL,
  `directionSystem` int(11) DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `gensites_UN_siteID` (`siteID`),
  UNIQUE KEY `gensites_UN_shipName` (`shipName`),
  FULLTEXT KEY `SEARCH_GENSITES` (`shipName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gractivegroups`
--

DROP TABLE IF EXISTS `gractivegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gractivegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grSite` int(11) DEFAULT NULL,
  `activeGroup` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gractiveobelisks`
--

DROP TABLE IF EXISTS `gractiveobelisks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gractiveobelisks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grSite` int(11) DEFAULT NULL,
  `activeObelisk` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grartifacts`
--

DROP TABLE IF EXISTS `grartifacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grartifacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artifactName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grartifacts_UN_artifactName` (`artifactName`),
  FULLTEXT KEY `SEARCH_GRARTIFACTS` (`artifactName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grcodexcategories`
--

DROP TABLE IF EXISTS `grcodexcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grcodexcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grcodexcategories_UN_categoryName` (`categoryName`),
  FULLTEXT KEY `SEARCH_GRCODEXCATEGORIES` (`categoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grcodexdata`
--

DROP TABLE IF EXISTS `grcodexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grcodexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grCodexCategory` int(11) DEFAULT NULL,
  `grPrimaryArtifact` int(11) DEFAULT NULL,
  `grSecondaryArtifact` int(11) DEFAULT NULL,
  `codexNumber` int(11) DEFAULT NULL,
  `text` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GRCODEXDATA` (`text`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grobeliskgroups`
--

DROP TABLE IF EXISTS `grobeliskgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grobeliskgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grType` int(11) DEFAULT NULL,
  `groupName` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GROBELISKGROUPS` (`groupName`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grobeliskreports`
--

DROP TABLE IF EXISTS `grobeliskreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grobeliskreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grreport` int(11) DEFAULT NULL,
  `groups` longtext DEFAULT NULL,
  `obelisks` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grobelisks`
--

DROP TABLE IF EXISTS `grobelisks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grobelisks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grType` int(11) DEFAULT NULL,
  `grObeliskGroup` int(11) DEFAULT NULL,
  `obeliskNumber` int(11) DEFAULT NULL,
  `broken` tinyint(1) DEFAULT NULL,
  `grCodexData` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=953 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grreports`
--

DROP TABLE IF EXISTS `grreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) DEFAULT NULL,
  `reportType` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GRREPORTS` (`systemName`,`bodyName`,`cmdrName`,`cmdrComment`,`clientVersion`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grsites`
--

DROP TABLE IF EXISTS `grsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `grsites_UN_siteID` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grtypes`
--

DROP TABLE IF EXISTS `grtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `journalName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grtypes_UN_type` (`type`),
  FULLTEXT KEY `SEARCH_GRTYPES` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gsactivegroups`
--

DROP TABLE IF EXISTS `gsactivegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsactivegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gsSite` int(11) DEFAULT NULL,
  `activeGroup` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gsactiveobelisks`
--

DROP TABLE IF EXISTS `gsactiveobelisks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsactiveobelisks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gsSite` int(11) DEFAULT NULL,
  `activeObelisk` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gsartifacts`
--

DROP TABLE IF EXISTS `gsartifacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsartifacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artifactName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gsartifacts_UN_artifactName` (`artifactName`),
  FULLTEXT KEY `SEARCH_GSARTIFACTS` (`artifactName`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gscodexcategories`
--

DROP TABLE IF EXISTS `gscodexcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gscodexcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gscodexcategories_UN_categoryName` (`categoryName`),
  FULLTEXT KEY `SEARCH_GSCODEXCATEGORIES` (`categoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gscodexdata`
--

DROP TABLE IF EXISTS `gscodexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gscodexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gsCodexCategory` int(11) DEFAULT NULL,
  `gsPrimaryArtifact` int(11) DEFAULT NULL,
  `gsSecondaryArtifact` int(11) DEFAULT NULL,
  `codexNumber` int(11) DEFAULT NULL,
  `text` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GSCODEXDATA` (`text`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gsobeliskgroups`
--

DROP TABLE IF EXISTS `gsobeliskgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsobeliskgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gsType` int(11) DEFAULT NULL,
  `groupName` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GSOBELISKGROUPS` (`groupName`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gsobeliskreports`
--

DROP TABLE IF EXISTS `gsobeliskreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsobeliskreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gsreport` int(11) DEFAULT NULL,
  `groups` longtext DEFAULT NULL,
  `obelisks` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gsobelisks`
--

DROP TABLE IF EXISTS `gsobelisks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsobelisks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gsType` int(11) DEFAULT NULL,
  `gsObeliskGroup` int(11) DEFAULT NULL,
  `obeliskNumber` int(11) DEFAULT NULL,
  `broken` tinyint(1) DEFAULT NULL,
  `gsCodexData` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gsreports`
--

DROP TABLE IF EXISTS `gsreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) DEFAULT NULL,
  `reportType` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `hasDatabank` tinyint(1) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GSREPORTS` (`systemName`,`bodyName`,`cmdrName`,`cmdrComment`,`clientVersion`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gssites`
--

DROP TABLE IF EXISTS `gssites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gssites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `hasDatabank` tinyint(1) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `gssites_UN_siteID` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gstypes`
--

DROP TABLE IF EXISTS `gstypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gstypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `journalName` varchar(255) DEFAULT NULL,
  `blueprint` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gstypes_UN_type` (`type`),
  FULLTEXT KEY `SEARCH_GSTYPES` (`type`,`journalName`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gvreports`
--

DROP TABLE IF EXISTS `gvreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gvreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) DEFAULT NULL,
  `reportType` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GVREPORTS` (`systemName`,`bodyName`,`type`,`cmdrName`,`cmdrComment`,`clientVersion`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gvsites`
--

DROP TABLE IF EXISTS `gvsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gvsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gvtypes`
--

DROP TABLE IF EXISTS `gvtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gvtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `journalName` varchar(255) DEFAULT NULL,
  `journalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GVTYPES` (`type`,`journalName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gyreports`
--

DROP TABLE IF EXISTS `gyreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gyreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) DEFAULT NULL,
  `reportType` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GYREPORTS` (`systemName`,`bodyName`,`type`,`cmdrName`,`cmdrComment`,`clientVersion`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gysites`
--

DROP TABLE IF EXISTS `gysites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gysites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `gysites_UN_siteID` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gytypes`
--

DROP TABLE IF EXISTS `gytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `journalName` varchar(255) DEFAULT NULL,
  `journalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GYTYPES` (`type`,`journalName`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hdreports`
--

DROP TABLE IF EXISTS `hdreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hdreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromSystemName` varchar(255) DEFAULT NULL,
  `toSystemName` varchar(255) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `hdRawJson` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_HDREPORTS` (`fromSystemName`,`toSystemName`,`cmdrName`,`cmdrComment`,`clientVersion`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hdsites`
--

DROP TABLE IF EXISTS `hdsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hdsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `solDistance` double DEFAULT NULL,
  `meropeDistance` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `killreports`
--

DROP TABLE IF EXISTS `killreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `killreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) DEFAULT NULL,
  `edTimestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `cmdrName` varchar(255) DEFAULT NULL,
  `reward` int(11) DEFAULT NULL,
  `rewardingFaction` varchar(255) DEFAULT NULL,
  `victimFaction` varchar(255) DEFAULT NULL,
  `rawEvent` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportAccepted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_KILLREPORTS` (`systemName`,`cmdrName`,`rewardingFaction`,`victimFaction`,`clientVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lcfssreports`
--

DROP TABLE IF EXISTS `lcfssreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcfssreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmdrName` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `signalName` varchar(255) DEFAULT NULL,
  `signalNameLocalised` varchar(255) DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `rawJson` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_LCFSSREPORTS` (`cmdrName`,`systemName`,`signalName`,`signalNameLocalised`,`clientVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lsreports`
--

DROP TABLE IF EXISTS `lsreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) DEFAULT NULL,
  `reportType` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_LSREPORTS` (`systemName`,`bodyName`,`type`,`cmdrName`,`cmdrComment`,`clientVersion`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lssites`
--

DROP TABLE IF EXISTS `lssites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lssites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `lssites_UN_siteID` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lstypes`
--

DROP TABLE IF EXISTS `lstypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lstypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `journalName` varchar(255) DEFAULT NULL,
  `journalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_LSTYPES` (`type`,`journalName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materialreports`
--

DROP TABLE IF EXISTS `materialreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materialreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` varchar(255) NOT NULL,
  `coordX` double NOT NULL,
  `coordY` double NOT NULL,
  `coordZ` double NOT NULL,
  `distanceFromMainStar` int(11) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `journalName` varchar(255) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `factionState` varchar(255) DEFAULT NULL,
  `factionAllegiance` varchar(255) DEFAULT NULL,
  `collectedFrom` varchar(255) DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_MATERIALREPORTS` (`system`,`body`,`category`,`journalName`,`clientVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nhssreports`
--

DROP TABLE IF EXISTS `nhssreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nhssreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) DEFAULT NULL,
  `threatLevel` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `nhssRawJson` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_NHSSREPORTS` (`systemName`,`cmdrName`,`cmdrComment`,`clientVersion`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nhsssites`
--

DROP TABLE IF EXISTS `nhsssites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nhsssites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `threatLevel` int(11) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pointofinterests`
--

DROP TABLE IF EXISTS `pointofinterests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pointofinterests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `ring` int(11) DEFAULT NULL,
  `poiDescription` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_POINTOFINTERESTS` (`poiDescription`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `journalName` varchar(255) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `regions_UN_journalName` (`journalName`),
  UNIQUE KEY `regions_UN_name` (`name`),
  FULLTEXT KEY `SEARCH_REGIONS` (`name`,`journalName`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reportcodices`
--

DROP TABLE IF EXISTS `reportcodices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportcodices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmdrName` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `entryId` int(11) DEFAULT NULL,
  `codexName` varchar(255) DEFAULT NULL,
  `codexNameLocalised` varchar(255) DEFAULT NULL,
  `subCategory` varchar(255) DEFAULT NULL,
  `subCategoryLocalised` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `categoryLocalised` varchar(255) DEFAULT NULL,
  `regionName` varchar(255) DEFAULT NULL,
  `regionLocalised` varchar(255) DEFAULT NULL,
  `voucherAmount` int(11) DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `rawJson` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_REPORTCODICES` (`cmdrName`,`systemName`,`bodyName`,`codexName`,`codexNameLocalised`,`subCategory`,`subCategoryLocalised`,`category`,`categoryLocalised`,`regionName`,`regionLocalised`,`clientVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reportevents`
--

DROP TABLE IF EXISTS `reportevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportevents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventName` varchar(255) DEFAULT NULL,
  `eventAltName` varchar(255) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `stationName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `rawJson` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_REPORTEVENTS` (`eventName`,`cmdrName`,`systemName`,`bodyName`,`stationName`,`clientVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reportfsses`
--

DROP TABLE IF EXISTS `reportfsses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportfsses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmdrName` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `signalName` varchar(255) DEFAULT NULL,
  `signalNameLocalised` varchar(255) DEFAULT NULL,
  `ussType` varchar(255) DEFAULT NULL,
  `ussTypeLocalised` varchar(255) DEFAULT NULL,
  `spawningState` varchar(255) DEFAULT NULL,
  `spawningStateLocalised` varchar(255) DEFAULT NULL,
  `spawningFaction` varchar(255) DEFAULT NULL,
  `threatLevel` int(11) DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `rawJson` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_REPORTFSSES` (`cmdrName`,`systemName`,`signalName`,`signalNameLocalised`,`ussType`,`ussTypeLocalised`,`spawningState`,`spawningStateLocalised`,`spawningFaction`,`clientVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reporttypes`
--

DROP TABLE IF EXISTS `reporttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporttypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `journalName` varchar(255) DEFAULT NULL,
  `journalID` int(11) DEFAULT NULL,
  `journalType` varchar(255) DEFAULT NULL,
  `endpoint` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_REPORTTYPES` (`type`,`journalName`,`endpoint`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rings`
--

DROP TABLE IF EXISTS `rings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` int(11) DEFAULT NULL,
  `ringName` varchar(255) DEFAULT NULL,
  `ringtype` int(11) DEFAULT NULL,
  `mass` double DEFAULT NULL,
  `innerRadius` double DEFAULT NULL,
  `outerRadius` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_RINGS` (`ringName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systems`
--

DROP TABLE IF EXISTS `systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) DEFAULT NULL,
  `id64` bigint(53) DEFAULT NULL,
  `edsmID` int(11) DEFAULT NULL,
  `edsmCoordX` double DEFAULT NULL,
  `edsmCoordY` double DEFAULT NULL,
  `edsmCoordZ` double DEFAULT NULL,
  `edsmCoordLocked` tinyint(1) DEFAULT NULL,
  `missingSkipCount` int(11) DEFAULT NULL,
  `region` int(11) DEFAULT NULL,
  `primaryStar` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_SYSTEMS` (`systemName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbcycles`
--

DROP TABLE IF EXISTS `tbcycles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbcycles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cycle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbcycles_UN` (`cycle`),
  FULLTEXT KEY `SEARCH_TBCYCLES` (`cycle`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbreports`
--

DROP TABLE IF EXISTS `tbreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) DEFAULT NULL,
  `reportType` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `cycle` varchar(255) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_TBREPORTS` (`systemName`,`bodyName`,`cmdrName`,`cmdrComment`,`clientVersion`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbsites`
--

DROP TABLE IF EXISTS `tbsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `cycle` int(11) DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `frontierID` int(11) DEFAULT NULL,
  `subtype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbsites_UN_siteID` (`siteID`),
  FULLTEXT KEY `SEARCH_TBSITES` (`comment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbsubtypes`
--

DROP TABLE IF EXISTS `tbsubtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbsubtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `metaAlloyCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbsubtypes_type_unique` (`type`),
  FULLTEXT KEY `SEARCH_TBSUBTYPES` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbtypes`
--

DROP TABLE IF EXISTS `tbtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `journalName` varchar(255) DEFAULT NULL,
  `journalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbtypes_type_unique` (`type`),
  FULLTEXT KEY `SEARCH_TBTYPES` (`type`,`journalName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsreports`
--

DROP TABLE IF EXISTS `tsreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) DEFAULT NULL,
  `reportType` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_TSREPORTS` (`systemName`,`bodyName`,`cmdrName`,`cmdrComment`,`clientVersion`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tssites`
--

DROP TABLE IF EXISTS `tssites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tssites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `msg1Site` int(11) DEFAULT NULL,
  `msg2Site` int(11) DEFAULT NULL,
  `msg3Site` int(11) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `tssites_UN_siteID` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tsstatuses`
--

DROP TABLE IF EXISTS `tsstatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsstatuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tsstatuses_UN_status` (`status`),
  FULLTEXT KEY `SEARCH_TSSTATUSES` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twreports`
--

DROP TABLE IF EXISTS `twreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) DEFAULT NULL,
  `reportType` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(53) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_TWREPORTS` (`systemName`,`bodyName`,`type`,`cmdrName`,`cmdrComment`,`clientVersion`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twsites`
--

DROP TABLE IF EXISTS `twsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `twsites_UN_siteID` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twtypes`
--

DROP TABLE IF EXISTS `twtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `journalName` varchar(255) DEFAULT NULL,
  `journalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_TWTYPES` (`type`,`journalName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `upload_file`
--

DROP TABLE IF EXISTS `upload_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `sha256` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `public_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_UPLOAD_FILE` (`name`,`hash`,`sha256`,`ext`,`mime`,`size`,`url`,`provider`,`public_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `upload_file_morph`
--

DROP TABLE IF EXISTS `upload_file_morph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_file_morph` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` longtext DEFAULT NULL,
  `field` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_UPLOAD_FILE_MORPH` (`related_type`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users-permissions_permission`
--

DROP TABLE IF EXISTS `users-permissions_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users-permissions_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `policy` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_USERS_PERMISSIONS_PERMISSION` (`type`,`controller`,`action`,`policy`)
) ENGINE=InnoDB AUTO_INCREMENT=2290 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'capiv2_base'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-15 15:56:59
