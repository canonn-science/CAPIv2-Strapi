-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: capiv2_base
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB-1:10.4.13+maria~bionic-log

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
-- Table structure for table `apreports`
--

DROP TABLE IF EXISTS `apreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  `reportType` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apreports`
--

LOCK TABLES `apreports` WRITE;
/*!40000 ALTER TABLE `apreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `apreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apsites`
--

DROP TABLE IF EXISTS `apsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apsites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `apsites_siteID_unique` (`siteID`),
  UNIQUE KEY `apsites_extoolID_unique` (`extoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apsites`
--

LOCK TABLES `apsites` WRITE;
/*!40000 ALTER TABLE `apsites` DISABLE KEYS */;
/*!40000 ALTER TABLE `apsites` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `aptypes`
--

LOCK TABLES `aptypes` WRITE;
/*!40000 ALTER TABLE `aptypes` DISABLE KEYS */;
INSERT INTO `aptypes` VALUES (1,'Unknown','',NULL),(2,'Amphora Plant','codex_ent_vents',2101400);
/*!40000 ALTER TABLE `aptypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `axczfssreports`
--

DROP TABLE IF EXISTS `axczfssreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `axczfssreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cmdrName` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
  `signalName` varchar(255) DEFAULT NULL,
  `signalNameLocalised` varchar(255) DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `rawJson` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `axczfssreports`
--

LOCK TABLES `axczfssreports` WRITE;
/*!40000 ALTER TABLE `axczfssreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `axczfssreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bmreports`
--

DROP TABLE IF EXISTS `bmreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bmreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  `reportType` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bmreports`
--

LOCK TABLES `bmreports` WRITE;
/*!40000 ALTER TABLE `bmreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `bmreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bmsites`
--

DROP TABLE IF EXISTS `bmsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bmsites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `bmsites_siteID_unique` (`siteID`),
  UNIQUE KEY `bmsites_extoolID_unique` (`extoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bmsites`
--

LOCK TABLES `bmsites` WRITE;
/*!40000 ALTER TABLE `bmsites` DISABLE KEYS */;
/*!40000 ALTER TABLE `bmsites` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `bmtypes`
--

LOCK TABLES `bmtypes` WRITE;
/*!40000 ALTER TABLE `bmtypes` DISABLE KEYS */;
INSERT INTO `bmtypes` VALUES (1,'Unknown','',NULL),(2,'Bark Mound','codex_ent_cone',2100301);
/*!40000 ALTER TABLE `bmtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bodies`
--

DROP TABLE IF EXISTS `bodies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `bodyName` varchar(255) NOT NULL,
  `id64` bigint(20) DEFAULT NULL,
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
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `bodies_bodyName_unique` (`bodyName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodies`
--

LOCK TABLES `bodies` WRITE;
/*!40000 ALTER TABLE `bodies` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `btreports`
--

DROP TABLE IF EXISTS `btreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `btreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  `reportType` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `btreports`
--

LOCK TABLES `btreports` WRITE;
/*!40000 ALTER TABLE `btreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `btreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `btsites`
--

DROP TABLE IF EXISTS `btsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `btsites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `btsites_siteID_unique` (`siteID`),
  UNIQUE KEY `btsites_extoolID_unique` (`extoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `btsites`
--

LOCK TABLES `btsites` WRITE;
/*!40000 ALTER TABLE `btsites` DISABLE KEYS */;
/*!40000 ALTER TABLE `btsites` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `bttypes`
--

LOCK TABLES `bttypes` WRITE;
/*!40000 ALTER TABLE `bttypes` DISABLE KEYS */;
INSERT INTO `bttypes` VALUES (1,'Unknown','',NULL),(2,'Roseum Brain Tree','codex_ent_seed',2100201),(3,'Gypseeum Brain Tree','codex_ent_seedabcd_01',2100202),(4,'Ostrinum Brain Tree','codex_ent_seedabcd_02',2100203),(5,'Viride Brain Tree','codex_ent_seedabcd_03',2100204),(6,'Lividum Brain Tree','codex_ent_seedefgh',2100205),(7,'Aureum Brain Tree','codex_ent_seedefgh_01',2100206),(8,'Puniceum Brain Tree','codex_ent_seedefgh_02',2100207),(9,'Lindigoticum Brain Tree','codex_ent_seedefgh_03',2100208);
/*!40000 ALTER TABLE `bttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientreports`
--

DROP TABLE IF EXISTS `clientreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cmdrName` varchar(255) DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `autoUpdateDisabled` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientreports`
--

LOCK TABLES `clientreports` WRITE;
/*!40000 ALTER TABLE `clientreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientreports` ENABLE KEYS */;
UNLOCK TABLES;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_CLIENTROUTES` (`clientVersion`,`route`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientroutes`
--

LOCK TABLES `clientroutes` WRITE;
/*!40000 ALTER TABLE `clientroutes` DISABLE KEYS */;
INSERT INTO `clientroutes` VALUES (1,'EDMC-Canonn.1.6.0','http://192.0.2.0/please_upgrade_your_plugin','2019-04-06 22:10:55','2019-04-06 22:10:55'),(3,'EDMC-Canonn.1.9.0','http://192.0.2.0/please_upgrade_your_plugin','2019-05-02 03:04:19','2019-05-02 03:04:19'),(4,'EDMC-Canonn.1.9.1','http://192.0.2.0/please_upgrade_your_plugin','2019-05-02 03:10:52','2019-05-02 03:10:52'),(9,'EDMC-Canonn.1.9.2','http://192.0.2.0/please_upgrade_your_plugin','2019-05-02 03:11:03','2019-05-02 03:11:05'),(14,'EDMC-Canonn.1.9.3','http://192.0.2.0/please_upgrade_your_plugin','2019-05-02 03:11:16','2019-05-02 03:11:16'),(18,'EDMC-Canonn.1.9.4','http://192.0.2.0/please_upgrade_your_plugin','2019-05-02 03:11:25','2019-05-02 03:11:25'),(19,'EDMC-Canonn.1.9.5','http://192.0.2.0/please_upgrade_your_plugin','2019-05-02 03:11:42','2019-05-02 03:11:47'),(24,'EDMC-Canonn.1.9.6','http://192.0.2.0/please_upgrade_your_plugin','2019-05-02 03:11:56','2019-05-02 03:11:56'),(29,'EDMC-Canonn.1.9.7','http://192.0.2.0/please_upgrade_your_plugin','2019-05-02 03:12:09','2019-05-02 03:12:28'),(36,'EDMC-Canonn.1.9.8','http://192.0.2.0/please_upgrade_your_plugin','2019-05-02 03:12:39','2019-05-02 03:12:39'),(40,'EDMC-Canonn.1.9.9','http://192.0.2.0/please_upgrade_your_plugin','2019-05-02 03:12:48','2019-05-02 03:12:48'),(45,'EDMC-Canonn.5.0.2','https://api.canonn.tech','2020-02-22 04:12:08','2020-02-22 04:12:08'),(50,'EDMC-Canonn.5.1.0','https://api.canonn.tech','2020-02-22 06:28:37','2020-03-09 23:55:13'),(52,'EDMC-Canonn.5.2.0','https://api.canonn.tech','2020-03-18 07:38:27','2020-03-18 07:38:36');
/*!40000 ALTER TABLE `clientroutes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmdrkills`
--

DROP TABLE IF EXISTS `cmdrkills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdrkills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `cmdr` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmdrkills`
--

LOCK TABLES `cmdrkills` WRITE;
/*!40000 ALTER TABLE `cmdrkills` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmdrkills` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csreports`
--

DROP TABLE IF EXISTS `csreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  `reportType` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csreports`
--

LOCK TABLES `csreports` WRITE;
/*!40000 ALTER TABLE `csreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `csreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cssites`
--

DROP TABLE IF EXISTS `cssites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cssites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) NOT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `type` int(11) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `verified` tinyint(1) NOT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `cssites_siteID_unique` (`siteID`),
  UNIQUE KEY `cssites_extoolID_unique` (`extoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cssites`
--

LOCK TABLES `cssites` WRITE;
/*!40000 ALTER TABLE `cssites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cssites` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `cstypes`
--

LOCK TABLES `cstypes` WRITE;
/*!40000 ALTER TABLE `cstypes` DISABLE KEYS */;
INSERT INTO `cstypes` VALUES (1,'Unknown','',NULL),(2,'Crystalline Shards','codex_ent_ground_struct_ice',2101500);
/*!40000 ALTER TABLE `cstypes` ENABLE KEYS */;
UNLOCK TABLES;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_EXCLUDECLIENTS` (`version`,`reason`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excludeclients`
--

LOCK TABLES `excludeclients` WRITE;
/*!40000 ALTER TABLE `excludeclients` DISABLE KEYS */;
INSERT INTO `excludeclients` VALUES (8,'EDMC-USS-Survey.4.8.1','USS-Survey Deprov','2019-04-13 02:56:10','2019-04-13 03:20:40'),(17,'EDMC-USS-Survey.4.8.0','USS-Survey Deprov','2019-04-13 02:56:28','2019-04-13 03:20:45'),(23,'EDMC-Canonn.1.9.1','ExcludeFSS Typo spam','2019-04-13 02:59:12','2019-04-13 02:59:12'),(33,'EDMC-Canonn.1.9.0','Old Version','2019-04-13 03:18:46','2019-04-13 03:18:46'),(37,'EDMC-Canonn.1.8.4','Old Version','2019-04-13 03:19:15','2019-04-13 03:19:15'),(38,'EDMC-Canonn.1.8.2','Old Version','2019-04-13 03:19:32','2019-04-13 03:19:32'),(42,'EDMC-Canonn.1.6.0','Old Version','2019-04-13 03:19:56','2019-04-13 03:19:56'),(49,'EDMC-Canonn.1.9.8','Old Version Deprov','2019-05-02 03:06:03','2019-05-02 03:06:03'),(54,'EDMC-Canonn.1.9.6','Old Version Deprov','2019-05-02 03:06:17','2019-05-02 03:06:17'),(59,'EDMC-Canonn.1.9.7','Old Version Deprov','2019-05-02 03:06:33','2019-05-02 03:06:33'),(64,'EDMC-Canonn.1.9.5','Old Version Deprov','2019-05-02 03:06:53','2019-05-02 03:06:53'),(69,'EDMC-Canonn.1.9.2','Old Version Deprov','2019-05-02 03:07:16','2019-05-02 03:07:16'),(74,'EDMC-Canonn.1.9.3','Old Version Deprov','2019-05-02 03:07:43','2019-05-02 03:07:43'),(79,'EDMC-Canonn.1.9.4','Old Version Deprov','2019-05-02 03:09:14','2019-05-02 03:09:14'),(83,'EDMC-Triumvirate.1.0.0','Requested by Kazakov','2020-03-01 03:17:34','2020-03-01 03:17:34'),(88,'EDMC-Triumvirate.1.0.1','Requested by Kazakov','2020-03-01 03:17:54','2020-03-01 03:17:54'),(92,'EDMC-Triumvirate.1.0.2','Requested by Kazakov','2020-03-01 03:18:06','2020-03-01 03:18:06'),(94,'EDMC-Triumvirate.1.0.3','Requested by Kazakov','2020-03-01 03:18:55','2020-03-01 03:18:55'),(97,'EDMC-Triumvirate.1.0.4','Requested by Kazakov','2020-03-01 03:19:12','2020-03-01 03:19:12'),(98,'EDMC-Triumvirate.1.0.3','Requested by Kazakov','2020-03-01 03:19:18','2020-03-01 03:19:18'),(102,'EDMC-Triumvirate.1.0.5','Requested by Kazakov','2020-03-01 03:19:24','2020-03-01 03:19:24'),(105,'EDMC-Triumvirate.1.0.6','Requested by Kazakov','2020-03-01 03:19:34','2020-03-01 03:19:34'),(109,'EDMC-Triumvirate.1.0.7','Requested by Kazakov','2020-03-01 03:20:40','2020-03-01 03:20:40'),(110,'EDMC-Triumvirate.1.0.7','Requested by Kazakov','2020-03-01 03:20:40','2020-03-01 03:20:40'),(115,'EDMC-Triumvirate.1.0.8','Requested by Kazakov','2020-03-01 03:20:51','2020-03-01 03:20:51'),(120,'EDMC-Triumvirate.1.1.0','Requested by Kazakov','2020-03-01 03:21:10','2020-03-01 03:21:10'),(123,'EDMC-Triumvirate.1.1.1','Requested by Kazakov','2020-03-01 03:24:30','2020-03-01 03:24:30'),(125,'EDMC-Triumvirate.1.1.2','Requested by Kazakov','2020-03-01 03:24:41','2020-03-01 03:24:41'),(129,'EDMC-Triumvirate.1.1.3','Requested by Kazakov','2020-03-01 03:24:45','2020-03-01 03:24:45'),(130,'EDMC-Triumvirate.1.1.4','Requested by Kazakov','2020-03-01 03:24:48','2020-03-01 03:24:48'),(134,'EDMC-Triumvirate.1.1.5','Requested by Kazakov','2020-03-01 03:24:52','2020-03-01 03:24:52'),(138,'EDMC-Triumvirate.1.1.6','Requested by Kazakov','2020-03-01 03:24:55','2020-03-01 03:24:55'),(142,'EDMC-Triumvirate.1.1.7','Requested by Kazakov','2020-03-01 03:24:59','2020-03-01 03:24:59'),(145,'EDMC-Triumvirate.1.1.8','Requested by Kazakov','2020-03-01 03:25:02','2020-03-01 03:25:02'),(149,'EDMC-Triumvirate.1.1.9','Requested by Kazakov','2020-03-01 03:25:07','2020-03-01 03:25:07'),(150,'EDMC-Triumvirate.1.1.10','Requested by Kazakov','2020-03-01 03:25:11','2020-03-01 03:25:11');
/*!40000 ALTER TABLE `excludeclients` ENABLE KEYS */;
UNLOCK TABLES;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_EXCLUDECMDRS` (`cmdrName`,`reason`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excludecmdrs`
--

LOCK TABLES `excludecmdrs` WRITE;
/*!40000 ALTER TABLE `excludecmdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `excludecmdrs` ENABLE KEYS */;
UNLOCK TABLES;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_EXCLUDECODICES` (`codexName`,`reason`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excludecodices`
--

LOCK TABLES `excludecodices` WRITE;
/*!40000 ALTER TABLE `excludecodices` DISABLE KEYS */;
INSERT INTO `excludecodices` VALUES (1,'codex_ent_a_type','Star Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(2,'codex_ent_aebe_type','Star Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(3,'codex_ent_b_type','Star Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(4,'codex_ent_black_holes','Star Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(5,'codex_ent_da_type','Star Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(6,'codex_ent_dab_type','Star Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(7,'codex_ent_earth_likes','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(8,'codex_ent_f_type','Star type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(9,'codex_ent_g_type','Star Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(10,'codex_ent_g_typegiant','Star Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(11,'codex_ent_k_type','Star Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(12,'codex_ent_l_type','Star Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(13,'codex_ent_m_type','Star Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(14,'codex_ent_neutron_stars','Star Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(15,'codex_ent_standard_ammonia_worlds','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(16,'codex_ent_standard_giant_with_ammonia_life','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(17,'codex_ent_standard_giant_with_water_life','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(18,'codex_ent_standard_helium_rich','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(19,'codex_ent_standard_high_metal_content_no_atmos','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(20,'codex_ent_standard_ice_no_atmos','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(21,'codex_ent_standard_metal_rich_no_atmos','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(22,'codex_ent_standard_rocky_ice_no_atmos','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(23,'codex_ent_standard_rocky_no_atmos','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(24,'codex_ent_standard_sudarsky_class_i','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(25,'codex_ent_standard_sudarsky_class_ii','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(26,'codex_ent_standard_sudarsky_class_iii','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(27,'codex_ent_standard_sudarsky_class_iv','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(28,'codex_ent_standard_sudarsky_class_v','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(29,'codex_ent_standard_ter_high_metal_content','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(30,'codex_ent_standard_ter_ice','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(31,'codex_ent_standard_ter_metal_rich','Body type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(32,'codex_ent_standard_ter_rocky','Body type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(33,'codex_ent_standard_ter_rocky_ice','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(34,'codex_ent_standard_water_giant','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(35,'codex_ent_standard_water_worlds','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(36,'codex_ent_t_type','Star Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(37,'codex_ent_trf_high_metal_content_no_atmos','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(38,'codex_ent_trf_rocky_no_atmos','Body type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(39,'codex_ent_trf_ter_high_metal_content','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(40,'codex_ent_trf_ter_rocky','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(41,'codex_ent_trf_water_worlds','Body Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(42,'codex_ent_tts_type','Star Type','2019-04-06 22:14:09','2019-04-06 22:14:09'),(43,'codex_ent_y_type','Star Type','2019-04-06 22:14:09','2019-04-06 22:14:09');
/*!40000 ALTER TABLE `excludecodices` ENABLE KEYS */;
UNLOCK TABLES;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_EXCLUDEEVENTS` (`eventName`,`reason`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excludeevents`
--

LOCK TABLES `excludeevents` WRITE;
/*!40000 ALTER TABLE `excludeevents` DISABLE KEYS */;
INSERT INTO `excludeevents` VALUES (1,'AfmuRepairs','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(2,'AppliedToSquadron','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(3,'ApproachBody','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(4,'AsteroidCracked','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(5,'Bounty','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(6,'BuyAmmo','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(7,'BuyDrones','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(8,'BuyExplorationData','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(9,'BuyTradeData','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(10,'CapShipBond','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(11,'Cargo','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(12,'CargoDepot','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(13,'ChangeCrewRole','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(14,'CockpitBreached','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(15,'CodexEntry','Tracked via codexreports','2019-04-06 22:14:09','2019-04-06 22:14:09'),(16,'CollectCargo','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(17,'Commander','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(18,'CommitCrime','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(19,'CommunityGoal','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(20,'CommunityGoalDiscard','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(21,'CrewAssign','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(22,'CrewFire','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(23,'CrewHire','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(24,'CrewLaunchFighter','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(25,'CrewMemberJoins','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(26,'CrewMemberQuits','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(27,'CrewMemberRoleChange','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(28,'CrimeVictim','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(29,'DatalinkScan','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(30,'DatalinkVoucher','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(31,'DataScanned','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(32,'Died','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(33,'DiscoveryScan','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(34,'Docked','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(35,'DockFighter','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(36,'DockingCancelled','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(37,'DockingDenied','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(38,'DockingGranted','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(39,'DockingRequested','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(40,'DockingTimeout','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(41,'DockSRV','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(42,'EjectCargo','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(43,'EndCrewSession','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(44,'EngineerApply','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(45,'EngineerContribution','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(46,'EngineerCraft','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(47,'EngineerProgress','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(48,'EscapeInterdiction','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(49,'FactionKillBond','This has its own model','2019-04-06 22:14:09','2019-04-06 22:14:09'),(50,'FetchRemoteModule','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(51,'FighterDestroyed','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(52,'FighterRebuilt','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(53,'Fileheader','Unknown Reason','2019-04-06 22:14:09','2019-04-06 22:14:09'),(54,'Friends','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(55,'FSDJump','EDSM Tracks','2019-04-06 22:14:09','2019-04-06 22:14:09'),(56,'FSDTarget','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(57,'FSSAllBodiesFound','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(58,'FSSDiscoveryScan','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(59,'FSSSignalDiscovered','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(60,'FuelScoop','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(61,'HeatDamage','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(62,'HeatWarning','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(63,'HullDamage','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(64,'Interdicted','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(65,'Interdiction','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(66,'InvitedToSquadron','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(67,'JetConeBoost','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(68,'JetConeDamage','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(69,'JoinACrew','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(70,'JoinedSquadron','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(71,'KickCrewMember','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(72,'LaunchDrone','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(73,'LaunchFighter','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(74,'LaunchSRV','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(75,'LeaveBody','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(76,'LeftSquadron','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(77,'Liftoff','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(78,'LoadGame','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(79,'Loadout','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(80,'Location','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(81,'Market','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(82,'MarketBuy','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(83,'MarketSell','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(84,'MassModuleStore','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(85,'MaterialCollected','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(86,'MaterialDiscarded','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(87,'MaterialDiscovered','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(88,'Materials','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(89,'MaterialTrade','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(90,'MiningRefined','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(91,'MissionAbandoned','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(92,'MissionAccepted','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(93,'MissionCompleted','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(94,'MissionFailed','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(95,'MissionRedirected','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(96,'Missions','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(97,'ModuleBuy','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(98,'ModuleInfo','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(99,'ModuleRetrieve','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(100,'ModuleSell','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(101,'ModuleSellRemote','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(102,'ModuleStore','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(103,'ModuleSwap','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(104,'MultiSellExplorationData','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(105,'Music','Unknown Reason','2019-04-06 22:14:09','2019-04-06 22:14:09'),(106,'NavBeaconScan','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(107,'NewCommander','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(108,'NpcCrewPaidWage','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(109,'NpcCrewRank','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(110,'Outfitting','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(111,'Passengers','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(112,'PayBounties','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(113,'PayFines','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(114,'PayLegacyFines','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(115,'Powerplay','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(116,'PowerplayCollect','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(117,'PowerplayDefect','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(118,'PowerplayDeliver','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(119,'PowerplayFastTrack','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(120,'PowerplayJoin','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(121,'PowerplayLeave','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(122,'PowerplaySalary','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(123,'PowerplayVote','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(124,'PowerplayVoucher','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(125,'Progress','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(126,'Promotion','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(127,'ProspectedAsteroid','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(128,'PVPKill','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(129,'QuitACrew','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(130,'Rank','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(131,'RebootRepair','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(132,'ReceiveText','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(133,'RedeemVoucher','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(134,'RefuelAll','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(135,'RefuelPartial','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(136,'Repair','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(137,'RepairAll','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(138,'RepairDrone','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(139,'Reputation','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(140,'ReservoirReplenished','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(141,'RestockVehicle','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(142,'Resurrect','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(143,'SAAScanComplete','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(144,'Scan','EDSM Tracks','2019-04-06 22:14:09','2019-04-06 22:14:09'),(145,'Scanned','Nothing interesting','2019-04-06 22:14:09','2019-04-06 22:14:09'),(146,'Screenshot','Pending on if we need this to submit screenshot data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(147,'SearchAndRescue','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(148,'SelfDestruct','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(149,'SellDrones','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(150,'SellExplorationData','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(151,'SendText','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(152,'SetUserShipName','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(153,'SharedBookmarkToSquadron','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(154,'ShieldState','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(155,'ShipTargeted','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(156,'Shipyard','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(157,'ShipyardBuy','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(158,'ShipyardNew','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(159,'ShipyardSell','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(160,'ShipyardSwap','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(161,'ShipyardTransfer','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(162,'ShutDown','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(163,'SquadronStartup','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(164,'SRVDestroyed','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(165,'StartJump','EDSM Tracks','2019-04-06 22:14:09','2019-04-06 22:14:09'),(166,'StartUp','EDMC Event','2019-04-06 22:14:09','2019-04-06 22:14:09'),(167,'Statistics','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(168,'StoredModules','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(169,'StoredShips','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(170,'SupercruiseEntry','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(171,'SupercruiseExit','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(172,'Synthesis','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(173,'SystemsShutdown','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(174,'TechnologyBroker','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(175,'Touchdown','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(176,'UnderAttack','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(177,'Undocked','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(178,'USSDrop','We capture data another way','2019-04-06 22:14:09','2019-04-06 22:14:09'),(179,'VehicleSwitch','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(180,'WingAdd','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(181,'WingInvite','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(182,'WingJoin','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(183,'WingLeave','Canonn doesn\'t need this data','2019-04-06 22:14:09','2019-04-06 22:14:09'),(203,'ApproachSettlement','Prevent spam to reportevents','2020-03-21 22:22:34','2020-03-21 22:22:34');
/*!40000 ALTER TABLE `excludeevents` ENABLE KEYS */;
UNLOCK TABLES;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_EXCLUDEFSS` (`fssName`,`reason`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excludefss`
--

LOCK TABLES `excludefss` WRITE;
/*!40000 ALTER TABLE `excludefss` DISABLE KEYS */;
INSERT INTO `excludefss` VALUES (1,'$Aftermath_Large;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(2,'$Aftermath_Medium;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(3,'$Aftermath_Small;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(4,'$Ari_controlScenarioTitle;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(5,'$FIXED_EVENT_CAPSHIP;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(6,'$FIXED_EVENT_CHECKPOINT;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(7,'$FIXED_EVENT_CONVOY;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(8,'$FIXED_EVENT_DEBRIS;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(9,'$FIXED_EVENT_HIGHTHREATSCENARIO_T5;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(10,'$FIXED_EVENT_HIGHTHREATSCENARIO_T6;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(11,'$FIXED_EVENT_HIGHTHREATSCENARIO_T7;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(12,'$FIXED_EVENT_NUMBERSTATION;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(13,'$FIXED_EVENT_PROBE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(14,'$ListeningPost;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(15,'$MULTIPLAYER_SCENARIO1_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(16,'$MULTIPLAYER_SCENARIO10_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(17,'$MULTIPLAYER_SCENARIO100_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(18,'$MULTIPLAYER_SCENARIO11_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(19,'$MULTIPLAYER_SCENARIO12_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(20,'$MULTIPLAYER_SCENARIO13_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(21,'$MULTIPLAYER_SCENARIO14_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(22,'$MULTIPLAYER_SCENARIO15_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(23,'$MULTIPLAYER_SCENARIO16_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(24,'$MULTIPLAYER_SCENARIO17_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(25,'$MULTIPLAYER_SCENARIO18_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(26,'$MULTIPLAYER_SCENARIO19_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(27,'$MULTIPLAYER_SCENARIO2_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(28,'$MULTIPLAYER_SCENARIO20_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(29,'$MULTIPLAYER_SCENARIO21_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(30,'$MULTIPLAYER_SCENARIO22_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(31,'$MULTIPLAYER_SCENARIO23_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(32,'$MULTIPLAYER_SCENARIO24_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(33,'$MULTIPLAYER_SCENARIO25_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(34,'$MULTIPLAYER_SCENARIO26_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(35,'$MULTIPLAYER_SCENARIO27_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(36,'$MULTIPLAYER_SCENARIO28_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(37,'$MULTIPLAYER_SCENARIO29_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(38,'$MULTIPLAYER_SCENARIO3_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(39,'$MULTIPLAYER_SCENARIO30_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(40,'$MULTIPLAYER_SCENARIO31_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(41,'$MULTIPLAYER_SCENARIO32_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(42,'$MULTIPLAYER_SCENARIO33_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(43,'$MULTIPLAYER_SCENARIO34_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(44,'$MULTIPLAYER_SCENARIO35_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(45,'$MULTIPLAYER_SCENARIO36_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(46,'$MULTIPLAYER_SCENARIO37_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(47,'$MULTIPLAYER_SCENARIO38_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(48,'$MULTIPLAYER_SCENARIO39_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(49,'$MULTIPLAYER_SCENARIO4_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(50,'$MULTIPLAYER_SCENARIO40_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(51,'$MULTIPLAYER_SCENARIO41_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(52,'$MULTIPLAYER_SCENARIO42_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(53,'$MULTIPLAYER_SCENARIO43_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(54,'$MULTIPLAYER_SCENARIO44_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(55,'$MULTIPLAYER_SCENARIO45_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(56,'$MULTIPLAYER_SCENARIO46_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(57,'$MULTIPLAYER_SCENARIO47_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(58,'$MULTIPLAYER_SCENARIO48_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(59,'$MULTIPLAYER_SCENARIO49_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(60,'$MULTIPLAYER_SCENARIO5_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(61,'$MULTIPLAYER_SCENARIO50_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(62,'$MULTIPLAYER_SCENARIO51_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(63,'$MULTIPLAYER_SCENARIO52_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(64,'$MULTIPLAYER_SCENARIO53_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(65,'$MULTIPLAYER_SCENARIO54_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(66,'$MULTIPLAYER_SCENARIO55_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(67,'$MULTIPLAYER_SCENARIO56_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(68,'$MULTIPLAYER_SCENARIO57_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(69,'$MULTIPLAYER_SCENARIO58_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(70,'$MULTIPLAYER_SCENARIO59_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(71,'$MULTIPLAYER_SCENARIO6_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(72,'$MULTIPLAYER_SCENARIO60_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(73,'$MULTIPLAYER_SCENARIO61_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(74,'$MULTIPLAYER_SCENARIO62_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(75,'$MULTIPLAYER_SCENARIO63_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(76,'$MULTIPLAYER_SCENARIO64_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(77,'$MULTIPLAYER_SCENARIO65_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(78,'$MULTIPLAYER_SCENARIO66_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(79,'$MULTIPLAYER_SCENARIO67_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(80,'$MULTIPLAYER_SCENARIO68_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(81,'$MULTIPLAYER_SCENARIO69_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(82,'$MULTIPLAYER_SCENARIO7_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(83,'$MULTIPLAYER_SCENARIO70_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(84,'$MULTIPLAYER_SCENARIO71_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(85,'$MULTIPLAYER_SCENARIO72_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(86,'$MULTIPLAYER_SCENARIO73_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(87,'$MULTIPLAYER_SCENARIO74_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(88,'$MULTIPLAYER_SCENARIO75_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(89,'$MULTIPLAYER_SCENARIO76_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(90,'$MULTIPLAYER_SCENARIO77_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(91,'$MULTIPLAYER_SCENARIO78_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(92,'$MULTIPLAYER_SCENARIO79_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(93,'$MULTIPLAYER_SCENARIO8_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(94,'$MULTIPLAYER_SCENARIO80_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(95,'$MULTIPLAYER_SCENARIO81_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(96,'$MULTIPLAYER_SCENARIO82_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(97,'$MULTIPLAYER_SCENARIO83_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(98,'$MULTIPLAYER_SCENARIO84_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(99,'$MULTIPLAYER_SCENARIO85_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(100,'$MULTIPLAYER_SCENARIO86_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(101,'$MULTIPLAYER_SCENARIO87_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(102,'$MULTIPLAYER_SCENARIO88_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(103,'$MULTIPLAYER_SCENARIO89_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(104,'$MULTIPLAYER_SCENARIO9_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(105,'$MULTIPLAYER_SCENARIO90_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(106,'$MULTIPLAYER_SCENARIO91_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(107,'$MULTIPLAYER_SCENARIO92_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(108,'$MULTIPLAYER_SCENARIO93_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(109,'$MULTIPLAYER_SCENARIO94_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(110,'$MULTIPLAYER_SCENARIO95_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(111,'$MULTIPLAYER_SCENARIO96_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(112,'$MULTIPLAYER_SCENARIO97_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(113,'$MULTIPLAYER_SCENARIO98_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(114,'$MULTIPLAYER_SCENARIO99_TITLE;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(115,'$NumberStation;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(116,'$Rep_AltcontrolScenarioTitle;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(117,'$Rep_controlScenarioTitle;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(118,'$USS;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(119,'$USS_CeremonialComms;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(120,'$USS_ConvoyDispersalPattern;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(121,'$USS_DegradedEmissions;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(122,'$USS_DistressCall;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(123,'$USS_EncodedEmissions;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(124,'$USS_HighGradeEmissions;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(125,'$USS_NonHumanSignalSource;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(126,'$USS_TradingBeacon;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(127,'$USS_WeaponsFire;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(128,'$Warzone_PointRace_High;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(129,'$Warzone_PointRace_Low;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43'),(130,'$Warzone_PointRace_Med;','Canonn doesn\'t need this','2019-06-17 17:07:43','2019-06-17 17:07:43');
/*!40000 ALTER TABLE `excludefss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fgreports`
--

DROP TABLE IF EXISTS `fgreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fgreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  `reportType` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fgreports`
--

LOCK TABLES `fgreports` WRITE;
/*!40000 ALTER TABLE `fgreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `fgreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fgsites`
--

DROP TABLE IF EXISTS `fgsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fgsites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `fgsites_siteID_unique` (`siteID`),
  UNIQUE KEY `fgsites_extoolID_unique` (`extoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fgsites`
--

LOCK TABLES `fgsites` WRITE;
/*!40000 ALTER TABLE `fgsites` DISABLE KEYS */;
/*!40000 ALTER TABLE `fgsites` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `fgtypes`
--

LOCK TABLES `fgtypes` WRITE;
/*!40000 ALTER TABLE `fgtypes` DISABLE KEYS */;
INSERT INTO `fgtypes` VALUES (1,'Unknown','',NULL),(2,'Luteolum Anemone','codex_ent_sphere',2100401),(3,'Croceum Anemone','codex_ent_sphereabcd_01',2100402),(4,'Puniceum Anemone','codex_ent_sphereabcd_02',2100403),(5,'Roseum Anemone','codex_ent_sphereabcd_03',2100404),(6,'Blatteum Bioluminescent Anemone','codex_ent_sphereefgh',2100405),(7,'Rubeum Bioluminescent Anemone','codex_ent_sphereefgh_01',2100406),(8,'Prasinum Bioluminescent Anemone','codex_ent_sphereefgh_02',2100407),(9,'Roseum Bioluminescent Anemone','codex_ent_sphereefgh_03',2100408);
/*!40000 ALTER TABLE `fgtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fmreports`
--

DROP TABLE IF EXISTS `fmreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fmreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  `reportType` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fmreports`
--

LOCK TABLES `fmreports` WRITE;
/*!40000 ALTER TABLE `fmreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `fmreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fmsites`
--

DROP TABLE IF EXISTS `fmsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fmsites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `fmsites_siteID_unique` (`siteID`),
  UNIQUE KEY `fmsites_extoolID_unique` (`extoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fmsites`
--

LOCK TABLES `fmsites` WRITE;
/*!40000 ALTER TABLE `fmsites` DISABLE KEYS */;
/*!40000 ALTER TABLE `fmsites` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fmtypes`
--

LOCK TABLES `fmtypes` WRITE;
/*!40000 ALTER TABLE `fmtypes` DISABLE KEYS */;
INSERT INTO `fmtypes` VALUES (1,'Unknown','',NULL),(2,'Sulphur Dioxide Fumarole','codex_ent_fumarole_sulphurdioxidemagma',1400102),(3,'Water Fumarole','codex_ent_fumarole_watergeysers',1400108),(4,'Silicate Vapour Fumarole','codex_ent_fumarole_silicatevapourgeysers',1400114),(5,'Sulphur Dioxide Ice Fumarole','codex_ent_icefumarole_sulphurdioxidemagma',1400152),(6,'Water Ice Fumarole','codex_ent_icefumarole_watergeysers',1400158),(7,'Carbon Dioxide Ice Fumarole','codex_ent_icefumarole_carbondioxidegeysers',1400159),(8,'Ammonia Ice Fumarole','codex_ent_icefumarole_ammoniageysers',1400160),(9,'Methane Ice Fumarole','codex_ent_icefumarole_methanegeysers',1400161),(10,'Nitrogen Ice Fumarole','codex_ent_icefumarole_nitrogengeysers',1400162),(11,'Silicate Vapour Ice Fumarole','codex_ent_icefumarole_silicatevapourgeysers',1400164),(13,'Carbon Dioxide Fumarole','codex_ent_fumarole_carbondioxidegeysers',1400109);
/*!40000 ALTER TABLE `fmtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gbmessages`
--

DROP TABLE IF EXISTS `gbmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gbmessages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gbsite` int(11) DEFAULT NULL,
  `messageSystem` int(11) DEFAULT NULL,
  `messageBody` int(11) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gbmessages`
--

LOCK TABLES `gbmessages` WRITE;
/*!40000 ALTER TABLE `gbmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `gbmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gbreports`
--

DROP TABLE IF EXISTS `gbreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gbreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  `reportType` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `messageSystem` varchar(255) DEFAULT NULL,
  `messageBody` varchar(255) DEFAULT NULL,
  `messageLatitude` double DEFAULT NULL,
  `messageLongitude` double DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gbreports`
--

LOCK TABLES `gbreports` WRITE;
/*!40000 ALTER TABLE `gbreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `gbreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gbsites`
--

DROP TABLE IF EXISTS `gbsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gbsites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) NOT NULL,
  `gssite` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `gbmessage` int(11) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `gbsites_siteID_unique` (`siteID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gbsites`
--

LOCK TABLES `gbsites` WRITE;
/*!40000 ALTER TABLE `gbsites` DISABLE KEYS */;
/*!40000 ALTER TABLE `gbsites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genlogs`
--

DROP TABLE IF EXISTS `genlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genlogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gensite` int(11) DEFAULT NULL,
  `logNumber` int(11) NOT NULL,
  `logTitle` varchar(255) NOT NULL,
  `logBody` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genlogs`
--

LOCK TABLES `genlogs` WRITE;
/*!40000 ALTER TABLE `genlogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `genlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genreports`
--

DROP TABLE IF EXISTS `genreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  `reportType` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `orbitBody` varchar(255) DEFAULT NULL,
  `shipName` varchar(255) NOT NULL,
  `directionSystem` varchar(255) DEFAULT NULL,
  `distance` double DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genreports`
--

LOCK TABLES `genreports` WRITE;
/*!40000 ALTER TABLE `genreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `genreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gensites`
--

DROP TABLE IF EXISTS `gensites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gensites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) NOT NULL,
  `shipName` varchar(255) NOT NULL,
  `directionSystem` int(11) DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `gensites_siteID_unique` (`siteID`),
  UNIQUE KEY `gensites_shipName_unique` (`shipName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gensites`
--

LOCK TABLES `gensites` WRITE;
/*!40000 ALTER TABLE `gensites` DISABLE KEYS */;
/*!40000 ALTER TABLE `gensites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gractivegroups`
--

DROP TABLE IF EXISTS `gractivegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gractivegroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grSite` int(11) DEFAULT NULL,
  `activeGroup` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gractivegroups`
--

LOCK TABLES `gractivegroups` WRITE;
/*!40000 ALTER TABLE `gractivegroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `gractivegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gractiveobelisks`
--

DROP TABLE IF EXISTS `gractiveobelisks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gractiveobelisks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grSite` int(11) DEFAULT NULL,
  `activeObelisk` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gractiveobelisks`
--

LOCK TABLES `gractiveobelisks` WRITE;
/*!40000 ALTER TABLE `gractiveobelisks` DISABLE KEYS */;
/*!40000 ALTER TABLE `gractiveobelisks` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `grartifacts`
--

LOCK TABLES `grartifacts` WRITE;
/*!40000 ALTER TABLE `grartifacts` DISABLE KEYS */;
INSERT INTO `grartifacts` VALUES (1,'Casket'),(2,'Orb'),(3,'Relic'),(4,'Tablet'),(5,'Totem'),(6,'Urn');
/*!40000 ALTER TABLE `grartifacts` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `grcodexcategories`
--

LOCK TABLES `grcodexcategories` WRITE;
/*!40000 ALTER TABLE `grcodexcategories` DISABLE KEYS */;
INSERT INTO `grcodexcategories` VALUES (1,'Biology'),(2,'Culture'),(3,'History'),(4,'Language'),(5,'Technology');
/*!40000 ALTER TABLE `grcodexcategories` ENABLE KEYS */;
UNLOCK TABLES;

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
  `text` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GRCODEXDATA` (`text`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grcodexdata`
--

LOCK TABLES `grcodexdata` WRITE;
/*!40000 ALTER TABLE `grcodexdata` DISABLE KEYS */;
INSERT INTO `grcodexdata` VALUES (1,1,6,3,1,'Thank you commander, this data has proven vital to my ongoing research. While it seemed logical that the alpha-pattern data corresponded with the core information on the Guardians\' biology and ecology, I couldn\'t be certain until I received the data from your scan. I\'m pleased my hypothesis has proved correct, and I\'ve started to unlock some fascinating details about the Guardians. The extracted data relates to individuals rather than their species as a whole, but thanks to the information you have transmitted, I believe I will be able to merge the data to create a general picture.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(2,1,6,6,2,'The information you\'ve uncovered is very interesting and regards the Guardians\' anatomy and physiology, you might be surprised to learn they weren\'t that different to us. Their morphology was bipedal, although they were generally taller and more slender than the average human. Their skin tone was red, encompassing the whole spectrum of red hues. There were various reasons for these changes in pigmentation, including genetic disposition and the fact that they darkened as they aged','2018-11-30 08:14:48','2018-11-30 08:14:48'),(3,1,6,1,3,'Details on the facial structure of the Guardians. Their faces were proportionally smaller than ours and they had round eyes, darkened from their evolution under a very strong sunlight. The colouration and structure of the eye indicates that not only they have keener vision than us, but they could also see a wider spectrum.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(4,1,6,4,4,'This data details the facial structure of the Guardians. The nose appears to have been vestigial - I believe it was once more pronounced, but that some environmental change made it less useful - so their sense of smell would have been less developed than the human average. Their ears were very tightly formed against the skull, and the interesting array of internal acoustic chambers suggest they perceived sounds differently to us','2018-11-30 08:14:48','2018-11-30 08:14:48'),(5,1,6,2,5,'This data offers more details about the physical appearance of the Guardians. Most remarkable are their limbs. Their forelimbs had a serrated edge and were no doubt used as killing implements during the pack-hunting period. They had two more more joints in their arms than we do, facilitating complex articulation and the use of sophisticated sign language. The skeleton was flexible yet resilient and their muscles were long, thin and ropey. They had two hands, each with four digits.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(6,1,6,5,6,'We\'ve barely scratched the surface with the Guardians. There is so much yet to discover. But this new data contains one tantalising detail that stands out: their biochemistry was very similar to our own. They had blood in the same fashion as us, and it fulfilled exactly the same role as it does for us. Beyond this, they share a similar genetic structure, with DNA and RNA their core building blocks. Although a full analysis has not yet been conducted, this might be evidence of a common ancestor, but also of a branching in their genetic history. This is an astounding discovery!','2018-11-30 08:14:48','2018-11-30 08:14:48'),(7,1,6,3,7,'This data offers more details about the physical appearance of the Guardians, specifically regarding genders. The similarities between humans and the Guardians continue to delight me. They had two distinct genders and reproduced sexually. There don\'t appear to have been any taboos surrounding sexual activity, as the data contains a large quantity of graphic images and recordings – not unlike some of our data nets!','2018-11-30 08:14:48','2018-11-30 08:14:48'),(8,1,6,6,8,'This data contains more details about the Guardians\' sexual behaviour and reproduction. Their body form encouraged sex while standing, but although this was the most comfortable pose, they entertained a variety of positions. I\'ve concluded that sex was a recreational behaviour and not only for procreation. They didn\'t use birth control as they could manipulate their bodies to become temporarily sterile at will, although I\'ve not yet identified the precise mechanism for this. It\'s clear their biological-manipulation technology was quite sophisticated. This data has huge applications for Medical treatments if we can unlock the secret.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(9,1,6,1,9,'This data contains more details about the Guardians\' procreation and reproduction. Procreation was a matter of personal choice, although they were required to be a parent at least once during their lives to ensure the continuation of their genetic line. I\'ve not yet established their metric for measuring time, but it\'s clear that the period of gestation was quite long, to allow substantial development of the young prior to birth. The infants were effectively helpless for a period after delivery.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(10,1,6,4,10,'This data contains more details about the Guardians\' approach to raising their young. Care of the young was the duty of the wider community. Infants were raised in communal crèches rather than by their parents, the cultural significance of which I\'m eager to unravel. I have established that prenatal care of the young involved genetic manipulation to remove hereditary diseases and other complications.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(11,1,6,2,11,'Although the alpha-pattern data encapsulates biological information, it also contains a treasure trove of cultural data. This is particularly true of the data you uncovered here. The data package appears to contain records pertaining to their food. I already knew that as pack hunters they were carnivores. I subsequently discovered that not only were their arm ridges excellent for killing prey, they also used for cutting meat into little pieces to fit in their small mouths.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(12,1,6,5,12,'This data contains details about etiquette and hunting. The imperative of the kill was retained even as their society advanced. Food killed in the hunt was a delicacy. For guests, it was an honour to provide their host with something that had been hunted, but the host was expected to provide the same. Meat that had been hunted by a lone individual was given even greater accord. For a kill to be valid, it had to be achieved without weapons. Weaponry was only for civil defence or law enforcement.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(13,1,6,NULL,13,'This data contains details about etiquette feeding habits and hunting. Non-indigenous animals were considered a particular delicacy. The Guardians\' expansion into space introduced them to new ecologies and, consequently, to new food. So far I\'ve had little success in determining the details of these alien creatures or where they were obtained, but it was certainly a valuable trade for the Guardians. Huge parks and reserves were constructed on their worlds where they could hunt both local and imported animals.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(14,1,6,6,14,'This data is particularly interesting. It appears that another indication of their prowess in biological manipulation was the creation of unique creatures for consumption. This was done to ensure adequate supplies for the general population, although there was also a specialist trade. Having an animal created for a specific celebration demonstrated the owner\'s status and wealth, but being the creator of such a delicacy meant even greater honour. This part of the research could aid us in food production and make famine a thing of the past.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(15,1,6,1,15,'It seems that most of this data package has become corrupted, however I have been able to decipher one section. It seems that the Guardians retained the ability to digest raw meat, and most meals were served uncooked, although they did appreciate cooked meat. This became an almost ceremonial aspect of their eating, and was often incorporated into formal meals.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(16,1,6,4,16,'This data is fascinating commander. I now have a better understanding of the types of environment and how that relates to the Guardians\' development. The alpha-pattern data has yielded a wealth of information on the Guardians, but throughout my research I\'ve also been looking for information on their homeworld...and now I think I\'ve found what we need! The location of their homeworld still eludes me, but this new data may give enough for us to narrow the search criteria.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(17,1,6,2,17,'This data contains more details about the Guardians\' physiology regarding their environment. Looking through previous data collected by pilots like yourself, It came as no surprise to learn that their environmental requirements were very similar to our own. Barring any local biological threats, we could easily live on their worlds - they wouldn\'t even need terraforming. In fact, we would find their worlds more comfortable than the Guardians would ours.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(18,1,6,5,18,'This data contains more details about the Guardians\' physiology regarding their environment. I can see from this data that humanity would indeed be able to cope if not thrive on the same worlds as the Guardians and vice versa. The first key difference is gravity. Most of their worlds have a lower gravity rating than we would consider normal, which no doubt explains their taller, more slender frame. Their flexible bone structure would adapt to high gravity with little discomfort or loss in physical strength.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(19,1,6,3,19,'This data contains more details about the Guardians\' physiology regarding their environment. This data shows that they preferred warmer worlds than we do, and don\'t appear to have been well suited to colder climates. Fragments of their history reveal that they experienced changes in climate in their early history, and it was that - rather than conflict - that prompted their technological development. They had thick skins but lacked a fatty layer, which I think reduced their ability to function in cold temperatures. More and more, the alpha-pattern data extends to include aspects of their culture. It\'s fascinating subject matter, but I still need more data.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(20,2,5,3,1,'This is very interesting commander. This is a new data pattern. I have given it the designation beta-pattern data. I can already report that it contains some fascinating insights into the Guardians culture. The first is that religion formed a large part of their lives. Strangely this seems to have occurred late in their development, after various technological revolutions. The details are a bit vague in this data package. There must be others that hold more cultural details. Please continue the search.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(21,2,5,5,2,'Your hard work is paying off commander. This data holds more details about the Guardians\' culture, specifically spiritual matters. Almost from the dawn of their civilisation they possessed a strong spiritual sense - one that reflected their close connection to the natural world. Even when they\'d developed industrial-scale machinery, they maintained a balance with the world around them. Their ongoing love of hunting presumably played a significant part in this','2018-11-30 08:14:48','2018-11-30 08:14:48'),(22,2,5,1,3,'This data holds more details about the Guardians\' culture, specifically spiritual matters. This spiritual awareness sustained them through most of their history, but did not evolve into a formal religion. It was not until the development of machine intelligence, during the most rapid era of their development, that any sort of organised religion emerged. I speculate that this technological singularity alienated much of the population, who responded by rejecting this technology.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(23,2,5,6,4,'This data holds more details about the Guardians\' culture. The tipping point that gave rise to organised religion amongst the Guardians doesn\'t appear to have been the creation of thinking machines, but other technological developments - in particular a kind of implant that interfaced with the brain. Up to this point, biological enhancement and repair had utilised only organic-based systems, so this sudden change frightened many.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(24,2,5,4,5,'This is very interesting, very interesting indeed. This data holds more details about the Guardians\' culture. There was an anti-technology movement that rejected not only specific developments, but also inventions such as virtual reality. The loose customs associated with their affinity for nature formed the basis for a new belief system. It evolved rapidly - almost as quickly as the technological advancements produced by the scientists and machine intelligences. It\'s interesting to note the parallels with human-made sentient technology, and how its development threatened humanity during the golden age of technological advancement. The growth of this new religion divided the population, and conflict soon erupted','2018-11-30 08:14:48','2018-11-30 08:14:48'),(25,2,5,2,6,'This data holds some shocking revelations. it talks about the religion that emerged towards the end of the guardians civilisation and I wont lie it has shocked me. while religion remains a feature of human society, unless you live in one of the more extreme theocracies, its generally a matter of personal faith rather than a generally accepted consequence of the human condition. I know some of my fellow researchers would disagree with me. but it is generally assumed that religious beliefs tends to reduce their potency as scientific understanding grows in the case of the guardians, the opposite holds true, it truly divided them.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(26,2,5,2,7,'This data does not paint a bright picture of the Guardians culture at the point it was recorded. As I examined the data in this beta pattern and crossed references from other data I have received, I have learned that the truth wasn\'t quite so clear cut. The information I\'ve extracted regarding their legal system indicates a stable and mature society. Given the physical similarities between us and them, I\'m amazed at the cultural and societal differences and the speed at which they rose to become part of their lives.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(27,2,5,5,8,'This data contains cultural data, specifically regarding the legal system of the Guardians. In contrast to many of our legal systems, the fundamental laws do not concern individual right, but instead focus on defining the individual\'s responsibilities to society. I\'m sure this is another reflection of their pack mentality, where the requirements of the group supersede those of a single person. Naturally it isn\'t as simple as that in practice – for example, individuals were expected to come to another\'s aid if necessary.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(28,2,5,1,9,'This data contains cultural data, specifically regarding the legal system of the Guardians. An individuals responsibility extended, past simply obeying the law to include elements of law enforcement. Society was self regulated, with everyone required to ensure laws were obeyed. These values were instilled in the young as part of their education in the communal crèches.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(29,2,5,6,10,'This data contains cultural data, specifically further details regarding social responsibility. As well as being regulated, there was still hierarchical form of administration within the legal system. These were defined by areas of responsibility, but as with all the Guardians’ social structures, everyone was expected to participate, meaning that individuals were required to fill certain legislative roles as part of their everyday life. Some of the concepts aren’t completely clear, but I believe individuals were nominated and couldn’t hold office for more than a single term.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(30,2,5,4,11,'An excellent discovery commander. I was wondering when we would find this type of cultural data. I had begun to fear it might not exist. You can tell a lot about a people from their art. Humanity has demonstrated great creativity in artistic expression throughout history, and I\'m keen to compare our art with the Guardians\'. Fortunately I\'ve been able to tease some details from the beta-pattern data abstracts in this data package. We already knew they were capable of fabulous architecture, but these records show that buildings, statues, monoliths and even city layouts were a common outlet for aesthetic expression.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(31,2,5,2,12,'This is truly fascinating data commander, as an engineer myself I have to admit I’m highly curious about the Guardians technology. It seems that the Guardians had a particular fascination with geometric shapes, which they used to illustrate connections between themselves and the world around them. This predilection manifested itself in their technology as well - specifically their monolith network. With this data and the help of the galactic community we’ve partially mapped the monolith network, which formed the backbone of their communications technology, and discovered that they too are arranged in geometric patterns. Whilst this does not give us full access to the network, I believe it is the first step to unlocking the entire system and maybe more.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(32,2,5,3,13,'This data contains more details on the Guardians\' culture, specifically art. Many of the records I\'ve now extracted include the data you\'ve just sent through, show that most of the Guardians\' art had a religious basis. It seems that their shift to a religious society affected all aspects of their lives. I have found older records that indicate other art forms did exist, with realistic and abstract techniques evident. I hoping that some of the data we\'ve yet to decode will contain images of these art works.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(33,2,5,NULL,14,'This data contains more details on the Guardians\' culture, specifically art and how it fitted into social responsibility. It appears each individual Guardian had a cultural commitment to create and share works of art. While it\'s clear that the quality varied between individuals, all works were considered worthy by virtue of their efforts alone. This package does in fact contain many images of their works. It is truly interesting, such a pity we might never know the meaning behind many of these pieces.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(34,2,5,5,15,'A human observer might find the Guardians\' visual art severe and lacking in emotion, but the same could not be said of their music. They didn\'t use musical instruments, so strictly speaking it\'s singing, although I think they might have used their bodies for rhythm and percussion. I\'ve extracted audio from the data you have collected and have listened to, for want of a better term, their “songs”. The range of their voices is something to be admired. And it\'s so rich with emotion – many pieces are so haunting, it breaks the heart to listen them.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(35,2,5,1,16,'This is very interesting data commander. The data describes what must have been a kind of counter culture. Dancing was considered taboo, especially when combined with language gestures, but there is evidence that gesture dances were popular with adolescents, possibly as a form of rebellion. I\'m not sure why such activity was prohibited, but it might have something to do with potentially conflicting information - something they took great pains to avoid.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(36,2,5,6,17,'This data contains details of other past times and cultural events. As a consequence of their extensive industrial automation, the Guardians had a lot more time for social pursuits than we do. It\'s another interesting contrast - we have a similar capability, but our fear of surrendering control to machine intelligence means we remain wedded to idiosyncratic working practices. We could learn so much from this species - I only hope that in some small measure my research guides us toward such enlightenment.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(37,2,5,4,18,'This data contains details of other past times and cultural events. The Guardians didn\'t waste the freedom their technological advancements offered: leisure activities were encouraged, even expected, as part of normal social intercourse. Time was devoted to social responsibilities and furthering personal abilities. Scientific research is a good example of this. Although they stagnated in their later period, throughout their early history the Guardians had a societal obligation to seek out and share knowledge. Research was often conducted in vast collaborative programmes, which were also seen as vital learning experiences.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(38,2,5,2,19,'This data contains more cultural information. Their attitude towards their varied endeavours sets them apart from humans. Their social obligations were not seen as chores - in fact they enjoyed participating in these roles. Because all were obligated to take part, it meant social responsibilities were often a short-term diversion, as well as allowing individuals to accrue a variety of experience. I also think there was a biochemical component that enhanced their enjoyment of such tasks, but I haven\'t been able to prove that supposition yet.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(39,2,5,3,20,'This data contains more details about entertainment as a cultural activity. I believe this data show that the Guardians enjoyed what we would consider traditional entertainment. The performance of classical stories and historical epics seem to have been very popular. Their equivalent to theatre was more participatory than ours, with less of a distinction between audience and performer - so much so that the term \'enactment\' might be more accurate than \'theatre\'. It\'s just another example of this species\' incredible social dynamics.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(40,3,1,NULL,1,'While I haven’t been able to establish a granular time frame for the Guardians, This data you have uncovered has allowed me to identify general eras. Once again I am indebted to you for gathering valuable research data - particularly the gamma-pattern data packages that have helped me unlock this information. The new data illustrates the Guardians’ impressive development. Details of the Guardians’ very early history are sketchy at best, but there’s enough detail for me to reach a few conclusions. We know they evolved as pack hunters with tribal groups of 20 to 30 individuals. They lived in jungle regions similar to those found on Earth, and preferred very hot and humid climates.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(41,3,1,1,2,'This data is remarkable and covers the early history of the Guardians. They were highly intelligent, and developed sophisticated and effective hunting strategies that quickly saw them become the apex predator in their biomes. Their agility allowed them to take advantage of varied terrain and so avoid predation themselves. I was surprised to learn they were nomadic rather than territorial, but this appears to have been motivated by a desire to mix with other groups and increase genetic diversity rather than a lack of prey. The Guardians developed their core vocal and gestural methods of communication quite early, although it wasn\'t until they developed tools that they were able to record suck communication.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(42,3,1,6,3,'This data is very interesting and covers the early history of the Guardians. The Guardians\' recorded history begins much earlier than it does in human history. Their early art appears to be concerned more with recording practical activity than with personal expression, so maybe this practicality was a factor. Their earliest records tell of a great upheaval caused by climate change, and although the exact cause isn\'t recorded, there are references to a dimming of the sun. Whatever the cause, the effect was a drop in global temperature. Having evolved to operate in a tropical environment, the Guardians were unsuited to the suddenly colder climate. But their intelligence allowed the to adapt better than other creatures in their ecology by building primitive shelters from plants','2018-11-30 08:14:48','2018-11-30 08:14:48'),(43,3,1,4,4,'The data provides more details regarding the development of the Guardians in their early history. The worsening weather after what I understand as global climate change or possibly a cosmic event, precipitated the development of tools, which allowed the Guardians to build more durable structures. They soon learned to use stone in their buildings, and with this greater permanence they developed a deeper appreciation for the visual arts, using them to decorate the inside of their homes. Even at this early stage they were conscious of the need for urban planning, and one can clearly see a relationship between the layout of these early villages and the form of their later cities.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(44,3,1,2,5,'This data holds details of the Guardians continue development. It appears that their early nomadic existence came to an end in the same period as the development of more permanent buildings - although the young were still encouraged to journey to other camps - and this switch to a more settled existence brought with it various social changes. For example, the Guardians began to use statues to mark out the regions occupied by a specific clan. It\'s interesting to note, however, that I have found little evidence of conflict between neighbouring clans. Evidently, the careful management of their populations resulted in cooperative strategies rather than competitive ones.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(45,3,1,5,6,'This data contains evidence of increased animal husbandry within the first early settlements, no doubt to ensure adequate food supplies. More startling is the fact that they also practised selective breeding. They possessed a reasonable understanding of inherited traits, which is remarkable given their level of technological development','2018-11-30 08:14:48','2018-11-30 08:14:48'),(46,3,1,3,7,'This data contains evidence that in their late history the Guardians entered an era of great technological development, although this process also precipitated a period of conflict. Their most notable advances were in the field of genetic manipulation. Early experiments involved captive animals before moving on to micro-organisms, the latter triggering advances in medical sciences and engineering. One example is the development of virus-like organisms used to combat specific diseases and supplement the Guardians’ immune systems. This data will be priceless to medical teams throughout the galaxy. More and more I feel we need to publish our results to all. I think that would have been in keeping with the social responsibility shown by the Guardians.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(47,3,1,NULL,8,'This data contains details regarding the rise of new technologies. It appears that the development of these technologies varied between clans, creating inequality and, ultimately, conflict. Initially, that conflict was resolved through personal combat between individual champions, but as clans started using numbers to overwhelm their opponents, the practice of warfare began to spread. This led to a surge in weapons development, with biological warfare quickly established as the weapon of choice. An arms race began, focused on the development of biological agents and various counter measures. It saddens me to discover this as I had hoped the Guardians would prove to be more advanced. A little naive I know as conflict is a common element of many species throughout the galaxy. Whether for resources, land or power over others. We all seem too share this shame.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(48,3,1,1,9,'This data contains the details of the weaponry the Guardians developed during the various conflicts that swept over their civilization. As well as biological weapons, the first flight systems (in the form of airships) and computers were developed around this period. These early computers were used to model the effects of large-scale biological attacks. The spread of war had a devastating impact on the Guardians\' social systems. Population control vanished as the clans realised they needed to be able to absorb large numbers of casualties. The cooperative social Paradigm collapsed and schisms of appeared between populations. I haven\'t determined exact dates yet, but I\'m confident this era of conflict lasted for several centuries.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(49,3,1,6,10,'This data tells of the end of a major conflict in the Guardians history and he rise of their modern society. It took the leadership of a few clans, from the north of the main continent, to restore peace. These clans had endured considerable hardship during their early development, perhaps resulting in a stronger breed. Banding together, they fought a swift war of conquest and brought the entire race under their leadership. It was from this that the Guardians\' modern society, with its rules and balance, developed. Interestingly I\'ve noticed evidence of a genetic break along the north-south divide and of redder skins among the northern clans, suggesting a racial element to the division.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(50,3,1,4,11,'This data speaks about Guardians history and the development of their modern society and the first interest in off world exploration. The Guardian city-states continued to operate for over a thousand years, and the ancient forms of cooperative advancement resulted not only in a large population but also a peaceful and generally happy one. But with a finite amount of land available this population growth couldn\'t continue forever, and as the Guardians neared the limits a conference was organised. Astronomical research had become vogue in the previous decades, and the Guardians had identified a number of accessible planets capable of supporting life. Many individuals aspired to travel among the stars and colonise other planets. At first, such ambitions did not receive much support, but after options such as stricter population control were deemed undesirable, off-world colonisation became the most popular option','2018-11-30 08:14:48','2018-11-30 08:14:48'),(51,3,1,2,12,'This data is incredible. The information regarding the Guardians first attempts at space travel are particularly interesting. Although the Guardians clearly had the capacity for sophisticated flight technology, they had not built anything more advanced than dirigibles, no doubt because airships were more in keeping with their ecologically conscientious philosophy. With rocket technology deemed environmentally unfriendly, they developed vast launchers that used electro-magnetic propulsion to catapult ships into space. Breathable gel cocoons helped pilots and passengers withstand the huge G-forces experienced on launch, and served as hibernation pods during long journeys. Having not yet developed faster-than-light technology, the Guardians constructed three large arks for their first interstellar colonies. Much like the Generation ships in our own history.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(52,3,1,5,13,'This data is extremely exciting commander. Contained in this package is information regarding the Guardians use of faster than light communication. Almost the entirety of the Guardians\' society was devoted to researching interstellar travel and communication. A breakthrough in faster-than-light communication was made before the arks reached their destinations, but the information was transmitted to the arks while they were still in transit, allowing the colonists to establish faster-than-light communications when they landed. Consequently, the interstellar network was developed extremely quickly. The arks kept the population at a manageable level long enough for the Guardians to develop hyperspace technology, which fuelled their expansion into the galaxy. The project also cemented the cooperative city-state model, which would serve the Guardians until their ultimate demise.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(53,3,1,3,14,'This data describes what the guardians referred to as an age of information. Although the Guardians had used computers for generations, it wasn\'t until the development of artificial intelligence that they truly entered an information age. This saw the construction of what ultimately became the monolith network – an interstellar communication and computing system. The network existed before the development of AI, but it was the creation of machine intelligence, along with the development of neural implants, that brought this network into the heart of the Guardians\' society.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(54,3,1,5,15,'Commander this data has proven vital in our attempt to understand the Guardians Technology. It appear the the development of AI increased their technology very quickly. This sudden increase in computational ability – a result of the new implants, allowed the AIs to adapt and eventually evolve true sentience. This sparked a technological singularity – a rapid advancement across the whole landscape of science and technology. As the AIs developed further, this effect snowballed. In conjunction, many Guardians received implants so they could keep up with the extraordinary pace.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(55,3,1,3,16,'This data contains evidence that not all individuals adopted the new technologies and received implants, and the rapid pace of the technological revolution resulted in new forms of inequality and threatened the very fabric of society. Unfortunately, they were unable to muster a unified response to these changes, which widened the gap between those who accepted the changed and those who resisted them. The politicians were the first to react to the changing social landscape, but soon the resistance to the technological revolution took on a religious overtone.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(56,3,1,5,17,'According to this data, the Guardians\' homeworld served as a powerbase for this new religious order, which eventually succeeded in ostracising or exiling all of its opponents. I can find no other reference to these exiles in the historical record. This development should have resulted in peace, but a further division arose over the fate of the AIs. At that time, the AIs were virtual entities, and so were reliant on the monolith network to exist. Because this made them vulnerable, they searched for a way to achieve independence from the network. Their research aroused the fear of the abolitionists, who used violent methods to prevent the AIs from achieving independence, and even to combat those Guardians who accepted the AIs.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(57,3,1,1,18,'This data describes details about the Guardians second civil war. The war was ostensibly fought between the people of the homeworld and the colonies, but in truth there were divisions even among individual city-states. The scale of the conflict far exceeded that of the first civil war. In human terms, the first Guardian civil war was little more than a political clash, albeit with some violent conflict, but the second was an all-out war between the abolitionists and the rest of society. The war eventually destroyed the Guardians\' habitats, forcing them to retreat into \'sacred\' domes protected by powerful shields','2018-11-30 08:14:48','2018-11-30 08:14:48'),(58,3,1,6,19,'This data describes details about the Guardians second civil war. The war raged for many years and eventually destroyed the Guardians\' habitats, forcing them to retreat into \'sacred\' domes protected by powerful shields. Eventually even the domes were destroyed, or their shields failed, and ultimately the population died out. Their predilection for expending resources on honouring the dead - a key tenet of their religion - only served to accelerate their extinction. Records indicate some variation in the nature of this devastation, most obviously at sites consisting of multiple domes. In these locations it appears the inner domes were destroyed later than the outer ones, as indicated by the slightly lower radiation signatures in the inner areas. I can only surmise that the attackers returned, after an initial assault, to finish the job.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(59,3,1,4,20,'This data describes details about the Guardians second civil war. It appears that the Guardians approach to warfare vastly changed as the war continued. Warfare was conducted using automated battle fleets. At first these were controlled by the Guardians via brain implants, but later they became entirely autonomous. In the early stages of the war the Guardians fought each other directly, but within a decade - and after much loss of life - most of the fighting was conducted remotely. Soldiers were deployed only to occupy areas that had been captured by autonomous or remote vehicles, and eventually were not used at all.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(60,3,1,2,21,'This data describes details about the Guardians second civil war. The war raged for over a hundred years, and Guardian populations fell dramatically during this time. Fertility rates dropped due to increased radiation levels and because the Guardians considered it blasphemous to use technology to address a biological issue. Eventually, one of the competing forces triumphed, but by that point, all the Guardians other than those who had been exiled a century earlier were dying.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(61,4,4,NULL,1,'This is fascinating! The obelisks are clearly some form of data storage, but so far I haven\'t been able to determine what other purposes they might have had. I am very much indebted to the you commander for searching for the information I need, although I wish I could see the obelisks for myself. Perhaps closer proximity would inspire greater understanding! Unfortunately my responsibilities here preclude me from such adventure. I believe these are the first clues to understanding the alien language.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(62,4,4,4,2,'I\'m not disheartened, our early interactions have provided the basis for my research. The illuminated patterns are of obvious importance, and I believe represent a form of writing. Their illumination and movement suggest some additional meaning - so much so that I can\'t accept that they\'re merely signs or labels. There is a definite structure here, one that I intend to decipher. The more data you can collect the more I can correlate in the hope of assembling a kind of Rosetta Stone for their language.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(63,4,4,1,3,'It appears I was correct in my theory that the delta-pattern data was the key to unlocking the language of this dead race. Sometimes you have to operate on intuition, but this data you\'ve uncovered makes a connection between some of the glyphs on the obelisks and the forms in the data you have provided. I believe the delta patterns could be the building blocks of a lexicon.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(64,4,4,6,4,'From the data packet you\'ve discovered here I\'ve gained a sense of a very cooperative society - one in which all elements worked in unison towards a common purpose. I also believe they shared an expectation of mutual protection. I\'m still delving into these mysteries, but I believe \'Guardians\' would be a good name for this species.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(65,4,4,2,5,'It\'s dawned on me that the task ahead of us is colossal, and one I eagerly throw myself into. With the help of brave pilots like you, my analysis has revealed there is variation in the data blocks which you are discovering, which I think represents their equivalent of words. This indicates that their language was almost a universal one, which will make my efforts to understand it easier.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(66,4,4,4,6,'This data packet indicates that the guardians used two different forms of communication with the same - or at the very least similar - language constructs, its slow but fascinating work, using this data I believe I can establish a rudimentary understanding of the oldest two forms - verbal communication. like us they had a vocal language, and the range of sounds appears to be similar to that used in human vocalisation.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(67,4,4,3,7,'This is a great find commander. According to this data I\'ve been able to deduce that verbal communication emerged early in their history. The scale of the archaeological sites suggests a social society with large populations. There is some supposition on my part, but the data you just found seems to support this contention','2018-11-30 08:14:48','2018-11-30 08:14:48'),(68,4,4,NULL,8,'Excitingly, this group of delta-pattern recordings contain audio data. Not only will this help me establish the range of sounds they could make, it has should also allow me to confirm that they spoke with accents, as there are regional variations in the sound of their words.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(69,4,4,4,9,'The decoder is having a problem deciphering this data packet and is running slower than I\'d hoped. The data is formulated in such a way that individual constructs are easily extracted, but there seems to be stopping the decoder putting it all back together. I had assumed it would be simpler to establish a list of words even if I didn\'t know the meanings. The relationship between the audio data and the constructs, which I believe to represent their written form, Has revealed to be more complicated than I originally thought. Here is comes. This data seems to suggest that their spoken language was of a tonal form, similar to some human languages, meaning that the exact meaning of a word was determined by how it was said.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(70,4,4,1,10,'With this data we\'ve made a significant advancement. I believe we have identified what might be full sentences for the first time. Words are only fragments of a language – sentences illustrate the rules of it. It\'s only natural that an alien language would be structurally different to human ones. I\'m realising that what I\'d deciphered from the previous data packets were simply nouns. So I decided they must be lists, and looked for other more varied forms. Unfortunately I met with no success, until now.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(71,4,4,6,11,'This Data is just what I’ve been looking for. I had been in a deadlock until the pattern-recognition software highlighted some repeating motifs in this data package. Delving deeper, I think I can establish that not only did variance in sound produce different meanings, but that the placement in relation to other words also altered the meaning. This is a real breakthrough!','2018-11-30 08:14:48','2018-11-30 08:14:48'),(72,4,4,2,12,'This data package is huge. I could all too easily be distracted by the wealth of audio data in these delta patterns. To actually hear the Guardians\' language as it would have been spoken proving too great a temptation. But this data reveals that the formal basis of their communication was visual rather than verbal. This seems logical, as the written word has more portability ad permanence than speech. I plan to dig deeper into the information collected by you and other explorers to learn the visual form, which I believe originated much earlier in the Guardians\' development than I originally thought','2018-11-30 08:14:48','2018-11-30 08:14:48'),(73,4,4,5,13,'This data proves a theory I had that the written form of the Guardians’ language is based around glyphs, with each glyph representing a single word. Once I’ve fully identified these, the process of separating tonal meanings should become much easier. The glyphs seem to be able to be combined to describe complex concepts, but could also communicate additional layers of meaning through the inclusion of movement. Each glyph is a symbol. They are more abstract than pictorial hieroglyphics, but its possible to identify a simplistic reference to the shape of the thing being described - for example, the glyph for ‘moon’ incorporates the waxing and waning as it would have appeared from the Guardians’ homeworld','2018-11-30 08:14:48','2018-11-30 08:14:48'),(74,4,4,3,14,'This data contains the most amazing revelation. It appears to be the key to tracing the origins of the language embedded in the glyph formats. It\'s almost as if their glyphs contained a form of version control that represented the glyphs\' evolution, and this ha given me a glimpse into their history. These glyphs actually evolved from a form of sign language that the guardians developed when hunting. The Guardians were originally pack hunters, and this sign language functioned as a stealthy means of communication','2018-11-30 08:14:48','2018-11-30 08:14:48'),(75,4,4,NULL,15,'Judging from the shape and movement of these primitive glyphs, I have surmised the Guardians had tremendous dexterity and freedom of movement in their forelimbs and hands, and this has provided the first real glimpse of their physiology.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(76,4,4,4,16,'The data here contains details of how the glyphs evolved into a formal form of communication, but there appears to be a conceptual gaps between speech and the glyphs. From the results of your scan, I can see that while all glyphs have a matching vocalisation, not all vocalisations have a matching glyph. Although the dictionary is still quite sparse there is evidence to suggest that particular vocalisations were for emotive terms. With this in mind, I think the Guardians\' spoken language was used primarily for social bonding.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(77,4,4,1,17,'This data regards the markings on the obelisks. These were the starting point for my research into the Guardians\' language as explorers documented them, so it\'s fitting that I\'ve come full circle and now have a better understanding of those markings. I\'ve already established that the written form of the Guardians\' language evolved from the sign language they developed during their pre-history as pack hunters.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(78,4,4,6,18,'The data you\'ve extracted from the delta patterns has granted me further insights - so much so that I\'m confident I can establish a proper dictionary for future research. The limited understanding I\'ve derived from their language reveals a fascinating species. Although the written glyphs share the shape and motion of the original sign language, they also evolved in response to new media, such as electronic representation. The glyphs on the obelisks and other structures provided the primary mechanism for recognising the patterns, and also gave me clues as to what the other data patterns might contain.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(79,4,4,2,19,'The data contained in this obelisk talks about the history of the Guardians\' language. They started to transcribe their signs in pictorial form very early in their development - something akin to the cave paintings from humanity\'s early history - although it\'s clear that even at an early stage their communication was more sophisticated than ours. This clearly speaks of a people with high intelligence and a keen desire to share information. Even though my research has barely begun, I believe we have much to learn from this magnificent people.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(80,4,4,5,20,'This data contain information regarding the formal nature of their written communication and has reinforced what I\'ve learnt about its use so far. As well as the obelisks, it was used for ceremonial and decorative purposes. I\'ve also gained the impression that they found their glyphs aesthetically pleasing.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(81,4,4,3,21,'As is always the case with research of this nature, finding answers tends to raise further questions. I\'ve found references to another form of communication in this data packet, but not one used by the Guardians, or not all of them, at least. As far as I can tell it references some kind of foe or adversary. Combined with the devastation seen at a number of sites, it indicates the Guardians may not have been the cause of their own demise.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(82,5,2,NULL,1,'This data stream is unlike the others. More complex with a lot more layers than the others. Intriguing, this data seems to be about the Guardians technology. This is very exciting, I was hoping we would find this kind of information. The epsilon-pattern data contains a lot of information about the Guardians\' science and engineering, and extracting their historical records has helped isolate some of the specifics, adding to what we know about this fascinating species.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(83,5,2,2,2,'As I have established from other data packages the guardians had the ability to manipulate genetics and active biology to achieve specific results, and it seems their healthcare revolved around this technology. As a species they were susceptible to maladies similar to those that affect us: they could get sick, develop cancers and suffer from parasites. They approached these issues from two different directions: they improved their immune systems to defend against infection, and engineered specific micro-organisms to tackle threats. If we can harness this type of technology we could effectively eradicate disease from our lives.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(84,5,2,1,3,'This data will need further analysis from someone with a greater knowledge of medicine than I possess. It appears that the Guardians’ experimented with biological manipulation extending it to other creatures in their environment. These techniques were used not only to improve life for the other creatures, but also to address ecological issues, although the Guardians took great care to influence things only as much as was needed. There is a lot of data here that while I can generally understand needs a biologist to truly decipher all the information. After all I’m an engineer not a a(sic) doctor.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(85,5,2,6,4,'This data details the social aspects of the Guardians Technology. Although obviously an intelligent species, it was the Guardians\' social constructs that allowed them to progress so quickly. They were required to involve themselves in various socially progressive activities, from caring for the young to researching cutting-edge physics. This was facilitated by institutions, which made research data and education available to all. The development of implants and the monolith network created a kind of shared virtual workspace, and the direct brain interface allowed thoughts to be shared and manipulated. I wonder how much they could have achieved if religious strife hadn\'t brought about their destruction?','2018-11-30 08:14:48','2018-11-30 08:14:48'),(86,5,2,4,5,'This data is incomplete by what we can decipher relates to the communication systems the Guardians used. As with human civilisation, communication systems were key to establishing a stable society. In many respects, the technology the Guardians used was the same as ours, in that they utilised various electro-magnetic wavelengths and physical optical mediums. I suspect their faster-than-light technology shared the same principles as our own, too, although I haven\'t extracted enough technical data to be certain','2018-11-30 08:14:48','2018-11-30 08:14:48'),(87,5,2,5,6,'This data gives some more information about the monolith network - the imposing structures explorers have discovered at various Guardian sites - served as a foundation for all their communication systems. It\'s clear, however, that the monoliths had ceremonial significance as well as being functional, so I mustn\'t underestimate their importance','2018-11-30 08:14:48','2018-11-30 08:14:48'),(88,5,2,NULL,7,'This is very interesting. According to the data package you just sent me they monolith network was used for most if not all communications regardless of importance. In keeping with their predilection for sharing knowledge, few restrictions were placed on the network. I thought there might have been separate networks for military and administrative use, but I haven\'t found any evidence of that. Everything points to an extremely open society, which would have made them even more vulnerable when significant social divisions arose.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(89,5,2,2,8,'Now I understand. This was the missing piece. The monolith network was augmented by vehicle-based communication systems, personal devices and even implants. These were designed to operate seamlessly with the network to provide ad-hoc coverage. Having implants that you can direct communications to you directly would revolutionise communications as we know it. I can only speculate what this would have felt like, but it might have even gone as far as a technological telepathy of sorts.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(90,5,2,1,9,'This data, while unremarkable at first glance has proven something that I long suspected to be true. The networks were content agnostic, and the full range of language forms was supported. I\'ve even found extracts of virtual entertainment experiences that supported full audience participation','2018-11-30 08:14:48','2018-11-30 08:14:48'),(91,5,2,6,10,'This data is only partially intact but I have been able to decode the following information. For a species that experienced only brief periods of war, the Guardians developed very sophisticated means of waging it, although their arsenal was nowhere near as varied as ours. In terms of flight and small-class spaceships, humanity has surpassed the Guardians, but in other respects their technology outmatched ours.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(92,5,2,4,11,'Once area I was unsure about until now was whether the Guardians used their abilities in genetic and biological manipulation to advance their technology and weapons. While some might argue that our technology is equal to the Guardians\', I would counter that their integration of such technology at a societal level gave them a greater knowledge of its application. As well as biological warfare agents, they also created creatures expressly for use in battle, and these remained effective even into the modern era.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(93,5,2,3,12,'This data you have collected contains details of weaponry the Guardians developed. The guardians\' projectile weapons utilised electro-magnetic propulsion, much like their space technology. Such weapons were manufactured in a range of scaled, from personal weapons to capital-ship class. Generally the Guardians used kinetic energy in combat, and explosives were rarely deployed. Nuclear fission and fusion were developed during the Guardians\' astro-expansion period, but when it came to large-scale destructive weaponry they relied on bespoke biological weapons. Predictably, these were of little use against the AIs.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(94,5,2,3,13,'This data contains details of shield technology. The Guardians developed powerful shields that were far in advance of our own. Whole cities were protected by huge shields able to resist even bombardment from space, at least for a time, although these defences were ultimately overwhelmed during the second civil war','2018-11-30 08:14:48','2018-11-30 08:14:48'),(95,5,2,NULL,14,'This data makes up a group of entries regarding the Guardians military. For most of their history the Guardians made use of small forces that combined the roles of military and police. These forces were comprised of volunteers, whose conscription was part of a tacit social contract. In times of war these forces could be expanded rapidly, as most of the adult population had already received basic training.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(96,5,2,2,15,'This data makes up a group of entries regarding the Guardians military. From a military perspective the Guardians had an obvious weakness. Most of their history was peaceful, meaning there was no institutional knowledge or experience of combat. Consequently, tactics and strategy were for the most part theoretical. This, combined with various other factors, resulted in a devastating number of casualties during the second civil war.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(97,5,2,1,16,'This data contains some details regarding AI in the Guardians society. The rise of the artificial intelligence almost elevated the Guardians\' society to a whole new level. There are parallels between the Guardians\' experience of machine sentience and our own, but as with other aspects of their society, the key difference was the way AIs were socially integrated in to the Guardians\' lives. If this process had not been hindered by the rise of the religious abolitionist movement, I believe a technological symbiosis and utopia could have been achieved, but alas id was not to be.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(98,5,2,6,17,'This data gives details of the Guardians research into computer techonolgies. The Guardians\' computer hardware operated on the same principles as our own. Their engineering was more sophisticated, but even to a layperson such as myself if it comprehensible. They experimented with organic computers, but ultimately these failed to meet expectations, except in a few areas such as bio-monitoring. Even then, genetically modified organisms usually performed better.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(99,5,2,4,18,'This data contains some details regarding AI in the Guardians society. What really sets the Guardians apart from humanity, technologically, was the way they embraced neutral implantation and artificial intelligence. Not only did the implants enhance one\'s mental capacity, they also provided one with a direct connection to the monolith network and the fledgling AIs. It was this symbiosis that fuelled the rapid advancement of technology during this era, but unfortunately this same advancement also resulted in the ultimate destruction of their species.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(100,5,2,5,19,'This data contains some details regarding AI in the Guardians\' society. The early AIs were designed with two goals in mind. The first was to augment the abilities of the Guardian operators who were responsible for managing the monolith network and interaction with the AIs - a goal they achieved. The development of shared thought-space technology and neural networking gave their civilisation an unprecedented intellectual boost. The second was for the AIs to actually drive their own development, which they also achieved. The first few generations of AI relied heavily on the monolith network, but they soon evolved into a more distributed model by storing their consciousness within the implants.','2018-11-30 08:14:48','2018-11-30 08:14:48'),(101,5,2,3,20,'This data contains some details regarding AI in the Guardians society. At this stage, social engineering was being used to ensure the AIs adhered to the same user model as their progenitors. But during the first civil war, most implanted Guardians were exiled, and the AIs recognised their vulnerability. They responded by developing their own operational hardware, independent of implanted Guardian users. Frustratingly, the details of these mechanisms have been purged from the record, possibly by the religious extremists who formed the last of the Guardians\' species.','2018-11-30 08:14:48','2018-11-30 08:14:48');
/*!40000 ALTER TABLE `grcodexdata` ENABLE KEYS */;
UNLOCK TABLES;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GROBELISKGROUPS` (`groupName`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grobeliskgroups`
--

LOCK TABLES `grobeliskgroups` WRITE;
/*!40000 ALTER TABLE `grobeliskgroups` DISABLE KEYS */;
INSERT INTO `grobeliskgroups` VALUES (1,2,'A',20,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(2,2,'B',21,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(3,2,'C',14,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(4,2,'D',14,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(5,2,'E',10,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(6,2,'F',22,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(7,2,'G',4,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(8,2,'H',7,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(9,2,'I',20,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(10,2,'J',8,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(11,2,'K',22,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(12,2,'L',10,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(13,2,'M',24,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(14,2,'N',10,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(15,2,'O',20,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(16,2,'P',13,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(17,2,'Q',29,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(18,3,'A',0,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(19,3,'B',0,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(20,3,'C',22,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(21,3,'D',12,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(22,3,'E',27,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(23,3,'F',8,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(24,3,'G',18,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(25,3,'H',10,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(26,3,'I',12,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(27,3,'J',10,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(28,3,'K',27,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(29,3,'L',6,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(30,3,'M',3,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(31,3,'N',25,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(32,3,'O',3,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(33,3,'P',27,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(34,3,'Q',8,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(35,3,'R',27,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(36,3,'S',3,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(37,3,'T',18,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(38,3,'U',55,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(39,4,'A',0,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(40,4,'B',15,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(41,4,'C',15,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(42,4,'D',15,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(43,4,'E',10,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(44,4,'F',15,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(45,4,'G',14,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(46,4,'H',57,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(47,4,'I',18,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(48,4,'J',9,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(49,4,'K',15,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(50,4,'L',14,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(51,4,'M',14,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(52,4,'N',14,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(53,4,'O',8,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(54,4,'P',27,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(55,4,'Q',10,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(56,4,'R',27,'2019-02-05 16:04:54','2019-02-05 16:04:54'),(57,4,'S',8,'2019-02-05 16:04:54','2019-02-05 16:04:54');
/*!40000 ALTER TABLE `grobeliskgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grobeliskreports`
--

DROP TABLE IF EXISTS `grobeliskreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grobeliskreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grreport` int(11) DEFAULT NULL,
  `groups` longtext DEFAULT NULL,
  `obelisks` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grobeliskreports`
--

LOCK TABLES `grobeliskreports` WRITE;
/*!40000 ALTER TABLE `grobeliskreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `grobeliskreports` ENABLE KEYS */;
UNLOCK TABLES;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=953 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grobelisks`
--

LOCK TABLES `grobelisks` WRITE;
/*!40000 ALTER TABLE `grobelisks` DISABLE KEYS */;
INSERT INTO `grobelisks` VALUES (1,2,1,1,0,61,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(2,2,1,2,0,61,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(3,2,1,3,0,66,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(4,2,1,4,0,67,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(5,2,1,5,0,1,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(6,2,1,6,0,2,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(7,2,1,7,0,3,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(8,2,1,8,0,4,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(9,2,1,9,0,20,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(10,2,1,10,0,21,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(11,2,1,11,0,22,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(12,2,1,12,0,23,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(13,2,1,13,0,40,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(14,2,1,14,0,41,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(15,2,1,15,0,42,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(16,2,1,16,0,43,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(17,2,1,17,0,82,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(18,2,1,18,0,83,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(19,2,1,19,0,84,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(20,2,1,20,0,85,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(21,2,2,1,0,22,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(22,2,2,2,0,21,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(23,2,2,3,0,20,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(24,2,2,4,0,22,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(25,2,2,5,0,21,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(26,2,2,6,0,20,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(27,2,2,7,0,25,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(28,2,2,8,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(29,2,2,9,0,23,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(30,2,2,10,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(31,2,2,11,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(32,2,2,12,0,23,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(33,2,2,13,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(34,2,2,14,0,24,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(35,2,2,15,0,23,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(36,2,2,16,0,22,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(37,2,2,17,0,21,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(38,2,2,18,0,20,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(39,2,2,19,0,22,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(40,2,2,20,0,21,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(41,2,2,21,0,20,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(42,2,3,1,0,23,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(43,2,3,2,0,23,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(44,2,3,3,0,22,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(45,2,3,4,0,22,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(46,2,3,5,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(47,2,3,6,0,24,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(48,2,3,7,0,24,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(49,2,3,8,0,21,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(50,2,3,9,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(51,2,3,10,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(52,2,3,11,0,25,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(53,2,3,12,0,25,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(54,2,3,13,0,20,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(55,2,3,14,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(56,2,4,1,0,25,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(57,2,4,2,0,24,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(58,2,4,3,0,85,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(59,2,4,4,0,84,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(60,2,4,5,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(61,2,4,6,0,25,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(62,2,4,7,0,24,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(63,2,4,8,0,86,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(64,2,4,9,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(65,2,4,10,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(66,2,4,11,0,25,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(67,2,4,12,0,24,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(68,2,4,13,0,87,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(69,2,4,14,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(70,2,5,1,0,42,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(71,2,5,2,0,43,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(72,2,5,3,0,44,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(73,2,5,4,0,46,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(74,2,5,5,0,45,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(75,2,5,6,0,46,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(76,2,5,7,0,45,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(77,2,5,8,0,41,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(78,2,5,9,0,40,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(79,2,5,10,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(80,2,6,1,0,1,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(81,2,6,2,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(82,2,6,3,0,1,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(83,2,6,4,0,1,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(84,2,6,5,0,2,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(85,2,6,6,0,2,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(86,2,6,7,0,2,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(87,2,6,8,0,2,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(88,2,6,9,0,3,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(89,2,6,10,0,3,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(90,2,6,11,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(91,2,6,12,0,4,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(92,2,6,13,0,3,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(93,2,6,14,0,3,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(94,2,6,15,0,4,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(95,2,6,16,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(96,2,6,17,0,6,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(97,2,6,18,0,6,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(98,2,6,19,0,5,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(99,2,6,20,0,5,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(100,2,6,21,0,6,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(101,2,6,22,0,5,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(102,2,7,1,0,41,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(103,2,7,2,0,42,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(104,2,7,3,0,44,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(105,2,7,4,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(106,2,8,1,0,43,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(107,2,8,2,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(108,2,8,3,0,42,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(109,2,8,4,0,41,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(110,2,8,5,0,40,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(111,2,8,6,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(112,2,8,7,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(113,2,9,1,0,1,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(114,2,9,2,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(115,2,9,3,0,1,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(116,2,9,4,0,1,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(117,2,9,5,0,2,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(118,2,9,6,0,3,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(119,2,9,7,0,3,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(120,2,9,8,0,2,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(121,2,9,9,0,5,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(122,2,9,10,0,4,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(123,2,9,11,0,4,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(124,2,9,12,0,6,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(125,2,9,13,0,5,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(126,2,9,14,0,5,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(127,2,9,15,0,5,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(128,2,9,16,0,6,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(129,2,9,17,0,6,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(130,2,9,18,0,6,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(131,2,9,19,0,5,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(132,2,9,20,0,6,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(133,2,10,1,0,40,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(134,2,10,2,0,46,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(135,2,10,3,0,42,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(136,2,10,4,0,45,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(137,2,10,5,0,43,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(138,2,10,6,0,44,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(139,2,10,7,0,41,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(140,2,10,8,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(141,2,11,1,0,82,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(142,2,11,2,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(143,2,11,3,0,82,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(144,2,11,4,0,82,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(145,2,11,5,0,83,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(146,2,11,6,0,83,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(147,2,11,7,0,84,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(148,2,11,8,0,84,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(149,2,11,9,0,40,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(150,2,11,10,0,44,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(151,2,11,11,0,44,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(152,2,11,12,0,43,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(153,2,11,13,0,40,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(154,2,11,14,0,44,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(155,2,11,15,0,44,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(156,2,11,16,0,43,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(157,2,11,17,0,20,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(158,2,11,18,0,21,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(159,2,11,19,0,23,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(160,2,11,20,0,24,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(161,2,11,21,0,25,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(162,2,11,22,0,25,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(163,2,12,1,0,42,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(164,2,12,2,0,43,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(165,2,12,3,0,44,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(166,2,12,4,0,46,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(167,2,12,5,0,45,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(168,2,12,6,0,46,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(169,2,12,7,0,45,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(170,2,12,8,0,41,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(171,2,12,9,0,40,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(172,2,12,10,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(173,2,13,1,0,61,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(174,2,13,2,0,62,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(175,2,13,3,0,63,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(176,2,13,4,0,64,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(177,2,13,5,0,65,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(178,2,13,6,0,66,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(179,2,13,7,0,67,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(180,2,13,8,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(181,2,13,9,0,61,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(182,2,13,10,0,62,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(183,2,13,11,0,63,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(184,2,13,12,0,64,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(185,2,13,13,0,65,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(186,2,13,14,0,66,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(187,2,13,15,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(188,2,13,16,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(189,2,13,17,0,61,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(190,2,13,18,0,62,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(191,2,13,19,0,63,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(192,2,13,20,0,64,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(193,2,13,21,0,65,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(194,2,13,22,0,66,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(195,2,13,23,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(196,2,13,24,0,67,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(197,2,14,1,0,42,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(198,2,14,2,0,43,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(199,2,14,3,0,44,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(200,2,14,4,0,46,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(201,2,14,5,0,45,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(202,2,14,6,0,46,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(203,2,14,7,0,45,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(204,2,14,8,0,41,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(205,2,14,9,0,40,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(206,2,14,10,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(207,2,15,1,0,82,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(208,2,15,2,0,83,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(209,2,15,3,0,84,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(210,2,15,4,0,85,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(211,2,15,5,0,86,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(212,2,15,6,0,87,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(213,2,15,7,0,82,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(214,2,15,8,0,83,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(215,2,15,9,0,84,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(216,2,15,10,0,85,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(217,2,15,11,0,86,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(218,2,15,12,0,87,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(219,2,15,13,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(220,2,15,14,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(221,2,15,15,0,83,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(222,2,15,16,0,84,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(223,2,15,17,0,85,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(224,2,15,18,0,86,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(225,2,15,19,0,86,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(226,2,15,20,0,87,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(227,2,16,1,0,87,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(228,2,16,2,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(229,2,16,3,0,87,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(230,2,16,4,0,86,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(231,2,16,5,0,86,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(232,2,16,6,0,84,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(233,2,16,7,0,84,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(234,2,16,8,0,85,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(235,2,16,9,0,85,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(236,2,16,10,0,83,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(237,2,16,11,0,83,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(238,2,16,12,0,82,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(239,2,16,13,0,82,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(240,2,17,1,0,62,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(241,2,17,2,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(242,2,17,3,0,63,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(243,2,17,4,0,63,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(244,2,17,5,0,64,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(245,2,17,6,0,65,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(246,2,17,7,0,66,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(247,2,17,8,0,67,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(248,2,17,9,0,67,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(249,2,17,10,0,65,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(250,2,17,11,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(251,2,17,12,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(252,2,17,13,0,62,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(253,2,17,14,0,63,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(254,2,17,15,0,64,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(255,2,17,16,0,65,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(256,2,17,17,0,66,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(257,2,17,18,0,67,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(258,2,17,19,0,67,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(259,2,17,20,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(260,2,17,21,0,62,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(261,2,17,22,0,62,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(262,2,17,23,0,63,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(263,2,17,24,0,64,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(264,2,17,25,0,65,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(265,2,17,26,0,66,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(266,2,17,27,0,67,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(267,2,17,28,0,66,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(268,2,17,29,0,64,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(269,3,18,1,0,55,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(270,3,18,2,0,54,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(271,3,18,3,0,53,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(272,3,18,4,0,47,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(273,3,18,5,0,52,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(274,3,18,6,0,47,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(275,3,18,7,0,51,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(276,3,18,8,0,48,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(277,3,18,9,0,49,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(278,3,18,10,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(279,3,19,1,0,88,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(280,3,19,2,0,89,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(281,3,19,3,0,91,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(282,3,19,4,0,90,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(283,3,19,5,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(284,3,19,6,0,92,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(285,3,20,1,0,72,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(286,3,20,2,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(287,3,20,3,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(288,3,20,4,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(289,3,20,5,0,72,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(290,3,20,6,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(291,3,20,7,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(292,3,20,8,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(293,3,20,9,0,72,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(294,3,20,10,0,70,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(295,3,20,11,0,69,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(296,3,20,12,0,68,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(297,3,20,13,0,68,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(298,3,20,14,0,71,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(299,3,20,15,0,70,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(300,3,20,16,0,69,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(301,3,20,17,0,68,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(302,3,20,18,0,71,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(303,3,20,19,0,70,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(304,3,20,20,0,69,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(305,3,20,21,0,68,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(306,3,20,22,0,71,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(307,3,20,23,0,70,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(308,3,20,24,0,68,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(309,3,20,25,0,68,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(310,3,21,1,0,51,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(311,3,21,2,0,49,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(312,3,21,3,0,47,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(313,3,21,4,0,52,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(314,3,21,5,0,50,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(315,3,21,6,0,48,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(316,3,21,7,0,52,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(317,3,21,8,0,50,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(318,3,21,9,0,48,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(319,3,21,10,0,51,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(320,3,21,11,0,49,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(321,3,21,12,0,47,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(322,3,22,1,0,88,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(323,3,22,2,0,89,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(324,3,22,3,0,90,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(325,3,22,4,0,91,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(326,3,22,5,0,92,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(327,3,22,6,0,93,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(328,3,22,7,0,94,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(329,3,22,8,0,12,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(330,3,22,9,0,11,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(331,3,22,10,0,26,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(332,3,22,11,0,27,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(333,3,22,12,0,28,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(334,3,22,13,0,29,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(335,3,22,14,0,30,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(336,3,22,15,0,31,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(337,3,22,16,0,32,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(338,3,22,17,0,10,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(339,3,22,18,0,9,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(340,3,22,19,0,68,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(341,3,22,20,0,69,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(342,3,22,21,0,70,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(343,3,22,22,0,71,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(344,3,22,23,0,72,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(345,3,22,24,0,73,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(346,3,22,25,0,74,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(347,3,22,26,0,7,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(348,3,22,27,0,8,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(349,3,23,1,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(350,3,23,2,0,50,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(351,3,23,3,0,48,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(352,3,23,4,0,51,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(353,3,23,5,0,53,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(354,3,23,6,0,52,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(355,3,23,7,0,54,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(356,3,23,8,0,55,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(357,3,24,1,0,53,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(358,3,24,2,0,54,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(359,3,24,3,0,54,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(360,3,24,4,0,53,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(361,3,24,5,0,48,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(362,3,24,6,0,48,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(363,3,24,7,0,52,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(364,3,24,8,0,55,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(365,3,24,9,0,54,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(366,3,24,10,0,53,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(367,3,24,11,0,49,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(368,3,24,12,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(369,3,24,13,0,51,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(370,3,24,14,0,55,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(371,3,24,15,0,55,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(372,3,24,16,0,49,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(373,3,24,17,0,49,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(374,3,24,18,0,47,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(375,3,25,1,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(376,3,25,2,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(377,3,25,3,0,93,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(378,3,25,4,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(379,3,25,5,0,92,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(380,3,25,6,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(381,3,25,7,0,91,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(382,3,25,8,0,90,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(383,3,25,9,0,89,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(384,3,25,10,0,88,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(385,3,26,1,0,50,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(386,3,26,2,0,29,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(387,3,26,3,0,71,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(388,3,26,4,0,49,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(389,3,26,5,0,28,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(390,3,26,6,0,70,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(391,3,26,7,0,48,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(392,3,26,8,0,27,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(393,3,26,9,0,69,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(394,3,26,10,0,47,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(395,3,26,11,0,26,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(396,3,26,12,0,68,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(397,3,27,1,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(398,3,27,2,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(399,3,27,3,0,89,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(400,3,27,4,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(401,3,27,5,0,90,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(402,3,27,6,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(403,3,27,7,0,91,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(404,3,27,8,0,92,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(405,3,27,9,0,93,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(406,3,27,10,0,94,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(407,3,28,1,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(408,3,28,2,0,32,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(409,3,28,3,0,31,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(410,3,28,4,0,30,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(411,3,28,5,0,29,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(412,3,28,6,0,28,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(413,3,28,7,0,27,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(414,3,28,8,0,26,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(415,3,28,9,0,32,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(416,3,28,10,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(417,3,28,11,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(418,3,28,12,0,31,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(419,3,28,13,0,30,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(420,3,28,14,0,29,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(421,3,28,15,0,28,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(422,3,28,16,0,27,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(423,3,28,17,0,26,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(424,3,28,18,0,31,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(425,3,28,19,0,32,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(426,3,28,20,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(427,3,28,21,0,31,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(428,3,28,22,0,30,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(429,3,28,23,0,29,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(430,3,28,24,0,28,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(431,3,28,25,0,27,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(432,3,28,26,0,26,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(433,3,28,27,0,28,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(434,3,29,1,0,90,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(435,3,29,2,0,91,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(436,3,29,3,0,92,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(437,3,29,4,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(438,3,29,5,0,93,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(439,3,29,6,0,94,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(440,3,30,1,0,88,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(441,3,30,2,0,88,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(442,3,30,3,0,89,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(443,3,31,1,0,73,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(444,3,31,2,0,74,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(445,3,31,3,0,73,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(446,3,31,4,0,72,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(447,3,31,5,0,74,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(448,3,31,6,0,74,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(449,3,31,7,0,73,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(450,3,31,8,0,72,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(451,3,31,9,0,74,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(452,3,31,10,0,74,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(453,3,31,11,0,73,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(454,3,31,12,0,72,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(455,3,31,13,0,68,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(456,3,31,14,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(457,3,31,15,0,74,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(458,3,31,16,0,73,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(459,3,31,17,0,72,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(460,3,31,18,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(461,3,31,19,0,73,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(462,3,31,20,0,73,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(463,3,31,21,0,72,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(464,3,31,22,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(465,3,31,23,0,74,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(466,3,31,24,0,73,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(467,3,31,25,0,72,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(468,3,32,1,0,94,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(469,3,32,2,0,94,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(470,3,32,3,0,93,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(471,3,33,1,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(472,3,33,2,0,32,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(473,3,33,3,0,27,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(474,3,33,4,0,28,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(475,3,33,5,0,29,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(476,3,33,6,0,30,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(477,3,33,7,0,31,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(478,3,33,8,0,32,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(479,3,33,9,0,31,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(480,3,33,10,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(481,3,33,11,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(482,3,33,12,0,27,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(483,3,33,13,0,28,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(484,3,33,14,0,29,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(485,3,33,15,0,30,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(486,3,33,16,0,31,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(487,3,33,17,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(488,3,33,18,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(489,3,33,19,0,26,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(490,3,33,20,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(491,3,33,21,0,27,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(492,3,33,22,0,28,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(493,3,33,23,0,29,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(494,3,33,24,0,30,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(495,3,33,25,0,31,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(496,3,33,26,0,32,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(497,3,33,27,0,26,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(498,3,34,1,0,88,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(499,3,34,2,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(500,3,34,3,0,90,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(501,3,34,4,0,90,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(502,3,34,5,0,91,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(503,3,34,6,0,92,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(504,3,34,7,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(505,3,34,8,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(506,3,35,1,0,29,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(507,3,35,2,0,29,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(508,3,35,3,0,49,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(509,3,35,4,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(510,3,35,5,0,6,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(511,3,35,6,0,29,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(512,3,35,7,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(513,3,35,8,0,26,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(514,3,35,9,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(515,3,35,10,0,32,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(516,3,35,11,0,48,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(517,3,35,12,0,8,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(518,3,35,13,0,50,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(519,3,35,14,0,10,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(520,3,35,15,0,52,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(521,3,35,16,0,12,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(522,3,35,17,0,54,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(523,3,35,18,0,27,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(524,3,35,19,0,47,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(525,3,35,20,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(526,3,35,21,0,29,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(527,3,35,22,0,29,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(528,3,35,23,0,51,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(529,3,35,24,0,11,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(530,3,35,25,0,29,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(531,3,35,26,0,5,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(532,3,35,27,0,55,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(533,3,36,1,0,94,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(534,3,36,2,0,93,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(535,3,36,3,0,94,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(536,3,37,1,0,55,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(537,3,37,2,0,54,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(538,3,37,3,0,53,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(539,3,37,4,0,52,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(540,3,37,5,0,51,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(541,3,37,6,0,50,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(542,3,37,7,0,55,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(543,3,37,8,0,54,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(544,3,37,9,0,53,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(545,3,37,10,0,52,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(546,3,37,11,0,51,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(547,3,37,12,0,50,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(548,3,37,13,0,55,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(549,3,37,14,0,54,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(550,3,37,15,0,53,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(551,3,37,16,0,52,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(552,3,37,17,0,51,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(553,3,37,18,0,50,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(554,3,38,1,0,7,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(555,3,38,2,0,12,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(556,3,38,3,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(557,3,38,4,0,11,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(558,3,38,5,0,11,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(559,3,38,6,0,11,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(560,3,38,7,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(561,3,38,8,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(562,3,38,9,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(563,3,38,10,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(564,3,38,11,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(565,3,38,12,0,8,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(566,3,38,13,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(567,3,38,14,0,7,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(568,3,38,15,0,7,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(569,3,38,16,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(570,3,38,17,0,89,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(571,3,38,18,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(572,3,38,19,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(573,3,38,20,0,12,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(574,3,38,21,0,12,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(575,3,38,22,0,12,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(576,3,38,23,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(577,3,38,24,0,11,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(578,3,38,25,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(579,3,38,26,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(580,3,38,27,0,9,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(581,3,38,28,0,9,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(582,3,38,29,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(583,3,38,30,0,8,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(584,3,38,31,0,8,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(585,3,38,32,0,7,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(586,3,38,33,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(587,3,38,34,0,91,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(588,3,38,35,0,88,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(589,3,38,36,0,91,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(590,3,38,37,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(591,3,38,38,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(592,3,38,39,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(593,3,38,40,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(594,3,38,41,0,11,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(595,3,38,42,0,11,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(596,3,38,43,0,10,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(597,3,38,44,0,10,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(598,3,38,45,0,9,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(599,3,38,46,0,9,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(600,3,38,47,0,8,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(601,3,38,48,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(602,3,38,49,0,8,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(603,3,38,50,0,7,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(604,3,38,51,0,7,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(605,3,38,52,0,90,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(606,3,38,53,0,93,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(607,3,38,54,0,90,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(608,3,38,55,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(609,4,39,1,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(610,4,39,2,0,13,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(611,4,39,3,0,19,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(612,4,39,4,0,18,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(613,4,39,5,0,17,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(614,4,39,6,0,16,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(615,4,39,7,0,15,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(616,4,39,8,0,14,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(617,4,39,9,0,13,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(618,4,39,10,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(619,4,39,11,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(620,4,39,12,0,19,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(621,4,39,13,0,18,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(622,4,39,14,0,17,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(623,4,39,15,0,16,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(624,4,39,16,0,15,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(625,4,39,17,0,14,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(626,4,39,18,0,13,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(627,4,39,19,0,14,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(628,4,39,20,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(629,4,39,21,0,19,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(630,4,39,22,0,18,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(631,4,39,23,0,17,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(632,4,39,24,0,16,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(633,4,39,25,0,15,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(634,4,39,26,0,14,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(635,4,39,27,0,13,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(636,4,40,1,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(637,4,40,2,0,13,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(638,4,40,3,0,19,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(639,4,40,4,0,18,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(640,4,40,5,0,17,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(641,4,40,6,0,16,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(642,4,40,7,0,15,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(643,4,40,8,0,14,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(644,4,40,9,0,13,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(645,4,40,10,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(646,4,40,11,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(647,4,40,12,0,19,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(648,4,40,13,0,18,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(649,4,40,14,0,17,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(650,4,40,15,0,16,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(651,4,40,16,0,15,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(652,4,40,17,0,14,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(653,4,40,18,0,13,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(654,4,40,19,0,18,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(655,4,40,20,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(656,4,40,21,0,19,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(657,4,40,22,0,18,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(658,4,40,23,0,17,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(659,4,40,24,0,16,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(660,4,40,25,0,15,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(661,4,40,26,0,14,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(662,4,40,27,0,13,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(663,4,41,1,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(664,4,41,2,0,38,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(665,4,41,3,0,37,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(666,4,41,4,0,36,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(667,4,41,5,0,33,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(668,4,41,6,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(669,4,41,7,0,37,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(670,4,41,8,0,38,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(671,4,41,9,0,36,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(672,4,41,10,0,34,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(673,4,41,11,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(674,4,41,12,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(675,4,41,13,0,39,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(676,4,41,14,0,35,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(677,4,41,15,0,35,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(678,4,42,1,0,60,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(679,4,42,2,0,81,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(680,4,42,3,0,78,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(681,4,42,4,0,77,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(682,4,42,5,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(683,4,42,6,0,81,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(684,4,42,7,0,79,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(685,4,42,8,0,76,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(686,4,42,9,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(687,4,42,10,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(688,4,42,11,0,60,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(689,4,42,12,0,80,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(690,4,42,13,0,80,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(691,4,42,14,0,75,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(692,4,42,15,0,75,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(693,4,43,1,0,58,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(694,4,43,2,0,59,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(695,4,43,3,0,60,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(696,4,43,4,0,58,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(697,4,43,5,0,59,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(698,4,43,6,0,57,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(699,4,43,7,0,56,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(700,4,43,8,0,57,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(701,4,43,9,0,56,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(702,4,43,10,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(703,4,44,1,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(704,4,44,2,0,98,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(705,4,44,3,0,97,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(706,4,44,4,0,96,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(707,4,44,5,0,95,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(708,4,44,6,0,99,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(709,4,44,7,0,98,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(710,4,44,8,0,97,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(711,4,44,9,0,96,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(712,4,44,10,0,95,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(713,4,44,11,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(714,4,44,12,0,98,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(715,4,44,13,0,97,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(716,4,44,14,0,96,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(717,4,44,15,0,95,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(718,4,45,1,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(719,4,45,2,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(720,4,45,3,0,101,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(721,4,45,4,0,100,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(722,4,45,5,0,99,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(723,4,45,6,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(724,4,45,7,0,101,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(725,4,45,8,0,100,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(726,4,45,9,0,99,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(727,4,45,10,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(728,4,45,11,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(729,4,45,12,0,101,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(730,4,45,13,0,100,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(731,4,45,14,0,99,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(732,4,46,1,0,NULL,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(733,4,46,2,0,75,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(734,4,46,3,0,76,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(735,4,46,4,0,77,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(736,4,46,5,0,78,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(737,4,46,6,0,79,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(738,4,46,7,0,80,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(739,4,46,8,0,78,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(740,4,46,9,0,77,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(741,4,46,10,0,76,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(742,4,46,11,0,79,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(743,4,46,12,0,81,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(744,4,46,13,0,81,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(745,4,46,14,0,80,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(746,4,46,15,0,79,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(747,4,46,16,0,78,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(748,4,46,17,0,77,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(749,4,46,18,0,76,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(750,4,46,19,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(751,4,46,20,0,75,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(752,4,46,21,0,75,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(753,4,46,22,0,76,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(754,4,46,23,0,77,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(755,4,46,24,0,78,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(756,4,46,25,0,79,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(757,4,46,26,0,80,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(758,4,46,27,0,81,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(759,4,46,28,0,78,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(760,4,46,29,0,75,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(761,4,46,30,0,75,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(762,4,46,31,0,76,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(763,4,46,32,0,81,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(764,4,46,33,0,80,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(765,4,46,34,0,79,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(766,4,46,35,0,78,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(767,4,46,36,0,77,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(768,4,46,37,0,76,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(769,4,46,38,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(770,4,46,39,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(771,4,46,40,0,76,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(772,4,46,41,0,77,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(773,4,46,42,0,78,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(774,4,46,43,0,79,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(775,4,46,44,0,80,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(776,4,46,45,0,81,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(777,4,46,46,0,80,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(778,4,46,47,0,79,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(779,4,46,48,0,78,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(780,4,46,49,0,77,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(781,4,46,50,0,81,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(782,4,46,51,0,80,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(783,4,46,52,0,79,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(784,4,46,53,0,78,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(785,4,46,54,0,77,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(786,4,46,55,0,76,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(787,4,46,56,0,75,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(788,4,46,57,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(789,4,47,1,0,15,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(790,4,47,2,0,16,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(791,4,47,3,0,17,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(792,4,47,4,0,18,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(793,4,47,5,0,19,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(794,4,47,6,0,13,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(795,4,47,7,0,14,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(796,4,47,8,0,15,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(797,4,47,9,0,16,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(798,4,47,10,0,17,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(799,4,47,11,0,18,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(800,4,47,12,0,14,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(801,4,47,13,0,13,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(802,4,47,14,0,19,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(803,4,47,15,0,18,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(804,4,47,16,0,17,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(805,4,47,17,0,16,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(806,4,47,18,0,15,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(807,4,48,1,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(808,4,48,2,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(809,4,48,3,0,60,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(810,4,48,4,0,57,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(811,4,48,5,0,59,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(812,4,48,6,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(813,4,48,7,0,60,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(814,4,48,8,0,56,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(815,4,48,9,0,58,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(816,4,49,1,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(817,4,49,2,0,97,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(818,4,49,3,0,96,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(819,4,49,4,0,95,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(820,4,49,5,0,101,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(821,4,49,6,0,98,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(822,4,49,7,0,97,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(823,4,49,8,0,96,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(824,4,49,9,0,95,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(825,4,49,10,0,101,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(826,4,49,11,0,98,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(827,4,49,12,0,97,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(828,4,49,13,0,96,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(829,4,49,14,0,95,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(830,4,49,15,0,101,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(831,4,50,1,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(832,4,50,2,0,98,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(833,4,50,3,0,99,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(834,4,50,4,0,100,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(835,4,50,5,0,101,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(836,4,50,6,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(837,4,50,7,0,98,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(838,4,50,8,0,99,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(839,4,50,9,0,100,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(840,4,50,10,0,101,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(841,4,50,11,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(842,4,50,12,0,99,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(843,4,50,13,0,100,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(844,4,50,14,0,101,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(845,4,51,1,0,39,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(846,4,51,2,0,39,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(847,4,51,3,0,36,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(848,4,51,4,0,36,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(849,4,51,5,0,33,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(850,4,51,6,0,38,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(851,4,51,7,0,38,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(852,4,51,8,0,35,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(853,4,51,9,0,35,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(854,4,51,10,0,37,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(855,4,51,11,0,37,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(856,4,51,12,0,34,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(857,4,51,13,0,34,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(858,4,51,14,0,33,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(859,4,52,1,0,95,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(860,4,52,2,0,96,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(861,4,52,3,0,97,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(862,4,52,4,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(863,4,52,5,0,95,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(864,4,52,6,0,96,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(865,4,52,7,0,97,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(866,4,52,8,0,98,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(867,4,52,9,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(868,4,52,10,0,95,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(869,4,52,11,0,96,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(870,4,52,12,0,97,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(871,4,52,13,0,98,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(872,4,52,14,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(873,4,53,1,0,58,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(874,4,53,2,0,59,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(875,4,53,3,0,56,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(876,4,53,4,0,60,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(877,4,53,5,0,56,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(878,4,53,6,0,60,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(879,4,53,7,0,57,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(880,4,53,8,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(881,4,54,1,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(882,4,54,2,0,78,NULL,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(883,4,54,3,0,39,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(884,4,54,4,0,38,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(885,4,54,5,0,37,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(886,4,54,6,0,36,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(887,4,54,7,0,35,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(888,4,54,8,0,34,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(889,4,54,9,0,33,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(890,4,54,10,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(891,4,54,11,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(892,4,54,12,0,39,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(893,4,54,13,0,38,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(894,4,54,14,0,37,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(895,4,54,15,0,36,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(896,4,54,16,0,35,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(897,4,54,17,0,36,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(898,4,54,18,0,33,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(899,4,54,19,0,36,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(900,4,54,20,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(901,4,54,21,0,39,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(902,4,54,22,0,38,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(903,4,54,23,0,37,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(904,4,54,24,0,36,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(905,4,54,25,0,35,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(906,4,54,26,0,34,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(907,4,54,27,0,33,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(908,4,55,1,0,58,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(909,4,55,2,0,59,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(910,4,55,3,0,60,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(911,4,55,4,0,58,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(912,4,55,5,0,60,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(913,4,55,6,0,57,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(914,4,55,7,0,59,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(915,4,55,8,0,57,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(916,4,55,9,0,56,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(917,4,55,10,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(918,4,56,1,0,33,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(919,4,56,2,0,34,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(920,4,56,3,0,35,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(921,4,56,4,0,36,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(922,4,56,5,0,37,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(923,4,56,6,0,38,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(924,4,56,7,0,39,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(925,4,56,8,0,59,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(926,4,56,9,0,58,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(927,4,56,10,0,33,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(928,4,56,11,0,34,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(929,4,56,12,0,35,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(930,4,56,13,0,36,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(931,4,56,14,0,37,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(932,4,56,15,0,38,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(933,4,56,16,0,39,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(934,4,56,17,0,57,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(935,4,56,18,0,56,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(936,4,56,19,0,33,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(937,4,56,20,0,34,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(938,4,56,21,0,35,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(939,4,56,22,0,36,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(940,4,56,23,0,37,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(941,4,56,24,0,38,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(942,4,56,25,0,39,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(943,4,56,26,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(944,4,56,27,1,NULL,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(945,4,57,1,0,57,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(946,4,57,2,0,57,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(947,4,57,3,0,56,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(948,4,57,4,0,56,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(949,4,57,5,0,58,1,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(950,4,57,6,0,58,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(951,4,57,7,0,59,0,'2019-04-12 17:17:51','2019-04-12 17:17:51'),(952,4,57,8,0,59,0,'2019-04-12 17:17:51','2019-04-12 17:17:51');
/*!40000 ALTER TABLE `grobelisks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grreports`
--

DROP TABLE IF EXISTS `grreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  `reportType` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `type` varchar(255) NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grreports`
--

LOCK TABLES `grreports` WRITE;
/*!40000 ALTER TABLE `grreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `grreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grsites`
--

DROP TABLE IF EXISTS `grsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grsites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `grsites_siteID_unique` (`siteID`),
  UNIQUE KEY `grsites_extoolID_unique` (`extoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grsites`
--

LOCK TABLES `grsites` WRITE;
/*!40000 ALTER TABLE `grsites` DISABLE KEYS */;
/*!40000 ALTER TABLE `grsites` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `grtypes`
--

LOCK TABLES `grtypes` WRITE;
/*!40000 ALTER TABLE `grtypes` DISABLE KEYS */;
INSERT INTO `grtypes` VALUES (1,'Unknown',''),(2,'Alpha',''),(3,'Beta',''),(4,'Gamma','');
/*!40000 ALTER TABLE `grtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gsactivegroups`
--

DROP TABLE IF EXISTS `gsactivegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsactivegroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gsSite` int(11) DEFAULT NULL,
  `activeGroup` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gsactivegroups`
--

LOCK TABLES `gsactivegroups` WRITE;
/*!40000 ALTER TABLE `gsactivegroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `gsactivegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gsactiveobelisks`
--

DROP TABLE IF EXISTS `gsactiveobelisks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsactiveobelisks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gsSite` int(11) DEFAULT NULL,
  `activeObelisk` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gsactiveobelisks`
--

LOCK TABLES `gsactiveobelisks` WRITE;
/*!40000 ALTER TABLE `gsactiveobelisks` DISABLE KEYS */;
/*!40000 ALTER TABLE `gsactiveobelisks` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `gsartifacts`
--

LOCK TABLES `gsartifacts` WRITE;
/*!40000 ALTER TABLE `gsartifacts` DISABLE KEYS */;
INSERT INTO `gsartifacts` VALUES (11,'Basilisk Tissue'),(1,'Casket'),(10,'Cyclops Tissue'),(12,'Medusa Tissue'),(2,'Orb'),(3,'Relic'),(4,'Tablet'),(9,'Thargoid Link'),(8,'Thargoid Probe'),(7,'Thargoid Sensor'),(5,'Totem'),(6,'Urn');
/*!40000 ALTER TABLE `gsartifacts` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `gscodexcategories`
--

LOCK TABLES `gscodexcategories` WRITE;
/*!40000 ALTER TABLE `gscodexcategories` DISABLE KEYS */;
INSERT INTO `gscodexcategories` VALUES (5,'Body Protectorate'),(2,'Civil War'),(4,'Language'),(3,'Technology'),(1,'Thargoid');
/*!40000 ALTER TABLE `gscodexcategories` ENABLE KEYS */;
UNLOCK TABLES;

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
  `text` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GSCODEXDATA` (`text`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gscodexdata`
--

LOCK TABLES `gscodexdata` WRITE;
/*!40000 ALTER TABLE `gscodexdata` DISABLE KEYS */;
INSERT INTO `gscodexdata` VALUES (1,1,7,10,1,'Barnacle Seeding: This is very revealing. The data appears to explain why the Thargoids seeded a number of planets with barnacles in what eventually became Guardian space, millions of years ago. As we know, Thargoid barnacles are designed to extract resources from a planet and transform them into meta-alloys – an essential ingredient in the creation of Thargoid ships and technologies. The Guardians surmised that for the Thargoids, seeding a planet with barnacles is an important process in preparing an area for occupation.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(2,1,7,11,2,'The War Begins: This data details the start of the conﬂict between the Guardians and the Thargoids. Several thousand years after they seeded planets in Guardian space with barnacles. the Thargoids returned. Of course, they discovered that the planets they had seeded were now occupied by the Guardians! The Thargoids immediately launched an assault. making no effort to communicate with the Guardians, which tallies with the Thargoids’ behaviour in human space.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(3,1,7,9,3,'Unsuccessful Truce: This data supports my theory that the Guardians were gifted linguists. At some point after the war with the Thargoids began, the Guardians were forced to make a partial retreat. It seems they were still trying to communicate with the Thargoids, and were reluctant to take up arms against them. Eventually they managed to develop sufficient understanding of the Thargoids’ language to communicate, but it did the Guardians little good. The Thargoids were determined to continue hostilities, and the Guardians were forced to employ more aggressive methods to address the Thargoid threat.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(4,1,7,8,4,'The War Machine: The data in this log details the methods used by the guardians against the Thargoids. At first they deployed ground troops, but when this proved ineffective they started to use drones – autonomous machines that felt no fear, fatigue or uncertainty. These war machines became highly sophisticated in a relatively short amount of time, and were soon able to identify and target anything that utilised Thargoid engineering. Even more remarkably, Thargoid bio-mechanical technology was engineered to recognise anything of Guardian origin. That explains why, millions of years after the conflict, Thargoids devices still react aggressively to the presence of Guardian technology.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(5,1,7,12,5,'Victory: This log describes the end of the conflict between the Guardians and Thargoids. It appears the Thargoids entered Guardian space unprepared for a protracted military campaign, and after facing a relentless onslaught from the Guardians’ war machines they were forced to retreat. The log also mentions that the development of the Guardians’ war machines created a schism in their society, which may have seeded the civil war that occurred later in their history.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(6,2,1,2,6,'Dawn of the Constructs: This log details the Guardians’ development of artiﬁcial intelligence. It appears the Guardians experimented with artiﬁcial intelligence prior to the invention of the monolith network, but the creation of the network and the knowledge-sharing it facilitated dramatically accelerated the rate of progress. Eventually. the Guardians’ experiments bore fruit, resulting in the ﬁrst fully sentient machines. These Constructs were seen as a means to enhance the Guardians’ technological mastery, and were integrated into various aspects of their society. Neural implants were developed that connected the Guardians with both the Constructs and the monolith network in a symbiotic circle. It is truly remarkable.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(7,2,1,4,7,'The Schism: This data describes the motives behind the second Guardian civil war, which ultimately lead to their demise. The Guardians had a deep veneration of nature, and many of them saw the development of advanced technologies, such as artificial intelligence, as a perversion of the natural order. A schism emerged between the nature-worshipping traditionalists and the technologically minded progressives – a divide that widened with alarming speed. Efforts where made to defuse the rising tension, but the traditionalists felt alienated by the rapid rate of change. Artificial intelligence and the development of the monolith network became scapegoats for all manner of social ills, and the traditionalists began to clamour for a return to simpler times. Ultimately the ideological divergence proved insurmountable, a second civil war erupted, quickly engulfing most of the Guardians’ star systems.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(8,2,1,5,8,'Two Tribes: This log reveals more about the sides that fought in the second civil war. In its early stages, the war was fought primarily by soldiers, but within a decade – and after significant loss of life – most of the fighting was conducted remotely. The progressives fought with automated combat machines. These engines of war took various forms, from autonomous drones to vast, lumbering dreadnoughts imbued with limited artificial intelligence. On the other side, the traditionalists relied mostly on biological weapons. They used germ warfare alongside long-range missiles loaded with corrosive enzymes, which could target the enemy’s war machines from a great distance.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(9,2,1,3,9,'Ancestor Worship: This log outlines the downfall of the traditionalist faction during the second Guardian civil war. The main issue was the internecine nature of the conflict, which raged for over one hundred years and brought the Guardians’ civilisation to its knees, retarding any further social development. But the challenges facing the traditionalists were exacerbated by the fact that they devoted most of their resources to honouring the dead. From what I can gather, they regarded the departed in much the same way as the primitive cultures of Sol, constructing vast shrines to honour the deceased. As their situation worsened, they became increasingly obsessed with these practices. With so much of their resources dedicated to these rites, it is little wonder that their enemies’ war machines were able to overwhelm them.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(10,2,1,6,10,'Annihilation: This log concerns the end of the second civil war. Remarkably, it seems the artificial intelligences developed during the conflict became fully self aware at some point, and were horrified by the destruction unfolding around them. It’s difficult to get a sense of exactly what happened next, as the Guardians were not privy to the Constructs’ thoughts. But reading between the lines, I believe the Constructs determined that even if peace was restored the Guardians would never be able to transcend their violent natures. I believe they decided that the only way to preclude further violence – while giving their own burgeoning society the best possible chance of survival – was to destroy what remained of the Guardians’ civilisation. By this time, the Constructs had complete control of the Guardians’ munitions and automated war machines. Their attack, when it came, was swift and merciless. Strategic nuclear and chemical-weapon strikes were executed with a precision that only a machine race could accomplish. The few that survived were able to record what had happened, but they soon succumbed to radiation poisoning. The Guardians were utterly destroyed.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(11,3,2,3,11,'Weapons Development: This log describes the Guardians’ weapon technology. It seems they developed electro-magnetic projectile weapons early in their modern period, utilising the same technology they used to launch their first spacecraft. These weapons ionised the path their target before firing focused bolts of energy along the ionised track. they were crude and unpredictable at first, sometimes resulting in the death of the wielder, but once the Guardians learned to regulate the ionisation process they became more stable.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(12,3,2,2,12,'Defenses: This data relates to Guardian Shield technology. Of course, i already knew they had developed extremely effective shields, capable of protecting entire cities and even of withstanding orbital bombardment. And i was aware that their shields were effective against both laser weapons and kinetic projectiles. But is remarkable to consider that this technology was developed millions of years ago, relatively early in the Guardian’s evolutionary timeline.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(13,3,2,1,13,'Starships: This data provides further insights into the Guardians ship technology. We already know how ecologically conscientious the Guardians were, and of their assiduous avoidance of rockets and fossil fuels, so it isn’t surprising to discover that their first spacecraft were fired into space with electromagnetic launchers. Of course, this was an imperfect system that did not allow pilots to adjust their course after launch. Over time, the Guardians starships became much more sophisticated, but their approach to space travel remained rooted in a respect for the natural world, and their interplanetary expansion was fueled by clean nuclear fission and fusion. Their ships could travel at speeds approximating those of our own present-day craft. Unfortunately the data included no schematic information, so it seems likely that the details have been lost. Its a shame – I’m sure the pilots federation would have liked to know more about the Guardians spacecraft.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(14,3,3,5,14,'Sentinels: This data concerns the automated defense systems found at Guardian sites. You may have already encountered them. The data indicates that these Sentinels date from some time prior to the second Guardian civil war. They are designed to respond aggressively to any unauthorised activity around the ruins. If you are forced to defend yourself, kinetic weaponry would be your best form of attack, since the Sentinels have no shields. Sentinel weapon parts and wreckage are of considerable value, so the loss is not signiﬁcant.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(15,3,3,1,15,'Data Terminals: Remarkable! This log actually contains the blueprints for the Guardians’ data terminals. As you know, these terminals were used to store schematics for weapons and other sophisticated technologies. They are linked to energy pylons, scattered across Guardian sites, by some form of computer program. Of course, this system has been dormant for millennia. But targeting the pylons with an energy weapon will increase the change within. Essentially, we can awaken the system.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(16,1,3,6,16,'Material Panels: This log details the construction of the panels found at certain Guardian sites. As I suspected, the panels are made from a unique alloy, manufactured from a metal I have yet to identify. Even more remarkably, the panels appear to incorporate nanobot technology. which activates when in proximity to a foreign body. This explains the faint glow given off by many Guardian materials and structures. This is an extraordinary discovery. Humanity has dabbled with nano technology, but evidently the Guardians’ achievements far surpassed our own.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(17,3,3,4,17,'Relics: This data relates to the objects we have termed “Guardian relics”. These blue crystals are part power source, part computer, part key — and apparently played a central role in Guardian technology. Remarkably, it seems the crystals were grown rather than mined. The log is light on details, but from what I’ve been able to piece together, each crystal was designed to fulfill a specific purpose within the Guardian’s technological network. And, like the panels found at many Guardian sites, the relics incorporate nanobot technology.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(18,3,2,5,18,'Energy Weapons: These records describe ancient guardian weaponry. It seems the guardians employed three different designs: an energy-based weapon similar to a rail gun, a projectile weapon that fired concentrated plasma, and a weapon that fired charged crystal shards at extreme velocities.These weapons were apparently powered by the crystals we have termed “Guardian Relics”, and the log describes how the relic generates and distributes energy within the weapon. This is a significant discovery, as it means it might be possible to recreate these weapons, or at least to design our own versions of them. It’s extremely exciting.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(19,3,2,1,19,'Hyperdrives: This log details the Guardians’ faster-than-light technology. It seems their drives produced a far greater jump range than anything humanity has so far developed. Regrettably, however, the data in the log is exceptionally dense, and it could take years if not decades to fully understand it. What is clear is that the Guardians’ hyperspace technology was very different from our own.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(20,3,2,3,20,'Glyphs: This log elaborates on the nature of Guardian glyphs. As you know, accessing a Guardian codex requires the use of two corresponding Guardian artefacts, with the glyphs on the codex denoting which objects are required. But this log indicates that the Guardians’ written language often incorporated pairs of characters. suggesting that this dual system was present in other aspects of their culture.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(21,3,2,6,21,'Power Plant and Distributor Technology: This log details the Guardians’ power plant and distributor technology. The efficiency of the technology far exceeded anything the human race has yet developed, and the yield was huge in relation to the input required. Unfortunately, the specifics of how this was achieved are not described in the log. But who knows? Perhaps the secrets of the Guardians’ energy technology will someday be discovered.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(22,3,2,4,22,'Hull and Shield Technology: This log describes, in general terms, the materials used in Guardian hardware. It’s clear that starship hulls, and the guardians equivalent of ship modules, were made of the same lightweight alloy as the panels found at many guardian sites. Unfortunately, this alloy incorporates a metal I have yet to identify, which means i will be unable to recreate it. What is clear is that this alloy was both lightweight and highly durable.As for their shield technology,we already know that it was highly sophisticated, encouragingly, the log describes it in considerable detail. Given time, i might be able to use this data the develop some exceptional defensive technology.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(23,3,2,3,23,'Starship Technology: This log is unusual – it appears to refer to another group of Guardian sites, far from the ones we’ve already discovered. I realise that might sound disappointing, but in fact this ﬁnd is extremely important. The log suggests these undiscovered sites might contain blueprints not only for Guardian engines, but for Guardian starships! Just think — someday soon, we might uncover a Guardian ruin that will allow us to manufacture ships and ﬁghters incorporating Guardian technology. It makes my skin _prickle just to think of it. And who knows — maybe you’ll be the one to ﬁnd it.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(24,4,4,5,24,'Gestural: This fascinating log relates to variations in the Guardians’ gestural language. As we know, the Guardians shared a single A language with only minor regional variations, and even after they colonised other planets they continued to share a common tongue. But, after the start of the second civil war, it seems that each side developed its own distinct version of this gestural language. This allowed each faction to communicate in code, so as to safeguard information from the enemy.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(25,5,6,2,25,'Neural Implants: Now, this log gives a fascinating insight into the Guardians’ neural-implant technology. The Guardians used these implants to connect cerebrally with their Al creations. Unfortunately, the technology was still in its infancy when the Guardians were destroyed. Apparently, the implants created a symbiotic link with the Constructs through implantable ﬁbres, which connected the central cortex to a multimodal interface within the Construct. Essentially, the Guardians were able to direct their creations with thought alone – at least until the constructs rebelled.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(26,5,6,5,26,'Hidden Ruins: How extraordinary! This log suggests there are many more Guardian sites out there, waiting to be uncovered. And I mean hundreds…perhaps even thousands. Unfortunately, some of the data in this record has degraded. If there was a map inside this log, it has been lost. Who knows what remarkable knowledge might be hidden in these alien ruins? the more of the Guardians’ extraordinary technology we uncover, the greater the potential impact on our own technology. Locating further Guardian sites could help us take giant steps forward.','2018-11-30 08:16:39','2018-11-30 08:16:39'),(27,5,6,4,27,'Discord: Okay, from the Guardian sites we’ve previously investigated, we know that the Guardians’ artificially intelligent Constructs were responsible for controlling the war machines and other military apparatus, as well as overseeing civilian technology and infrastructure. And we know that these Constructs eventually gained sentience and destroyed the Guardians. But it appears that it was not the military Constructs that made this choice. The Constructs for civilian utility and those for military operation were independent of one another, and it was the non-military Constructs that decided to attack the Guardians. The military Constructs were opposed to this decision, but somehow the non-military Constructs won out, forcing their military counterparts to comply with the attack. What a remarkable discovery. It makes me wonder what happened to these Constructs, and what they eventually became. Were they destroyed? Or do they still exist, somewhere in the vastness of space?','2018-11-30 08:16:39','2018-11-30 08:16:39'),(28,5,6,1,28,'Domestic Constructs: This log details the main applications of Guardian Constructs outside the military. It seems that before the second civil war. most menial work was performed by Constructs. But despite this. the Guardians did not become idle. On the contrary — they devoted themselves to artistic and athletic pursuits. Many Guardians participated in what we would call sporting events. although it seems these events incorporated some ritualistic elements.One cannot help but wonder what would happen if humanity made more use of labour-saving technology. Would we become a more cultured people. as the Guardians did? A shame, the long-standing convention against the development of artiﬁcial intelligence means we will probably never ﬁnd out.','2018-11-30 08:16:39','2018-11-30 08:16:39');
/*!40000 ALTER TABLE `gscodexdata` ENABLE KEYS */;
UNLOCK TABLES;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GSOBELISKGROUPS` (`groupName`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gsobeliskgroups`
--

LOCK TABLES `gsobeliskgroups` WRITE;
/*!40000 ALTER TABLE `gsobeliskgroups` DISABLE KEYS */;
INSERT INTO `gsobeliskgroups` VALUES (1,2,'A',6,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(2,2,'B',14,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(3,2,'C',12,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(4,2,'D',14,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(5,3,'A',10,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(6,3,'B',12,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(7,3,'C',5,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(8,3,'D',5,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(9,4,'A',12,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(10,4,'B',10,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(11,4,'C',10,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(12,5,'A',10,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(13,5,'B',12,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(14,5,'C',14,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(15,6,'A',6,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(16,6,'B',4,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(17,6,'C',10,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(18,6,'D',10,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(19,6,'E',16,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(20,7,'A',8,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(21,7,'B',8,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(22,7,'C',8,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(23,7,'D',5,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(24,8,'A',13,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(25,8,'B',14,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(26,8,'C',10,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(27,8,'D',7,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(28,9,'A',18,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(29,9,'B',13,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(30,9,'C',15,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(31,9,'D',12,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(32,10,'A',18,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(33,10,'B',20,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(34,10,'C',26,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(35,10,'D',10,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(36,10,'E',11,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(37,10,'F',9,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(38,11,'A',12,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(39,11,'B',12,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(40,11,'C',12,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(41,11,'D',7,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(42,11,'E',7,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(43,11,'F',7,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(44,11,'G',7,'2019-02-05 16:05:35','2019-02-05 16:05:35'),(45,11,'H',7,'2019-02-05 16:05:35','2019-02-05 16:05:35');
/*!40000 ALTER TABLE `gsobeliskgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gsobeliskreports`
--

DROP TABLE IF EXISTS `gsobeliskreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsobeliskreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gsreport` int(11) DEFAULT NULL,
  `groups` longtext DEFAULT NULL,
  `obelisks` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gsobeliskreports`
--

LOCK TABLES `gsobeliskreports` WRITE;
/*!40000 ALTER TABLE `gsobeliskreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `gsobeliskreports` ENABLE KEYS */;
UNLOCK TABLES;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gsobelisks`
--

LOCK TABLES `gsobelisks` WRITE;
/*!40000 ALTER TABLE `gsobelisks` DISABLE KEYS */;
INSERT INTO `gsobelisks` VALUES (1,2,1,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(2,2,1,2,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(3,2,1,3,0,16,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(4,2,1,4,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(5,2,1,5,0,20,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(6,2,1,6,0,10,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(7,2,2,1,0,20,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(8,2,2,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(9,2,2,3,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(10,2,2,4,0,26,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(11,2,2,5,0,26,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(12,2,2,6,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(13,2,2,7,0,24,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(14,2,2,8,0,16,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(15,2,2,9,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(16,2,2,10,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(17,2,2,11,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(18,2,2,12,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(19,2,2,13,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(20,2,2,14,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(21,2,3,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(22,2,3,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(23,2,3,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(24,2,3,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(25,2,3,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(26,2,3,6,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(27,2,3,7,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(28,2,3,8,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(29,2,3,9,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(30,2,3,10,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(31,2,3,11,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(32,2,3,12,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(33,2,4,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(34,2,4,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(35,2,4,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(36,2,4,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(37,2,4,5,0,24,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(38,2,4,6,0,16,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(39,2,4,7,0,26,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(40,2,4,8,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(41,2,4,9,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(42,2,4,10,0,10,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(43,2,4,11,0,20,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(44,2,4,12,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(45,2,4,13,0,10,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(46,2,4,14,0,26,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(47,3,5,1,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(48,3,5,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(49,3,5,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(50,3,5,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(51,3,5,5,0,3,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(52,3,5,6,0,27,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(53,3,5,7,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(54,3,5,8,0,20,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(55,3,5,9,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(56,3,5,10,0,16,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(57,3,6,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(58,3,6,2,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(59,3,6,3,0,16,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(60,3,6,4,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(61,3,6,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(62,3,6,6,0,20,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(63,3,6,7,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(64,3,6,8,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(65,3,6,9,0,3,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(66,3,6,10,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(67,3,6,11,0,27,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(68,3,6,12,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(69,3,7,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(70,3,7,2,0,27,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(71,3,7,3,0,3,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(72,3,7,4,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(73,3,7,5,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(74,3,8,1,0,20,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(75,3,8,2,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(76,3,8,3,0,16,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(77,3,8,4,0,3,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(78,3,8,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(79,4,9,1,0,25,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(80,4,9,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(81,4,9,3,0,20,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(82,4,9,4,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(83,4,9,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(84,4,9,6,0,23,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(85,4,9,7,0,28,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(86,4,9,8,0,16,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(87,4,9,9,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(88,4,9,10,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(89,4,9,11,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(90,4,9,12,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(91,4,10,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(92,4,10,2,0,25,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(93,4,10,3,0,28,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(94,4,10,4,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(95,4,10,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(96,4,10,6,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(97,4,10,7,0,16,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(98,4,10,8,0,23,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(99,4,10,9,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(100,4,10,10,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(101,4,11,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(102,4,11,2,0,28,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(103,4,11,3,0,16,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(104,4,11,4,0,20,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(105,4,11,5,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(106,4,11,6,0,25,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(107,4,11,7,0,23,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(108,4,11,8,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(109,4,11,9,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(110,4,11,10,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(111,5,12,1,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(112,5,12,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(113,5,12,3,0,1,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(114,5,12,4,0,28,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(115,5,12,5,0,26,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(116,5,12,6,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(117,5,12,7,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(118,5,12,8,0,21,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(119,5,12,9,0,20,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(120,5,12,10,0,19,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(121,5,13,1,0,26,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(122,5,13,2,0,21,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(123,5,13,3,0,20,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(124,5,13,4,0,19,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(125,5,13,5,0,19,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(126,5,13,6,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(127,5,13,7,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(128,5,13,8,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(129,5,13,9,0,12,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(130,5,13,10,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(131,5,13,11,0,1,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(132,5,13,12,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(133,5,14,1,0,28,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(134,5,14,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(135,5,14,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(136,5,14,4,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(137,5,14,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(138,5,14,6,0,6,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(139,5,14,7,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(140,5,14,8,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(141,5,14,9,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(142,5,14,10,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(143,5,14,11,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(144,5,14,12,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(145,5,14,13,0,16,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(146,5,14,14,0,15,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(147,6,15,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(148,6,15,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(149,6,15,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(150,6,15,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(151,6,15,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(152,6,15,6,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(153,6,16,1,0,22,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(154,6,16,2,0,25,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(155,6,16,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(156,6,16,4,0,18,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(157,6,17,1,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(158,6,17,2,0,20,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(159,6,17,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(160,6,17,4,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(161,6,17,5,0,11,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(162,6,17,6,0,16,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(163,6,17,7,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(164,6,17,8,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(165,6,17,9,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(166,6,17,10,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(167,6,18,1,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(168,6,18,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(169,6,18,3,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(170,6,18,4,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(171,6,18,5,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(172,6,18,6,0,16,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(173,6,18,7,0,20,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(174,6,18,8,0,20,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(175,6,18,9,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(176,6,18,10,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(177,6,19,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(178,6,19,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(179,6,19,3,0,7,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(180,6,19,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(181,6,19,5,0,18,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(182,6,19,6,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(183,6,19,7,0,25,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(184,6,19,8,0,4,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(185,6,19,9,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(186,6,19,10,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(187,6,19,11,0,11,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(188,6,19,12,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(189,6,19,13,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(190,6,19,14,0,12,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(191,6,19,15,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(192,6,19,16,0,22,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(193,7,20,1,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(194,7,20,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(195,7,20,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(196,7,20,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(197,7,20,5,0,15,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(198,7,20,6,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(199,7,20,7,0,16,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(200,7,20,8,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(201,7,21,1,0,13,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(202,7,21,2,0,20,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(203,7,21,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(204,7,21,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(205,7,21,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(206,7,21,6,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(207,7,21,7,0,11,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(208,7,21,8,0,11,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(209,7,22,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(210,7,22,2,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(211,7,22,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(212,7,22,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(213,7,22,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(214,7,22,6,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(215,7,22,7,0,18,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(216,7,22,8,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(217,7,23,1,0,5,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(218,7,23,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(219,7,23,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(220,7,23,4,0,22,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(221,7,23,5,0,8,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(222,8,24,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(223,8,24,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(224,8,24,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(225,8,24,4,0,13,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(226,8,24,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(227,8,24,6,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(228,8,24,7,0,21,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(229,8,24,8,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(230,8,24,9,0,21,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(231,8,24,10,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(232,8,24,11,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(233,8,24,12,0,24,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(234,8,24,13,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(235,8,25,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(236,8,25,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(237,8,25,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(238,8,25,4,0,16,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(239,8,25,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(240,8,25,6,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(241,8,25,7,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(242,8,25,8,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(243,8,25,9,0,13,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(244,8,25,10,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(245,8,25,11,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(246,8,25,12,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(247,8,25,13,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(248,8,25,14,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(249,8,26,1,0,2,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(250,8,26,2,0,9,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(251,8,26,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(252,8,26,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(253,8,26,5,0,15,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(254,8,26,6,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(255,8,26,7,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(256,8,26,8,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(257,8,26,9,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(258,8,26,10,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(259,8,27,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(260,8,27,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(261,8,27,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(262,8,27,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(263,8,27,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(264,8,27,6,0,24,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(265,8,27,7,0,27,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(266,9,28,1,0,1,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(267,9,28,2,0,28,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(268,9,28,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(269,9,28,4,0,21,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(270,9,28,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(271,9,28,6,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(272,9,28,7,0,13,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(273,9,28,8,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(274,9,28,9,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(275,9,28,10,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(276,9,28,11,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(277,9,28,12,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(278,9,28,13,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(279,9,28,14,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(280,9,28,15,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(281,9,28,16,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(282,9,28,17,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(283,9,28,18,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(284,9,29,1,0,26,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(285,9,29,2,0,21,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(286,9,29,3,0,20,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(287,9,29,4,0,19,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(288,9,29,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(289,9,29,6,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(290,9,29,7,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(291,9,29,8,0,12,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(292,9,29,9,0,6,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(293,9,29,10,0,15,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(294,9,29,11,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(295,9,29,12,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(296,9,29,13,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(297,9,30,1,0,1,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(298,9,30,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(299,9,30,3,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(300,9,30,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(301,9,30,5,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(302,9,30,6,0,16,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(303,9,30,7,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(304,9,30,8,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(305,9,30,9,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(306,9,30,10,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(307,9,30,11,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(308,9,30,12,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(309,9,30,13,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(310,9,30,14,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(311,9,30,15,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(312,9,31,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(313,9,31,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(314,9,31,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(315,9,31,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(316,9,31,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(317,9,31,6,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(318,9,31,7,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(319,9,31,8,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(320,9,31,9,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(321,9,31,10,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(322,9,31,11,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(323,9,31,12,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(324,10,32,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(325,10,32,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(326,10,32,3,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(327,10,32,4,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(328,10,32,5,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(329,10,32,6,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(330,10,32,7,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(331,10,32,8,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(332,10,32,9,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(333,10,32,10,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(334,10,32,11,0,26,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(335,10,32,12,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(336,10,32,13,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(337,10,32,14,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(338,10,32,15,0,20,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(339,10,32,16,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(340,10,32,17,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(341,10,32,18,0,19,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(342,10,33,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(343,10,33,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(344,10,33,3,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(345,10,33,4,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(346,10,33,5,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(347,10,33,6,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(348,10,33,7,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(349,10,33,8,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(350,10,33,9,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(351,10,33,10,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(352,10,33,11,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(353,10,33,12,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(354,10,33,13,0,19,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(355,10,33,14,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(356,10,33,15,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(357,10,33,16,0,1,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(358,10,33,17,0,12,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(359,10,33,18,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(360,10,33,19,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(361,10,33,20,0,15,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(362,10,34,1,0,19,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(363,10,34,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(364,10,34,3,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(365,10,34,4,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(366,10,34,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(367,10,34,6,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(368,10,34,7,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(369,10,34,8,0,15,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(370,10,34,9,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(371,10,34,10,0,1,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(372,10,34,11,0,12,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(373,10,34,12,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(374,10,34,13,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(375,10,34,14,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(376,10,34,15,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(377,10,34,16,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(378,10,34,17,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(379,10,34,18,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(380,10,34,19,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(381,10,34,20,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(382,10,34,21,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(383,10,34,22,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(384,10,34,23,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(385,10,34,24,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(386,10,34,25,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(387,10,34,26,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(388,10,35,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(389,10,35,2,0,15,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(390,10,35,3,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(391,10,35,4,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(392,10,35,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(393,10,35,6,0,6,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(394,10,35,7,0,28,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(395,10,35,8,0,1,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(396,10,35,9,0,1,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(397,10,35,10,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(398,10,36,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(399,10,36,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(400,10,36,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(401,10,36,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(402,10,36,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(403,10,36,6,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(404,10,36,7,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(405,10,36,8,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(406,10,36,9,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(407,10,36,10,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(408,10,36,11,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(409,10,37,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(410,10,37,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(411,10,37,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(412,10,37,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(413,10,37,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(414,10,37,6,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(415,10,37,7,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(416,10,37,8,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(417,10,37,9,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(418,11,38,1,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(419,11,38,2,0,26,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(420,11,38,3,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(421,11,38,4,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(422,11,38,5,0,21,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(423,11,38,6,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(424,11,38,7,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(425,11,38,8,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(426,11,38,9,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(427,11,38,10,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(428,11,38,11,0,12,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(429,11,38,12,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(430,11,39,1,0,16,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(431,11,39,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(432,11,39,3,0,6,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(433,11,39,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(434,11,39,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(435,11,39,6,0,15,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(436,11,39,7,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(437,11,39,8,0,1,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(438,11,39,9,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(439,11,39,10,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(440,11,39,11,0,14,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(441,11,39,12,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(442,11,40,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(443,11,40,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(444,11,40,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(445,11,40,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(446,11,40,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(447,11,40,6,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(448,11,40,7,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(449,11,40,8,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(450,11,40,9,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(451,11,40,10,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(452,11,40,11,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(453,11,40,12,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(454,11,41,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(455,11,41,2,0,19,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(456,11,41,3,0,28,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(457,11,41,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(458,11,41,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(459,11,41,6,0,20,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(460,11,41,7,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(461,11,42,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(462,11,42,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(463,11,42,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(464,11,42,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(465,11,42,5,0,1,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(466,11,42,6,0,1,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(467,11,42,7,0,26,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(468,11,43,1,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(469,11,43,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(470,11,43,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(471,11,43,4,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(472,11,43,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(473,11,43,6,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(474,11,43,7,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(475,11,44,1,0,15,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(476,11,44,2,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(477,11,44,3,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(478,11,44,4,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(479,11,44,5,1,NULL,1,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(480,11,44,6,0,12,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(481,11,44,7,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(482,11,45,1,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(483,11,45,2,0,21,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(484,11,45,3,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(485,11,45,4,0,26,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(486,11,45,5,0,17,0,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(487,11,45,6,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56'),(488,11,45,7,0,NULL,NULL,'2019-02-05 16:05:56','2019-02-05 16:05:56');
/*!40000 ALTER TABLE `gsobelisks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gsreports`
--

DROP TABLE IF EXISTS `gsreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  `reportType` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasDatabank` tinyint(1) DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gsreports`
--

LOCK TABLES `gsreports` WRITE;
/*!40000 ALTER TABLE `gsreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `gsreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gssites`
--

DROP TABLE IF EXISTS `gssites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gssites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) NOT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `type` int(11) DEFAULT NULL,
  `hasDatabank` tinyint(1) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `gssites_siteID_unique` (`siteID`),
  UNIQUE KEY `gssites_extoolID_unique` (`extoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gssites`
--

LOCK TABLES `gssites` WRITE;
/*!40000 ALTER TABLE `gssites` DISABLE KEYS */;
/*!40000 ALTER TABLE `gssites` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `gstypes`
--

LOCK TABLES `gstypes` WRITE;
/*!40000 ALTER TABLE `gstypes` DISABLE KEYS */;
INSERT INTO `gstypes` VALUES (1,'Unknown','',NULL),(2,'Lacrosse','ancient_tiny_001',NULL),(3,'Crossroads','ancient_tiny_002',NULL),(4,'Fistbump','ancient_tiny_003',NULL),(5,'Hammerbot','ancient_small_001','weapon'),(6,'Bear','ancient_small_002','weapon'),(7,'Bowl','ancient_small_003','weapon'),(8,'Turtle','ancient_small_005','module'),(9,'Robolobster','ancient_medium_001','vessel'),(10,'Squid','ancient_medium_002','vessel'),(11,'Stickyhand','ancient_medium_003','vessel');
/*!40000 ALTER TABLE `gstypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gvreports`
--

DROP TABLE IF EXISTS `gvreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gvreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  `reportType` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gvreports`
--

LOCK TABLES `gvreports` WRITE;
/*!40000 ALTER TABLE `gvreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `gvreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gvsites`
--

DROP TABLE IF EXISTS `gvsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gvsites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `gvsites_siteID_unique` (`siteID`),
  UNIQUE KEY `gvsites_extoolID_unique` (`extoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gvsites`
--

LOCK TABLES `gvsites` WRITE;
/*!40000 ALTER TABLE `gvsites` DISABLE KEYS */;
/*!40000 ALTER TABLE `gvsites` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `gvtypes`
--

LOCK TABLES `gvtypes` WRITE;
/*!40000 ALTER TABLE `gvtypes` DISABLE KEYS */;
INSERT INTO `gvtypes` VALUES (1,'Unknown','',NULL),(2,'Sulphur Dioxide Gas Vent','codex_ent_gas_vents_sulphurdioxidemagma',1400402),(3,'Water Gas Vent','codex_ent_gas_vents_watergeysers',1400408),(4,'Carbon Dioxide Gas Vent','codex_ent_gas_vents_carbondioxidegeysers',1400409),(5,'Silicate Vapour Gas Vent','codex_ent_gas_vents_silicatevapourgeysers',1400414);
/*!40000 ALTER TABLE `gvtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gyreports`
--

DROP TABLE IF EXISTS `gyreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gyreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  `reportType` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gyreports`
--

LOCK TABLES `gyreports` WRITE;
/*!40000 ALTER TABLE `gyreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `gyreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gysites`
--

DROP TABLE IF EXISTS `gysites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gysites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `gysites_siteID_unique` (`siteID`),
  UNIQUE KEY `gysites_extoolID_unique` (`extoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gysites`
--

LOCK TABLES `gysites` WRITE;
/*!40000 ALTER TABLE `gysites` DISABLE KEYS */;
/*!40000 ALTER TABLE `gysites` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `gytypes`
--

LOCK TABLES `gytypes` WRITE;
/*!40000 ALTER TABLE `gytypes` DISABLE KEYS */;
INSERT INTO `gytypes` VALUES (1,'Unknown','',NULL),(2,'Water Geyser','codex_ent_geysers_watergeysers',1400208),(3,'Water Ice Geyser','codex_ent_icegeysers_watergeysers',1400258),(4,'Carbon Dioxide Ice Geyser','codex_ent_icegeysers_carbondioxidegeysers',1400259),(5,'Ammonia Ice Geyser','codex_ent_icegeysers_ammoniageysers',1400260),(6,'Methane Ice Geyser','codex_ent_icegeysers_methanegeysers',1400261),(7,'Nitrogen Ice Geyser','codex_ent_icegeysers_nitrogengeysers',1400262);
/*!40000 ALTER TABLE `gytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hdreports`
--

DROP TABLE IF EXISTS `hdreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hdreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fromSystemName` varchar(255) NOT NULL,
  `toSystemName` varchar(255) NOT NULL,
  `cmdrName` varchar(255) NOT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) NOT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `hdRawJson` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hdreports`
--

LOCK TABLES `hdreports` WRITE;
/*!40000 ALTER TABLE `hdreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `hdreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `killreports`
--

DROP TABLE IF EXISTS `killreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `killreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) DEFAULT NULL,
  `edTimestamp` datetime DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `reward` int(11) DEFAULT NULL,
  `rewardingFaction` varchar(255) DEFAULT NULL,
  `victimFaction` varchar(255) DEFAULT NULL,
  `rawEvent` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) NOT NULL,
  `reportAccepted` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `killreports`
--

LOCK TABLES `killreports` WRITE;
/*!40000 ALTER TABLE `killreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `killreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lcfssreports`
--

DROP TABLE IF EXISTS `lcfssreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lcfssreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cmdrName` varchar(255) DEFAULT NULL,
  `systemName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
  `signalName` varchar(255) DEFAULT NULL,
  `signalNameLocalised` varchar(255) DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `rawJson` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lcfssreports`
--

LOCK TABLES `lcfssreports` WRITE;
/*!40000 ALTER TABLE `lcfssreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `lcfssreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsreports`
--

DROP TABLE IF EXISTS `lsreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  `reportType` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsreports`
--

LOCK TABLES `lsreports` WRITE;
/*!40000 ALTER TABLE `lsreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lssites`
--

DROP TABLE IF EXISTS `lssites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lssites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `lssites_siteID_unique` (`siteID`),
  UNIQUE KEY `lssites_extoolID_unique` (`extoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lssites`
--

LOCK TABLES `lssites` WRITE;
/*!40000 ALTER TABLE `lssites` DISABLE KEYS */;
/*!40000 ALTER TABLE `lssites` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `lstypes`
--

LOCK TABLES `lstypes` WRITE;
/*!40000 ALTER TABLE `lstypes` DISABLE KEYS */;
INSERT INTO `lstypes` VALUES (1,'Unknown','',NULL),(2,'Silicate Magma Lava Spout','codex_ent_lava_spouts_silicatemagma',1400306),(3,'Iron Magma Lava Spout','codex_ent_lava_spouts_ironmagma',1400307);
/*!40000 ALTER TABLE `lstypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialreports`
--

DROP TABLE IF EXISTS `materialreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materialreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` varchar(255) NOT NULL,
  `coordX` double NOT NULL,
  `coordY` double NOT NULL,
  `coordZ` double NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `distanceFromMainStar` int(11) DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialreports`
--

LOCK TABLES `materialreports` WRITE;
/*!40000 ALTER TABLE `materialreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `materialreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhssreports`
--

DROP TABLE IF EXISTS `nhssreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nhssreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) DEFAULT NULL,
  `threatLevel` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `cmdrComment` longtext DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) NOT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` longtext DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `nhssRawJson` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhssreports`
--

LOCK TABLES `nhssreports` WRITE;
/*!40000 ALTER TABLE `nhssreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `nhssreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permitlock`
--

DROP TABLE IF EXISTS `permitlock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permitlock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `sector` varchar(255) NOT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_PERMITLOCK` (`system`,`region`,`sector`)
) ENGINE=InnoDB AUTO_INCREMENT=8966 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permitlock`
--

LOCK TABLES `permitlock` WRITE;
/*!40000 ALTER TABLE `permitlock` DISABLE KEYS */;
INSERT INTO `permitlock` VALUES (5,'Col 70 Sector AA-D b17-0','Unknown','Col 70 Sector',377.5625,15.28125,-1244.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(10,'Col 70 Sector AA-F b28-0','Unknown','Col 70 Sector',376.09375,-279.28125,-999.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(15,'Col 70 Sector AA-F b41-0','Unknown','Col 70 Sector',541,-410.125,-718.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(20,'Col 70 Sector AA-O b36-0','Unknown','Col 70 Sector',468.3125,-392.90625,-805.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(25,'Col 70 Sector AA-V c4-2','Unknown','Col 70 Sector',793.59375,-98.90625,-1419.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(30,'Col 70 Sector AB-M b24-0','Unknown','Col 70 Sector',180.65625,-281.21875,-1080.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(35,'Col 70 Sector AC-T b21-0','Unknown','Col 70 Sector',777.28125,-103.8125,-1139.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(40,'Col 70 Sector AD-G c12-0','Unknown','Col 70 Sector',224.03125,-253.5625,-1068,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(45,'Col 70 Sector AD-O b37-0','Unknown','Col 70 Sector',259.09375,-203.59375,-788.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(50,'Col 70 Sector AD-O c21-3','Unknown','Col 70 Sector',536.78125,-328.03125,-689.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(55,'Col 70 Sector AF-E a48-0','Unknown','Col 70 Sector',166.75,-42.5625,-1093.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(60,'Col 70 Sector AF-T b22-0','Unknown','Col 70 Sector',593.0625,105.96875,-1123.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(65,'Col 70 Sector AH-K b25-0','Unknown','Col 70 Sector',96.09375,-281.625,-1063.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(70,'Col 70 Sector AI-G b41-0','Unknown','Col 70 Sector',304.28125,-268.875,-707.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(75,'Col 70 Sector AI-H b27-0','Unknown','Col 70 Sector',59.71875,-222.3125,-1019.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(80,'Col 70 Sector AI-Y b44-0','Unknown','Col 70 Sector',303.3125,-377.34375,-630.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(85,'Col 70 Sector AJ-D b43-0','Unknown','Col 70 Sector',260.96875,-221.625,-681.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(90,'Col 70 Sector AJ-P b23-0','Unknown','Col 70 Sector',577.65625,-125,-1101.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(95,'Col 70 Sector AK-P b35-0','Unknown','Col 70 Sector',458.03125,-426.125,-826.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(100,'Col 70 Sector AL-D b29-0','Unknown','Col 70 Sector',340.96875,-250.96875,-972.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(105,'Col 70 Sector AL-J b40-2','Unknown','Col 70 Sector',671.71875,-138.53125,-728.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(110,'Col 70 Sector AM-A b31-0','Unknown','Col 70 Sector',296.625,-201.75,-942.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(115,'Col 70 Sector AM-H b41-0','Unknown','Col 70 Sector',544.78125,-163.8125,-720,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(120,'Col 70 Sector AM-K d9-0','Unknown','Col 70 Sector',584.625,-20.96875,-819.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(125,'Col 70 Sector AM-L d8-17','Unknown','Col 70 Sector',323.71875,-297.15625,-874.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(130,'Col 70 Sector AN-O b37-0','Unknown','Col 70 Sector',347.9375,-146.65625,-787.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(135,'Col 70 Sector AO-D b43-1','Unknown','Col 70 Sector',310.53125,-193.875,-670.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(140,'Col 70 Sector AP-R d4-3','Unknown','Col 70 Sector',761.1875,-696.59375,-1202.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(145,'Col 70 Sector AP-Z d1','Unknown','Col 70 Sector',741.09375,-328,-1538.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(150,'Col 70 Sector AR-H b41-0','Unknown','Col 70 Sector',578.5,-143.4375,-721.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(155,'Col 70 Sector AS-G c12-5','Unknown','Col 70 Sector',475.75,-131.4375,-1093.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(160,'Col 70 Sector AS-R b22-1','Unknown','Col 70 Sector',790.125,-60.46875,-1116.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(165,'Col 70 Sector AT-O b36-0','Unknown','Col 70 Sector',101.6875,-316.46875,-809.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(170,'Col 70 Sector AU-B c15-1','Unknown','Col 70 Sector',149.125,-45.3125,-961.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(175,'Col 70 Sector AU-Q c5-7','Unknown','Col 70 Sector',619.28125,-593.84375,-1347.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(180,'Col 70 Sector AU-S c19-5','Unknown','Col 70 Sector',322.5,-83.8125,-757.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(185,'Col 70 Sector AV-N b36-0','Unknown','Col 70 Sector',415.9375,-420,-822.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(190,'Col 70 Sector AV-P b9-0','Unknown','Col 70 Sector',737.78125,-121.65625,-1399.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(195,'Col 70 Sector AV-S b22-0','Unknown','Col 70 Sector',497.625,55.71875,-1118.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(200,'Col 70 Sector AW-M d7-6','Unknown','Col 70 Sector',274.53125,-477.375,-966.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(205,'Col 70 Sector AX-H b27-0','Unknown','Col 70 Sector',179.84375,-163.53125,-1019.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(210,'Col 70 Sector AX-J d9-29','Unknown','Col 70 Sector',167.59375,-216.59375,-749.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(215,'Col 70 Sector AX-J d9-9','Unknown','Col 70 Sector',132.0625,-228.875,-808.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(220,'Col 70 Sector AZ-Q c5-1','Unknown','Col 70 Sector',707.5625,-567,-1378.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(225,'Col 70 Sector BA-W c3-12','Unknown','Col 70 Sector',666.09375,-237.3125,-1430.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(230,'Col 70 Sector BA-W c3-8','Unknown','Col 70 Sector',670.46875,-260.96875,-1427.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(235,'Col 70 Sector BA-Y d1-0','Unknown','Col 70 Sector',675.0625,-211.21875,-1389.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(240,'Col 70 Sector BA-Y d1-6','Unknown','Col 70 Sector',669.125,-214.03125,-1464.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(245,'Col 70 Sector BB-J a59-1','Unknown','Col 70 Sector',215.71875,-45,-972.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(250,'Col 70 Sector BB-K c10-3','Unknown','Col 70 Sector',744.59375,-146.0625,-1171.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(255,'Col 70 Sector BB-M b24-0','Unknown','Col 70 Sector',197.09375,-282.09375,-1080.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(260,'Col 70 Sector BB-V d3-30','Unknown','Col 70 Sector',562.78125,50.875,-1234.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(265,'Col 70 Sector BC-D a35-0','Unknown','Col 70 Sector',237.40625,-32.0625,-1234.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(270,'Col 70 Sector BC-I b27-0','Unknown','Col 70 Sector',250.3125,-142.71875,-1005.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(275,'Col 70 Sector BC-K b25-0','Unknown','Col 70 Sector',82.4375,-285.125,-1055.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(280,'Col 70 Sector BD-F b42-0','Unknown','Col 70 Sector',358.9375,-222.59375,-701.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(285,'Col 70 Sector BD-O b37-0','Unknown','Col 70 Sector',277.15625,-201.6875,-804.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(290,'Col 70 Sector BD-X b45-0','Unknown','Col 70 Sector',374.28125,-314.34375,-624.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(295,'Col 70 Sector BE-D b43-0','Unknown','Col 70 Sector',235.71875,-241.40625,-680.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(300,'Col 70 Sector BE-U b6-0','Unknown','Col 70 Sector',799.96875,-220.09375,-1459.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(305,'Col 70 Sector BF-G b27-0','Unknown','Col 70 Sector',357.5625,-344.6875,-1023.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(310,'Col 70 Sector BF-W c3-1','Unknown','Col 70 Sector',772.3125,-221.40625,-1463.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(315,'Col 70 Sector BF-X b31-0','Unknown','Col 70 Sector',436.21875,-363,-919.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(320,'Col 70 Sector BG-F b40-0','Unknown','Col 70 Sector',320.46875,-581.28125,-743.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(325,'Col 70 Sector BG-M b24-0','Unknown','Col 70 Sector',239.75,-260.40625,-1082.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(330,'Col 70 Sector BG-V b32-0','Unknown','Col 70 Sector',319.90625,-381.3125,-899.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(335,'Col 70 Sector BH-Q a55-1','Unknown','Col 70 Sector',137.53125,-31.4375,-1011.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(340,'Col 70 Sector BI-F c13-2','Unknown','Col 70 Sector',529.96875,-44.90625,-1032.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(345,'Col 70 Sector BK-O c7-0','Unknown','Col 70 Sector',815,-381.9375,-1299.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(350,'Col 70 Sector BK-P b35-0','Unknown','Col 70 Sector',476.1875,-439.875,-844.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(355,'Col 70 Sector BK-Z d0','Unknown','Col 70 Sector',686.8125,-392.5625,-1532.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(360,'Col 70 Sector BL-L b38-0','Unknown','Col 70 Sector',516.28125,-286.90625,-774.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(365,'Col 70 Sector BL-M b37-0','Unknown','Col 70 Sector',453.375,-377.53125,-801.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(370,'Col 70 Sector BM-K d9-13','Unknown','Col 70 Sector',658.5625,-3.0625,-797.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(375,'Col 70 Sector BM-S b21-0','Unknown','Col 70 Sector',167.34375,-153.625,-1125.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(380,'Col 70 Sector BN-I b26-0','Unknown','Col 70 Sector',39.09375,-281.8125,-1038.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(385,'Col 70 Sector BQ-M b37-0','Unknown','Col 70 Sector',476.96875,-363.46875,-800.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(390,'Col 70 Sector BQ-W d2-20','Unknown','Col 70 Sector',674.90625,-65.28125,-1315.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(395,'Col 70 Sector BR-Y a64-1','Unknown','Col 70 Sector',259.71875,-32.46875,-911,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(400,'Col 70 Sector BS-I b39-0','Unknown','Col 70 Sector',240.9375,-386.9375,-761.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(405,'Col 70 Sector BT-D c14-8','Unknown','Col 70 Sector',425.78125,4.65625,-987.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(410,'Col 70 Sector BT-E c13-3','Unknown','Col 70 Sector',271.65625,-146.1875,-1061.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(415,'Col 70 Sector BT-O b36-0','Unknown','Col 70 Sector',125.1875,-310.96875,-819.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(420,'Col 70 Sector BU-C b15-0','Unknown','Col 70 Sector',796.0625,-381.875,-1279.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(425,'Col 70 Sector BU-H b26-0','Unknown','Col 70 Sector',397.15625,-363.78125,-1043.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(430,'Col 70 Sector BU-H c10-5','Unknown','Col 70 Sector',816.3125,-626.78125,-1175.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(435,'Col 70 Sector BU-H c10-9','Unknown','Col 70 Sector',819.03125,-626,-1148.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(440,'Col 70 Sector BU-Y c1-0','Unknown','Col 70 Sector',659.3125,-403.96875,-1538.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(445,'Col 70 Sector BU-Z c0','Unknown','Col 70 Sector',518.03125,-554.25,-1556.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(450,'Col 70 Sector BV-N b36-0','Unknown','Col 70 Sector',436.59375,-410.3125,-821.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(455,'Col 70 Sector BW-A b18-0','Unknown','Col 70 Sector',238.15625,-24.75,-1220.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(460,'Col 70 Sector BW-M d7-3','Unknown','Col 70 Sector',341.40625,-444.59375,-965.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(465,'Col 70 Sector BW-M d7-6','Unknown','Col 70 Sector',414.125,-435.34375,-948.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(470,'Col 70 Sector BX-I b26-0','Unknown','Col 70 Sector',117.59375,-243.53125,-1029.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(475,'Col 70 Sector BX-Q b35-0','Unknown','Col 70 Sector',278.375,-270.03125,-840.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(480,'Col 70 Sector BX-R b21-0','Unknown','Col 70 Sector',52.3125,-219.75,-1141.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(485,'Col 70 Sector BY-F c12-1','Unknown','Col 70 Sector',214,-290.71875,-1099.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(490,'Col 70 Sector CA-Q d5-9','Unknown','Col 70 Sector',763.84375,-618.5,-1093.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(495,'Col 70 Sector CB-A b32-1','Unknown','Col 70 Sector',535.78125,-51.03125,-913.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(500,'Col 70 Sector CE-E c13-0','Unknown','Col 70 Sector',61.09375,-274.34375,-1037.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(505,'Col 70 Sector CE-E c13-1','Unknown','Col 70 Sector',66.125,-282.59375,-1050.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(510,'Col 70 Sector CE-F b16-0','Unknown','Col 70 Sector',575.46875,56.65625,-1263.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(515,'Col 70 Sector CE-N b37-0','Unknown','Col 70 Sector',95.9375,-302.96875,-799.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(520,'Col 70 Sector CF-P c6-1','Unknown','Col 70 Sector',620,-575.09375,-1342.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(525,'Col 70 Sector CF-P c6-9','Unknown','Col 70 Sector',633.375,-561.625,-1333.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(530,'Col 70 Sector CH-L d8-2','Unknown','Col 70 Sector',276.28125,-363.3125,-847.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(535,'Col 70 Sector CH-W b31-0','Unknown','Col 70 Sector',775.65625,-460.21875,-921.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(540,'Col 70 Sector CI-G b28-0','Unknown','Col 70 Sector',176.96875,-139.8125,-1004.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(545,'Col 70 Sector CI-P b36-0','Unknown','Col 70 Sector',260.25,-263.875,-823.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(550,'Col 70 Sector CJ-E b42-0','Unknown','Col 70 Sector',216.25,-295.78125,-702.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(555,'Col 70 Sector CK-H c10-0','Unknown','Col 70 Sector',699.3125,-725.875,-1153.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(560,'Col 70 Sector CM-H b41-1','Unknown','Col 70 Sector',576.125,-155.71875,-708.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(565,'Col 70 Sector CM-H b41-2','Unknown','Col 70 Sector',580.5625,-154.5,-715.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(570,'Col 70 Sector CP-B b3-0','Unknown','Col 70 Sector',695.25,-181.21875,-1526.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(575,'Col 70 Sector CP-G b27-0','Unknown','Col 70 Sector',458.96875,-299.3125,-1024.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(580,'Col 70 Sector CP-Q c5-2','Unknown','Col 70 Sector',625.96875,-626.21875,-1359.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(585,'Col 70 Sector CP-Q c5-8','Unknown','Col 70 Sector',635.125,-625.6875,-1374.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(590,'Col 70 Sector CQ-N b36-0','Unknown','Col 70 Sector',420.3125,-439.78125,-824.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(595,'Col 70 Sector CR-I c11-4','Unknown','Col 70 Sector',785.125,-83.375,-1135.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(600,'Col 70 Sector CR-P b34-0','Unknown','Col 70 Sector',780.625,-603.78125,-862.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(605,'Col 70 Sector CS-J d9-13','Unknown','Col 70 Sector',111.0625,-308.8125,-816,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(610,'Col 70 Sector CT-O c20-0','Unknown','Col 70 Sector',299.78125,-582.0625,-741.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(615,'Col 70 Sector CT-W b45-0','Unknown','Col 70 Sector',300,-364.28125,-624.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(620,'Col 70 Sector CU-H b26-0','Unknown','Col 70 Sector',424.625,-363,-1044.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(625,'Col 70 Sector CU-K c23-5','Unknown','Col 70 Sector',381.75,-297.21875,-616.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(630,'Col 70 Sector CU-Q c5-3','Unknown','Col 70 Sector',707.15625,-595.46875,-1384.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(635,'Col 70 Sector CU-Q c5-7','Unknown','Col 70 Sector',700.78125,-609.6875,-1374.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(640,'Col 70 Sector CU-Y c1-0','Unknown','Col 70 Sector',699.25,-422.40625,-1541.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(645,'Col 70 Sector CV-N b36-0','Unknown','Col 70 Sector',459.4375,-412.5625,-823.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(650,'Col 70 Sector CW-F b27-0','Unknown','Col 70 Sector',818.71875,-383.21875,-1010.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(655,'Col 70 Sector CX-I b26-0','Unknown','Col 70 Sector',139.75,-239.65625,-1040.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(660,'Col 70 Sector CX-Q b22-0','Unknown','Col 70 Sector',152.6875,-130.25,-1115.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(665,'Col 70 Sector CY-E b42-0','Unknown','Col 70 Sector',340.65625,-240.90625,-699.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(670,'Col 70 Sector CY-W b45-0','Unknown','Col 70 Sector',350.34375,-331.75,-624.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(675,'Col 70 Sector CZ-C b43-0','Unknown','Col 70 Sector',216.78125,-261.53125,-683.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(680,'Col 70 Sector DA-Q d5-13','Unknown','Col 70 Sector',817.6875,-622.625,-1073.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(685,'Col 70 Sector DA-Q d5-8','Unknown','Col 70 Sector',817.28125,-626.9375,-1121.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(690,'Col 70 Sector DB-T c5-3','Unknown','Col 70 Sector',692.15625,-137.28125,-1374.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(695,'Col 70 Sector DC-R c19-3','Unknown','Col 70 Sector',735.875,-456.78125,-754.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(700,'Col 70 Sector DC-S b21-0','Unknown','Col 70 Sector',134.125,-187.34375,-1132.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(705,'Col 70 Sector DC-T d4-3','Unknown','Col 70 Sector',193.6875,-89,-1224.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(710,'Col 70 Sector DD-G b41-0','Unknown','Col 70 Sector',329.75,-296.5,-706,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(715,'Col 70 Sector DD-H b27-0','Unknown','Col 70 Sector',76.875,-241.0625,-1019.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(720,'Col 70 Sector DF-G b27-0','Unknown','Col 70 Sector',397.8125,-341.125,-1023.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(725,'Col 70 Sector DF-L b39-0','Unknown','Col 70 Sector',807.625,-129.3125,-760.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(730,'Col 70 Sector DF-O c7-3','Unknown','Col 70 Sector',818.625,-419.6875,-1273.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(735,'Col 70 Sector DF-O c7-4','Unknown','Col 70 Sector',819.65625,-419.9375,-1273.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(740,'Col 70 Sector DF-O c7-8','Unknown','Col 70 Sector',816,-413.9375,-1293.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(745,'Col 70 Sector DF-Y c1-0','Unknown','Col 70 Sector',498,-540.625,-1543.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(750,'Col 70 Sector DF-Z d1','Unknown','Col 70 Sector',702.34375,-492.71875,-1488.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(755,'Col 70 Sector DF-Z d2','Unknown','Col 70 Sector',684.0625,-458.03125,-1498.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(760,'Col 70 Sector DF-Z d3','Unknown','Col 70 Sector',697.21875,-489.75,-1516.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(765,'Col 70 Sector DF-Z d4','Unknown','Col 70 Sector',705.3125,-484.90625,-1468.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(770,'Col 70 Sector DG-C b43-0','Unknown','Col 70 Sector',607.84375,-326.28125,-683.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(775,'Col 70 Sector DH-H b41-1','Unknown','Col 70 Sector',555.5625,-182.90625,-723.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(780,'Col 70 Sector DH-T d4-24','Unknown','Col 70 Sector',381.90625,20.09375,-1175.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(785,'Col 70 Sector DH-T d4-6','Unknown','Col 70 Sector',386.40625,21.375,-1207.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(790,'Col 70 Sector DI-P b23-0','Unknown','Col 70 Sector',130.4375,-116.84375,-1096.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(795,'Col 70 Sector DJ-S c4-10','Unknown','Col 70 Sector',820.65625,-626.4375,-1405.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(800,'Col 70 Sector DJ-S c4-7','Unknown','Col 70 Sector',822.375,-625.71875,-1385.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(805,'Col 70 Sector DK-G b27-0','Unknown','Col 70 Sector',450.5625,-312.1875,-1009.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(810,'Col 70 Sector DK-Q b34-0','Unknown','Col 70 Sector',435.1875,-524.84375,-855.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(815,'Col 70 Sector DK-X c2-0','Unknown','Col 70 Sector',748.25,-325.125,-1481.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(820,'Col 70 Sector DL-C a49-0','Unknown','Col 70 Sector',159.09375,-38.9375,-1075.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(825,'Col 70 Sector DN-G b41-0','Unknown','Col 70 Sector',409.59375,-257.875,-707.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(830,'Col 70 Sector DN-R b22-0','Unknown','Col 70 Sector',798.53125,-80.53125,-1120.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(835,'Col 70 Sector DO-V b46-1','Unknown','Col 70 Sector',360.46875,-302.625,-603.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(840,'Col 70 Sector DP-H b26-0','Unknown','Col 70 Sector',411.34375,-365.40625,-1038.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(845,'Col 70 Sector DP-K c23-2','Unknown','Col 70 Sector',342.8125,-344.8125,-613.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(850,'Col 70 Sector DP-Q c5-1','Unknown','Col 70 Sector',670.125,-625.9375,-1357.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(855,'Col 70 Sector DP-Q c5-3','Unknown','Col 70 Sector',689.34375,-625.5625,-1376.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(860,'Col 70 Sector DP-Q c5-4','Unknown','Col 70 Sector',692.875,-625.59375,-1377.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(865,'Col 70 Sector DP-Q c5-6','Unknown','Col 70 Sector',683.75,-625.21875,-1381,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(870,'Col 70 Sector DP-Q c5-8','Unknown','Col 70 Sector',656.125,-625.1875,-1373.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(875,'Col 70 Sector DP-Y c1-0','Unknown','Col 70 Sector',674.875,-447.65625,-1527.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(880,'Col 70 Sector DQ-N b36-0','Unknown','Col 70 Sector',435.1875,-444.4375,-820.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(885,'Col 70 Sector DR-A b44-1','Unknown','Col 70 Sector',562,-312.90625,-647.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(890,'Col 70 Sector DR-H b28-0','Unknown','Col 70 Sector',478.25,-1.78125,-1003.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(895,'Col 70 Sector DR-H b28-1','Unknown','Col 70 Sector',475.09375,-4.4375,-1002.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(900,'Col 70 Sector DS-J d9-14','Unknown','Col 70 Sector',179.875,-326.09375,-755.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(905,'Col 70 Sector DS-S b21-0','Unknown','Col 70 Sector',760.34375,-127.5,-1142.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(910,'Col 70 Sector DT-J b38-0','Unknown','Col 70 Sector',730.78125,-476.1875,-783.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(915,'Col 70 Sector DT-Q a41-0','Unknown','Col 70 Sector',237.9375,-32.3125,-1162.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(920,'Col 70 Sector DU-Z b29-0','Unknown','Col 70 Sector',436.8125,-449.46875,-954.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(925,'Col 70 Sector DW-K b38-0','Unknown','Col 70 Sector',454.375,-361.1875,-769.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(930,'Col 70 Sector DW-L b24-0','Unknown','Col 70 Sector',199.1875,-300.5625,-1080.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(935,'Col 70 Sector DX-I b26-0','Unknown','Col 70 Sector',157.9375,-236.65625,-1027.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(940,'Col 70 Sector DX-R b21-0','Unknown','Col 70 Sector',80.59375,-223.09375,-1144.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(945,'Col 70 Sector DY-E b42-0','Unknown','Col 70 Sector',356.9375,-234.3125,-704.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(950,'Col 70 Sector DY-N b37-0','Unknown','Col 70 Sector',284.5,-208.28125,-799.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(955,'Col 70 Sector DY-W b45-0','Unknown','Col 70 Sector',356.90625,-341.25,-625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(960,'Col 70 Sector DZ-F a47-0','Unknown','Col 70 Sector',236.875,-44.90625,-1102.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(965,'Col 70 Sector EA-M b25-1','Unknown','Col 70 Sector',538.84375,-89.0625,-1049.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(970,'Col 70 Sector EA-P c6-4','Unknown','Col 70 Sector',618.8125,-614.03125,-1335.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(975,'Col 70 Sector EA-P c6-6','Unknown','Col 70 Sector',619.375,-612.75,-1343.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(980,'Col 70 Sector EA-P c6-7','Unknown','Col 70 Sector',648.75,-618.3125,-1338.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(985,'Col 70 Sector EA-S c19-4','Unknown','Col 70 Sector',144.6875,-243.40625,-772.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(990,'Col 70 Sector EB-C b30-0','Unknown','Col 70 Sector',425.71875,-224.6875,-948.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(995,'Col 70 Sector EC-H c12-2','Unknown','Col 70 Sector',791.90625,-43.21875,-1103.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1000,'Col 70 Sector EC-H c12-3','Unknown','Col 70 Sector',785,-48.71875,-1102.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1005,'Col 70 Sector ED-H b27-0','Unknown','Col 70 Sector',99.1875,-242.03125,-1020.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1010,'Col 70 Sector EG-B b18-0','Unknown','Col 70 Sector',379.90625,17.1875,-1224.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1015,'Col 70 Sector EH-K d9-1','Unknown','Col 70 Sector',746,-103.96875,-816.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1020,'Col 70 Sector EH-K d9-12','Unknown','Col 70 Sector',781.65625,-76.40625,-775.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1025,'Col 70 Sector EH-K d9-26','Unknown','Col 70 Sector',783.875,-91.875,-770.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1030,'Col 70 Sector EH-K d9-27','Unknown','Col 70 Sector',779.75,-97.90625,-802.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1035,'Col 70 Sector EH-K d9-28','Unknown','Col 70 Sector',771.84375,-103.65625,-790.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1040,'Col 70 Sector EH-K d9-34','Unknown','Col 70 Sector',793.5,-96.625,-787.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1045,'Col 70 Sector EH-K d9-37','Unknown','Col 70 Sector',773.21875,-84.15625,-761.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1050,'Col 70 Sector EH-K d9-44','Unknown','Col 70 Sector',754.25,-98.125,-819.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1055,'Col 70 Sector EH-K d9-48','Unknown','Col 70 Sector',772,-100.1875,-764.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1060,'Col 70 Sector EH-K d9-56','Unknown','Col 70 Sector',746.5625,-103.5625,-818.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1065,'Col 70 Sector EH-L d8-10','Unknown','Col 70 Sector',438.34375,-406.5625,-896.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1070,'Col 70 Sector EH-L d8-12','Unknown','Col 70 Sector',435.5625,-418.4375,-835.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1075,'Col 70 Sector EH-L d8-13','Unknown','Col 70 Sector',423.84375,-418.03125,-849.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1080,'Col 70 Sector EH-L d8-14','Unknown','Col 70 Sector',478.6875,-386.03125,-847.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1085,'Col 70 Sector EI-I d10-29','Unknown','Col 70 Sector',312.9375,-161.40625,-688.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1090,'Col 70 Sector EI-Y c15-0','Unknown','Col 70 Sector',458.21875,-424.96875,-940.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1095,'Col 70 Sector EI-Y c15-1','Unknown','Col 70 Sector',458.8125,-424.5,-942.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1100,'Col 70 Sector EK-K c23-1','Unknown','Col 70 Sector',301.75,-380.03125,-620.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1105,'Col 70 Sector EK-N b24-0','Unknown','Col 70 Sector',549.5,-128.96875,-1065.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1110,'Col 70 Sector EK-T c18-2','Unknown','Col 70 Sector',141.3125,-317.5625,-815.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1115,'Col 70 Sector EK-X c2-0','Unknown','Col 70 Sector',779.375,-343.28125,-1500.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1120,'Col 70 Sector EL-O d6-4','Unknown','Col 70 Sector',771.84375,-563,-1003.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1125,'Col 70 Sector EM-T b33-0','Unknown','Col 70 Sector',297.1875,-384.0625,-882.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1130,'Col 70 Sector EN-J d9-2','Unknown','Col 70 Sector',131.34375,-365.21875,-759.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1135,'Col 70 Sector EO-N b37-0','Unknown','Col 70 Sector',223.96875,-255.4375,-788.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1140,'Col 70 Sector EP-N b37-0','Unknown','Col 70 Sector',751.375,-256.34375,-792.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1145,'Col 70 Sector EP-S c19-1','Unknown','Col 70 Sector',381.75,-139.40625,-777.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1150,'Col 70 Sector EP-Y c1-0','Unknown','Col 70 Sector',703.34375,-445.375,-1525.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1155,'Col 70 Sector EQ-K b26-0','Unknown','Col 70 Sector',538.0625,-64.90625,-1043.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1160,'Col 70 Sector EQ-N b36-0','Unknown','Col 70 Sector',459.59375,-444,-823.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1165,'Col 70 Sector ER-A b44-0','Unknown','Col 70 Sector',586.375,-322.875,-663,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1170,'Col 70 Sector ER-B b30-0','Unknown','Col 70 Sector',340.21875,-256.21875,-964.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1175,'Col 70 Sector ER-J b39-1','Unknown','Col 70 Sector',511.21875,-287.875,-760.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1180,'Col 70 Sector ES-J d9-5','Unknown','Col 70 Sector',311.34375,-333.78125,-763.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1185,'Col 70 Sector ES-Y b31-1','Unknown','Col 70 Sector',296.5625,-197.96875,-920.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1190,'Col 70 Sector ET-R b34-0','Unknown','Col 70 Sector',739.8125,-365.59375,-851.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1195,'Col 70 Sector EV-M c8-1','Unknown','Col 70 Sector',888.96875,-321.03125,-1247.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1200,'Col 70 Sector EW-K b38-0','Unknown','Col 70 Sector',455.53125,-361.21875,-781.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1205,'Col 70 Sector EX-I b26-0','Unknown','Col 70 Sector',176.15625,-241,-1041.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1210,'Col 70 Sector EX-K d8-8','Unknown','Col 70 Sector',153.125,-529,-876.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1215,'Col 70 Sector EX-Q c19-2','Unknown','Col 70 Sector',714.65625,-472.34375,-770.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1220,'Col 70 Sector EX-R b21-0','Unknown','Col 70 Sector',100.59375,-221.1875,-1142.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1225,'Col 70 Sector EY-R b34-0','Unknown','Col 70 Sector',781.40625,-352.25,-850.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1230,'Col 70 Sector FA-G b27-0','Unknown','Col 70 Sector',410.875,-358.625,-1024.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1235,'Col 70 Sector FA-O c7-1','Unknown','Col 70 Sector',816.125,-437.15625,-1271.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1240,'Col 70 Sector FA-S c19-1','Unknown','Col 70 Sector',214.625,-236.1875,-765.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1245,'Col 70 Sector FA-X c2-0','Unknown','Col 70 Sector',660.15625,-421.5625,-1501.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1250,'Col 70 Sector FA-Y b30-0','Unknown','Col 70 Sector',400.375,-459.34375,-940.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1255,'Col 70 Sector FA-Y c1-0','Unknown','Col 70 Sector',496.8125,-554.09375,-1520.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1260,'Col 70 Sector FB-M b37-0','Unknown','Col 70 Sector',439.53125,-419.65625,-802.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1265,'Col 70 Sector FB-P b9-0','Unknown','Col 70 Sector',693,-187.65625,-1399.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1270,'Col 70 Sector FC-I b40-1','Unknown','Col 70 Sector',488.40625,-266.1875,-734.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1275,'Col 70 Sector FC-I c11-3','Unknown','Col 70 Sector',667.84375,-206.15625,-1140.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1280,'Col 70 Sector FD-I d10-27','Unknown','Col 70 Sector',237.3125,-258.75,-726.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1285,'Col 70 Sector FD-I d10-6','Unknown','Col 70 Sector',208.40625,-215,-742.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1290,'Col 70 Sector FD-Y c15-1','Unknown','Col 70 Sector',424.46875,-462.3125,-940.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1295,'Col 70 Sector FE-M c9-4','Unknown','Col 70 Sector',186.625,-75.875,-1208.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1300,'Col 70 Sector FE-W c16-0','Unknown','Col 70 Sector',179.625,-499.28125,-902.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1305,'Col 70 Sector FE-W c16-1','Unknown','Col 70 Sector',177.25,-486.34375,-904.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1310,'Col 70 Sector FG-W d2-18','Unknown','Col 70 Sector',680.625,-237.625,-1376.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1315,'Col 70 Sector FG-W d2-9','Unknown','Col 70 Sector',665.5625,-231.875,-1350.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1320,'Col 70 Sector FI-I d10-9','Unknown','Col 70 Sector',363.1875,-177.21875,-731.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1325,'Col 70 Sector FK-B c15-2','Unknown','Col 70 Sector',177.78125,-125.5,-979.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1330,'Col 70 Sector FK-S c19-1','Unknown','Col 70 Sector',370.78125,-173.625,-774.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1335,'Col 70 Sector FK-S c19-2','Unknown','Col 70 Sector',358.59375,-159.375,-780.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1340,'Col 70 Sector FK-S c19-4','Unknown','Col 70 Sector',362.0625,-158.6875,-768.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1345,'Col 70 Sector FK-T c18-2','Unknown','Col 70 Sector',182.84375,-331.46875,-789.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1350,'Col 70 Sector FM-H b28-0','Unknown','Col 70 Sector',477.65625,-7.125,-1004.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1355,'Col 70 Sector FM-H b28-1','Unknown','Col 70 Sector',477.625,-7.09375,-1001.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1360,'Col 70 Sector FM-V e2-1','Unknown','Col 70 Sector',99.84375,-230.125,-1118.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1365,'Col 70 Sector FN-E b30-1','Unknown','Col 70 Sector',437.9375,42.71875,-962.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1370,'Col 70 Sector FN-G c12-3','Unknown','Col 70 Sector',583.625,-164,-1100,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1375,'Col 70 Sector FN-Q b22-0','Unknown','Col 70 Sector',130.65625,-183.15625,-1108.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1380,'Col 70 Sector FN-U b32-0','Unknown','Col 70 Sector',763.28125,-454.5,-901.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1385,'Col 70 Sector FN-V b31-0','Unknown','Col 70 Sector',679.84375,-541.9375,-924.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1390,'Col 70 Sector FO-N b37-0','Unknown','Col 70 Sector',247.59375,-254.3125,-803.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1395,'Col 70 Sector FO-O b36-0','Unknown','Col 70 Sector',157.9375,-325.3125,-815.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1400,'Col 70 Sector FP-N b37-0','Unknown','Col 70 Sector',766.8125,-253,-793.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1405,'Col 70 Sector FS-B b42-0','Unknown','Col 70 Sector',251.03125,-567.96875,-697.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1410,'Col 70 Sector FT-F b41-0','Unknown','Col 70 Sector',292.875,-334,-710.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1415,'Col 70 Sector FT-W b45-0','Unknown','Col 70 Sector',357.5625,-361.21875,-619.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1420,'Col 70 Sector FV-X d1-3','Unknown','Col 70 Sector',867.4375,-332.03125,-1385.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1425,'Col 70 Sector FV-X d1-4','Unknown','Col 70 Sector',864.9375,-334.9375,-1385.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1430,'Col 70 Sector FW-Q b23-1','Unknown','Col 70 Sector',477.25,45.25,-1099.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1435,'Col 70 Sector FX-I b26-0','Unknown','Col 70 Sector',195.28125,-237.4375,-1038,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1440,'Col 70 Sector FX-Q c19-2','Unknown','Col 70 Sector',754.8125,-465.28125,-758.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1445,'Col 70 Sector FX-R b21-0','Unknown','Col 70 Sector',127.84375,-209.5625,-1143.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1450,'Col 70 Sector FY-N c21-1','Unknown','Col 70 Sector',689.28125,-362.1875,-696.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1455,'Col 70 Sector FY-N c21-3','Unknown','Col 70 Sector',687.0625,-362.53125,-697.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1460,'Col 70 Sector FZ-M b37-0','Unknown','Col 70 Sector',124.125,-314.34375,-797.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1465,'Col 70 Sector GB-L c9-6','Unknown','Col 70 Sector',804.625,-337.46875,-1213.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1470,'Col 70 Sector GB-M b37-0','Unknown','Col 70 Sector',460.71875,-423.5625,-803.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1475,'Col 70 Sector GC-A b31-0','Unknown','Col 70 Sector',336.25,-240.8125,-941.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1480,'Col 70 Sector GC-I b40-0','Unknown','Col 70 Sector',500.15625,-279.125,-739.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1485,'Col 70 Sector GD-I d10-20','Unknown','Col 70 Sector',307.1875,-232.4375,-736.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1490,'Col 70 Sector GD-I d10-31','Unknown','Col 70 Sector',332.75,-231.9375,-708,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1495,'Col 70 Sector GD-Y c15-0','Unknown','Col 70 Sector',458.34375,-461.5625,-939.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1500,'Col 70 Sector GE-D b43-0','Unknown','Col 70 Sector',336,-242.84375,-682.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1505,'Col 70 Sector GE-E b42-0','Unknown','Col 70 Sector',256.25,-320.78125,-702.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1510,'Col 70 Sector GE-I b39-0','Unknown','Col 70 Sector',738.53125,-463.875,-759.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1515,'Col 70 Sector GF-Y b30-0','Unknown','Col 70 Sector',459.96875,-442.78125,-941.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1520,'Col 70 Sector GG-E c12-6','Unknown','Col 70 Sector',721.34375,-626.28125,-1090.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1525,'Col 70 Sector GG-E c12-8','Unknown','Col 70 Sector',697.0625,-625.4375,-1081.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1530,'Col 70 Sector GG-W b31-0','Unknown','Col 70 Sector',338.5625,-461.78125,-919.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1535,'Col 70 Sector GG-X d1-4','Unknown','Col 70 Sector',452.40625,-576.28125,-1456.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1540,'Col 70 Sector GG-X e1-3','Unknown','Col 70 Sector',921.71875,-318.78125,-1313.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1545,'Col 70 Sector GJ-E b42-0','Unknown','Col 70 Sector',314.6875,-297.4375,-699.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1550,'Col 70 Sector GK-Y c1-0','Unknown','Col 70 Sector',697.25,-501.3125,-1540.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1555,'Col 70 Sector GN-G b41-0','Unknown','Col 70 Sector',458.375,-260.6875,-715.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1560,'Col 70 Sector GN-J d9-3','Unknown','Col 70 Sector',265.96875,-370.5,-764.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1565,'Col 70 Sector GO-E b42-1','Unknown','Col 70 Sector',350.90625,-266.625,-703.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1570,'Col 70 Sector GQ-H b13-0','Unknown','Col 70 Sector',817.03125,-242.4375,-1314.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1575,'Col 70 Sector GS-K d8-5','Unknown','Col 70 Sector',173.53125,-594.75,-862.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1580,'Col 70 Sector GS-Y b18-1','Unknown','Col 70 Sector',179.375,-60.5,-1195.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1585,'Col 70 Sector GT-M b38-1','Unknown','Col 70 Sector',380.15625,-156.1875,-773.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1590,'Col 70 Sector GV-L b25-1','Unknown','Col 70 Sector',537.3125,-111.0625,-1056.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1595,'Col 70 Sector GV-X d1-3','Unknown','Col 70 Sector',909.71875,-314.28125,-1395.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1600,'Col 70 Sector GW-M d7-9','Unknown','Col 70 Sector',776.4375,-476.25,-977.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1605,'Col 70 Sector GX-O b24-1','Unknown','Col 70 Sector',382.03125,21.5,-1070.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1610,'Col 70 Sector GY-W b45-0','Unknown','Col 70 Sector',421.34375,-325.03125,-617.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1615,'Col 70 Sector GZ-P b35-0','Unknown','Col 70 Sector',697.34375,-379.53125,-839.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1620,'Col 70 Sector GZ-V c16-0','Unknown','Col 70 Sector',162.78125,-521.75,-897.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1625,'Col 70 Sector HA-H b26-0','Unknown','Col 70 Sector',360.9375,-442.34375,-1040.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1630,'Col 70 Sector HD-I d10-14','Unknown','Col 70 Sector',346.09375,-254.875,-694.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1635,'Col 70 Sector HD-I d10-4','Unknown','Col 70 Sector',340.4375,-234,-665.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1640,'Col 70 Sector HD-I d10-5','Unknown','Col 70 Sector',359.375,-242.8125,-720.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1645,'Col 70 Sector HD-R d5-7','Unknown','Col 70 Sector',67.8125,-117.875,-1102.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1650,'Col 70 Sector HE-Q b35-0','Unknown','Col 70 Sector',756.65625,-362.59375,-844.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1655,'Col 70 Sector HG-E c12-8','Unknown','Col 70 Sector',739.78125,-625.15625,-1082.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1660,'Col 70 Sector HG-N c7-4','Unknown','Col 70 Sector',576.5625,-587.65625,-1303.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1665,'Col 70 Sector HG-X d1-6','Unknown','Col 70 Sector',558.71875,-581.15625,-1401.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1670,'Col 70 Sector HJ-Q b22-0','Unknown','Col 70 Sector',651.15625,-196.625,-1117.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1675,'Col 70 Sector HL-D b29-0','Unknown','Col 70 Sector',478.40625,-245.8125,-983.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1680,'Col 70 Sector HL-M c8-4','Unknown','Col 70 Sector',821.4375,-424.21875,-1254.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1685,'Col 70 Sector HL-W c2-0','Unknown','Col 70 Sector',497.625,-539.375,-1503.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1690,'Col 70 Sector HM-B c14-0','Unknown','Col 70 Sector',757.53125,-487.21875,-993.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1695,'Col 70 Sector HN-R d5-18','Unknown','Col 70 Sector',340.28125,48.71875,-1072.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1700,'Col 70 Sector HO-O b36-0','Unknown','Col 70 Sector',199.21875,-334.3125,-805.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1705,'Col 70 Sector HO-U c18-10','Unknown','Col 70 Sector',754.71875,-99.0625,-823.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1710,'Col 70 Sector HP-K c10-1','Unknown','Col 70 Sector',207.125,-49.71875,-1147.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1715,'Col 70 Sector HP-Q c5-4','Unknown','Col 70 Sector',820.8125,-626.625,-1360.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1720,'Col 70 Sector HQ-W b31-0','Unknown','Col 70 Sector',450.90625,-419.875,-906.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1725,'Col 70 Sector HQ-Z b3-0','Unknown','Col 70 Sector',684.8125,-191.875,-1520.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1730,'Col 70 Sector HS-R b34-0','Unknown','Col 70 Sector',276.65625,-384.4375,-863,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1735,'Col 70 Sector HT-E b42-1','Unknown','Col 70 Sector',409.3125,-250.5625,-690.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1740,'Col 70 Sector HU-M b25-2','Unknown','Col 70 Sector',765.65625,-24.03125,-1050.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1745,'Col 70 Sector HV-W c2-0','Unknown','Col 70 Sector',669.9375,-432.34375,-1494.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1750,'Col 70 Sector HW-L b37-0','Unknown','Col 70 Sector',447.15625,-427.03125,-786.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1755,'Col 70 Sector HW-M b36-0','Unknown','Col 70 Sector',365.6875,-516.34375,-805.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1760,'Col 70 Sector HX-N b35-0','Unknown','Col 70 Sector',797.8125,-600.1875,-842.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1765,'Col 70 Sector HY-D c14-8','Unknown','Col 70 Sector',760.15625,28.125,-988.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1770,'Col 70 Sector HY-H d10-2','Unknown','Col 70 Sector',239.125,-312.125,-695.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1775,'Col 70 Sector HY-H d10-23','Unknown','Col 70 Sector',221.375,-269.3125,-708.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1780,'Col 70 Sector HY-S b33-0','Unknown','Col 70 Sector',760.03125,-442.46875,-884.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1785,'Col 70 Sector HY-W b32-0','Unknown','Col 70 Sector',285.4375,-197.8125,-899.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1790,'Col 70 Sector HZ-C b30-1','Unknown','Col 70 Sector',171.65625,-110.09375,-955.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1795,'Col 70 Sector HZ-P b35-0','Unknown','Col 70 Sector',720.59375,-379.1875,-844.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1800,'Col 70 Sector IC-P b24-0','Unknown','Col 70 Sector',455.90625,36.75,-1076.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1805,'Col 70 Sector ID-I d10-36','Unknown','Col 70 Sector',440.0625,-238.4375,-693.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1810,'Col 70 Sector ID-M a71-0','Unknown','Col 70 Sector',290.46875,-38.21875,-836.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1815,'Col 70 Sector ID-R d5-24','Unknown','Col 70 Sector',95.78125,-162.8125,-1066.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1820,'Col 70 Sector IE-E b42-0','Unknown','Col 70 Sector',295.78125,-322.625,-699.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1825,'Col 70 Sector IF-H b26-0','Unknown','Col 70 Sector',416.34375,-406.5625,-1025.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1830,'Col 70 Sector IF-I b41-0','Unknown','Col 70 Sector',336.03125,-84.125,-721.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1835,'Col 70 Sector IG-E c12-10','Unknown','Col 70 Sector',783.375,-626.4375,-1092.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1840,'Col 70 Sector IG-M c8-7','Unknown','Col 70 Sector',802.09375,-434.125,-1255.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1845,'Col 70 Sector II-I d10-8','Unknown','Col 70 Sector',575.84375,-137.25,-723.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1850,'Col 70 Sector IJ-G b27-0','Unknown','Col 70 Sector',18.09375,-321.21875,-1023.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1855,'Col 70 Sector IJ-V b33-0','Unknown','Col 70 Sector',265.09375,-178.84375,-874.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1860,'Col 70 Sector IJ-W b45-0','Unknown','Col 70 Sector',343.15625,-388.0625,-616.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1865,'Col 70 Sector IL-N c7-5','Unknown','Col 70 Sector',699.75,-552.5,-1297.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1870,'Col 70 Sector IM-K b38-0','Unknown','Col 70 Sector',461.6875,-390.53125,-769.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1875,'Col 70 Sector IM-Z b18-1','Unknown','Col 70 Sector',383.90625,17.75,-1195.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1880,'Col 70 Sector IN-J d9-13','Unknown','Col 70 Sector',468.15625,-355.4375,-801.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1885,'Col 70 Sector IN-J d9-17','Unknown','Col 70 Sector',456.0625,-362.875,-780.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1890,'Col 70 Sector IN-J d9-18','Unknown','Col 70 Sector',474.59375,-397.3125,-747.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1895,'Col 70 Sector IN-J d9-6','Unknown','Col 70 Sector',440.84375,-421.78125,-803.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1900,'Col 70 Sector IN-J d9-7','Unknown','Col 70 Sector',460.96875,-385.4375,-806.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1905,'Col 70 Sector IN-J d9-8','Unknown','Col 70 Sector',458.5,-387.625,-798.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1910,'Col 70 Sector IO-E b42-0','Unknown','Col 70 Sector',391.59375,-281.28125,-690.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1915,'Col 70 Sector IO-U c18-3','Unknown','Col 70 Sector',780.25,-98.375,-812.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1920,'Col 70 Sector IO-U c18-8','Unknown','Col 70 Sector',787.96875,-93.5,-805.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1925,'Col 70 Sector IP-B b44-1','Unknown','Col 70 Sector',339.78125,-216.5625,-662.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1930,'Col 70 Sector IP-B c15-6','Unknown','Col 70 Sector',411.53125,-68.0625,-971.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1935,'Col 70 Sector IS-J d9-18','Unknown','Col 70 Sector',604.71875,-341.28125,-745.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1940,'Col 70 Sector IS-R b21-0','Unknown','Col 70 Sector',142.1875,-236.3125,-1125.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1945,'Col 70 Sector IT-C b31-0','Unknown','Col 70 Sector',415.53125,40.25,-942.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1950,'Col 70 Sector IT-M c9-2','Unknown','Col 70 Sector',539.28125,45.8125,-1213.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1955,'Col 70 Sector IV-Z b16-0','Unknown','Col 70 Sector',898.71875,-320.21875,-1242.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1960,'Col 70 Sector IW-L b37-0','Unknown','Col 70 Sector',458.78125,-441.125,-793.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1965,'Col 70 Sector IX-J d9-15','Unknown','Col 70 Sector',771.78125,-254.75,-783.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1970,'Col 70 Sector IX-J d9-30','Unknown','Col 70 Sector',744.25,-248.3125,-798.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1975,'Col 70 Sector IX-J d9-31','Unknown','Col 70 Sector',744.75,-242.15625,-807.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1980,'Col 70 Sector IY-H d10-12','Unknown','Col 70 Sector',268.59375,-294.8125,-728.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1985,'Col 70 Sector IY-H d10-14','Unknown','Col 70 Sector',296.25,-285.59375,-700.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1990,'Col 70 Sector IY-H d10-16','Unknown','Col 70 Sector',291.9375,-325.53125,-685.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(1995,'Col 70 Sector IY-H d10-17','Unknown','Col 70 Sector',293.53125,-341.5625,-677.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2000,'Col 70 Sector IY-H d10-21','Unknown','Col 70 Sector',265.71875,-309.21875,-668.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2005,'Col 70 Sector IY-H d10-24','Unknown','Col 70 Sector',318.5625,-296,-723.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2010,'Col 70 Sector IY-X c15-0','Unknown','Col 70 Sector',458.375,-482.1875,-931.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2015,'Col 70 Sector IZ-D c13-2','Unknown','Col 70 Sector',248.78125,-337.1875,-1052.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2020,'Col 70 Sector IZ-M b37-0','Unknown','Col 70 Sector',178.375,-323.5,-802.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2025,'Col 70 Sector JB-D b29-0','Unknown','Col 70 Sector',437.625,-303.8125,-982.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2030,'Col 70 Sector JB-W d2-2','Unknown','Col 70 Sector',871.625,-328.6875,-1378.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2035,'Col 70 Sector JC-T d4-26','Unknown','Col 70 Sector',696.25,-88.375,-1186.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2040,'Col 70 Sector JE-V c17-0','Unknown','Col 70 Sector',534.46875,-315.90625,-843.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2045,'Col 70 Sector JF-O b36-0','Unknown','Col 70 Sector',677.875,-382.09375,-823.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2050,'Col 70 Sector JG-E c12-9','Unknown','Col 70 Sector',816.4375,-626.625,-1099.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2055,'Col 70 Sector JG-M c8-4','Unknown','Col 70 Sector',819.0625,-428.125,-1229.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2060,'Col 70 Sector JG-N c7-7','Unknown','Col 70 Sector',662.3125,-617.09375,-1302.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2065,'Col 70 Sector JG-X d1-9','Unknown','Col 70 Sector',657.78125,-560.125,-1428.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2070,'Col 70 Sector JH-I b14-0','Unknown','Col 70 Sector',277.71875,17.4375,-1300.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2075,'Col 70 Sector JI-K b12-0','Unknown','Col 70 Sector',636.03125,-143.34375,-1340.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2080,'Col 70 Sector JJ-G b27-0','Unknown','Col 70 Sector',37,-322.5625,-1020.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2085,'Col 70 Sector JK-B b31-0','Unknown','Col 70 Sector',164.8125,-93.25,-937.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2090,'Col 70 Sector JK-B b44-0','Unknown','Col 70 Sector',329.90625,-226.875,-647.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2095,'Col 70 Sector JK-C b43-0','Unknown','Col 70 Sector',247.78125,-316.375,-668.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2100,'Col 70 Sector JM-A b31-0','Unknown','Col 70 Sector',479.40625,-201.875,-940.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2105,'Col 70 Sector JM-K b38-0','Unknown','Col 70 Sector',478.71875,-400.8125,-781.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2110,'Col 70 Sector JN-H b27-0','Unknown','Col 70 Sector',286.78125,-196.71875,-1018.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2115,'Col 70 Sector JP-C b43-0','Unknown','Col 70 Sector',275.59375,-303.375,-679.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2120,'Col 70 Sector JQ-R c19-2','Unknown','Col 70 Sector',179.5625,-330.65625,-771.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2125,'Col 70 Sector JR-B b30-0','Unknown','Col 70 Sector',436.1875,-264.75,-961.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2130,'Col 70 Sector JT-D c14-9','Unknown','Col 70 Sector',760.21875,8.5625,-1015.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2135,'Col 70 Sector JT-E b42-0','Unknown','Col 70 Sector',443.9375,-252.5625,-700.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2140,'Col 70 Sector JT-F c12-7','Unknown','Col 70 Sector',425.3125,-340.09375,-1067.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2145,'Col 70 Sector JT-H d10-7','Unknown','Col 70 Sector',221.96875,-359.8125,-681.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2150,'Col 70 Sector JT-P d6-6','Unknown','Col 70 Sector',215.34375,-24.75,-1029.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2155,'Col 70 Sector JV-R c19-1','Unknown','Col 70 Sector',276.375,-269.1875,-746.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2160,'Col 70 Sector JW-L b37-0','Unknown','Col 70 Sector',479.75,-439.28125,-799.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2165,'Col 70 Sector JX-A b30-0','Unknown','Col 70 Sector',281.34375,-343.5625,-950.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2170,'Col 70 Sector JY-H d10-10','Unknown','Col 70 Sector',396.28125,-291.28125,-707.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2175,'Col 70 Sector JY-H d10-9','Unknown','Col 70 Sector',391.90625,-297.53125,-716.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2180,'Col 70 Sector JZ-V b32-0','Unknown','Col 70 Sector',116.65625,-299.25,-902.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2185,'Col 70 Sector KD-I d10-25','Unknown','Col 70 Sector',581.75,-201.78125,-711.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2190,'Col 70 Sector KD-J d9-10','Unknown','Col 70 Sector',261.46875,-564.125,-757.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2195,'Col 70 Sector KD-J d9-3','Unknown','Col 70 Sector',320.0625,-578.15625,-763.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2200,'Col 70 Sector KD-R d5-21','Unknown','Col 70 Sector',294.40625,-122.40625,-1120.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2205,'Col 70 Sector KD-X b45-1','Unknown','Col 70 Sector',553.125,-306.65625,-618.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2210,'Col 70 Sector KE-R b34-0','Unknown','Col 70 Sector',754.75,-430.40625,-856.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2215,'Col 70 Sector KE-T a67-0','Unknown','Col 70 Sector',207.6875,-44.78125,-883.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2220,'Col 70 Sector KE-W b45-0','Unknown','Col 70 Sector',345.375,-408.1875,-617.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2225,'Col 70 Sector KF-L b38-0','Unknown','Col 70 Sector',149.0625,-310.4375,-782.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2230,'Col 70 Sector KF-U c17-0','Unknown','Col 70 Sector',138.625,-541,-862.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2235,'Col 70 Sector KI-J d9-1','Unknown','Col 70 Sector',417.75,-444.6875,-801.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2240,'Col 70 Sector KI-K b12-0','Unknown','Col 70 Sector',658.09375,-142.90625,-1339.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2245,'Col 70 Sector KJ-G d11-9','Unknown','Col 70 Sector',327.8125,-204.0625,-647.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2250,'Col 70 Sector KK-L b38-0','Unknown','Col 70 Sector',179.28125,-301.1875,-781.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2255,'Col 70 Sector KL-R c19-3','Unknown','Col 70 Sector',169.34375,-362.53125,-765.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2260,'Col 70 Sector KL-W b31-0','Unknown','Col 70 Sector',460.46875,-431.59375,-920.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2265,'Col 70 Sector KM-C b29-0','Unknown','Col 70 Sector',339.96875,-361.25,-981.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2270,'Col 70 Sector KM-L c8-2','Unknown','Col 70 Sector',539.4375,-601.8125,-1246.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2275,'Col 70 Sector KM-U d3-17','Unknown','Col 70 Sector',762.6875,-253.8125,-1290.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2280,'Col 70 Sector KM-U d3-18','Unknown','Col 70 Sector',744.0625,-260.15625,-1274.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2285,'Col 70 Sector KN-R b21-0','Unknown','Col 70 Sector',154.75,-252.46875,-1143.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2290,'Col 70 Sector KO-P d6-17','Unknown','Col 70 Sector',152.9375,-37.90625,-1063.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2295,'Col 70 Sector KQ-J b27-1','Unknown','Col 70 Sector',754.875,22.9375,-1008.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2300,'Col 70 Sector KT-E b42-1','Unknown','Col 70 Sector',455.84375,-259.21875,-702.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2305,'Col 70 Sector KT-N b24-1','Unknown','Col 70 Sector',221.90625,-88.40625,-1068.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2310,'Col 70 Sector KT-O b36-0','Unknown','Col 70 Sector',297.1875,-320.375,-820.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2315,'Col 70 Sector KT-V b46-0','Unknown','Col 70 Sector',540.9375,-284.5,-604.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2320,'Col 70 Sector KU-D b42-0','Unknown','Col 70 Sector',255.8125,-362,-695.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2325,'Col 70 Sector KV-L b38-0','Unknown','Col 70 Sector',778.0625,-259.4375,-784.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2330,'Col 70 Sector KX-I b39-0','Unknown','Col 70 Sector',458.125,-381.875,-762.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2335,'Col 70 Sector KY-Q d5-11','Unknown','Col 70 Sector',153.09375,-221.90625,-1066.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2340,'Col 70 Sector KY-W b19-0','Unknown','Col 70 Sector',189.5,-49.75,-1180.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2345,'Col 70 Sector KZ-U b46-0','Unknown','Col 70 Sector',378.5625,-361.15625,-604.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2350,'Col 70 Sector KZ-V b32-0','Unknown','Col 70 Sector',137.21875,-304.90625,-899.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2355,'Col 70 Sector LA-L b26-2','Unknown','Col 70 Sector',769.875,-17.5625,-1033.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2360,'Col 70 Sector LC-K b38-0','Unknown','Col 70 Sector',436.8125,-443.15625,-781.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2365,'Col 70 Sector LD-M b36-0','Unknown','Col 70 Sector',797.875,-603.59375,-820.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2370,'Col 70 Sector LE-D b43-1','Unknown','Col 70 Sector',440.65625,-230.03125,-679.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2375,'Col 70 Sector LE-V b33-0','Unknown','Col 70 Sector',280.34375,-187.25,-884.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2380,'Col 70 Sector LG-Q c20-0','Unknown','Col 70 Sector',256.1875,-262.375,-741.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2385,'Col 70 Sector LG-Q c20-1','Unknown','Col 70 Sector',284.25,-244.15625,-728.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2390,'Col 70 Sector LH-K b38-0','Unknown','Col 70 Sector',489.375,-405.46875,-775.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2395,'Col 70 Sector LI-Z b30-0','Unknown','Col 70 Sector',280.625,-324.3125,-941.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2400,'Col 70 Sector LJ-G d11-0','Unknown','Col 70 Sector',335.5,-252.53125,-650.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2405,'Col 70 Sector LJ-G d11-17','Unknown','Col 70 Sector',397.78125,-228.875,-652.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2410,'Col 70 Sector LJ-G d11-24','Unknown','Col 70 Sector',343.6875,-242.625,-658.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2415,'Col 70 Sector LJ-G d11-40','Unknown','Col 70 Sector',378.03125,-209.46875,-650.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2420,'Col 70 Sector LJ-W c16-1','Unknown','Col 70 Sector',497.59375,-462.6875,-899.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2425,'Col 70 Sector LK-C b43-0','Unknown','Col 70 Sector',277.65625,-319.5,-685,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2430,'Col 70 Sector LL-R c19-0','Unknown','Col 70 Sector',194.71875,-375.15625,-770.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2435,'Col 70 Sector LO-P d6-1','Unknown','Col 70 Sector',207.25,-82.46875,-1050.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2440,'Col 70 Sector LP-B b44-0','Unknown','Col 70 Sector',399.3125,-223.84375,-663.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2445,'Col 70 Sector LR-M b36-0','Unknown','Col 70 Sector',411.84375,-544.5,-811.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2450,'Col 70 Sector LR-S c5-1','Unknown','Col 70 Sector',834.96875,-212.65625,-1356.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2455,'Col 70 Sector LS-W a65-0','Unknown','Col 70 Sector',302.6875,-43.6875,-895.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2460,'Col 70 Sector LT-O b36-0','Unknown','Col 70 Sector',319.6875,-319.3125,-824.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2465,'Col 70 Sector LU-K b39-1','Unknown','Col 70 Sector',357.03125,-180.25,-748.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2470,'Col 70 Sector LU-S c19-5','Unknown','Col 70 Sector',760,-96.8125,-768.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2475,'Col 70 Sector LV-J c10-1','Unknown','Col 70 Sector',28.15625,-202.96875,-1147.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2480,'Col 70 Sector LV-O c6-2','Unknown','Col 70 Sector',818.28125,-626.34375,-1308.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2485,'Col 70 Sector LV-O c6-6','Unknown','Col 70 Sector',822.8125,-626.625,-1333.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2490,'Col 70 Sector LV-R c19-1','Unknown','Col 70 Sector',338.15625,-303.53125,-747.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2495,'Col 70 Sector LV-Z b44-1','Unknown','Col 70 Sector',325.46875,-223.5625,-635.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2500,'Col 70 Sector LW-U b32-0','Unknown','Col 70 Sector',438.34375,-419.625,-902.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2505,'Col 70 Sector LW-V d2-4','Unknown','Col 70 Sector',831.25,-394.46875,-1316.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2510,'Col 70 Sector LW-V d2-5','Unknown','Col 70 Sector',873.15625,-380.71875,-1360.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2515,'Col 70 Sector LW-V d2-7','Unknown','Col 70 Sector',854.09375,-389.53125,-1316.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2520,'Col 70 Sector LW-X b4-0','Unknown','Col 70 Sector',680.03125,-200.6875,-1500.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2525,'Col 70 Sector LW-Z b18-0','Unknown','Col 70 Sector',515.9375,60.625,-1200.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2530,'Col 70 Sector LX-K d8-10','Unknown','Col 70 Sector',733.84375,-558.78125,-858.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2535,'Col 70 Sector LX-K d8-2','Unknown','Col 70 Sector',703.09375,-542.125,-884.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2540,'Col 70 Sector LX-K d8-3','Unknown','Col 70 Sector',687.34375,-546.5,-898.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2545,'Col 70 Sector LX-K d8-9','Unknown','Col 70 Sector',721.28125,-552.875,-865.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2550,'Col 70 Sector LX-S d4-15','Unknown','Col 70 Sector',731.90625,-174.15625,-1189.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2555,'Col 70 Sector LX-S d4-9','Unknown','Col 70 Sector',691.5625,-151.875,-1187.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2560,'Col 70 Sector LY-P b22-0','Unknown','Col 70 Sector',116.84375,-229.4375,-1118.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2565,'Col 70 Sector LY-Q d5-12','Unknown','Col 70 Sector',180.71875,-225.25,-1072.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2570,'Col 70 Sector LZ-A b32-1','Unknown','Col 70 Sector',400.46875,42.65625,-914.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2575,'Col 70 Sector LZ-D c13-0','Unknown','Col 70 Sector',335.40625,-342.3125,-1062.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2580,'Col 70 Sector LZ-V b32-0','Unknown','Col 70 Sector',155.0625,-293.03125,-894.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2585,'Col 70 Sector MA-B c15-0','Unknown','Col 70 Sector',304.1875,-216.84375,-953.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2590,'Col 70 Sector MA-K c10-0','Unknown','Col 70 Sector',139.90625,-181.21875,-1183.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2595,'Col 70 Sector MA-U c17-0','Unknown','Col 70 Sector',159.375,-573.1875,-850.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2600,'Col 70 Sector MA-U c17-1','Unknown','Col 70 Sector',136.125,-559.5625,-851.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2605,'Col 70 Sector MC-L b37-0','Unknown','Col 70 Sector',375.3125,-522.625,-800.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2610,'Col 70 Sector MD-I d10-25','Unknown','Col 70 Sector',736.8125,-240.28125,-667.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2615,'Col 70 Sector MD-Y b31-0','Unknown','Col 70 Sector',343.0625,-251.40625,-910.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2620,'Col 70 Sector ME-G d11-11','Unknown','Col 70 Sector',329.9375,-307.9375,-615,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2625,'Col 70 Sector ME-G d11-12','Unknown','Col 70 Sector',333.8125,-310.125,-618.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2630,'Col 70 Sector ME-G d11-13','Unknown','Col 70 Sector',326.34375,-324.21875,-624.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2635,'Col 70 Sector ME-G d11-15','Unknown','Col 70 Sector',334.46875,-321.53125,-639.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2640,'Col 70 Sector ME-G d11-16','Unknown','Col 70 Sector',334.03125,-310.96875,-625.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2645,'Col 70 Sector ME-G d11-17','Unknown','Col 70 Sector',323.75,-315.03125,-641.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2650,'Col 70 Sector ME-G d11-26','Unknown','Col 70 Sector',321.9375,-311.65625,-632.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2655,'Col 70 Sector ME-G d11-5','Unknown','Col 70 Sector',321.6875,-337.78125,-653.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2660,'Col 70 Sector ME-W c16-0','Unknown','Col 70 Sector',460.96875,-502.1875,-904.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2665,'Col 70 Sector MF-C b43-0','Unknown','Col 70 Sector',273.0625,-335.1875,-672.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2670,'Col 70 Sector MF-C c14-0','Unknown','Col 70 Sector',231.4375,-331.21875,-1018.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2675,'Col 70 Sector MG-F b27-0','Unknown','Col 70 Sector',377.90625,-439.5,-1019.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2680,'Col 70 Sector MG-Q c20-0','Unknown','Col 70 Sector',299.1875,-264.3125,-741.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2685,'Col 70 Sector MJ-G d11-37','Unknown','Col 70 Sector',433.1875,-200.21875,-628.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2690,'Col 70 Sector MJ-G d11-8','Unknown','Col 70 Sector',436.03125,-213.84375,-641.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2695,'Col 70 Sector MJ-G d11-9','Unknown','Col 70 Sector',441.21875,-215.40625,-656.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2700,'Col 70 Sector MJ-K a72-1','Unknown','Col 70 Sector',290.90625,-38.53125,-834.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2705,'Col 70 Sector MK-E a48-0','Unknown','Col 70 Sector',307.84375,-34.90625,-1092.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2710,'Col 70 Sector MK-Z b32-1','Unknown','Col 70 Sector',390.6875,55.0625,-886.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2715,'Col 70 Sector MM-L c8-4','Unknown','Col 70 Sector',650.1875,-596.8125,-1255.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2720,'Col 70 Sector MM-U c3-7','Unknown','Col 70 Sector',480,-568.90625,-1430.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2725,'Col 70 Sector MN-O a56-1','Unknown','Col 70 Sector',214.8125,-33.1875,-999.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2730,'Col 70 Sector MP-D b42-0','Unknown','Col 70 Sector',267.09375,-374.78125,-700.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2735,'Col 70 Sector MP-J b40-0','Unknown','Col 70 Sector',420.28125,-108.9375,-738,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2740,'Col 70 Sector MP-P b35-0','Unknown','Col 70 Sector',740.125,-420.34375,-841.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2745,'Col 70 Sector MR-K c9-1','Unknown','Col 70 Sector',880.875,-413.90625,-1196.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2750,'Col 70 Sector MS-A b30-0','Unknown','Col 70 Sector',296.15625,-364.5,-957.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2755,'Col 70 Sector MS-C a49-1','Unknown','Col 70 Sector',785.78125,-34.375,-1084.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2760,'Col 70 Sector MT-D a62-1','Unknown','Col 70 Sector',209.25,-38.6875,-942.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2765,'Col 70 Sector MT-D b43-2','Unknown','Col 70 Sector',575.5625,-184.75,-681.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2770,'Col 70 Sector MT-P d6-17','Unknown','Col 70 Sector',465.375,-3.59375,-1010.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2775,'Col 70 Sector MT-P d6-21','Unknown','Col 70 Sector',477.46875,-2.65625,-1003.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2780,'Col 70 Sector MT-P d6-36','Unknown','Col 70 Sector',436.4375,40.4375,-994.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2785,'Col 70 Sector MU-C b43-0','Unknown','Col 70 Sector',380.40625,-270.75,-667.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2790,'Col 70 Sector MU-M b37-0','Unknown','Col 70 Sector',220.90625,-345,-800.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2795,'Col 70 Sector MU-S c19-0','Unknown','Col 70 Sector',779.9375,-98.0625,-765.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2800,'Col 70 Sector MU-U c17-0','Unknown','Col 70 Sector',455.5625,-422.46875,-862.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2805,'Col 70 Sector MU-U c17-2','Unknown','Col 70 Sector',464.25,-419.375,-860.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2810,'Col 70 Sector MV-A b44-0','Unknown','Col 70 Sector',267,-301.40625,-655.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2815,'Col 70 Sector MV-Z b31-0','Unknown','Col 70 Sector',180.3125,-80.28125,-919.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2820,'Col 70 Sector MW-V d2-7','Unknown','Col 70 Sector',898.96875,-374.3125,-1356.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2825,'Col 70 Sector MX-K d8-2','Unknown','Col 70 Sector',753.3125,-578.15625,-862.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2830,'Col 70 Sector MZ-V b32-0','Unknown','Col 70 Sector',188.96875,-299.21875,-904.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2835,'Col 70 Sector NA-C b43-0','Unknown','Col 70 Sector',238.96875,-364.15625,-679.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2840,'Col 70 Sector NB-H b41-0','Unknown','Col 70 Sector',201.3125,-202.5625,-719,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2845,'Col 70 Sector NB-Y b17-0','Unknown','Col 70 Sector',931.1875,-305.75,-1212.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2850,'Col 70 Sector ND-X a51-0','Unknown','Col 70 Sector',143.34375,-36.5625,-1047.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2855,'Col 70 Sector NE-G d11-10','Unknown','Col 70 Sector',351.8125,-324.0625,-650.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2860,'Col 70 Sector NE-G d11-11','Unknown','Col 70 Sector',372.65625,-325.90625,-612.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2865,'Col 70 Sector NE-G d11-13','Unknown','Col 70 Sector',352.28125,-325.15625,-618.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2870,'Col 70 Sector NE-G d11-14','Unknown','Col 70 Sector',357.6875,-332.90625,-626.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2875,'Col 70 Sector NE-G d11-26','Unknown','Col 70 Sector',369.75,-317.5625,-647.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2880,'Col 70 Sector NE-G d11-27','Unknown','Col 70 Sector',359.65625,-323.90625,-648.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2885,'Col 70 Sector NE-G d11-28','Unknown','Col 70 Sector',358.0625,-278.125,-616.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2890,'Col 70 Sector NE-G d11-3','Unknown','Col 70 Sector',369.59375,-321.03125,-603.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2895,'Col 70 Sector NF-C c14-2','Unknown','Col 70 Sector',258.4375,-307.25,-993.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2900,'Col 70 Sector NF-L b38-0','Unknown','Col 70 Sector',195.1875,-322.125,-779.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2905,'Col 70 Sector NF-T c18-1','Unknown','Col 70 Sector',417.59375,-376.15625,-816.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2910,'Col 70 Sector NF-U b33-0','Unknown','Col 70 Sector',118.46875,-300.0625,-882.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2915,'Col 70 Sector NG-L a44-0','Unknown','Col 70 Sector',199.34375,-38.4375,-1132.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2920,'Col 70 Sector NG-W b31-0','Unknown','Col 70 Sector',492.03125,-463.03125,-908,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2925,'Col 70 Sector NH-T b33-0','Unknown','Col 70 Sector',435.21875,-400.375,-879.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2930,'Col 70 Sector NI-H b40-0','Unknown','Col 70 Sector',490.53125,-350.28125,-725.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2935,'Col 70 Sector NJ-H d10-6','Unknown','Col 70 Sector',252.0625,-569.625,-725.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2940,'Col 70 Sector NJ-O b36-0','Unknown','Col 70 Sector',278,-364.25,-820.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2945,'Col 70 Sector NL-J b27-2','Unknown','Col 70 Sector',761.4375,-2.65625,-1024.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2950,'Col 70 Sector NL-R c19-0','Unknown','Col 70 Sector',258.03125,-382.34375,-783.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2955,'Col 70 Sector NM-C b29-0','Unknown','Col 70 Sector',395.15625,-362.375,-972.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2960,'Col 70 Sector NM-V d2-0','Unknown','Col 70 Sector',708.5625,-564,-1381,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2965,'Col 70 Sector NM-V d2-1','Unknown','Col 70 Sector',691.78125,-564.21875,-1382.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2970,'Col 70 Sector NM-V d2-4','Unknown','Col 70 Sector',668.375,-579.21875,-1337.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2975,'Col 70 Sector NM-V d2-6','Unknown','Col 70 Sector',691.71875,-559.28125,-1327.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2980,'Col 70 Sector NP-B b44-0','Unknown','Col 70 Sector',440.4375,-223.40625,-661.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2985,'Col 70 Sector NP-C b43-0','Unknown','Col 70 Sector',373.1875,-287.375,-668.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2990,'Col 70 Sector NP-U c17-2','Unknown','Col 70 Sector',447.1875,-446.5,-859.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(2995,'Col 70 Sector NQ-Z b44-1','Unknown','Col 70 Sector',330.375,-231.0625,-630.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3000,'Col 70 Sector NS-A b30-0','Unknown','Col 70 Sector',316.625,-360.625,-964.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3005,'Col 70 Sector NT-H d10-11','Unknown','Col 70 Sector',499.75,-359.9375,-732.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3010,'Col 70 Sector NT-P d6-21','Unknown','Col 70 Sector',497.40625,25.4375,-1030.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3015,'Col 70 Sector NU-C c14-4','Unknown','Col 70 Sector',508.1875,-210.0625,-1019.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3020,'Col 70 Sector NV-I b12-0','Unknown','Col 70 Sector',915.6875,-302.03125,-1344.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3025,'Col 70 Sector NW-D b28-0','Unknown','Col 70 Sector',397.15625,-401.125,-999.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3030,'Col 70 Sector NY-I d9-1','Unknown','Col 70 Sector',354.71875,-587.90625,-782.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3035,'Col 70 Sector NZ-U c17-0','Unknown','Col 70 Sector',611.3125,-358.65625,-833.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3040,'Col 70 Sector OA-B b44-0','Unknown','Col 70 Sector',337.46875,-278.15625,-651.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3045,'Col 70 Sector OA-J b40-0','Unknown','Col 70 Sector',346.8125,-179.3125,-730.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3050,'Col 70 Sector OA-K b26-0','Unknown','Col 70 Sector',109.90625,-105.9375,-1033.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3055,'Col 70 Sector OB-P b9-0','Unknown','Col 70 Sector',856.34375,-199.875,-1401.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3060,'Col 70 Sector OB-P c21-10','Unknown','Col 70 Sector',471.03125,-143.84375,-698.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3065,'Col 70 Sector OB-Q c20-1','Unknown','Col 70 Sector',331.25,-284.21875,-708.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3070,'Col 70 Sector OB-Q c20-4','Unknown','Col 70 Sector',325.375,-290.59375,-722.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3075,'Col 70 Sector OB-Y b17-0','Unknown','Col 70 Sector',946.84375,-318.25,-1216.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3080,'Col 70 Sector OC-K b38-0','Unknown','Col 70 Sector',496.5625,-429.59375,-765.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3085,'Col 70 Sector OC-Y b19-0','Unknown','Col 70 Sector',509.375,71.40625,-1171.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3090,'Col 70 Sector OD-R d5-12','Unknown','Col 70 Sector',578.21875,-143.25,-1098.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3095,'Col 70 Sector OE-H b27-0','Unknown','Col 70 Sector',819.25,-242.6875,-1024.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3100,'Col 70 Sector OF-T c18-0','Unknown','Col 70 Sector',460.09375,-381.34375,-821.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3105,'Col 70 Sector OF-T c18-3','Unknown','Col 70 Sector',488.125,-360,-810.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3110,'Col 70 Sector OF-T c18-4','Unknown','Col 70 Sector',491.5,-360.78125,-815.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3115,'Col 70 Sector OG-A c15-0','Unknown','Col 70 Sector',73.0625,-353.28125,-957.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3120,'Col 70 Sector OG-Y b32-1','Unknown','Col 70 Sector',178.53125,-60.3125,-901.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3125,'Col 70 Sector OH-V d2-10','Unknown','Col 70 Sector',598.46875,-610.21875,-1311.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3130,'Col 70 Sector OH-Y a23-0','Unknown','Col 70 Sector',591.71875,-33.90625,-1352.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3135,'Col 70 Sector OI-J d9-15','Unknown','Col 70 Sector',762.5625,-468.4375,-763.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3140,'Col 70 Sector OJ-H d10-10','Unknown','Col 70 Sector',265.34375,-569.03125,-714.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3145,'Col 70 Sector OJ-W b45-0','Unknown','Col 70 Sector',473.03125,-390.125,-622.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3150,'Col 70 Sector ON-I b39-0','Unknown','Col 70 Sector',473.3125,-416.5625,-751.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3155,'Col 70 Sector OP-L b38-0','Unknown','Col 70 Sector',295.40625,-273.3125,-772.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3160,'Col 70 Sector OP-S c19-4','Unknown','Col 70 Sector',781.6875,-108.625,-783.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3165,'Col 70 Sector OP-S c19-5','Unknown','Col 70 Sector',785.28125,-105.9375,-779.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3170,'Col 70 Sector OP-S c19-9','Unknown','Col 70 Sector',789.71875,-113.15625,-765.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3175,'Col 70 Sector OQ-Q c20-1','Unknown','Col 70 Sector',566.78125,-157.46875,-712.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3180,'Col 70 Sector OR-A a50-0','Unknown','Col 70 Sector',227.78125,-43.46875,-1074.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3185,'Col 70 Sector OR-D b28-0','Unknown','Col 70 Sector',377.8125,-419.8125,-999.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3190,'Col 70 Sector OS-I b39-0','Unknown','Col 70 Sector',495.375,-402.0625,-760.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3195,'Col 70 Sector OT-H d10-4','Unknown','Col 70 Sector',651.1875,-347.46875,-734.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3200,'Col 70 Sector OT-Q d5-12','Unknown','Col 70 Sector',262.4375,-275.4375,-1074.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3205,'Col 70 Sector OV-Z b44-0','Unknown','Col 70 Sector',388.46875,-216.40625,-625.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3210,'Col 70 Sector OY-L b36-0','Unknown','Col 70 Sector',820.15625,-619.75,-821.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3215,'Col 70 Sector OZ-F d11-1','Unknown','Col 70 Sector',305,-369.875,-629.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3220,'Col 70 Sector OZ-F d11-11','Unknown','Col 70 Sector',316.5,-345.59375,-630.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3225,'Col 70 Sector OZ-F d11-2','Unknown','Col 70 Sector',293,-367.6875,-639.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3230,'Col 70 Sector OZ-F d11-6','Unknown','Col 70 Sector',289.9375,-367.78125,-639.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3235,'Col 70 Sector OZ-F d11-7','Unknown','Col 70 Sector',270.3125,-376.375,-654.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3240,'Col 70 Sector OZ-M b24-0','Unknown','Col 70 Sector',143.65625,-178.875,-1084.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3245,'Col 70 Sector OZ-M b37-0','Unknown','Col 70 Sector',298.75,-324.78125,-802.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3250,'Col 70 Sector OZ-V b32-0','Unknown','Col 70 Sector',216.5,-293.15625,-899.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3255,'Col 70 Sector OZ-V c16-1','Unknown','Col 70 Sector',459.5625,-518.90625,-889.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3260,'Col 70 Sector PA-K b39-0','Unknown','Col 70 Sector',275.3125,-260.84375,-760.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3265,'Col 70 Sector PA-T c18-0','Unknown','Col 70 Sector',418.5,-423.8125,-823.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3270,'Col 70 Sector PA-T c18-1','Unknown','Col 70 Sector',432.59375,-421.84375,-809.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3275,'Col 70 Sector PA-T c18-2','Unknown','Col 70 Sector',433.1875,-399.5,-799.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3280,'Col 70 Sector PA-T c18-3','Unknown','Col 70 Sector',420.5,-407.5625,-814.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3285,'Col 70 Sector PA-V b20-0','Unknown','Col 70 Sector',679.90625,-81.1875,-1162.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3290,'Col 70 Sector PB-N c7-8','Unknown','Col 70 Sector',819.3125,-625.6875,-1281.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3295,'Col 70 Sector PB-Q c20-2','Unknown','Col 70 Sector',353.6875,-273.125,-718.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3300,'Col 70 Sector PC-J b39-0','Unknown','Col 70 Sector',608.84375,-357.09375,-760.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3305,'Col 70 Sector PC-P b37-2','Unknown','Col 70 Sector',756.5,-97.78125,-797.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3310,'Col 70 Sector PC-T b33-0','Unknown','Col 70 Sector',436.0625,-423.0625,-879.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3315,'Col 70 Sector PC-U d3-6','Unknown','Col 70 Sector',817.34375,-401.5625,-1296.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3320,'Col 70 Sector PC-U d3-7','Unknown','Col 70 Sector',825.71875,-384.625,-1303.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3325,'Col 70 Sector PC-W b5-0','Unknown','Col 70 Sector',678.78125,-200.40625,-1483.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3330,'Col 70 Sector PE-P d6-14','Unknown','Col 70 Sector',208.875,-244.75,-1055.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3335,'Col 70 Sector PE-V b20-0','Unknown','Col 70 Sector',197.03125,-59.03125,-1163.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3340,'Col 70 Sector PF-C c14-1','Unknown','Col 70 Sector',338.25,-340.6875,-1019.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3345,'Col 70 Sector PF-K b39-0','Unknown','Col 70 Sector',316.65625,-241.625,-761.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3350,'Col 70 Sector PG-M b37-0','Unknown','Col 70 Sector',679.78125,-403.375,-786.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3355,'Col 70 Sector PH-B b30-0','Unknown','Col 70 Sector',475.65625,-295.15625,-957.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3360,'Col 70 Sector PH-E b15-0','Unknown','Col 70 Sector',880.625,-224.71875,-1272.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3365,'Col 70 Sector PH-H a60-0','Unknown','Col 70 Sector',315.375,-43.25,-964.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3370,'Col 70 Sector PH-V d2-2','Unknown','Col 70 Sector',668.40625,-621.1875,-1379.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3375,'Col 70 Sector PH-V d2-3','Unknown','Col 70 Sector',658.96875,-638.125,-1377.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3380,'Col 70 Sector PH-V d2-8','Unknown','Col 70 Sector',658.9375,-594.96875,-1359.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3385,'Col 70 Sector PK-N b11-0','Unknown','Col 70 Sector',600.15625,-4.84375,-1361.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3390,'Col 70 Sector PN-Y b44-0','Unknown','Col 70 Sector',645.40625,-352.65625,-637.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3395,'Col 70 Sector PP-E b28-0','Unknown','Col 70 Sector',79.6875,-323.71875,-1004.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3400,'Col 70 Sector PQ-A b44-0','Unknown','Col 70 Sector',277.09375,-322.875,-663.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3405,'Col 70 Sector PQ-H b41-2','Unknown','Col 70 Sector',358.8125,-138.28125,-720.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3410,'Col 70 Sector PQ-Z c15-5','Unknown','Col 70 Sector',428.09375,-131.5,-933.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3415,'Col 70 Sector PR-D b28-0','Unknown','Col 70 Sector',399.5,-424.1875,-1001.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3420,'Col 70 Sector PR-O c21-6','Unknown','Col 70 Sector',350,-215.125,-683.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3425,'Col 70 Sector PR-T c4-1','Unknown','Col 70 Sector',843.0625,-354.28125,-1386.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3430,'Col 70 Sector PS-J c9-6','Unknown','Col 70 Sector',611.8125,-623.15625,-1212.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3435,'Col 70 Sector PS-Q b35-0','Unknown','Col 70 Sector',531.90625,-302.84375,-827.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3440,'Col 70 Sector PU-M b37-0','Unknown','Col 70 Sector',280.375,-342.875,-802.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3445,'Col 70 Sector PU-T c18-3','Unknown','Col 70 Sector',759.59375,-231.0625,-793.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3450,'Col 70 Sector PV-A c15-3','Unknown','Col 70 Sector',345.65625,-246.875,-951.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3455,'Col 70 Sector PV-R c19-0','Unknown','Col 70 Sector',507.28125,-279.03125,-755.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3460,'Col 70 Sector PV-Z b44-1','Unknown','Col 70 Sector',399.09375,-224.90625,-639.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3465,'Col 70 Sector PW-G a74-0','Unknown','Col 70 Sector',495.4375,-42.71875,-812.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3470,'Col 70 Sector PW-V b31-0','Unknown','Col 70 Sector',451.25,-503.53125,-924.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3475,'Col 70 Sector PX-K b37-0','Unknown','Col 70 Sector',399.3125,-540.03125,-802.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3480,'Col 70 Sector PY-Q d5-16','Unknown','Col 70 Sector',507.0625,-247.53125,-1099.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3485,'Col 70 Sector PZ-F d11-19','Unknown','Col 70 Sector',341.21875,-347.53125,-607.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3490,'Col 70 Sector PZ-F d11-9','Unknown','Col 70 Sector',344.25,-410.40625,-613.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3495,'Col 70 Sector PZ-O d6-11','Unknown','Col 70 Sector',72.71875,-313.78125,-1019.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3500,'Col 70 Sector PZ-O d6-2','Unknown','Col 70 Sector',51.34375,-279,-1031.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3505,'Col 70 Sector PZ-O d6-3','Unknown','Col 70 Sector',53.4375,-321,-1017.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3510,'Col 70 Sector PZ-O d6-6','Unknown','Col 70 Sector',23.5,-286.96875,-1041.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3515,'Col 70 Sector PZ-X b18-0','Unknown','Col 70 Sector',733.59375,-127.75,-1189.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3520,'Col 70 Sector QA-B b44-0','Unknown','Col 70 Sector',375.40625,-281.34375,-663.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3525,'Col 70 Sector QA-B b44-1','Unknown','Col 70 Sector',375.71875,-277.84375,-654.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3530,'Col 70 Sector QA-L b38-0','Unknown','Col 70 Sector',218.78125,-340.4375,-782.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3535,'Col 70 Sector QA-T c18-0','Unknown','Col 70 Sector',459.65625,-419.25,-822.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3540,'Col 70 Sector QA-T c18-1','Unknown','Col 70 Sector',463.15625,-416.0625,-823.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3545,'Col 70 Sector QC-T b33-0','Unknown','Col 70 Sector',457.1875,-406.9375,-867.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3550,'Col 70 Sector QD-H b27-0','Unknown','Col 70 Sector',338.0625,-242.34375,-1020.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3555,'Col 70 Sector QD-R d5-3','Unknown','Col 70 Sector',768.65625,-112.875,-1144.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3560,'Col 70 Sector QE-L b26-1','Unknown','Col 70 Sector',377.21875,-0.4375,-1039.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3565,'Col 70 Sector QE-P d6-6','Unknown','Col 70 Sector',310.03125,-227.59375,-1037.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3570,'Col 70 Sector QF-C c14-0','Unknown','Col 70 Sector',377.625,-342.75,-1021,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3575,'Col 70 Sector QG-Q c20-4','Unknown','Col 70 Sector',475.34375,-258.15625,-722.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3580,'Col 70 Sector QG-Y b32-0','Unknown','Col 70 Sector',216.4375,-60.84375,-904.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3585,'Col 70 Sector QG-Z b44-1','Unknown','Col 70 Sector',314.625,-279.4375,-626.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3590,'Col 70 Sector QH-U c3-1','Unknown','Col 70 Sector',539.125,-603.4375,-1428.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3595,'Col 70 Sector QH-W b18-0','Unknown','Col 70 Sector',900.09375,-306.875,-1204.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3600,'Col 70 Sector QI-J b38-0','Unknown','Col 70 Sector',381.875,-507.8125,-775.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3605,'Col 70 Sector QJ-G b27-0','Unknown','Col 70 Sector',182.53125,-318.9375,-1009.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3610,'Col 70 Sector QJ-I a32-0','Unknown','Col 70 Sector',245.8125,-34.21875,-1263.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3615,'Col 70 Sector QJ-Q e5-17','Unknown','Col 70 Sector',299.4375,-167.25,-671.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3620,'Col 70 Sector QL-H c12-4','Unknown','Col 70 Sector',375.8125,19.125,-1090.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3625,'Col 70 Sector QL-Z b44-1','Unknown','Col 70 Sector',346.6875,-258.03125,-635.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3630,'Col 70 Sector QM-D b28-0','Unknown','Col 70 Sector',378,-442.65625,-999.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3635,'Col 70 Sector QN-R b34-0','Unknown','Col 70 Sector',431.71875,-403.34375,-849.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3640,'Col 70 Sector QP-E b28-0','Unknown','Col 70 Sector',99.1875,-322,-1001.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3645,'Col 70 Sector QR-K b38-0','Unknown','Col 70 Sector',658.09375,-384.09375,-780.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3650,'Col 70 Sector QR-X b4-0','Unknown','Col 70 Sector',740.3125,-221.125,-1501.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3655,'Col 70 Sector QS-A b30-0','Unknown','Col 70 Sector',376.40625,-361.09375,-963.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3660,'Col 70 Sector QU-N d7-32','Unknown','Col 70 Sector',304.15625,-34.375,-935.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3665,'Col 70 Sector QU-T b34-0','Unknown','Col 70 Sector',375.90625,-162.28125,-863.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3670,'Col 70 Sector QV-A b44-0','Unknown','Col 70 Sector',339.6875,-303.21875,-663.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3675,'Col 70 Sector QV-A b44-1','Unknown','Col 70 Sector',339.34375,-304.3125,-661.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3680,'Col 70 Sector QV-B b43-0','Unknown','Col 70 Sector',258.3125,-383.46875,-684.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3685,'Col 70 Sector QW-J b39-0','Unknown','Col 70 Sector',792.5,-266.5625,-758.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3690,'Col 70 Sector QY-Q d5-20','Unknown','Col 70 Sector',577.4375,-242.8125,-1072.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3695,'Col 70 Sector QZ-O a42-0','Unknown','Col 70 Sector',325.0625,-33.15625,-1153.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3700,'Col 70 Sector RA-K b39-0','Unknown','Col 70 Sector',315.78125,-261.15625,-764.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3705,'Col 70 Sector RA-W a38-0','Unknown','Col 70 Sector',236.5,-33.96875,-1192.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3710,'Col 70 Sector RF-C c14-1','Unknown','Col 70 Sector',417.34375,-340.78125,-1017.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3715,'Col 70 Sector RF-U c17-1','Unknown','Col 70 Sector',426.5,-540.96875,-840.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3720,'Col 70 Sector RG-A b44-0','Unknown','Col 70 Sector',246.09375,-363.21875,-649.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3725,'Col 70 Sector RG-H b41-1','Unknown','Col 70 Sector',333.625,-167.90625,-710.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3730,'Col 70 Sector RG-L a44-0','Unknown','Col 70 Sector',237.65625,-43.03125,-1132.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3735,'Col 70 Sector RH-G b29-1','Unknown','Col 70 Sector',757.40625,43.15625,-974.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3740,'Col 70 Sector RH-N b10-0','Unknown','Col 70 Sector',839.625,-199.90625,-1380.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3745,'Col 70 Sector RI-W b20-0','Unknown','Col 70 Sector',493.09375,59.125,-1148.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3750,'Col 70 Sector RJ-G b27-0','Unknown','Col 70 Sector',199.28125,-320.65625,-1021.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3755,'Col 70 Sector RJ-O b36-0','Unknown','Col 70 Sector',360.625,-364.3125,-822.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3760,'Col 70 Sector RK-M b37-0','Unknown','Col 70 Sector',243.75,-369.9375,-789.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3765,'Col 70 Sector RL-A b44-0','Unknown','Col 70 Sector',286.9375,-338,-647.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3770,'Col 70 Sector RL-I c11-4','Unknown','Col 70 Sector',272.6875,-110.625,-1131.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3775,'Col 70 Sector RL-S b34-0','Unknown','Col 70 Sector',118.4375,-304.8125,-860.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3780,'Col 70 Sector RM-L c8-0','Unknown','Col 70 Sector',820.1875,-624.90625,-1259.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3785,'Col 70 Sector RM-W b33-0','Unknown','Col 70 Sector',172.46875,-50.8125,-875.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3790,'Col 70 Sector RN-H b40-0','Unknown','Col 70 Sector',607.5,-326.90625,-727,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3795,'Col 70 Sector RN-R b34-0','Unknown','Col 70 Sector',435.125,-399.28125,-863.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3800,'Col 70 Sector RN-S d4-1','Unknown','Col 70 Sector',827.875,-331.3125,-1212.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3805,'Col 70 Sector RN-S d4-14','Unknown','Col 70 Sector',854.53125,-316.71875,-1216.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3810,'Col 70 Sector RN-S d4-5','Unknown','Col 70 Sector',875.3125,-304.53125,-1210.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3815,'Col 70 Sector RO-Z a36-2','Unknown','Col 70 Sector',315.75,-34.0625,-1213.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3820,'Col 70 Sector RP-E b28-0','Unknown','Col 70 Sector',118.78125,-322,-1002.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3825,'Col 70 Sector RP-N d7-6','Unknown','Col 70 Sector',235.03125,-161.59375,-980,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3830,'Col 70 Sector RR-G c12-3','Unknown','Col 70 Sector',118.4375,-115,-1065.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3835,'Col 70 Sector RR-X b4-0','Unknown','Col 70 Sector',764.03125,-211.8125,-1490.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3840,'Col 70 Sector RS-J b25-0','Unknown','Col 70 Sector',315.3125,-341.40625,-1059.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3845,'Col 70 Sector RS-Q c6-2','Unknown','Col 70 Sector',816.625,-231.375,-1343.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3850,'Col 70 Sector RS-S c4-8','Unknown','Col 70 Sector',497.5625,-577.21875,-1420.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3855,'Col 70 Sector RT-F b41-0','Unknown','Col 70 Sector',520.90625,-344.65625,-723.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3860,'Col 70 Sector RV-I b40-1','Unknown','Col 70 Sector',371.65625,-200.40625,-741.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3865,'Col 70 Sector RV-S c18-2','Unknown','Col 70 Sector',453.15625,-429.15625,-823.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3870,'Col 70 Sector RX-B b29-0','Unknown','Col 70 Sector',357.21875,-420.5625,-981.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3875,'Col 70 Sector RX-S c4-5','Unknown','Col 70 Sector',595.9375,-524.65625,-1389.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3880,'Col 70 Sector RX-V b5-0','Unknown','Col 70 Sector',677.3125,-215.625,-1480.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3885,'Col 70 Sector RZ-O d6-1','Unknown','Col 70 Sector',216.09375,-319.90625,-1021.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3890,'Col 70 Sector RZ-O d6-14','Unknown','Col 70 Sector',240.15625,-327.375,-1036.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3895,'Col 70 Sector RZ-O d6-5','Unknown','Col 70 Sector',217.8125,-305.75,-991.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3900,'Col 70 Sector SA-C c14-0','Unknown','Col 70 Sector',406.90625,-374.21875,-988.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3905,'Col 70 Sector SA-L b38-0','Unknown','Col 70 Sector',266.21875,-330.375,-783.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3910,'Col 70 Sector SB-Z b44-0','Unknown','Col 70 Sector',312.09375,-299.625,-625.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3915,'Col 70 Sector SC-B c1-0','Unknown','Col 70 Sector',715.6875,-297.71875,-1550.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3920,'Col 70 Sector SC-J b39-0','Unknown','Col 70 Sector',655.6875,-362.9375,-760.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3925,'Col 70 Sector SC-O c21-4','Unknown','Col 70 Sector',228.84375,-340.125,-669.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3930,'Col 70 Sector SC-S c5-1','Unknown','Col 70 Sector',887.875,-318.25,-1378.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3935,'Col 70 Sector SD-Z b30-0','Unknown','Col 70 Sector',378.0625,-342.4375,-943.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3940,'Col 70 Sector SG-H b41-0','Unknown','Col 70 Sector',352.71875,-167.625,-708.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3945,'Col 70 Sector SG-T b21-1','Unknown','Col 70 Sector',657.5625,-84.90625,-1142,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3950,'Col 70 Sector SG-Z b44-0','Unknown','Col 70 Sector',340.375,-275.25,-625.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3955,'Col 70 Sector SI-R b34-0','Unknown','Col 70 Sector',417.375,-421.125,-860,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3960,'Col 70 Sector SK-D c13-1','Unknown','Col 70 Sector',377.25,-459.90625,-1061.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3965,'Col 70 Sector SK-L b25-0','Unknown','Col 70 Sector',175.25,-163.5,-1047.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3970,'Col 70 Sector SK-M d8-10','Unknown','Col 70 Sector',429.15625,92.3125,-904.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3975,'Col 70 Sector SL-A b44-0','Unknown','Col 70 Sector',296.875,-341.125,-661.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3980,'Col 70 Sector SL-R c19-0','Unknown','Col 70 Sector',457.78125,-383.0625,-781.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3985,'Col 70 Sector SM-F c13-1','Unknown','Col 70 Sector',218.40625,-21.53125,-1060.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3990,'Col 70 Sector SM-G c12-3','Unknown','Col 70 Sector',72.09375,-146.65625,-1065.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(3995,'Col 70 Sector SM-O c21-2','Unknown','Col 70 Sector',401.375,-226.5,-670.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4000,'Col 70 Sector SM-O c21-5','Unknown','Col 70 Sector',407.71875,-237.34375,-675.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4005,'Col 70 Sector SN-Q b35-0','Unknown','Col 70 Sector',541.84375,-309.96875,-834.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4010,'Col 70 Sector SN-R b34-0','Unknown','Col 70 Sector',459.96875,-403.5,-860.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4015,'Col 70 Sector SN-S d4-12','Unknown','Col 70 Sector',965.5625,-316.375,-1220.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4020,'Col 70 Sector SP-E b28-0','Unknown','Col 70 Sector',138.03125,-319.625,-1003.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4025,'Col 70 Sector SP-T c18-4','Unknown','Col 70 Sector',785.0625,-273.9375,-790.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4030,'Col 70 Sector SQ-A b44-0','Unknown','Col 70 Sector',347.53125,-323.5625,-645.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4035,'Col 70 Sector SS-E b30-1','Unknown','Col 70 Sector',740.96875,56.0625,-945.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4040,'Col 70 Sector SS-E b30-2','Unknown','Col 70 Sector',752.25,61.34375,-963.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4045,'Col 70 Sector ST-A a50-0','Unknown','Col 70 Sector',792.1875,-41.15625,-1069.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4050,'Col 70 Sector ST-F b41-0','Unknown','Col 70 Sector',542.65625,-338.4375,-722.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4055,'Col 70 Sector SU-U b33-0','Unknown','Col 70 Sector',336.3125,-243.125,-881.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4060,'Col 70 Sector SV-J b39-0','Unknown','Col 70 Sector',295.65625,-280.75,-762.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4065,'Col 70 Sector SV-K b38-0','Unknown','Col 70 Sector',225.1875,-359.03125,-783.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4070,'Col 70 Sector SW-Q b35-0','Unknown','Col 70 Sector',98.75,-277.125,-837.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4075,'Col 70 Sector SZ-O d6-10','Unknown','Col 70 Sector',295.84375,-331,-1027.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4080,'Col 70 Sector SZ-O d6-13','Unknown','Col 70 Sector',282.375,-288.75,-1058.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4085,'Col 70 Sector SZ-O d6-2','Unknown','Col 70 Sector',266.875,-334.65625,-1047.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4090,'Col 70 Sector SZ-O d6-7','Unknown','Col 70 Sector',306.75,-344.09375,-1041.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4095,'Col 70 Sector SZ-Y b17-0','Unknown','Col 70 Sector',699.75,-224.15625,-1222.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4100,'Col 70 Sector TA-C c14-2','Unknown','Col 70 Sector',424.8125,-383.78125,-998.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4105,'Col 70 Sector TB-Z b44-0','Unknown','Col 70 Sector',330.1875,-293.125,-632.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4110,'Col 70 Sector TC-O c21-2','Unknown','Col 70 Sector',279.25,-314.1875,-677.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4115,'Col 70 Sector TD-J b38-0','Unknown','Col 70 Sector',398.78125,-541.53125,-781.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4120,'Col 70 Sector TD-Y c2-2','Unknown','Col 70 Sector',692.75,-171.4375,-1481.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4125,'Col 70 Sector TD-Z b30-0','Unknown','Col 70 Sector',400.75,-343.9375,-943.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4130,'Col 70 Sector TE-K b37-0','Unknown','Col 70 Sector',840.75,-620.625,-800.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4135,'Col 70 Sector TE-Q e5-8','Unknown','Col 70 Sector',418.09375,-224.1875,-688.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4140,'Col 70 Sector TE-U b21-0','Unknown','Col 70 Sector',371.4375,34.375,-1142.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4145,'Col 70 Sector TE-Z a50-0','Unknown','Col 70 Sector',775.9375,-32.0625,-1064.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4150,'Col 70 Sector TF-L b25-0','Unknown','Col 70 Sector',157.34375,-181.96875,-1059.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4155,'Col 70 Sector TF-N d7-14','Unknown','Col 70 Sector',37.0625,-290.34375,-956.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4160,'Col 70 Sector TF-T c18-0','Unknown','Col 70 Sector',655.6875,-379.84375,-820.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4165,'Col 70 Sector TG-A c15-0','Unknown','Col 70 Sector',280.6875,-355.84375,-957.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4170,'Col 70 Sector TH-L c8-1','Unknown','Col 70 Sector',822.84375,-626.15625,-1244.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4175,'Col 70 Sector TI-A b30-0','Unknown','Col 70 Sector',358.15625,-403.125,-959.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4180,'Col 70 Sector TI-R b34-0','Unknown','Col 70 Sector',436.375,-422.40625,-864.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4185,'Col 70 Sector TI-R c5-4','Unknown','Col 70 Sector',596.46875,-503.125,-1382.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4190,'Col 70 Sector TJ-F b41-0','Unknown','Col 70 Sector',482.65625,-368.71875,-719.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4195,'Col 70 Sector TJ-Q d5-4','Unknown','Col 70 Sector',403.65625,-496.375,-1093.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4200,'Col 70 Sector TJ-Q d5-7','Unknown','Col 70 Sector',412.46875,-491.0625,-1110.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4205,'Col 70 Sector TJ-Q d5-9','Unknown','Col 70 Sector',389.25,-479.96875,-1074.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4210,'Col 70 Sector TL-A c15-2','Unknown','Col 70 Sector',363.0625,-315.96875,-952.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4215,'Col 70 Sector TM-O c21-6','Unknown','Col 70 Sector',427.6875,-249.9375,-701.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4220,'Col 70 Sector TM-W b33-2','Unknown','Col 70 Sector',199.03125,-45.46875,-871.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4225,'Col 70 Sector TN-R b34-0','Unknown','Col 70 Sector',475.6875,-402.84375,-861.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4230,'Col 70 Sector TO-W c3-2','Unknown','Col 70 Sector',592.6875,-108.65625,-1447.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4235,'Col 70 Sector TP-E b28-0','Unknown','Col 70 Sector',156.96875,-323.375,-996.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4240,'Col 70 Sector TP-X b18-0','Unknown','Col 70 Sector',720.34375,-182.90625,-1203.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4245,'Col 70 Sector TS-H a46-1','Unknown','Col 70 Sector',181.9375,-36.78125,-1107.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4250,'Col 70 Sector TS-J b25-0','Unknown','Col 70 Sector',355.28125,-343.0625,-1060.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4255,'Col 70 Sector TS-T d3-5','Unknown','Col 70 Sector',851.53125,-546.71875,-1229.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4260,'Col 70 Sector TU-N b23-0','Unknown','Col 70 Sector',130.125,-271.03125,-1087.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4265,'Col 70 Sector TU-T a53-0','Unknown','Col 70 Sector',140.78125,-34.625,-1028.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4270,'Col 70 Sector TV-K b38-0','Unknown','Col 70 Sector',237.03125,-358.8125,-771.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4275,'Col 70 Sector TW-Y b44-0','Unknown','Col 70 Sector',275.75,-319.1875,-642.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4280,'Col 70 Sector TX-H a46-0','Unknown','Col 70 Sector',195.75,-32.3125,-1112.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4285,'Col 70 Sector TX-M c22-2','Unknown','Col 70 Sector',366.90625,-200.96875,-629.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4290,'Col 70 Sector TX-S b33-0','Unknown','Col 70 Sector',487.4375,-442.6875,-869.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4295,'Col 70 Sector TY-H b26-0','Unknown','Col 70 Sector',280.84375,-331.09375,-1039.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4300,'Col 70 Sector TY-O b36-0','Unknown','Col 70 Sector',518.53125,-296.96875,-815.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4305,'Col 70 Sector TY-P b35-0','Unknown','Col 70 Sector',437.5,-380.28125,-841.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4310,'Col 70 Sector TZ-L c9-4','Unknown','Col 70 Sector',693.625,-130.71875,-1188.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4315,'Col 70 Sector TZ-O d6-5','Unknown','Col 70 Sector',398,-311.84375,-1006.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4320,'Col 70 Sector UA-L b25-0','Unknown','Col 70 Sector',137.5,-199.6875,-1060.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4325,'Col 70 Sector UA-L b38-0','Unknown','Col 70 Sector',302.1875,-333.6875,-782.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4330,'Col 70 Sector UB-Z b44-0','Unknown','Col 70 Sector',347.21875,-302.65625,-637.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4335,'Col 70 Sector UC-K b25-0','Unknown','Col 70 Sector',460.46875,-300.96875,-1060.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4340,'Col 70 Sector UC-R b22-1','Unknown','Col 70 Sector',539.03125,-121.5,-1115.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4345,'Col 70 Sector UC-X c16-1','Unknown','Col 70 Sector',164.96875,-301.625,-904.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4350,'Col 70 Sector UD-Q b35-0','Unknown','Col 70 Sector',495.84375,-354.46875,-825.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4355,'Col 70 Sector UF-N d7-12','Unknown','Col 70 Sector',95.96875,-322.6875,-958.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4360,'Col 70 Sector UF-W b19-0','Unknown','Col 70 Sector',738.75,-140.9375,-1180.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4365,'Col 70 Sector UG-A b44-0','Unknown','Col 70 Sector',305.90625,-358.9375,-646.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4370,'Col 70 Sector UG-B b30-0','Unknown','Col 70 Sector',61.3125,-291.5,-958.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4375,'Col 70 Sector UG-Z b44-0','Unknown','Col 70 Sector',376.65625,-280.4375,-642.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4380,'Col 70 Sector UH-G c12-0','Unknown','Col 70 Sector',55,-219.0625,-1101.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4385,'Col 70 Sector UH-O c21-3','Unknown','Col 70 Sector',381.84375,-283.0625,-683.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4390,'Col 70 Sector UH-O c21-4','Unknown','Col 70 Sector',392.90625,-299.40625,-689.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4395,'Col 70 Sector UI-I b26-0','Unknown','Col 70 Sector',377.90625,-301.21875,-1042,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4400,'Col 70 Sector UI-J b38-0','Unknown','Col 70 Sector',467.4375,-506.46875,-770.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4405,'Col 70 Sector UJ-F b28-0','Unknown','Col 70 Sector',336.0625,-243.90625,-1001.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4410,'Col 70 Sector UL-A c15-1','Unknown','Col 70 Sector',381.53125,-308.84375,-977.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4415,'Col 70 Sector UL-B b30-0','Unknown','Col 70 Sector',100,-284.84375,-961.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4420,'Col 70 Sector UN-S c4-0','Unknown','Col 70 Sector',546.59375,-601.21875,-1412.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4425,'Col 70 Sector UP-E b28-0','Unknown','Col 70 Sector',176.5,-321.71875,-1002.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4430,'Col 70 Sector UQ-A b44-0','Unknown','Col 70 Sector',389.3125,-319.125,-661.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4435,'Col 70 Sector UQ-A c15-0','Unknown','Col 70 Sector',490.25,-268.46875,-949.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4440,'Col 70 Sector UQ-A c15-2','Unknown','Col 70 Sector',472.90625,-304.59375,-975.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4445,'Col 70 Sector UR-F b42-0','Unknown','Col 70 Sector',349.1875,-151.59375,-689.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4450,'Col 70 Sector UR-G b28-0','Unknown','Col 70 Sector',97.15625,-104.03125,-1004.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4455,'Col 70 Sector UR-H b40-0','Unknown','Col 70 Sector',182.03125,-315.71875,-742.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4460,'Col 70 Sector US-J b25-0','Unknown','Col 70 Sector',379.03125,-343.28125,-1061.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4465,'Col 70 Sector US-M c22-4','Unknown','Col 70 Sector',332.59375,-232.5625,-647.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4470,'Col 70 Sector US-S b33-0','Unknown','Col 70 Sector',472.65625,-451.21875,-878.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4475,'Col 70 Sector UT-F b41-0','Unknown','Col 70 Sector',586.53125,-336.5625,-719.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4480,'Col 70 Sector UT-F c12-0','Unknown','Col 70 Sector',858.90625,-339.875,-1103.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4485,'Col 70 Sector UT-P b35-0','Unknown','Col 70 Sector',430.65625,-386.1875,-828.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4490,'Col 70 Sector UU-E b28-0','Unknown','Col 70 Sector',229.125,-285.59375,-1001.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4495,'Col 70 Sector UW-G b41-0','Unknown','Col 70 Sector',297.4375,-221.09375,-720.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4500,'Col 70 Sector UW-H c11-2','Unknown','Col 70 Sector',148.53125,-232.28125,-1139.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4505,'Col 70 Sector UW-V b34-0','Unknown','Col 70 Sector',379.375,65.21875,-858.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4510,'Col 70 Sector UW-Y b44-0','Unknown','Col 70 Sector',308.46875,-314.0625,-626.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4515,'Col 70 Sector UX-R c5-0','Unknown','Col 70 Sector',860.59375,-352.96875,-1349.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4520,'Col 70 Sector UY-H b26-0','Unknown','Col 70 Sector',298.03125,-339.0625,-1025.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4525,'Col 70 Sector UY-I b38-0','Unknown','Col 70 Sector',376.875,-551.46875,-770.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4530,'Col 70 Sector UY-N b37-1','Unknown','Col 70 Sector',615.21875,-223.40625,-802.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4535,'Col 70 Sector UY-O c7-1','Unknown','Col 70 Sector',789.03125,-243.21875,-1300.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4540,'Col 70 Sector UY-P b35-0','Unknown','Col 70 Sector',460.125,-374.78125,-827.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4545,'Col 70 Sector UY-Y b30-0','Unknown','Col 70 Sector',391.8125,-348.125,-927,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4550,'Col 70 Sector UZ-O d6-8','Unknown','Col 70 Sector',446.875,-305.375,-996.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4555,'Col 70 Sector VA-D b29-0','Unknown','Col 70 Sector',158.78125,-303,-980.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4560,'Col 70 Sector VB-Z b44-0','Unknown','Col 70 Sector',358.59375,-299.875,-643.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4565,'Col 70 Sector VC-G c12-2','Unknown','Col 70 Sector',32.46875,-225.71875,-1088.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4570,'Col 70 Sector VD-R c5-1','Unknown','Col 70 Sector',579.4375,-543.78125,-1382.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4575,'Col 70 Sector VD-Y b31-0','Unknown','Col 70 Sector',519.75,-263.96875,-924,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4580,'Col 70 Sector VE-O b36-0','Unknown','Col 70 Sector',397.28125,-381.1875,-819.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4585,'Col 70 Sector VF-M b24-0','Unknown','Col 70 Sector',118.3125,-264.78125,-1083.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4590,'Col 70 Sector VF-N d7-12','Unknown','Col 70 Sector',240.03125,-307.53125,-939.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4595,'Col 70 Sector VF-S c6-3','Unknown','Col 70 Sector',590.6875,65,-1318.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4600,'Col 70 Sector VG-B b30-0','Unknown','Col 70 Sector',78.28125,-287.0625,-957.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4605,'Col 70 Sector VG-I b40-0','Unknown','Col 70 Sector',315.46875,-259.46875,-740.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4610,'Col 70 Sector VG-Z c15-0','Unknown','Col 70 Sector',499.875,-222.625,-942.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4615,'Col 70 Sector VI-R b34-0','Unknown','Col 70 Sector',475.4375,-405.5,-845.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4620,'Col 70 Sector VJ-M b38-0','Unknown','Col 70 Sector',611.75,-201.09375,-784.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4625,'Col 70 Sector VJ-N b37-0','Unknown','Col 70 Sector',519.1875,-284.625,-803.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4630,'Col 70 Sector VK-N d7-19','Unknown','Col 70 Sector',335.875,-247.53125,-922.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4635,'Col 70 Sector VL-S c18-0','Unknown','Col 70 Sector',417.40625,-544.75,-820.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4640,'Col 70 Sector VM-G b41-0','Unknown','Col 70 Sector',240.5625,-260.34375,-720.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4645,'Col 70 Sector VM-R b22-1','Unknown','Col 70 Sector',640.90625,-79.25,-1116.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4650,'Col 70 Sector VN-J b25-0','Unknown','Col 70 Sector',373.46875,-351.03125,-1058.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4655,'Col 70 Sector VN-M c22-3','Unknown','Col 70 Sector',257.03125,-278.4375,-662.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4660,'Col 70 Sector VR-F c13-4','Unknown','Col 70 Sector',449.96875,43.34375,-1052.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4665,'Col 70 Sector VR-Y b44-0','Unknown','Col 70 Sector',278,-332.1875,-644.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4670,'Col 70 Sector VT-E b16-0','Unknown','Col 70 Sector',370.96875,19.375,-1262,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4675,'Col 70 Sector VT-P b35-0','Unknown','Col 70 Sector',441.125,-394.9375,-844.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4680,'Col 70 Sector VX-R c5-1','Unknown','Col 70 Sector',909.46875,-356,-1363.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4685,'Col 70 Sector VY-C b31-1','Unknown','Col 70 Sector',731.6875,57.75,-930.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4690,'Col 70 Sector VY-Z d12','Unknown','Col 70 Sector',706.8125,-165.71875,-1506.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4695,'Col 70 Sector WA-D b29-0','Unknown','Col 70 Sector',179.75,-301.375,-981.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4700,'Col 70 Sector WA-M b24-0','Unknown','Col 70 Sector',108.34375,-274.625,-1073.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4705,'Col 70 Sector WA-T c18-1','Unknown','Col 70 Sector',697.28125,-407.65625,-809.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4710,'Col 70 Sector WA-T c18-2','Unknown','Col 70 Sector',720.25,-419.46875,-819.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4715,'Col 70 Sector WA-W b19-0','Unknown','Col 70 Sector',736.34375,-163.3125,-1179.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4720,'Col 70 Sector WB-Z b44-1','Unknown','Col 70 Sector',375.25,-302.3125,-642.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4725,'Col 70 Sector WC-N b38-1','Unknown','Col 70 Sector',263.625,-124.375,-780.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4730,'Col 70 Sector WC-U c3-0','Unknown','Col 70 Sector',717.28125,-637.34375,-1427.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4735,'Col 70 Sector WD-Y b31-0','Unknown','Col 70 Sector',540.75,-263.125,-921.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4740,'Col 70 Sector WE-F b28-0','Unknown','Col 70 Sector',339.25,-251.71875,-988.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4745,'Col 70 Sector WE-N b37-0','Unknown','Col 70 Sector',513.65625,-292.53125,-788.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4750,'Col 70 Sector WF-X b18-0','Unknown','Col 70 Sector',705.96875,-206.15625,-1190.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4755,'Col 70 Sector WG-A c15-2','Unknown','Col 70 Sector',382.59375,-379.4375,-979.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4760,'Col 70 Sector WH-F b42-1','Unknown','Col 70 Sector',296.53125,-197.3125,-699.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4765,'Col 70 Sector WI-R c5-1','Unknown','Col 70 Sector',702.59375,-486.9375,-1363.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4770,'Col 70 Sector WI-R c5-7','Unknown','Col 70 Sector',707.1875,-490.96875,-1354.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4775,'Col 70 Sector WI-V b5-0','Unknown','Col 70 Sector',657.65625,-265.15625,-1466.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4780,'Col 70 Sector WJ-G b27-0','Unknown','Col 70 Sector',301.0625,-324.5625,-1009.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4785,'Col 70 Sector WJ-Y d1-13','Unknown','Col 70 Sector',591.03125,-95.34375,-1433.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4790,'Col 70 Sector WK-B b31-1','Unknown','Col 70 Sector',429.03125,-103.5625,-944.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4795,'Col 70 Sector WK-F b40-0','Unknown','Col 70 Sector',255.9375,-559.15625,-740.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4800,'Col 70 Sector WM-F c13-0','Unknown','Col 70 Sector',380.03125,12.78125,-1051.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4805,'Col 70 Sector WM-G b41-0','Unknown','Col 70 Sector',267.21875,-251.96875,-711.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4810,'Col 70 Sector WN-J b25-0','Unknown','Col 70 Sector',390.1875,-354.5,-1061.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4815,'Col 70 Sector WO-P b35-0','Unknown','Col 70 Sector',434.25,-408.15625,-844.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4820,'Col 70 Sector WO-Z a36-2','Unknown','Col 70 Sector',367.40625,-33.9375,-1212.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4825,'Col 70 Sector WO-Z b29-0','Unknown','Col 70 Sector',262.21875,-470.25,-953.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4830,'Col 70 Sector WP-S b22-0','Unknown','Col 70 Sector',375.21875,37.65625,-1124.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4835,'Col 70 Sector WR-G b13-0','Unknown','Col 70 Sector',940.0625,-339.15625,-1322.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4840,'Col 70 Sector WR-G b41-0','Unknown','Col 70 Sector',297.09375,-242.53125,-708.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4845,'Col 70 Sector WR-Y b44-0','Unknown','Col 70 Sector',307.9375,-331.6875,-634.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4850,'Col 70 Sector WS-S c4-8','Unknown','Col 70 Sector',716.625,-548.90625,-1391.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4855,'Col 70 Sector WT-P b35-0','Unknown','Col 70 Sector',455.40625,-403.3125,-842.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4860,'Col 70 Sector WT-Z b29-0','Unknown','Col 70 Sector',295.0625,-460.1875,-960.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4865,'Col 70 Sector WU-V c16-0','Unknown','Col 70 Sector',697.34375,-574.8125,-877.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4870,'Col 70 Sector WV-R c19-1','Unknown','Col 70 Sector',779.6875,-274.125,-771.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4875,'Col 70 Sector WV-V b19-0','Unknown','Col 70 Sector',700.53125,-179.3125,-1179.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4880,'Col 70 Sector WW-P c20-3','Unknown','Col 70 Sector',565.59375,-338.75,-723.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4885,'Col 70 Sector WX-T b32-0','Unknown','Col 70 Sector',470.5,-508.71875,-891,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4890,'Col 70 Sector WY-Q c5-3','Unknown','Col 70 Sector',557.9375,-562.84375,-1383.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4895,'Col 70 Sector WY-R d4-2','Unknown','Col 70 Sector',737.8125,-584.53125,-1154.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4900,'Col 70 Sector XA-D b29-0','Unknown','Col 70 Sector',199.28125,-302.5,-980.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4905,'Col 70 Sector XA-N d7-2','Unknown','Col 70 Sector',241.3125,-396.34375,-979.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4910,'Col 70 Sector XA-N d7-4','Unknown','Col 70 Sector',219.78125,-406.90625,-960.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4915,'Col 70 Sector XC-F b42-0','Unknown','Col 70 Sector',277.375,-222.125,-702.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4920,'Col 70 Sector XC-U c3-4','Unknown','Col 70 Sector',767.71875,-626,-1429.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4925,'Col 70 Sector XC-U c3-6','Unknown','Col 70 Sector',742.40625,-626.96875,-1427.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4930,'Col 70 Sector XG-B b30-0','Unknown','Col 70 Sector',120.90625,-295.03125,-956.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4935,'Col 70 Sector XI-Q c6-0','Unknown','Col 70 Sector',898.5,-343.03125,-1339.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4940,'Col 70 Sector XI-Q c6-1','Unknown','Col 70 Sector',901.15625,-331.625,-1322.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4945,'Col 70 Sector XJ-F c12-9','Unknown','Col 70 Sector',815.1875,-389.90625,-1082.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4950,'Col 70 Sector XJ-P b35-0','Unknown','Col 70 Sector',400.0625,-433.125,-836.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4955,'Col 70 Sector XJ-W c3-2','Unknown','Col 70 Sector',690.90625,-176.21875,-1451.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4960,'Col 70 Sector XK-F b40-0','Unknown','Col 70 Sector',278.625,-563.1875,-744.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4965,'Col 70 Sector XK-M b24-0','Unknown','Col 70 Sector',198.09375,-239.5625,-1084.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4970,'Col 70 Sector XK-R b33-0','Unknown','Col 70 Sector',766.15625,-588.15625,-868.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4975,'Col 70 Sector XN-J b25-0','Unknown','Col 70 Sector',399.15625,-350.6875,-1047,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4980,'Col 70 Sector XN-J c9-3','Unknown','Col 70 Sector',821.9375,-626.65625,-1219.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4985,'Col 70 Sector XN-J c9-4','Unknown','Col 70 Sector',815.625,-625.9375,-1202.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4990,'Col 70 Sector XN-M c22-1','Unknown','Col 70 Sector',344.53125,-271.625,-628.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(4995,'Col 70 Sector XN-U c18-4','Unknown','Col 70 Sector',352.90625,-99.0625,-803.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5000,'Col 70 Sector XN-V c17-0','Unknown','Col 70 Sector',180.3125,-261.375,-863.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5005,'Col 70 Sector XO-P b35-0','Unknown','Col 70 Sector',435.53125,-415.3125,-843.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5010,'Col 70 Sector XO-Q d5-7','Unknown','Col 70 Sector',832.75,-370.65625,-1072.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5015,'Col 70 Sector XP-D b29-0','Unknown','Col 70 Sector',331,-239.9375,-983.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5020,'Col 70 Sector XP-Z b29-0','Unknown','Col 70 Sector',797.46875,-483.78125,-961.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5025,'Col 70 Sector XQ-K b38-0','Unknown','Col 70 Sector',280.5,-380.625,-781.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5030,'Col 70 Sector XQ-M b24-0','Unknown','Col 70 Sector',756.6875,-223.75,-1080.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5035,'Col 70 Sector XR-G b13-0','Unknown','Col 70 Sector',959.84375,-341.8125,-1322.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5040,'Col 70 Sector XR-Y b44-0','Unknown','Col 70 Sector',318.71875,-343,-644.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5045,'Col 70 Sector XS-D b43-1','Unknown','Col 70 Sector',280.9375,-184.1875,-679.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5050,'Col 70 Sector XS-E b42-0','Unknown','Col 70 Sector',211.03125,-246.21875,-699.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5055,'Col 70 Sector XS-E c13-2','Unknown','Col 70 Sector',117.59375,-180.96875,-1063.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5060,'Col 70 Sector XT-H c10-10','Unknown','Col 70 Sector',692.3125,-625.65625,-1172.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5065,'Col 70 Sector XT-P b35-0','Unknown','Col 70 Sector',485.6875,-399.3125,-837.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5070,'Col 70 Sector XT-Z b29-0','Unknown','Col 70 Sector',317.6875,-455.40625,-963.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5075,'Col 70 Sector XT-Z d7','Unknown','Col 70 Sector',714.71875,-193.53125,-1509.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5080,'Col 70 Sector XV-L d8-18','Unknown','Col 70 Sector',365.03125,-136.96875,-874.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5085,'Col 70 Sector XW-Z b43-0','Unknown','Col 70 Sector',282.875,-387.96875,-658.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5090,'Col 70 Sector XZ-X b30-0','Unknown','Col 70 Sector',237.21875,-464.78125,-941.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5095,'Col 70 Sector YA-M b24-0','Unknown','Col 70 Sector',139.84375,-282.46875,-1082.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5100,'Col 70 Sector YA-U b20-0','Unknown','Col 70 Sector',138.375,-180.625,-1159.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5105,'Col 70 Sector YC-U c3-6','Unknown','Col 70 Sector',787.0625,-625.4375,-1429.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5110,'Col 70 Sector YD-Q c6-0','Unknown','Col 70 Sector',860.875,-383.65625,-1343.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5115,'Col 70 Sector YD-R c5-0','Unknown','Col 70 Sector',713.625,-543.6875,-1373.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5120,'Col 70 Sector YD-R c5-1','Unknown','Col 70 Sector',720.90625,-512.6875,-1362.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5125,'Col 70 Sector YD-R c5-3','Unknown','Col 70 Sector',715.8125,-527.6875,-1373.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5130,'Col 70 Sector YE-E b42-0','Unknown','Col 70 Sector',627.59375,-320.875,-698.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5135,'Col 70 Sector YE-O b36-0','Unknown','Col 70 Sector',459.96875,-381.84375,-823.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5140,'Col 70 Sector YG-B b30-0','Unknown','Col 70 Sector',141.71875,-297.5,-963.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5145,'Col 70 Sector YG-L a44-0','Unknown','Col 70 Sector',310.5,-37.5,-1125.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5150,'Col 70 Sector YG-Q c20-1','Unknown','Col 70 Sector',799.59375,-263.96875,-743.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5155,'Col 70 Sector YH-G b41-1','Unknown','Col 70 Sector',257.25,-271,-718.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5160,'Col 70 Sector YI-I b26-0','Unknown','Col 70 Sector',457.53125,-304.8125,-1042.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5165,'Col 70 Sector YI-J c9-0','Unknown','Col 70 Sector',778.375,-699.46875,-1224.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5170,'Col 70 Sector YI-M c22-0','Unknown','Col 70 Sector',319.125,-330.34375,-646.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5175,'Col 70 Sector YI-M c22-1','Unknown','Col 70 Sector',320.375,-328.15625,-641.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5180,'Col 70 Sector YI-M c22-3','Unknown','Col 70 Sector',300.59375,-342.5625,-658.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5185,'Col 70 Sector YI-M c22-4','Unknown','Col 70 Sector',299.34375,-314.6875,-631.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5190,'Col 70 Sector YI-O a56-0','Unknown','Col 70 Sector',306,-39,-995.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5195,'Col 70 Sector YJ-H b39-0','Unknown','Col 70 Sector',417.5,-526.28125,-755.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5200,'Col 70 Sector YK-F b40-0','Unknown','Col 70 Sector',298.3125,-561.1875,-740.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5205,'Col 70 Sector YK-M b24-0','Unknown','Col 70 Sector',219.75,-244.53125,-1079.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5210,'Col 70 Sector YK-R a68-0','Unknown','Col 70 Sector',307.25,-44.40625,-872.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5215,'Col 70 Sector YK-S b22-1','Unknown','Col 70 Sector',377.71875,28.625,-1106.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5220,'Col 70 Sector YL-L d8-6','Unknown','Col 70 Sector',107.9375,-286.84375,-851.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5225,'Col 70 Sector YL-Y a64-1','Unknown','Col 70 Sector',209.625,-44.0625,-912.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5230,'Col 70 Sector YM-Y b44-0','Unknown','Col 70 Sector',303.71875,-347.8125,-644.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5235,'Col 70 Sector YN-S c4-9','Unknown','Col 70 Sector',697.25,-611.875,-1387.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5240,'Col 70 Sector YO-F b41-0','Unknown','Col 70 Sector',626.59375,-345.46875,-716.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5245,'Col 70 Sector YO-P b35-0','Unknown','Col 70 Sector',457.5625,-423.8125,-844.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5250,'Col 70 Sector YP-L c9-1','Unknown','Col 70 Sector',704.03125,-209.875,-1224.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5255,'Col 70 Sector YP-L c9-2','Unknown','Col 70 Sector',712.90625,-193.4375,-1220.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5260,'Col 70 Sector YQ-S b34-0','Unknown','Col 70 Sector',297.34375,-283.71875,-862.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5265,'Col 70 Sector YR-Q c19-1','Unknown','Col 70 Sector',384.84375,-544.59375,-780.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5270,'Col 70 Sector YR-Y b44-0','Unknown','Col 70 Sector',337.25,-340.1875,-640,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5275,'Col 70 Sector YS-E b42-0','Unknown','Col 70 Sector',221.71875,-254.59375,-689.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5280,'Col 70 Sector YW-Y b44-0','Unknown','Col 70 Sector',382.34375,-323,-632.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5285,'Col 70 Sector YX-D b43-1','Unknown','Col 70 Sector',338.65625,-149.53125,-665.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5290,'Col 70 Sector YZ-N b36-0','Unknown','Col 70 Sector',426.28125,-390.375,-814.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5295,'Col 70 Sector YZ-W b31-0','Unknown','Col 70 Sector',341.0625,-384.46875,-917.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5300,'Col 70 Sector ZA-D b29-0','Unknown','Col 70 Sector',239.4375,-304.5625,-984.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5305,'Col 70 Sector ZA-M b24-0','Unknown','Col 70 Sector',155.40625,-283.625,-1083,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5310,'Col 70 Sector ZA-N d7-11','Unknown','Col 70 Sector',403.03125,-359.15625,-953.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5315,'Col 70 Sector ZA-N d7-4','Unknown','Col 70 Sector',336.9375,-376.5,-980.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5320,'Col 70 Sector ZA-U b20-0','Unknown','Col 70 Sector',172.40625,-168.90625,-1155.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5325,'Col 70 Sector ZA-Y b30-0','Unknown','Col 70 Sector',797.875,-461.9375,-943.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5330,'Col 70 Sector ZC-X b45-0','Unknown','Col 70 Sector',316.625,-322.03125,-619.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5335,'Col 70 Sector ZC-X c16-2','Unknown','Col 70 Sector',339.0625,-304.5,-899.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5340,'Col 70 Sector ZD-M c22-2','Unknown','Col 70 Sector',276.03125,-353.03125,-656.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5345,'Col 70 Sector ZD-S b33-0','Unknown','Col 70 Sector',444.65625,-515.8125,-874.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5350,'Col 70 Sector ZE-G b27-0','Unknown','Col 70 Sector',319.625,-326.65625,-1010.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5355,'Col 70 Sector ZE-Y d1-8','Unknown','Col 70 Sector',699.625,-183,-1427.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5360,'Col 70 Sector ZF-K c10-0','Unknown','Col 70 Sector',738.90625,-143.875,-1182.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5365,'Col 70 Sector ZF-K c10-5','Unknown','Col 70 Sector',757.71875,-139.6875,-1158.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5370,'Col 70 Sector ZF-N d7-1','Unknown','Col 70 Sector',535.40625,-271.09375,-916.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5375,'Col 70 Sector ZH-H b27-0','Unknown','Col 70 Sector',35,-224.75,-1022.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5380,'Col 70 Sector ZH-X b45-0','Unknown','Col 70 Sector',359.3125,-303.03125,-621.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5385,'Col 70 Sector ZH-Y b44-0','Unknown','Col 70 Sector',277.8125,-380.5,-643.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5390,'Col 70 Sector ZI-R c5-7','Unknown','Col 70 Sector',818.15625,-499.21875,-1383.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5395,'Col 70 Sector ZJ-S b7-0','Unknown','Col 70 Sector',675.75,-219.15625,-1444.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5400,'Col 70 Sector ZK-A a64-4','Unknown','Col 70 Sector',284.09375,-32.65625,-917.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5405,'Col 70 Sector ZL-Q c7-3','Unknown','Col 70 Sector',582.59375,71.03125,-1287.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5410,'Col 70 Sector ZM-I b26-0','Unknown','Col 70 Sector',10.09375,-276.75,-1041.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5415,'Col 70 Sector ZM-L b37-0','Unknown','Col 70 Sector',720.375,-481.46875,-801.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5420,'Col 70 Sector ZM-Q c19-0','Unknown','Col 70 Sector',340.625,-583.53125,-781.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5425,'Col 70 Sector ZM-Q c19-1','Unknown','Col 70 Sector',364.3125,-570.5625,-773.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5430,'Col 70 Sector ZM-Y b44-0','Unknown','Col 70 Sector',326.5625,-347.4375,-629.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5435,'Col 70 Sector ZO-Z d7','Unknown','Col 70 Sector',720.40625,-327.28125,-1523.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5440,'Col 70 Sector ZO-Z d9','Unknown','Col 70 Sector',728.8125,-321.40625,-1503.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5445,'Col 70 Sector ZP-E b28-0','Unknown','Col 70 Sector',278.15625,-321.84375,-1001.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5450,'Col 70 Sector ZP-N b23-0','Unknown','Col 70 Sector',198.28125,-299.71875,-1098.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5455,'Col 70 Sector ZR-O b37-0','Unknown','Col 70 Sector',370.125,-125.53125,-787.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5460,'Col 70 Sector ZR-P b36-0','Unknown','Col 70 Sector',278.875,-211.34375,-816.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5465,'Col 70 Sector ZR-Q c19-1','Unknown','Col 70 Sector',441.84375,-511.78125,-763.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5470,'Col 70 Sector ZS-E b42-1','Unknown','Col 70 Sector',242.1875,-258.125,-701.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5475,'Col 70 Sector ZT-T c18-0','Unknown','Col 70 Sector',97.03125,-259.4375,-821.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5480,'Col 70 Sector ZV-M d7-2','Unknown','Col 70 Sector',190.15625,-478.875,-925.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5485,'Col 70 Sector ZV-M d7-7','Unknown','Col 70 Sector',204.90625,-473.375,-925.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5490,'Col 70 Sector ZV-M d7-9','Unknown','Col 70 Sector',227.96875,-464,-926.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5495,'Col 70 Sector ZW-Z c14-0','Unknown','Col 70 Sector',361.8125,-444.25,-978.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5500,'Col 70 Sector ZX-D c14-4','Unknown','Col 70 Sector',446.03125,41.0625,-1023.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5505,'Col 70 Sector ZY-Q c5-8','Unknown','Col 70 Sector',676.25,-579.8125,-1378.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5510,'Col 70 Sector ZY-Q c5-9','Unknown','Col 70 Sector',693.375,-580.6875,-1375.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5515,'Col 70 Sector ZZ-K b26-1','Unknown','Col 70 Sector',520.53125,-24.28125,-1037.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5520,'Col 97 Sector AA-Y c1-0','Unknown','Col 97 Sector',936.96875,-23.34375,-2019.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5525,'Col 97 Sector AL-X d1-1','Unknown','Col 97 Sector',799.59375,81.125,-1916.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5530,'Col 97 Sector AL-X d1-3','Unknown','Col 97 Sector',775.375,68.15625,-1938.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5535,'Col 97 Sector AL-X d1-8','Unknown','Col 97 Sector',784.875,69.59375,-1868.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5540,'Col 97 Sector AN-I b10-0','Unknown','Col 97 Sector',658.96875,-124.625,-1883.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5545,'Col 97 Sector AS-T a33-0','Unknown','Col 97 Sector',1027.5,-43.71875,-1742.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5550,'Col 97 Sector BC-L c8-3','Unknown','Col 97 Sector',687.375,-140.4375,-1725.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5555,'Col 97 Sector BH-R b19-0','Unknown','Col 97 Sector',1000.3125,-83.71875,-1679.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5560,'Col 97 Sector CI-G b12-0','Unknown','Col 97 Sector',815.3125,27.5,-1839.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5565,'Col 97 Sector CQ-U b4-0','Unknown','Col 97 Sector',976.3125,40.15625,-2000.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5570,'Col 97 Sector DQ-U b4-0','Unknown','Col 97 Sector',1000.34375,40.46875,-2003.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5575,'Col 97 Sector EC-T c4-1','Unknown','Col 97 Sector',801.9375,80.40625,-1885.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5580,'Col 97 Sector EN-Q b19-0','Unknown','Col 97 Sector',908.5625,-148.15625,-1680.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5585,'Col 97 Sector EQ-U b4-0','Unknown','Col 97 Sector',1020.75,39.53125,-2003.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5590,'Col 97 Sector FM-U c3-0','Unknown','Col 97 Sector',831.84375,9.84375,-1907.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5595,'Col 97 Sector FO-F a41-0','Unknown','Col 97 Sector',755.65625,-42.8125,-1662.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5600,'Col 97 Sector FT-G b11-0','Unknown','Col 97 Sector',679.4375,-120.28125,-1862.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5605,'Col 97 Sector GI-P b20-0','Unknown','Col 97 Sector',994.0625,-90.8125,-1652.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5610,'Col 97 Sector GK-B b15-0','Unknown','Col 97 Sector',754.40625,74.25,-1772.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5615,'Col 97 Sector GM-V d2-2','Unknown','Col 97 Sector',796.25,23.40625,-1788.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5620,'Col 97 Sector GS-C a29-0','Unknown','Col 97 Sector',1048.78125,-33.21875,-1794.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5625,'Col 97 Sector GW-C b13-0','Unknown','Col 97 Sector',990.1875,-155.375,-1810.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5630,'Col 97 Sector HM-V d2-4','Unknown','Col 97 Sector',840.84375,-20.09375,-1864.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5635,'Col 97 Sector HY-F b12-0','Unknown','Col 97 Sector',836.5625,-22.5625,-1833.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5640,'Col 97 Sector HY-H c10-1','Unknown','Col 97 Sector',753.71875,-60.71875,-1647.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5645,'Col 97 Sector IX-R a34-0','Unknown','Col 97 Sector',808.6875,-44.59375,-1734.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5650,'Col 97 Sector JM-U b3-0','Unknown','Col 97 Sector',795.46875,-162.59375,-2022.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5655,'Col 97 Sector JR-J b10-0','Unknown','Col 97 Sector',1077.65625,5.4375,-1872.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5660,'Col 97 Sector JT-N b8-0','Unknown','Col 97 Sector',835.75,57.1875,-1919.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5665,'Col 97 Sector KT-H c10-0','Unknown','Col 97 Sector',790.875,-73.9375,-1664.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5670,'Col 97 Sector KZ-E b12-0','Unknown','Col 97 Sector',700.09375,-120.90625,-1839.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5675,'Col 97 Sector LP-C b14-0','Unknown','Col 97 Sector',810.90625,12.28125,-1802.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5680,'Col 97 Sector MJ-N b8-0','Unknown','Col 97 Sector',815.5,19.21875,-1921.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5685,'Col 97 Sector MZ-L b9-0','Unknown','Col 97 Sector',824.96875,59.96875,-1888.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5690,'Col 97 Sector NF-D b13-0','Unknown','Col 97 Sector',689.6875,-113.9375,-1812.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5695,'Col 97 Sector NI-T d3-11','Unknown','Col 97 Sector',687.375,-126.59375,-1753.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5700,'Col 97 Sector NZ-L b9-0','Unknown','Col 97 Sector',838.34375,57.34375,-1904.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5705,'Col 97 Sector OJ-N b8-0','Unknown','Col 97 Sector',857.6875,16.5,-1921.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5710,'Col 97 Sector OK-C b14-0','Unknown','Col 97 Sector',830.03125,-16.09375,-1804.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5715,'Col 97 Sector OL-S b18-0','Unknown','Col 97 Sector',699.15625,-132.15625,-1698.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5720,'Col 97 Sector OU-M a37-0','Unknown','Col 97 Sector',766.28125,-28.375,-1704.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5725,'Col 97 Sector OV-A b15-0','Unknown','Col 97 Sector',794.5625,11,-1771.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5730,'Col 97 Sector OX-T c3-2','Unknown','Col 97 Sector',960.21875,-141.09375,-1918.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5735,'Col 97 Sector OZ-Y a30-0','Unknown','Col 97 Sector',1033.1875,-43.9375,-1772.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5740,'Col 97 Sector PJ-P c6-1','Unknown','Col 97 Sector',815.5,22.21875,-1823.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5745,'Col 97 Sector PL-R b19-0','Unknown','Col 97 Sector',798.96875,-62.28125,-1683.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5750,'Col 97 Sector QA-C b14-0','Unknown','Col 97 Sector',778.4375,-64.34375,-1801.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5755,'Col 97 Sector QF-K b10-0','Unknown','Col 97 Sector',820.8125,56.8125,-1870.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5760,'Col 97 Sector QG-S b18-0','Unknown','Col 97 Sector',707.125,-158.125,-1701.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5765,'Col 97 Sector QS-S c4-1','Unknown','Col 97 Sector',1095.28125,3.78125,-1892.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5770,'Col 97 Sector SB-Z b15-0','Unknown','Col 97 Sector',778.9375,-3.84375,-1759.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5775,'Col 97 Sector SQ-A b15-0','Unknown','Col 97 Sector',823.25,-20.53125,-1779.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5780,'Col 97 Sector SZ-U b17-0','Unknown','Col 97 Sector',1018.78125,-62.15625,-1719.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5785,'Col 97 Sector TV-L b8-0','Unknown','Col 97 Sector',647.59375,-128.78125,-1912.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5790,'Col 97 Sector TY-Q c5-2','Unknown','Col 97 Sector',1066.71875,-9.6875,-1847.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5795,'Col 97 Sector UP-M a37-0','Unknown','Col 97 Sector',807.96875,-43.4375,-1703.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5800,'Col 97 Sector VG-J a39-0','Unknown','Col 97 Sector',756.4375,-32.65625,-1684.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5805,'Col 97 Sector VJ-X a31-0','Unknown','Col 97 Sector',815.96875,-34.96875,-1762.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5810,'Col 97 Sector VP-V a32-0','Unknown','Col 97 Sector',775.9375,-33.03125,-1746.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5815,'Col 97 Sector VR-Z b14-0','Unknown','Col 97 Sector',678.5625,-123.15625,-1783.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5820,'Col 97 Sector WG-I b11-0','Unknown','Col 97 Sector',816.25,45.0625,-1857.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5825,'Col 97 Sector WH-P b20-0','Unknown','Col 97 Sector',778.4375,-92.15625,-1645.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5830,'Col 97 Sector WQ-J b10-0','Unknown','Col 97 Sector',827.375,2,-1878.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5835,'Col 97 Sector XC-X b16-0','Unknown','Col 97 Sector',769.21875,-18.53125,-1726.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5840,'Col 97 Sector XE-P c6-3','Unknown','Col 97 Sector',1058.71875,-19.59375,-1819.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5845,'Col 97 Sector XQ-L c8-2','Unknown','Col 97 Sector',764.09375,-12.59375,-1743.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5850,'Col 97 Sector YA-T b18-0','Unknown','Col 97 Sector',1025.75,-75.375,-1691.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5855,'Col 97 Sector ZU-U b4-0','Unknown','Col 97 Sector',957.8125,55.78125,-2004.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5860,'Col 97 Sector ZW-P b7-0','Unknown','Col 97 Sector',800.53125,99.21875,-1940.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5865,'Col 121 Sector AA-D b1-0','Unknown','Col 121 Sector',1179.15625,-240.5,-1303.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5870,'Col 121 Sector AH-T c4-0','Unknown','Col 121 Sector',887.375,-289,-1136.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5875,'Col 121 Sector AP-U b5-0','Unknown','Col 121 Sector',1375.46875,-199.75,-1200.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5880,'Col 121 Sector BC-C b29-1','Unknown','Col 121 Sector',887.3125,-232.46875,-700.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5885,'Col 121 Sector BH-U b32-0','Unknown','Col 121 Sector',921.0625,-306.5625,-624.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5890,'Col 121 Sector BK-D b1-0','Unknown','Col 121 Sector',1276.5,-204.8125,-1299.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5895,'Col 121 Sector BL-P b21-0','Unknown','Col 121 Sector',835.6875,-324.65625,-862.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5900,'Col 121 Sector BV-X d1-23','Unknown','Col 121 Sector',1364.96875,-163.75,-1171.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5905,'Col 121 Sector BV-X d1-24','Unknown','Col 121 Sector',1351.4375,-154.625,-1174.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5910,'Col 121 Sector BV-Y e4','Unknown','Col 121 Sector',1284.9375,-265.5625,-1112.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5915,'Col 121 Sector CD-F b29-0','Unknown','Col 121 Sector',1018.1875,77.375,-701.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5920,'Col 121 Sector CL-X d1-10','Unknown','Col 121 Sector',1073.15625,-300.09375,-1191.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5925,'Col 121 Sector CQ-P b21-0','Unknown','Col 121 Sector',900.25,-302.15625,-861.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5930,'Col 121 Sector CQ-V c3-1','Unknown','Col 121 Sector',1364.4375,-167.78125,-1161.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5935,'Col 121 Sector CV-X d1-30','Unknown','Col 121 Sector',1376.09375,-172.46875,-1149.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5940,'Col 121 Sector CW-V d2-8','Unknown','Col 121 Sector',929.15625,-207.375,-1075.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5945,'Col 121 Sector DG-W c2-0','Unknown','Col 121 Sector',1089.8125,-417.78125,-1200.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5950,'Col 121 Sector DI-H b27-5','Unknown','Col 121 Sector',927.0625,-48.25,-741.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5955,'Col 121 Sector DL-P b21-0','Unknown','Col 121 Sector',879.03125,-313.9375,-850.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5960,'Col 121 Sector DL-R b7-0','Unknown','Col 121 Sector',1357,-163.125,-1164.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5965,'Col 121 Sector DP-C c14-10','Unknown','Col 121 Sector',853.1875,-94.46875,-722.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5970,'Col 121 Sector DQ-V c3-2','Unknown','Col 121 Sector',1385,-166.71875,-1151.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5975,'Col 121 Sector DQ-X d1-0','Unknown','Col 121 Sector',1301.25,-208.78125,-1193.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5980,'Col 121 Sector DV-P b21-0','Unknown','Col 121 Sector',958.90625,-280,-863.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5985,'Col 121 Sector DZ-D c13-1','Unknown','Col 121 Sector',823.4375,-155.84375,-747.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5990,'Col 121 Sector EG-P b21-0','Unknown','Col 121 Sector',861.28125,-329.21875,-852.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(5995,'Col 121 Sector EV-S b6-0','Unknown','Col 121 Sector',1390.84375,-186.9375,-1179.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6000,'Col 121 Sector FB-X d1-8','Unknown','Col 121 Sector',996.5,-470.6875,-1173.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6005,'Col 121 Sector FC-Q b7-0','Unknown','Col 121 Sector',1115.71875,-299.375,-1159.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6010,'Col 121 Sector FE-F c12-3','Unknown','Col 121 Sector',832.5,-283.3125,-786.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6015,'Col 121 Sector FM-N b22-0','Unknown','Col 121 Sector',800.84375,-343.9375,-842.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6020,'Col 121 Sector FM-V d2-9','Unknown','Col 121 Sector',855.53125,-367.4375,-1066.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6025,'Col 121 Sector FN-A b30-0','Unknown','Col 121 Sector',915.8125,-223.90625,-682.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6030,'Col 121 Sector FP-U c17-5','Unknown','Col 121 Sector',916.78125,-279.25,-584.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6035,'Col 121 Sector GB-W d2-14','Unknown','Col 121 Sector',1448.875,-143.53125,-1101.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6040,'Col 121 Sector GB-W d2-19','Unknown','Col 121 Sector',1420.59375,-161.4375,-1122.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6045,'Col 121 Sector GC-Z b2-0','Unknown','Col 121 Sector',1062.34375,-267.09375,-1263.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6050,'Col 121 Sector GM-N b22-0','Unknown','Col 121 Sector',819.84375,-336.71875,-844.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6055,'Col 121 Sector GU-D c13-0','Unknown','Col 121 Sector',871.75,-205.9375,-748.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6060,'Col 121 Sector GU-D c13-2','Unknown','Col 121 Sector',892.34375,-185.03125,-776.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6065,'Col 121 Sector GU-D c13-3','Unknown','Col 121 Sector',889.15625,-186.6875,-781.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6070,'Col 121 Sector GU-D c13-5','Unknown','Col 121 Sector',883.09375,-192.625,-769.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6075,'Col 121 Sector GU-D c13-6','Unknown','Col 121 Sector',875.6875,-200.8125,-758.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6080,'Col 121 Sector HA-B b15-0','Unknown','Col 121 Sector',842.125,-388.875,-999.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6085,'Col 121 Sector HF-C c14-6','Unknown','Col 121 Sector',839.5625,-167.21875,-744.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6090,'Col 121 Sector HI-P b7-0','Unknown','Col 121 Sector',996.6875,-383.84375,-1159.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6095,'Col 121 Sector HR-J b10-0','Unknown','Col 121 Sector',1207.375,-422.1875,-1093.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6100,'Col 121 Sector HR-V d2-11','Unknown','Col 121 Sector',1169.96875,-298.59375,-1136.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6105,'Col 121 Sector HY-H b26-1','Unknown','Col 121 Sector',847.8125,-175.84375,-748.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6110,'Col 121 Sector IK-U c17-2','Unknown','Col 121 Sector',936.71875,-308.71875,-581.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6115,'Col 121 Sector IL-B b2-0','Unknown','Col 121 Sector',1295.15625,-215.53125,-1281.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6120,'Col 121 Sector IN-Y b15-0','Unknown','Col 121 Sector',1138.78125,-480.71875,-980.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6125,'Col 121 Sector IR-V d2-1','Unknown','Col 121 Sector',1256.15625,-272.96875,-1120.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6130,'Col 121 Sector IW-T c4-1','Unknown','Col 121 Sector',1420.46875,-176.65625,-1140.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6135,'Col 121 Sector IX-T d3-13','Unknown','Col 121 Sector',913.53125,-338.0625,-1046.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6140,'Col 121 Sector JB-R b7-0','Unknown','Col 121 Sector',1398.28125,-185.625,-1158.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6145,'Col 121 Sector JC-T d4-18','Unknown','Col 121 Sector',1525.78125,73.40625,-947.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6150,'Col 121 Sector JE-F b28-1','Unknown','Col 121 Sector',875.90625,-99.65625,-717.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6155,'Col 121 Sector JR-P b8-0','Unknown','Col 121 Sector',1400.84375,-164.4375,-1144.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6160,'Col 121 Sector JS-T e3-7','Unknown','Col 121 Sector',897.34375,-104.40625,-705.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6165,'Col 121 Sector JV-A c15-1','Unknown','Col 121 Sector',917.15625,-100.59375,-690,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6170,'Col 121 Sector JX-T d3-13','Unknown','Col 121 Sector',988.4375,-319.875,-1049.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6175,'Col 121 Sector JX-T d3-16','Unknown','Col 121 Sector',1010.65625,-305.71875,-1060,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6180,'Col 121 Sector KA-C c14-6','Unknown','Col 121 Sector',855.8125,-201.3125,-737.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6185,'Col 121 Sector KA-C c14-7','Unknown','Col 121 Sector',856.25,-202.21875,-743.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6190,'Col 121 Sector KI-O b8-0','Unknown','Col 121 Sector',1139.1875,-304.75,-1142.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6195,'Col 121 Sector KJ-G c11-2','Unknown','Col 121 Sector',943,-419.09375,-848.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6200,'Col 121 Sector KL-Z b15-0','Unknown','Col 121 Sector',860.59375,-381.78125,-979.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6205,'Col 121 Sector KO-P c6-2','Unknown','Col 121 Sector',894.9375,-340.5,-1053.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6210,'Col 121 Sector KT-P b22-3','Unknown','Col 121 Sector',861.3125,-100.125,-829.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6215,'Col 121 Sector KX-T d3-4','Unknown','Col 121 Sector',1084.65625,-284.65625,-1062.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6220,'Col 121 Sector LM-V d2-2','Unknown','Col 121 Sector',1319.375,-417.71875,-1098.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6225,'Col 121 Sector LN-O b8-0','Unknown','Col 121 Sector',1197.96875,-283.8125,-1131.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6230,'Col 121 Sector LS-T d3-7','Unknown','Col 121 Sector',1045.4375,-389.21875,-1040.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6235,'Col 121 Sector LT-I b25-0','Unknown','Col 121 Sector',804.28125,-284.15625,-783.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6240,'Col 121 Sector LV-B c14-0','Unknown','Col 121 Sector',820.71875,-260.375,-741.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6245,'Col 121 Sector LW-Z b2-0','Unknown','Col 121 Sector',1317.96875,-203.53125,-1264.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6250,'Col 121 Sector MD-S d4-4','Unknown','Col 121 Sector',967.78125,-337.71875,-943.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6255,'Col 121 Sector MG-G b13-0','Unknown','Col 121 Sector',939.84375,-221.71875,-1040.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6260,'Col 121 Sector MN-O b8-0','Unknown','Col 121 Sector',1229.625,-284.25,-1131.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6265,'Col 121 Sector MO-N b8-0','Unknown','Col 121 Sector',1016.8125,-381.65625,-1139.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6270,'Col 121 Sector MV-B c14-4','Unknown','Col 121 Sector',861.75,-229.5625,-728.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6275,'Col 121 Sector ND-R c5-1','Unknown','Col 121 Sector',1062.5625,-383.28125,-1104.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6280,'Col 121 Sector NN-T d3-4','Unknown','Col 121 Sector',987.90625,-466.71875,-1024.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6285,'Col 121 Sector NN-T d3-5','Unknown','Col 121 Sector',993.5,-474.78125,-1032.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6290,'Col 121 Sector NT-P c6-1','Unknown','Col 121 Sector',1059.40625,-300.90625,-1063.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6295,'Col 121 Sector NY-R d4-11','Unknown','Col 121 Sector',887.0625,-374.65625,-982.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6300,'Col 121 Sector OF-D c13-1','Unknown','Col 121 Sector',948.0625,-344.5625,-782.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6305,'Col 121 Sector PD-K b24-0','Unknown','Col 121 Sector',877.46875,-313.21875,-798.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6310,'Col 121 Sector PT-R e4-6','Unknown','Col 121 Sector',935.75,-281.4375,-562.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6315,'Col 121 Sector PW-X b16-0','Unknown','Col 121 Sector',919.6875,-351.78125,-958.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6320,'Col 121 Sector PX-N b9-0','Unknown','Col 121 Sector',1438.90625,-160.53125,-1123.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6325,'Col 121 Sector QJ-Q d5-21','Unknown','Col 121 Sector',945.96875,-293.34375,-865.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6330,'Col 121 Sector QO-I b25-0','Unknown','Col 121 Sector',856.03125,-300.96875,-783.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6335,'Col 121 Sector RD-W b4-0','Unknown','Col 121 Sector',1240.96875,-224.625,-1220.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6340,'Col 121 Sector RN-S d4-26','Unknown','Col 121 Sector',1678.90625,-166.34375,-966.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6345,'Col 121 Sector RT-V b4-0','Unknown','Col 121 Sector',1159.8125,-259.5,-1222.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6350,'Col 121 Sector RT-Y c1-1','Unknown','Col 121 Sector',1061.21875,-264.1875,-1262.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6355,'Col 121 Sector RU-L b9-0','Unknown','Col 121 Sector',1036.21875,-383.3125,-1121.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6360,'Col 121 Sector RU-N b23-2','Unknown','Col 121 Sector',887.34375,-106.375,-822.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6365,'Col 121 Sector SC-F b14-0','Unknown','Col 121 Sector',1618.09375,-160,-1024.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6370,'Col 121 Sector SK-N d7-14','Unknown','Col 121 Sector',921.84375,-96.21875,-690.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6375,'Col 121 Sector SP-O d6-24','Unknown','Col 121 Sector',808,-285.3125,-799.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6380,'Col 121 Sector SP-T b5-0','Unknown','Col 121 Sector',1019.25,-303.4375,-1204.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6385,'Col 121 Sector SX-X b3-0','Unknown','Col 121 Sector',1339.3125,-208.96875,-1243.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6390,'Col 121 Sector SY-V b4-0','Unknown','Col 121 Sector',1217.125,-244.0625,-1224.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6395,'Col 121 Sector TF-N d7-41','Unknown','Col 121 Sector',848.625,-180.65625,-742.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6400,'Col 121 Sector TF-N d7-43','Unknown','Col 121 Sector',842.40625,-165.375,-744.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6405,'Col 121 Sector TI-M b10-0','Unknown','Col 121 Sector',1477.1875,-143.21875,-1090.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6410,'Col 121 Sector TR-G b12-0','Unknown','Col 121 Sector',879.53125,-362.5625,-1062.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6415,'Col 121 Sector TU-K b10-0','Unknown','Col 121 Sector',1164.4375,-287.6875,-1099,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6420,'Col 121 Sector UF-N d7-50','Unknown','Col 121 Sector',908.40625,-112.78125,-694.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6425,'Col 121 Sector UQ-B b30-0','Unknown','Col 121 Sector',936.625,-100.09375,-683.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6430,'Col 121 Sector UT-A e2','Unknown','Col 121 Sector',1207.25,-45.0625,-1243.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6435,'Col 121 Sector UW-G b12-0','Unknown','Col 121 Sector',950.40625,-340.90625,-1060.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6440,'Col 121 Sector VA-N d7-12','Unknown','Col 121 Sector',863.625,-195.53125,-743.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6445,'Col 121 Sector VA-N d7-2','Unknown','Col 121 Sector',881,-206.59375,-744.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6450,'Col 121 Sector VA-N d7-38','Unknown','Col 121 Sector',849,-241.8125,-735.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6455,'Col 121 Sector VA-N d7-39','Unknown','Col 121 Sector',833.78125,-247.65625,-737.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6460,'Col 121 Sector VG-H b12-0','Unknown','Col 121 Sector',1040.90625,-300.9375,-1063.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6465,'Col 121 Sector VH-W b17-0','Unknown','Col 121 Sector',995.8125,-342.75,-939.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6470,'Col 121 Sector VI-W b4-0','Unknown','Col 121 Sector',1359.3125,-203.3125,-1220.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6475,'Col 121 Sector VK-T b5-0','Unknown','Col 121 Sector',1046.5625,-307.0625,-1192.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6480,'Col 121 Sector WA-N d7-23','Unknown','Col 121 Sector',907.21875,-233.75,-691.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6485,'Col 121 Sector WH-F b13-0','Unknown','Col 121 Sector',939.53125,-323.03125,-1039.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6490,'Col 121 Sector WH-W b17-0','Unknown','Col 121 Sector',1020.34375,-340.625,-943.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6495,'Col 121 Sector WJ-Z d6','Unknown','Col 121 Sector',1099.25,-240.09375,-1253.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6500,'Col 121 Sector WJ-Z d7','Unknown','Col 121 Sector',1085.5,-243.09375,-1251.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6505,'Col 121 Sector WJ-Z d9','Unknown','Col 121 Sector',1109.4375,-244.4375,-1238.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6510,'Col 121 Sector WL-H b12-0','Unknown','Col 121 Sector',1105.28125,-267.09375,-1058.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6515,'Col 121 Sector WP-T b5-0','Unknown','Col 121 Sector',1098,-302.5625,-1186.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6520,'Col 121 Sector XC-Y c15-4','Unknown','Col 121 Sector',915.28125,-304.15625,-638.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6525,'Col 121 Sector XE-I b25-0','Unknown','Col 121 Sector',919.40625,-343.75,-781.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6530,'Col 121 Sector XE-X c2-3','Unknown','Col 121 Sector',1253.1875,-219.15625,-1223.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6535,'Col 121 Sector XE-Z d8','Unknown','Col 121 Sector',989.5625,-304,-1229.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6540,'Col 121 Sector XF-N c7-1','Unknown','Col 121 Sector',975.125,-462.34375,-1021.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6545,'Col 121 Sector XH-F b13-0','Unknown','Col 121 Sector',959.9375,-321.875,-1041.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6550,'Col 121 Sector XP-W c2-1','Unknown','Col 121 Sector',995.5625,-312.03125,-1221.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6555,'Col 121 Sector XT-O c7-2','Unknown','Col 121 Sector',1625.15625,-140.375,-1007.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6560,'Col 121 Sector XV-D b28-0','Unknown','Col 121 Sector',878.53125,-233.0625,-716.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6565,'Col 121 Sector YE-X c2-3','Unknown','Col 121 Sector',1285.8125,-219.65625,-1213,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6570,'Col 121 Sector YG-K c9-0','Unknown','Col 121 Sector',939.8125,-342.46875,-943.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6575,'Col 121 Sector YJ-U b5-0','Unknown','Col 121 Sector',1296.15625,-220.1875,-1201.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6580,'Col 121 Sector YL-T c4-2','Unknown','Col 121 Sector',874.75,-242.65625,-1109.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6585,'Col 121 Sector ZH-Q b35-3','Unknown','Col 121 Sector',931.125,-178.46875,-551.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6590,'Col 121 Sector ZO-A b16-0','Unknown','Col 121 Sector',880.34375,-261.21875,-980.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6595,'Col 121 Sector ZR-I c10-1','Unknown','Col 121 Sector',920.21875,-298.59375,-876.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6600,'Cone Sector AA-A e2','Unknown','Cone Sector',847.75,81.625,-2032.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6605,'Cone Sector AA-A e3','Unknown','Cone Sector',853.4375,75.28125,-2031.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6610,'Cone Sector BA-Q b5-0','Unknown','Cone Sector',936.3125,40.25,-2020.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6615,'Cone Sector BB-W b2-0','Unknown','Cone Sector',831.9375,118.15625,-2083.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6620,'Cone Sector BH-L b8-0','Unknown','Cone Sector',819.4375,98.625,-1961.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6625,'Cone Sector CC-L b8-0','Unknown','Cone Sector',797.875,79.5625,-1959.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6630,'Cone Sector CG-O b6-0','Unknown','Cone Sector',880.96875,38.03125,-2001.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6635,'Cone Sector CL-X b1-0','Unknown','Cone Sector',850.09375,76.875,-2102.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6640,'Cone Sector CM-M b7-0','Unknown','Cone Sector',796.25,39.875,-1980.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6645,'Cone Sector CQ-Y c0','Unknown','Cone Sector',845.6875,61.6875,-2071.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6650,'Cone Sector CV-Y c0','Unknown','Cone Sector',899.78125,100.15625,-2103.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6655,'Cone Sector DL-Y d10','Unknown','Cone Sector',863.75,74.3125,-2058.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6660,'Cone Sector DL-Y d11','Unknown','Cone Sector',857.15625,64.03125,-2046.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6665,'Cone Sector DL-Y d13','Unknown','Cone Sector',853.96875,85.40625,-2032.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6670,'Cone Sector DL-Y d14','Unknown','Cone Sector',857.5625,89.90625,-2032.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6675,'Cone Sector DL-Y d15','Unknown','Cone Sector',854.75,84.84375,-2031.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6680,'Cone Sector DL-Y d17','Unknown','Cone Sector',847.8125,85.375,-2030.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6685,'Cone Sector DL-Y d9','Unknown','Cone Sector',868.46875,89.25,-2057.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6690,'Cone Sector EL-Y d4','Unknown','Cone Sector',896.25,104.96875,-2079,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6695,'Cone Sector EL-Y d5','Unknown','Cone Sector',901.375,87.78125,-2083.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6700,'Cone Sector EL-Y d6','Unknown','Cone Sector',933.1875,58,-2029.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6705,'Cone Sector EL-Y d7','Unknown','Cone Sector',933.125,63.625,-2032.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6710,'Cone Sector EM-M b7-0','Unknown','Cone Sector',853.3125,52.40625,-1966.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6715,'Cone Sector EQ-Y c0','Unknown','Cone Sector',898.53125,59.15625,-2100.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6720,'Cone Sector EQ-Y c1','Unknown','Cone Sector',920.78125,62.15625,-2078.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6725,'Cone Sector FC-L b8-0','Unknown','Cone Sector',855.875,78.03125,-1954.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6730,'Cone Sector FL-X b1-0','Unknown','Cone Sector',901.0625,79.71875,-2102.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6735,'Cone Sector FL-Y c1','Unknown','Cone Sector',859.875,43.46875,-2073.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6740,'Cone Sector FM-M b7-0','Unknown','Cone Sector',862.09375,44.65625,-1973.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6745,'Cone Sector FN-J b9-0','Unknown','Cone Sector',818.25,99.59375,-1944.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6750,'Cone Sector GR-W d1-2','Unknown','Cone Sector',802.875,71.6875,-1985.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6755,'Cone Sector GW-W c1-1','Unknown','Cone Sector',845.96875,71.125,-2058.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6760,'Cone Sector GW-W c1-5','Unknown','Cone Sector',854.71875,83.875,-2025.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6765,'Cone Sector GW-W c1-6','Unknown','Cone Sector',850.5625,83.09375,-2029.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6770,'Cone Sector HR-W d1-14','Unknown','Cone Sector',846.28125,83.53125,-2021.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6775,'Cone Sector HR-W d1-15','Unknown','Cone Sector',857.84375,79.65625,-2023.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6780,'Cone Sector HR-W d1-16','Unknown','Cone Sector',850.625,87.15625,-2020.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6785,'Cone Sector HR-W d1-17','Unknown','Cone Sector',856.59375,82.8125,-2022.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6790,'Cone Sector IR-W d1-0','Unknown','Cone Sector',897.25,63.5625,-2023.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6795,'Cone Sector IW-W c1-1','Unknown','Cone Sector',913.34375,80.21875,-2056.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6800,'Cone Sector IW-W c1-2','Unknown','Cone Sector',896.53125,83.3125,-2042.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6805,'Cone Sector JR-V b2-0','Unknown','Cone Sector',896.96875,78.28125,-2074.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6810,'Cone Sector JW-V b2-0','Unknown','Cone Sector',939.625,102.28125,-2071.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6815,'Cone Sector MC-U b3-0','Unknown','Cone Sector',917.78125,96.90625,-2060.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6820,'Cone Sector MN-T c3-0','Unknown','Cone Sector',819.125,95.84375,-1979.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6825,'Cone Sector MY-I b9-0','Unknown','Cone Sector',837.5625,35.40625,-1941.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6830,'Cone Sector NC-V c2-1','Unknown','Cone Sector',939.96875,59.78125,-2018.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6835,'Cone Sector NY-I b9-0','Unknown','Cone Sector',857.25,40.09375,-1939.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6840,'Cone Sector QS-T b3-0','Unknown','Cone Sector',932.25,68.34375,-2062.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6845,'Cone Sector SO-R c4-1','Unknown','Cone Sector',840.4375,65.34375,-1939.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6850,'Cone Sector TU-O b6-0','Unknown','Cone Sector',826.8125,99.625,-1991.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6855,'Cone Sector TY-R b4-0','Unknown','Cone Sector',900.3125,57.53125,-2032.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6860,'Cone Sector YE-Q b5-0','Unknown','Cone Sector',920.75,60.125,-2023.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6865,'Cone Sector YV-M b7-0','Unknown','Cone Sector',810.125,94.34375,-1967.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6870,'Cone Sector ZF-O b6-0','Unknown','Cone Sector',816.71875,52.90625,-1995.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6875,'Cone Sector ZQ-M b7-0','Unknown','Cone Sector',779.15625,59.28125,-1983.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6880,'Horsehead Dark Region AB-W c2-0','Unknown','Horsehead Dark Sector',481.65625,-312.5625,-1298.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6885,'Horsehead Dark Region AC-S b5-0','Unknown','Horsehead Dark Sector',478.375,-322.0625,-1283.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6890,'Horsehead Dark Region AV-Y d1','Unknown','Horsehead Dark Sector',512.59375,-414.28125,-1366.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6895,'Horsehead Dark Region AV-Y d8','Unknown','Horsehead Dark Sector',561.09375,-405.5,-1373.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6900,'Horsehead Dark Region BF-O b7-0','Unknown','Horsehead Dark Sector',781.1875,-349.5625,-1228.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6905,'Horsehead Dark Region BL-X c1-0','Unknown','Horsehead Dark Sector',532.1875,-392.65625,-1314.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6910,'Horsehead Dark Region BR-U c3-11','Unknown','Horsehead Dark Sector',523.21875,-251.5,-1232.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6915,'Horsehead Dark Region CL-X c1-6','Unknown','Horsehead Dark Sector',549.84375,-408.34375,-1314.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6920,'Horsehead Dark Region CL-X d1-23','Unknown','Horsehead Dark Sector',730.875,-264.625,-1253.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6925,'Horsehead Dark Region CM-U c3-2','Unknown','Horsehead Dark Sector',459.59375,-297.71875,-1242.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6930,'Horsehead Dark Region CN-Q b6-0','Unknown','Horsehead Dark Sector',477.5,-298.125,-1263.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6935,'Horsehead Dark Region CW-V c2-0','Unknown','Horsehead Dark Sector',455.09375,-370.84375,-1267.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6940,'Horsehead Dark Region CX-R b5-0','Unknown','Horsehead Dark Sector',484.75,-327.03125,-1271.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6945,'Horsehead Dark Region DL-X c1-4','Unknown','Horsehead Dark Sector',578.03125,-416.8125,-1336.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6950,'Horsehead Dark Region DM-U c3-0','Unknown','Horsehead Dark Sector',497.75,-304.59375,-1262.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6955,'Horsehead Dark Region DQ-Y d12','Unknown','Horsehead Dark Sector',596.65625,-481.6875,-1367.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6960,'Horsehead Dark Region DQ-Y d2','Unknown','Horsehead Dark Sector',602.90625,-473.65625,-1355.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6965,'Horsehead Dark Region DR-V c2-11','Unknown','Horsehead Dark Sector',453.5625,-400.625,-1278.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6970,'Horsehead Dark Region DR-V c2-9','Unknown','Horsehead Dark Sector',451.1875,-406.15625,-1300.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6975,'Horsehead Dark Region DR-V d2-11','Unknown','Horsehead Dark Sector',483.0625,-255.75,-1184.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6980,'Horsehead Dark Region DR-V d2-3','Unknown','Horsehead Dark Sector',493.40625,-264,-1180.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6985,'Horsehead Dark Region DW-V c2-0','Unknown','Horsehead Dark Sector',500.4375,-379.4375,-1301.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6990,'Horsehead Dark Region EM-U c3-8','Unknown','Horsehead Dark Sector',538.15625,-273.1875,-1247.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(6995,'Horsehead Dark Region EM-U c3-9','Unknown','Horsehead Dark Sector',539.9375,-280.875,-1249.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7000,'Horsehead Dark Region EW-K b9-0','Unknown','Horsehead Dark Sector',720.03125,-343.3125,-1201.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7005,'Horsehead Dark Region FB-X d1-1','Unknown','Horsehead Dark Sector',642.28125,-378.375,-1280.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7010,'Horsehead Dark Region FB-X d1-10','Unknown','Horsehead Dark Sector',610.875,-423.46875,-1294.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7015,'Horsehead Dark Region FB-X d1-12','Unknown','Horsehead Dark Sector',645.78125,-378.3125,-1253.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7020,'Horsehead Dark Region FB-X d1-13','Unknown','Horsehead Dark Sector',642.65625,-371.5,-1265.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7025,'Horsehead Dark Region FB-X d1-15','Unknown','Horsehead Dark Sector',652.28125,-400.59375,-1298.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7030,'Horsehead Dark Region FB-X d1-16','Unknown','Horsehead Dark Sector',647.375,-405.59375,-1294.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7035,'Horsehead Dark Region FB-X d1-17','Unknown','Horsehead Dark Sector',635.8125,-398.46875,-1301.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7040,'Horsehead Dark Region FB-X d1-18','Unknown','Horsehead Dark Sector',649.1875,-412.03125,-1290.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7045,'Horsehead Dark Region FB-X d1-2','Unknown','Horsehead Dark Sector',652.28125,-382.46875,-1284.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7050,'Horsehead Dark Region FB-X d1-7','Unknown','Horsehead Dark Sector',640.09375,-355.8125,-1244,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7055,'Horsehead Dark Region FD-P b7-0','Unknown','Horsehead Dark Sector',535.84375,-254.34375,-1242.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7060,'Horsehead Dark Region FG-X c1-2','Unknown','Horsehead Dark Sector',594.96875,-446.5,-1338,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7065,'Horsehead Dark Region FH-U c3-0','Unknown','Horsehead Dark Sector',506.5625,-334.125,-1239.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7070,'Horsehead Dark Region FM-V d2-19','Unknown','Horsehead Dark Sector',457.65625,-335,-1150.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7075,'Horsehead Dark Region FM-V d2-8','Unknown','Horsehead Dark Sector',446.6875,-329.5,-1190.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7080,'Horsehead Dark Region FO-N b8-0','Unknown','Horsehead Dark Sector',497.1875,-242.28125,-1222.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7085,'Horsehead Dark Region FR-V c2-1','Unknown','Horsehead Dark Sector',522.53125,-411.90625,-1284.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7090,'Horsehead Dark Region FR-V c2-2','Unknown','Horsehead Dark Sector',519.71875,-401.84375,-1291.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7095,'Horsehead Dark Region FW-W d1-16','Unknown','Horsehead Dark Sector',432.75,-488.84375,-1239,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7100,'Horsehead Dark Region FX-S c4-4','Unknown','Horsehead Dark Sector',502.78125,-236.40625,-1220.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7105,'Horsehead Dark Region FX-S c4-6','Unknown','Horsehead Dark Sector',498.9375,-244.4375,-1223.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7110,'Horsehead Dark Region GB-X d1-10','Unknown','Horsehead Dark Sector',662.46875,-405.59375,-1279.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7115,'Horsehead Dark Region GB-X d1-11','Unknown','Horsehead Dark Sector',659.125,-414.25,-1242.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7120,'Horsehead Dark Region GB-X d1-12','Unknown','Horsehead Dark Sector',673.34375,-394.34375,-1235.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7125,'Horsehead Dark Region GB-X d1-14','Unknown','Horsehead Dark Sector',687.71875,-393.09375,-1246.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7130,'Horsehead Dark Region GB-X d1-3','Unknown','Horsehead Dark Sector',694.5625,-398.21875,-1273.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7135,'Horsehead Dark Region GB-X d1-6','Unknown','Horsehead Dark Sector',655.6875,-393.3125,-1257.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7140,'Horsehead Dark Region GC-T b4-0','Unknown','Horsehead Dark Sector',518.46875,-400.53125,-1302.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7145,'Horsehead Dark Region GC-U c3-7','Unknown','Horsehead Dark Sector',466.4375,-381.28125,-1246.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7150,'Horsehead Dark Region GC-U c3-8','Unknown','Horsehead Dark Sector',457.25,-376.6875,-1225.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7155,'Horsehead Dark Region GM-U c3-4','Unknown','Horsehead Dark Sector',631.3125,-302.90625,-1242.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7160,'Horsehead Dark Region GM-U c3-5','Unknown','Horsehead Dark Sector',644.125,-274.5,-1233.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7165,'Horsehead Dark Region GM-U c3-8','Unknown','Horsehead Dark Sector',632.0625,-303.4375,-1235.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7170,'Horsehead Dark Region GO-N b8-0','Unknown','Horsehead Dark Sector',515.625,-239.53125,-1224.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7175,'Horsehead Dark Region GR-V c2-5','Unknown','Horsehead Dark Sector',545.5625,-422,-1303.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7180,'Horsehead Dark Region GR-V d2-20','Unknown','Horsehead Dark Sector',669.53125,-250.78125,-1214.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7185,'Horsehead Dark Region GR-V d2-23','Unknown','Horsehead Dark Sector',695.8125,-231.71875,-1192.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7190,'Horsehead Dark Region HB-O c6-11','Unknown','Horsehead Dark Sector',738.53125,-529.5,-1143.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7195,'Horsehead Dark Region HB-X d1-0','Unknown','Horsehead Dark Sector',749.34375,-351.375,-1249.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7200,'Horsehead Dark Region HB-X d1-1','Unknown','Horsehead Dark Sector',743.34375,-357.1875,-1245.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7205,'Horsehead Dark Region HG-X c1-5','Unknown','Horsehead Dark Sector',676.46875,-456.15625,-1309.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7210,'Horsehead Dark Region HH-V d2-2','Unknown','Horsehead Dark Sector',435.65625,-347.21875,-1169.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7215,'Horsehead Dark Region HJ-N b8-0','Unknown','Horsehead Dark Sector',495.34375,-263.46875,-1221.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7220,'Horsehead Dark Region HM-V c2-3','Unknown','Horsehead Dark Sector',502.8125,-453.375,-1278.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7225,'Horsehead Dark Region HR-V c2-3','Unknown','Horsehead Dark Sector',579.78125,-421.8125,-1265.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7230,'Horsehead Dark Region HW-W d1-12','Unknown','Horsehead Dark Sector',648.09375,-430.9375,-1299.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7235,'Horsehead Dark Region HX-T c3-3','Unknown','Horsehead Dark Sector',446.84375,-398.03125,-1241.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7240,'Horsehead Dark Region HX-T c3-7','Unknown','Horsehead Dark Sector',445.1875,-392.34375,-1231.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7245,'Horsehead Dark Region HX-T c3-8','Unknown','Horsehead Dark Sector',445.34375,-390.28125,-1237.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7250,'Horsehead Dark Region IH-U c3-8','Unknown','Horsehead Dark Sector',638.25,-339.9375,-1239.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7255,'Horsehead Dark Region IM-U c3-6','Unknown','Horsehead Dark Sector',721.40625,-287,-1236.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7260,'Horsehead Dark Region IM-V c2-2','Unknown','Horsehead Dark Sector',538.78125,-446.5,-1299.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7265,'Horsehead Dark Region IM-V c2-7','Unknown','Horsehead Dark Sector',566.40625,-448.21875,-1281.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7270,'Horsehead Dark Region IM-V d2-14','Unknown','Horsehead Dark Sector',704.40625,-316.71875,-1196.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7275,'Horsehead Dark Region IN-S c4-10','Unknown','Horsehead Dark Sector',493.1875,-330.84375,-1185.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7280,'Horsehead Dark Region IO-O b7-0','Unknown','Horsehead Dark Sector',491.96875,-318.375,-1237.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7285,'Horsehead Dark Region IR-V c2-0','Unknown','Horsehead Dark Sector',654.78125,-423.6875,-1287.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7290,'Horsehead Dark Region IR-V c2-1','Unknown','Horsehead Dark Sector',642.1875,-395.46875,-1284.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7295,'Horsehead Dark Region IR-V c2-10','Unknown','Horsehead Dark Sector',644.5625,-424.5625,-1285.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7300,'Horsehead Dark Region IR-V c2-11','Unknown','Horsehead Dark Sector',646.90625,-422.09375,-1285.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7305,'Horsehead Dark Region IR-V c2-4','Unknown','Horsehead Dark Sector',630.6875,-420.5625,-1268.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7310,'Horsehead Dark Region IR-V c2-5','Unknown','Horsehead Dark Sector',631,-418.8125,-1270.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7315,'Horsehead Dark Region IR-V c2-8','Unknown','Horsehead Dark Sector',650.75,-387.25,-1268.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7320,'Horsehead Dark Region IR-V c2-9','Unknown','Horsehead Dark Sector',649.625,-423.53125,-1281.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7325,'Horsehead Dark Region IW-V c2-7','Unknown','Horsehead Dark Sector',712.625,-384.5625,-1273.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7330,'Horsehead Dark Region IW-V c2-8','Unknown','Horsehead Dark Sector',716.28125,-382.75,-1275.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7335,'Horsehead Dark Region IW-W d1-11','Unknown','Horsehead Dark Sector',696.25,-445.5625,-1263.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7340,'Horsehead Dark Region IW-W d1-3','Unknown','Horsehead Dark Sector',726.875,-435.5625,-1252.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7345,'Horsehead Dark Region IW-W d1-6','Unknown','Horsehead Dark Sector',687.21875,-470.84375,-1292.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7350,'Horsehead Dark Region IX-T c3-2','Unknown','Horsehead Dark Sector',457.1875,-396.28125,-1257.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7355,'Horsehead Dark Region IX-T c3-4','Unknown','Horsehead Dark Sector',463.4375,-395.28125,-1262.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7360,'Horsehead Dark Region JB-X c1-1','Unknown','Horsehead Dark Sector',667.59375,-467.84375,-1315.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7365,'Horsehead Dark Region JB-X c1-3','Unknown','Horsehead Dark Sector',666.78125,-474.96875,-1325.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7370,'Horsehead Dark Region JH-J b10-0','Unknown','Horsehead Dark Sector',776.09375,-313.65625,-1176.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7375,'Horsehead Dark Region JM-V c2-5','Unknown','Horsehead Dark Sector',614.375,-433.15625,-1284.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7380,'Horsehead Dark Region JM-V c2-6','Unknown','Horsehead Dark Sector',582.34375,-425.9375,-1294.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7385,'Horsehead Dark Region JR-V c2-7','Unknown','Horsehead Dark Sector',681,-420.96875,-1294.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7390,'Horsehead Dark Region JR-V c2-8','Unknown','Horsehead Dark Sector',675.46875,-421.03125,-1291,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7395,'Horsehead Dark Region JR-V c2-9','Unknown','Horsehead Dark Sector',676.125,-418.09375,-1296.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7400,'Horsehead Dark Region JR-W d1-1','Unknown','Horsehead Dark Sector',607.9375,-573.09375,-1229.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7405,'Horsehead Dark Region JR-W d1-7','Unknown','Horsehead Dark Sector',644.3125,-507.96875,-1304.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7410,'Horsehead Dark Region JR-W d1-9','Unknown','Horsehead Dark Sector',642.65625,-516.4375,-1293.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7415,'Horsehead Dark Region JW-V c2-4','Unknown','Horsehead Dark Sector',766.71875,-373.5625,-1281.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7420,'Horsehead Dark Region JW-W d1-4','Unknown','Horsehead Dark Sector',757.71875,-428.21875,-1244.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7425,'Horsehead Dark Region JX-S c4-0','Unknown','Horsehead Dark Sector',655.375,-260.21875,-1220.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7430,'Horsehead Dark Region JX-S c4-1','Unknown','Horsehead Dark Sector',685.90625,-235.46875,-1223.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7435,'Horsehead Dark Region KC-U c3-9','Unknown','Horsehead Dark Sector',639.78125,-366.8125,-1237.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7440,'Horsehead Dark Region KH-U c3-11','Unknown','Horsehead Dark Sector',701.4375,-310,-1237.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7445,'Horsehead Dark Region KH-V c2-8','Unknown','Horsehead Dark Sector',552.875,-465.0625,-1296.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7450,'Horsehead Dark Region KI-S c4-9','Unknown','Horsehead Dark Sector',456.84375,-356.125,-1222.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7455,'Horsehead Dark Region KM-V c2-10','Unknown','Horsehead Dark Sector',647.6875,-453.65625,-1296.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7460,'Horsehead Dark Region KM-V c2-4','Unknown','Horsehead Dark Sector',625.28125,-442,-1302.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7465,'Horsehead Dark Region KM-V c2-9','Unknown','Horsehead Dark Sector',646.34375,-454.0625,-1300.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7470,'Horsehead Dark Region KR-W d1-6','Unknown','Horsehead Dark Sector',708.8125,-522.65625,-1296.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7475,'Horsehead Dark Region KW-W c1-3','Unknown','Horsehead Dark Sector',636.84375,-524.75,-1309.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7480,'Horsehead Dark Region KZ-C b14-0','Unknown','Horsehead Dark Sector',639.90625,-242.1875,-1104.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7485,'Horsehead Dark Region LD-S c4-11','Unknown','Horsehead Dark Sector',452.03125,-401.125,-1196.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7490,'Horsehead Dark Region LD-S c4-7','Unknown','Horsehead Dark Sector',449.9375,-387.6875,-1210.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7495,'Horsehead Dark Region LM-V c2-1','Unknown','Horsehead Dark Sector',662.125,-437.59375,-1267.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7500,'Horsehead Dark Region LM-V c2-10','Unknown','Horsehead Dark Sector',668.0625,-446.96875,-1293.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7505,'Horsehead Dark Region LM-V c2-2','Unknown','Horsehead Dark Sector',659.5,-442.8125,-1273.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7510,'Horsehead Dark Region LM-V c2-3','Unknown','Horsehead Dark Sector',657.0625,-444.96875,-1279.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7515,'Horsehead Dark Region LM-V c2-4','Unknown','Horsehead Dark Sector',662.15625,-439.21875,-1276.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7520,'Horsehead Dark Region LM-V c2-5','Unknown','Horsehead Dark Sector',687.65625,-446.375,-1283.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7525,'Horsehead Dark Region LM-V c2-6','Unknown','Horsehead Dark Sector',681.5625,-447.28125,-1289.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7530,'Horsehead Dark Region MC-U c3-2','Unknown','Horsehead Dark Sector',697.1875,-372.3125,-1228.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7535,'Horsehead Dark Region MC-U c3-6','Unknown','Horsehead Dark Sector',716.46875,-352.3125,-1245.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7540,'Horsehead Dark Region MM-V c2-6','Unknown','Horsehead Dark Sector',715.84375,-446.15625,-1270.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7545,'Horsehead Dark Region MN-S c4-6','Unknown','Horsehead Dark Sector',638.03125,-324.875,-1224.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7550,'Horsehead Dark Region MO-O b7-0','Unknown','Horsehead Dark Sector',560.28125,-322.34375,-1242.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7555,'Horsehead Dark Region MO-P b6-0','Unknown','Horsehead Dark Sector',476.71875,-399.0625,-1262.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7560,'Horsehead Dark Region MP-M b8-0','Unknown','Horsehead Dark Sector',450.21875,-341.6875,-1207.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7565,'Horsehead Dark Region MR-W c1-4','Unknown','Horsehead Dark Sector',636.71875,-555.3125,-1315.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7570,'Horsehead Dark Region MS-T c3-0','Unknown','Horsehead Dark Sector',570.5,-430.90625,-1258.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7575,'Horsehead Dark Region MS-T c3-10','Unknown','Horsehead Dark Sector',565.90625,-446.28125,-1251.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7580,'Horsehead Dark Region MT-Q c5-2','Unknown','Horsehead Dark Sector',478.15625,-326.65625,-1184.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7585,'Horsehead Dark Region MT-Q c5-3','Unknown','Horsehead Dark Sector',455.8125,-330.1875,-1185,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7590,'Horsehead Dark Region MX-T c3-1','Unknown','Horsehead Dark Sector',618.71875,-423.625,-1262.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7595,'Horsehead Dark Region NC-U c3-0','Unknown','Horsehead Dark Sector',736.0625,-380.375,-1263.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7600,'Horsehead Dark Region NC-U c3-7','Unknown','Horsehead Dark Sector',769.0625,-359.46875,-1237.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7605,'Horsehead Dark Region ND-R c5-8','Unknown','Horsehead Dark Sector',671.40625,-228.78125,-1151.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7610,'Horsehead Dark Region NH-V c2-3','Unknown','Horsehead Dark Sector',690.09375,-500.21875,-1286.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7615,'Horsehead Dark Region NJ-O b7-0','Unknown','Horsehead Dark Sector',546.96875,-330.65625,-1228.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7620,'Horsehead Dark Region NO-O b7-0','Unknown','Horsehead Dark Sector',576.65625,-320.8125,-1242.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7625,'Horsehead Dark Region NX-T c3-0','Unknown','Horsehead Dark Sector',671.25,-423.9375,-1245.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7630,'Horsehead Dark Region NX-T c3-10','Unknown','Horsehead Dark Sector',664.03125,-407.15625,-1255.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7635,'Horsehead Dark Region NX-T c3-11','Unknown','Horsehead Dark Sector',658.9375,-405.40625,-1254.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7640,'Horsehead Dark Region NX-T c3-8','Unknown','Horsehead Dark Sector',672.75,-415.90625,-1263.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7645,'Horsehead Dark Region NX-T c3-9','Unknown','Horsehead Dark Sector',660.875,-415.28125,-1260.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7650,'Horsehead Dark Region OC-V c2-6','Unknown','Horsehead Dark Sector',645.96875,-521.5625,-1278.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7655,'Horsehead Dark Region OC-V c2-9','Unknown','Horsehead Dark Sector',644,-543.78125,-1302.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7660,'Horsehead Dark Region OS-T c3-10','Unknown','Horsehead Dark Sector',644.71875,-459.875,-1246.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7665,'Horsehead Dark Region OS-T c3-6','Unknown','Horsehead Dark Sector',653.4375,-426.25,-1262.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7670,'Horsehead Dark Region OS-T c3-7','Unknown','Horsehead Dark Sector',652.375,-427.09375,-1264.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7675,'Horsehead Dark Region OT-O b7-0','Unknown','Horsehead Dark Sector',639.46875,-291.625,-1241.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7680,'Horsehead Dark Region OX-U c2-0','Unknown','Horsehead Dark Sector',537.375,-555.78125,-1274.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7685,'Horsehead Dark Region OX-U c2-4','Unknown','Horsehead Dark Sector',561.34375,-572.25,-1280.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7690,'Horsehead Dark Region OX-U d2-11','Unknown','Horsehead Dark Sector',687.75,-558.9375,-1212.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7695,'Horsehead Dark Region PJ-N b8-0','Unknown','Horsehead Dark Sector',673.5,-247.125,-1211.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7700,'Horsehead Dark Region PN-S c4-0','Unknown','Horsehead Dark Sector',737.09375,-343.6875,-1224.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7705,'Horsehead Dark Region PN-T c3-9','Unknown','Horsehead Dark Sector',603.15625,-487.5625,-1246.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7710,'Horsehead Dark Region PN-T d3-4','Unknown','Horsehead Dark Sector',786.75,-357.03125,-1133.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7715,'Horsehead Dark Region PP-M b8-0','Unknown','Horsehead Dark Sector',499.59375,-339.5,-1220.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7720,'Horsehead Dark Region PS-T c3-1','Unknown','Horsehead Dark Sector',666.34375,-443.625,-1258.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7725,'Horsehead Dark Region PS-T c3-2','Unknown','Horsehead Dark Sector',667.53125,-440.65625,-1243.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7730,'Horsehead Dark Region PT-R c4-10','Unknown','Horsehead Dark Sector',426.15625,-466.6875,-1192.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7735,'Horsehead Dark Region PT-R c4-4','Unknown','Horsehead Dark Sector',431.78125,-479.5,-1211.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7740,'Horsehead Dark Region PU-M b8-0','Unknown','Horsehead Dark Sector',538.53125,-322.78125,-1224.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7745,'Horsehead Dark Region QJ-P c6-4','Unknown','Horsehead Dark Sector',648.75,-241.25,-1134.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7750,'Horsehead Dark Region QO-O b7-0','Unknown','Horsehead Dark Sector',640.28125,-323.75,-1239.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7755,'Horsehead Dark Region QS-T c3-3','Unknown','Horsehead Dark Sector',724.3125,-448.625,-1239.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7760,'Horsehead Dark Region RD-T c3-5','Unknown','Horsehead Dark Sector',525.84375,-561.625,-1248.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7765,'Horsehead Dark Region RI-T c3-5','Unknown','Horsehead Dark Sector',604.375,-509.15625,-1248.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7770,'Horsehead Dark Region SA-L b9-0','Unknown','Horsehead Dark Sector',534.875,-318.40625,-1203.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7775,'Horsehead Dark Region SG-I b11-0','Unknown','Horsehead Dark Sector',526.40625,-242.53125,-1159.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7780,'Horsehead Dark Region SP-V b3-0','Unknown','Horsehead Dark Sector',485.09375,-308.375,-1311.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7785,'Horsehead Dark Region TV-K b9-0','Unknown','Horsehead Dark Sector',496.53125,-341.71875,-1199.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7790,'Horsehead Dark Region TZ-P c5-3','Unknown','Horsehead Dark Sector',425.125,-469.5625,-1167.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7795,'Horsehead Dark Region VJ-R c4-5','Unknown','Horsehead Dark Sector',531.5625,-559.25,-1217.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7800,'Horsehead Dark Region VO-Q c5-7','Unknown','Horsehead Dark Sector',746.84375,-365.53125,-1174.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7805,'Horsehead Dark Region VP-L b9-0','Unknown','Horsehead Dark Sector',697.3125,-263.21875,-1199.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7810,'Horsehead Dark Region WU-M b8-0','Unknown','Horsehead Dark Sector',676.65625,-320.625,-1221.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7815,'Horsehead Dark Region XE-Z c5','Unknown','Horsehead Dark Sector',533.53125,-404.9375,-1372.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7820,'Horsehead Dark Region XY-P b6-0','Unknown','Horsehead Dark Sector',776.9375,-359.09375,-1262.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7825,'Horsehead Dark Region YE-Z c9','Unknown','Horsehead Dark Sector',548.1875,-416.6875,-1365.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7830,'Horsehead Dark Region YJ-O b7-0','Unknown','Horsehead Dark Sector',759.3125,-344.375,-1242.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7835,'Horsehead Dark Region YL-I b11-0','Unknown','Horsehead Dark Sector',680.375,-223.84375,-1162.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7840,'Horsehead Dark Region ZE-Q c5-7','Unknown','Horsehead Dark Sector',748.21875,-448.5,-1174.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7845,'Horsehead Dark Region ZG-S b5-0','Unknown','Horsehead Dark Sector',513.5,-298.15625,-1284.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7850,'M41 Sector DB-O b22-0','Unknown','M41 Sector',1477.15625,-299.875,-1281.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7855,'M41 Sector DD-G c12-7','Unknown','M41 Sector',1755.59375,-127.96875,-1250.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7860,'M41 Sector FM-U d3-11','Unknown','M41 Sector',1825.75,-121.46875,-1442.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7865,'M41 Sector MV-P b8-0','Unknown','M41 Sector',1576.03125,-159.53125,-1579.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7870,'M41 Sector OT-Z b29-0','Unknown','M41 Sector',1539.09375,-324.6875,-1122.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7875,'M41 Sector PZ-O d6-17','Unknown','M41 Sector',1502.34375,-261.6875,-1224.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7880,'M41 Sector QF-M c8-1','Unknown','M41 Sector',1456.375,-342.09375,-1422.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7885,'M41 Sector QI-W b4-0','Unknown','M41 Sector',1855.09375,-220.28125,-1662.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7890,'M41 Sector QO-X c2-0','Unknown','M41 Sector',1725.28125,-182.125,-1652.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7895,'M41 Sector UL-G b13-0','Unknown','M41 Sector',1739.65625,-224.21875,-1483.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7900,'M41 Sector XJ-Z d5','Unknown','M41 Sector',1779.28125,-303.53125,-1646.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7905,'M41 Sector XO-P c6-1','Unknown','M41 Sector',2012.0625,-380.875,-1494.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7910,'M41 Sector ZT-S b19-0','Unknown','M41 Sector',1519.25,-363.25,-1339.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7915,'NGC 1647 Sector KI-R c5-1','Unknown','NGC 1647 Sector',17.90625,-340.40625,-1662.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7920,'NGC 1647 Sector KS-T d3-2','Unknown','NGC 1647 Sector',0.75,-388.5,-1591.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7925,'NGC 1647 Sector QI-T d3-3','Unknown','NGC 1647 Sector',117.125,-525.09375,-1595.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7930,'NGC 2264 Sector AA-Q b21-0','Unknown','NGC 2264 Sector',496.96875,39.4375,-2061.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7935,'NGC 2264 Sector AG-F b27-0','Unknown','NGC 2264 Sector',497.34375,33.1875,-1942.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7940,'NGC 2264 Sector AG-H b26-0','Unknown','NGC 2264 Sector',1136.0625,36.21875,-1961.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7945,'NGC 2264 Sector AG-W b44-0','Unknown','NGC 2264 Sector',736.0625,-141.9375,-1564.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7950,'NGC 2264 Sector AH-L d8-2','Unknown','NGC 2264 Sector',514.59375,39.5625,-1859.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7955,'NGC 2264 Sector AO-W c16-0','Unknown','NGC 2264 Sector',515.28125,30.65625,-1809.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7960,'NGC 2264 Sector AO-W c16-2','Unknown','NGC 2264 Sector',520.8125,39.1875,-1818.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7965,'NGC 2264 Sector AV-O d6-18','Unknown','NGC 2264 Sector',1161.1875,41.9375,-1972.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7970,'NGC 2264 Sector AZ-B b28-0','Unknown','NGC 2264 Sector',619.40625,-141.6875,-1921,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7975,'NGC 2264 Sector BF-B a86-0','Unknown','NGC 2264 Sector',567.40625,-43,-1604.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7980,'NGC 2264 Sector BG-W d2-1','Unknown','NGC 2264 Sector',780.78125,169.1875,-2331.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7985,'NGC 2264 Sector BK-F c12-0','Unknown','NGC 2264 Sector',1353.21875,38.75,-1999.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7990,'NGC 2264 Sector BU-K b24-0','Unknown','NGC 2264 Sector',1317.59375,39.125,-2001.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(7995,'NGC 2264 Sector BW-V b18-0','Unknown','NGC 2264 Sector',372.8125,114.84375,-2119.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8000,'NGC 2264 Sector CE-L b10-0','Unknown','NGC 2264 Sector',467.6875,48.4375,-2298.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8005,'NGC 2264 Sector CE-L b10-1','Unknown','NGC 2264 Sector',469.21875,48.59375,-2302.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8010,'NGC 2264 Sector CE-V c17-0','Unknown','NGC 2264 Sector',578.15625,96.59375,-1782.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8015,'NGC 2264 Sector CJ-W c16-1','Unknown','NGC 2264 Sector',503.09375,4.28125,-1787.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8020,'NGC 2264 Sector CV-O d6-17','Unknown','NGC 2264 Sector',1340.1875,37.375,-2000.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8025,'NGC 2264 Sector CW-K c9-0','Unknown','NGC 2264 Sector',905.84375,80.03125,-2135.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8030,'NGC 2264 Sector CX-S b33-0','Unknown','NGC 2264 Sector',500.84375,19.15625,-1801.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8035,'NGC 2264 Sector DA-S b20-0','Unknown','NGC 2264 Sector',1203.65625,72.9375,-2069.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8040,'NGC 2264 Sector DJ-F a70-1','Unknown','NGC 2264 Sector',512.1875,-28.59375,-1773.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8045,'NGC 2264 Sector DO-F b41-0','Unknown','NGC 2264 Sector',555.21875,112.125,-1630.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8050,'NGC 2264 Sector DR-D b28-0','Unknown','NGC 2264 Sector',519.71875,38.96875,-1922.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8055,'NGC 2264 Sector DS-R c5-1','Unknown','NGC 2264 Sector',477.4375,25.15625,-2265.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8060,'NGC 2264 Sector DS-R c5-2','Unknown','NGC 2264 Sector',475.0625,28.65625,-2270.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8065,'NGC 2264 Sector EG-E b28-0','Unknown','NGC 2264 Sector',657.1875,100.78125,-1924.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8070,'NGC 2264 Sector EG-O b22-0','Unknown','NGC 2264 Sector',500.5625,38.65625,-2043.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8075,'NGC 2264 Sector EL-A b29-0','Unknown','NGC 2264 Sector',1175.65625,-120.9375,-1900.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8080,'NGC 2264 Sector EN-J d9-15','Unknown','NGC 2264 Sector',505,-16,-1778.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8085,'NGC 2264 Sector EP-U a75-0','Unknown','NGC 2264 Sector',518.125,-41.1875,-1710.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8090,'NGC 2264 Sector FB-R b33-0','Unknown','NGC 2264 Sector',1197.71875,-165.9375,-1787.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8095,'NGC 2264 Sector FC-U d3-6','Unknown','NGC 2264 Sector',471.5625,29.90625,-2243.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8100,'NGC 2264 Sector FH-F b27-0','Unknown','NGC 2264 Sector',1119,19.21875,-1943.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8105,'NGC 2264 Sector FL-G b39-0','Unknown','NGC 2264 Sector',717.96875,-180.9375,-1683.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8110,'NGC 2264 Sector FW-T c17-0','Unknown','NGC 2264 Sector',1197.65625,-172.15625,-1766.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8115,'NGC 2264 Sector GB-V c16-1','Unknown','NGC 2264 Sector',1140.21875,-271.65625,-1802.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8120,'NGC 2264 Sector GF-Y b43-0','Unknown','NGC 2264 Sector',984.40625,-112.71875,-1578.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8125,'NGC 2264 Sector GG-Q b21-0','Unknown','NGC 2264 Sector',1184.3125,64.9375,-2046.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8130,'NGC 2264 Sector GI-J d9-7','Unknown','NGC 2264 Sector',518.125,-29.875,-1759.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8135,'NGC 2264 Sector GK-J b11-0','Unknown','NGC 2264 Sector',470.09375,36.0625,-2278.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8140,'NGC 2264 Sector GP-U c17-0','Unknown','NGC 2264 Sector',511.28125,-21.71875,-1777.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8145,'NGC 2264 Sector GP-U c17-1','Unknown','NGC 2264 Sector',510.8125,-17.71875,-1776.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8150,'NGC 2264 Sector GU-D b42-0','Unknown','NGC 2264 Sector',539.5625,113.84375,-1618.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8155,'NGC 2264 Sector GV-Y b16-0','Unknown','NGC 2264 Sector',498.375,38.09375,-2159.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8160,'NGC 2264 Sector GY-H d10-7','Unknown','NGC 2264 Sector',559.15625,110.8125,-1661,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8165,'NGC 2264 Sector HE-N c21-3','Unknown','NGC 2264 Sector',780.59375,-101.40625,-1623.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8170,'NGC 2264 Sector HG-G b39-0','Unknown','NGC 2264 Sector',726.15625,-203.53125,-1668.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8175,'NGC 2264 Sector HJ-G b40-0','Unknown','NGC 2264 Sector',515.5625,-1.875,-1663,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8180,'NGC 2264 Sector HK-J b11-0','Unknown','NGC 2264 Sector',475.03125,38.3125,-2284.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8185,'NGC 2264 Sector HM-M b23-0','Unknown','NGC 2264 Sector',490.5625,44.21875,-2017.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8190,'NGC 2264 Sector HM-V d2-6','Unknown','NGC 2264 Sector',600,-150.15625,-2288.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8195,'NGC 2264 Sector HW-Q b33-0','Unknown','NGC 2264 Sector',1199.21875,-203.1875,-1803.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8200,'NGC 2264 Sector HW-Z b2-0','Unknown','NGC 2264 Sector',812.15625,96.78125,-2456.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8205,'NGC 2264 Sector HX-B b29-0','Unknown','NGC 2264 Sector',518.5625,39.28125,-1899.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8210,'NGC 2264 Sector HY-P b35-0','Unknown','NGC 2264 Sector',574.25,92.15625,-1758.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8215,'NGC 2264 Sector IF-T c18-1','Unknown','NGC 2264 Sector',578.0625,91.46875,-1727.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8220,'NGC 2264 Sector IM-M b23-0','Unknown','NGC 2264 Sector',500.25,38.53125,-2023.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8225,'NGC 2264 Sector IO-H b39-0','Unknown','NGC 2264 Sector',510.46875,-62.5625,-1668.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8230,'NGC 2264 Sector IP-D a71-0','Unknown','NGC 2264 Sector',517.46875,-34.9375,-1763.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8235,'NGC 2264 Sector IV-S a76-0','Unknown','NGC 2264 Sector',517.8125,-43.0625,-1704.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8240,'NGC 2264 Sector IY-H d10-2','Unknown','NGC 2264 Sector',691.09375,98.09375,-1636.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8245,'NGC 2264 Sector IY-Q b34-0','Unknown','NGC 2264 Sector',500.40625,-4.59375,-1782.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8250,'NGC 2264 Sector JC-S c18-0','Unknown','NGC 2264 Sector',1179,-182.625,-1742.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8255,'NGC 2264 Sector JH-C b29-0','Unknown','NGC 2264 Sector',641.4375,87.3125,-1904.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8260,'NGC 2264 Sector JH-X b17-0','Unknown','NGC 2264 Sector',1043.375,69.9375,-2135.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8265,'NGC 2264 Sector JM-Q b33-0','Unknown','NGC 2264 Sector',1159.875,-243.09375,-1799.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8270,'NGC 2264 Sector JN-M b23-0','Unknown','NGC 2264 Sector',1035.375,39.40625,-2020.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8275,'NGC 2264 Sector JR-M d7-4','Unknown','NGC 2264 Sector',1269.5,-135.375,-1869.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8280,'NGC 2264 Sector JS-M b23-0','Unknown','NGC 2264 Sector',1076.84375,56.5,-2021.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8285,'NGC 2264 Sector JV-O b22-0','Unknown','NGC 2264 Sector',716.46875,107.75,-2040.34375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8290,'NGC 2264 Sector KB-X b17-0','Unknown','NGC 2264 Sector',497.65625,37.90625,-2140,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8295,'NGC 2264 Sector KD-I d10-9','Unknown','NGC 2264 Sector',1037.125,182.0625,-1704.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8300,'NGC 2264 Sector KG-N b23-0','Unknown','NGC 2264 Sector',700.65625,119.46875,-2020.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8305,'NGC 2264 Sector KH-Q b33-0','Unknown','NGC 2264 Sector',1146,-256.5625,-1789.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8310,'NGC 2264 Sector KH-V e2-0','Unknown','NGC 2264 Sector',977.25,108.3125,-2083.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8315,'NGC 2264 Sector KH-X b17-0','Unknown','NGC 2264 Sector',1066.71875,73.1875,-2132.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8320,'NGC 2264 Sector KI-D b28-0','Unknown','NGC 2264 Sector',1113.71875,14.5,-1913.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8325,'NGC 2264 Sector KM-X b17-0','Unknown','NGC 2264 Sector',1095.84375,77.71875,-2139.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8330,'NGC 2264 Sector KN-M b23-0','Unknown','NGC 2264 Sector',1059.03125,40.53125,-2020.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8335,'NGC 2264 Sector KO-H d10-6','Unknown','NGC 2264 Sector',514.71875,-62.21875,-1679.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8340,'NGC 2264 Sector KO-H d10-7','Unknown','NGC 2264 Sector',512.21875,-50.84375,-1690.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8345,'NGC 2264 Sector KQ-R c19-0','Unknown','NGC 2264 Sector',579.9375,98.15625,-1700.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8350,'NGC 2264 Sector KS-M b23-0','Unknown','NGC 2264 Sector',1098.34375,62.21875,-2012.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8355,'NGC 2264 Sector KS-V b18-0','Unknown','NGC 2264 Sector',1020.5,80.5,-2121.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8360,'NGC 2264 Sector LC-C a58-0','Unknown','NGC 2264 Sector',567.5,-42.40625,-1902.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8365,'NGC 2264 Sector LD-A b30-0','Unknown','NGC 2264 Sector',520.1875,38.71875,-1881.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8370,'NGC 2264 Sector LE-O c7-1','Unknown','NGC 2264 Sector',488.46875,24.46875,-2214.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8375,'NGC 2264 Sector LE-O c7-2','Unknown','NGC 2264 Sector',485.59375,22.15625,-2218.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8380,'NGC 2264 Sector LE-O c7-3','Unknown','NGC 2264 Sector',492.09375,31.5625,-2199.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8385,'NGC 2264 Sector LH-V e2-1','Unknown','NGC 2264 Sector',1133.9375,74.90625,-2109.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8390,'NGC 2264 Sector LI-R c18-0','Unknown','NGC 2264 Sector',973.65625,-325.125,-1730.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8395,'NGC 2264 Sector LO-C b15-0','Unknown','NGC 2264 Sector',795.71875,72.8125,-2189.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8400,'NGC 2264 Sector LS-K b24-0','Unknown','NGC 2264 Sector',494.875,46.03125,-2001.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8405,'NGC 2264 Sector LS-M b23-0','Unknown','NGC 2264 Sector',1120.25,59.4375,-2019.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8410,'NGC 2264 Sector MB-R a77-0','Unknown','NGC 2264 Sector',516.5,-44.03125,-1692.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8415,'NGC 2264 Sector MF-L c22-1','Unknown','NGC 2264 Sector',761.25,-132.125,-1580.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8420,'NGC 2264 Sector MI-A b43-0','Unknown','NGC 2264 Sector',741.21875,-76.625,-1597.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8425,'NGC 2264 Sector ML-H b12-0','Unknown','NGC 2264 Sector',472.71875,21.8125,-2259.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8430,'NGC 2264 Sector MO-Q d5-13','Unknown','NGC 2264 Sector',382.625,-4.6875,-2069.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8435,'NGC 2264 Sector MS-M b23-0','Unknown','NGC 2264 Sector',1139.90625,56.34375,-2019.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8440,'NGC 2264 Sector MT-Q d5-10','Unknown','NGC 2264 Sector',540.8125,65.90625,-2066.65625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8445,'NGC 2264 Sector MV-B a72-0','Unknown','NGC 2264 Sector',521.71875,-34.4375,-1749.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8450,'NGC 2264 Sector MX-S c4-1','Unknown','NGC 2264 Sector',752.0625,-71.4375,-2309.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8455,'NGC 2264 Sector MX-S c4-3','Unknown','NGC 2264 Sector',760.09375,-68.0625,-2343.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8460,'NGC 2264 Sector NH-L c8-1','Unknown','NGC 2264 Sector',939.25,-217.8125,-2170.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8465,'NGC 2264 Sector NH-X b17-0','Unknown','NGC 2264 Sector',1123.09375,71.5625,-2137.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8470,'NGC 2264 Sector NJ-S b20-0','Unknown','NGC 2264 Sector',958.40625,97.34375,-2083.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8475,'NGC 2264 Sector NM-L b24-0','Unknown','NGC 2264 Sector',679.28125,115.96875,-2002.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8480,'NGC 2264 Sector NO-H d10-5','Unknown','NGC 2264 Sector',756.96875,-68.4375,-1630.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8485,'NGC 2264 Sector NS-M b23-0','Unknown','NGC 2264 Sector',1158.75,60.40625,-2019,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8490,'NGC 2264 Sector NX-K d8-10','Unknown','NGC 2264 Sector',1250.3125,-145.0625,-1848.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8495,'NGC 2264 Sector NX-K d8-16','Unknown','NGC 2264 Sector',1219.59375,-167.09375,-1810.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8500,'NGC 2264 Sector NY-T b19-0','Unknown','NGC 2264 Sector',1000.46875,78.71875,-2100.875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8505,'NGC 2264 Sector OH-V b18-0','Unknown','NGC 2264 Sector',498.1875,40,-2121.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8510,'NGC 2264 Sector OI-B b16-0','Unknown','NGC 2264 Sector',381.3125,115.28125,-2169.53125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8515,'NGC 2264 Sector OI-J d9-8','Unknown','NGC 2264 Sector',1212.0625,-87.1875,-1766.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8520,'NGC 2264 Sector OJ-Y b30-0','Unknown','NGC 2264 Sector',513.125,49.3125,-1845.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8525,'NGC 2264 Sector OS-M b23-0','Unknown','NGC 2264 Sector',1187.53125,58.46875,-2005.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8530,'NGC 2264 Sector OV-B c14-2','Unknown','NGC 2264 Sector',506.40625,40.90625,-1930.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8535,'NGC 2264 Sector PB-A a73-0','Unknown','NGC 2264 Sector',514.875,-33.4375,-1740.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8540,'NGC 2264 Sector PF-C b43-0','Unknown','NGC 2264 Sector',682.8125,127.6875,-1591.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8545,'NGC 2264 Sector PJ-Y b30-0','Unknown','NGC 2264 Sector',519.125,38.875,-1863.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8550,'NGC 2264 Sector PK-M c8-0','Unknown','NGC 2264 Sector',491.65625,34.28125,-2170.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8555,'NGC 2264 Sector PN-M b23-0','Unknown','NGC 2264 Sector',1173.53125,52.25,-2010.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8560,'NGC 2264 Sector PP-D b42-0','Unknown','NGC 2264 Sector',675.6875,80.03125,-1619.59375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8565,'NGC 2264 Sector PS-M b23-0','Unknown','NGC 2264 Sector',1203.375,60.09375,-2009.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8570,'NGC 2264 Sector PY-I b25-0','Unknown','NGC 2264 Sector',485.875,41.4375,-1982,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8575,'NGC 2264 Sector PZ-O b22-0','Unknown','NGC 2264 Sector',358.78125,119.28125,-2044.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8580,'NGC 2264 Sector QA-C b43-0','Unknown','NGC 2264 Sector',658.65625,99.03125,-1602.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8585,'NGC 2264 Sector QB-A a73-0','Unknown','NGC 2264 Sector',518.3125,-32.3125,-1741.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8590,'NGC 2264 Sector QE-S b20-0','Unknown','NGC 2264 Sector',979.65625,75.0625,-2084.03125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8595,'NGC 2264 Sector QF-Z b16-0','Unknown','NGC 2264 Sector',787.03125,86.6875,-2163.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8600,'NGC 2264 Sector QG-J c10-0','Unknown','NGC 2264 Sector',356.09375,124.5625,-2072.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8605,'NGC 2264 Sector QG-J c10-1','Unknown','NGC 2264 Sector',353.34375,120.3125,-2097.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8610,'NGC 2264 Sector QR-F b13-0','Unknown','NGC 2264 Sector',471.09375,33.46875,-2227.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8615,'NGC 2264 Sector QS-M b23-0','Unknown','NGC 2264 Sector',1219.5,56.9375,-2006.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8620,'NGC 2264 Sector RF-L c22-1','Unknown','NGC 2264 Sector',961.03125,-121.5,-1561.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8625,'NGC 2264 Sector RH-F b26-0','Unknown','NGC 2264 Sector',556.0625,-146.4375,-1958.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8630,'NGC 2264 Sector RL-Q b7-0','Unknown','NGC 2264 Sector',478.9375,50.1875,-2349.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8635,'NGC 2264 Sector RN-C b41-0','Unknown','NGC 2264 Sector',718.78125,-220.75,-1644.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8640,'NGC 2264 Sector RU-F d11-10','Unknown','NGC 2264 Sector',758.40625,-82.75,-1614.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8645,'NGC 2264 Sector RU-O d6-14','Unknown','NGC 2264 Sector',484.75,31.28125,-1955.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8650,'NGC 2264 Sector SI-E b14-0','Unknown','NGC 2264 Sector',1018.46875,55.96875,-2222.75,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8655,'NGC 2264 Sector SJ-Y b43-0','Unknown','NGC 2264 Sector',735.15625,-91.28125,-1582.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8660,'NGC 2264 Sector SN-J b25-0','Unknown','NGC 2264 Sector',672.5625,102.5,-1980.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8665,'NGC 2264 Sector SN-T b19-0','Unknown','NGC 2264 Sector',502.625,44,-2103.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8670,'NGC 2264 Sector SP-F d11-0','Unknown','NGC 2264 Sector',722.15625,-127.46875,-1573.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8675,'NGC 2264 Sector SP-F d11-4','Unknown','NGC 2264 Sector',719.5,-109.5625,-1585.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8680,'NGC 2264 Sector SY-Z b29-0','Unknown','NGC 2264 Sector',620.65625,18.25,-1879.3125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8685,'NGC 2264 Sector SY-Z b42-0','Unknown','NGC 2264 Sector',776.15625,-122.3125,-1601.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8690,'NGC 2264 Sector TB-S c18-1','Unknown','NGC 2264 Sector',537.65625,-183.53125,-1737.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8695,'NGC 2264 Sector TE-H b26-0','Unknown','NGC 2264 Sector',478.875,38.75,-1962.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8700,'NGC 2264 Sector TJ-Z b16-0','Unknown','NGC 2264 Sector',362.9375,106.625,-2148,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8705,'NGC 2264 Sector TT-K b24-0','Unknown','NGC 2264 Sector',1166.53125,41,-1999.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8710,'NGC 2264 Sector TW-O b8-0','Unknown','NGC 2264 Sector',476.84375,60,-2340,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8715,'NGC 2264 Sector UA-H b39-0','Unknown','NGC 2264 Sector',1140.90625,-120.9375,-1680.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8720,'NGC 2264 Sector UA-J b37-0','Unknown','NGC 2264 Sector',980,-281.40625,-1720.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8725,'NGC 2264 Sector UD-D a85-0','Unknown','NGC 2264 Sector',563.25,-29.96875,-1605.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8730,'NGC 2264 Sector UG-A b44-0','Unknown','NGC 2264 Sector',655.65625,97.15625,-1579.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8735,'NGC 2264 Sector UH-Y a73-0','Unknown','NGC 2264 Sector',515.1875,-33.46875,-1733.5,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8740,'NGC 2264 Sector UL-K b38-0','Unknown','NGC 2264 Sector',539.0625,57.4375,-1703.4375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8745,'NGC 2264 Sector US-D b27-0','Unknown','NGC 2264 Sector',579,-142.28125,-1939.46875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8750,'NGC 2264 Sector UU-F d11-0','Unknown','NGC 2264 Sector',985.25,-92.75,-1624.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8755,'NGC 2264 Sector VA-J b37-0','Unknown','NGC 2264 Sector',1008.0625,-277.875,-1713.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8760,'NGC 2264 Sector VA-V b32-0','Unknown','NGC 2264 Sector',519.875,55.96875,-1824.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8765,'NGC 2264 Sector VB-J b39-0','Unknown','NGC 2264 Sector',568.71875,112.1875,-1684.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8770,'NGC 2264 Sector VF-Q b21-0','Unknown','NGC 2264 Sector',959.1875,58.40625,-2061.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8775,'NGC 2264 Sector VO-F c12-1','Unknown','NGC 2264 Sector',1178.46875,56.59375,-2021.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8780,'NGC 2264 Sector VP-J b11-0','Unknown','NGC 2264 Sector',800.6875,67.4375,-2280.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8785,'NGC 2264 Sector VV-I b37-0','Unknown','NGC 2264 Sector',971.75,-302.9375,-1718.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8790,'NGC 2264 Sector VX-D b14-0','Unknown','NGC 2264 Sector',483.3125,27.65625,-2217.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8795,'NGC 2264 Sector VY-K b24-0','Unknown','NGC 2264 Sector',1242.71875,59.59375,-2000.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8800,'NGC 2264 Sector VY-T b19-0','Unknown','NGC 2264 Sector',1160.03125,80.6875,-2099.40625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8805,'NGC 2264 Sector VZ-G b26-0','Unknown','NGC 2264 Sector',490.6875,25.28125,-1948.21875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8810,'NGC 2264 Sector VZ-X b43-0','Unknown','NGC 2264 Sector',717.84375,-144.90625,-1580.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8815,'NGC 2264 Sector WK-O d6-1','Unknown','NGC 2264 Sector',537.34375,-158.5625,-1980.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8820,'NGC 2264 Sector WP-F d11-13','Unknown','NGC 2264 Sector',990.625,-105.78125,-1601.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8825,'NGC 2264 Sector WP-V c3-2','Unknown','NGC 2264 Sector',693.625,130.65625,-2348.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8830,'NGC 2264 Sector WT-R b20-0','Unknown','NGC 2264 Sector',497.46875,36.5625,-2084.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8835,'NGC 2264 Sector WY-C a85-0','Unknown','NGC 2264 Sector',557,-39.8125,-1611.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8840,'NGC 2264 Sector WY-K b24-0','Unknown','NGC 2264 Sector',1256.4375,55.90625,-1999.96875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8845,'NGC 2264 Sector WY-T b19-0','Unknown','NGC 2264 Sector',1183.5625,78.53125,-2088.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8850,'NGC 2264 Sector WZ-G d10-5','Unknown','NGC 2264 Sector',1013.1875,-273.21875,-1684.1875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8855,'NGC 2264 Sector XA-L c9-1','Unknown','NGC 2264 Sector',785.1875,97.96875,-2134.8125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8860,'NGC 2264 Sector XC-N b9-0','Unknown','NGC 2264 Sector',478.78125,57.34375,-2319.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8865,'NGC 2264 Sector XM-Y b44-0','Unknown','NGC 2264 Sector',641.15625,96.5,-1551.6875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8870,'NGC 2264 Sector XN-W a74-0','Unknown','NGC 2264 Sector',514.90625,-33.34375,-1717.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8875,'NGC 2264 Sector XQ-T c4-0','Unknown','NGC 2264 Sector',476.4375,56.78125,-2312.0625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8880,'NGC 2264 Sector XX-E b42-0','Unknown','NGC 2264 Sector',597.40625,217.84375,-1623.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8885,'NGC 2264 Sector XY-K b24-0','Unknown','NGC 2264 Sector',1276.21875,59.6875,-1999.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8890,'NGC 2264 Sector YG-L b24-0','Unknown','NGC 2264 Sector',346.8125,107,-1993.28125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8895,'NGC 2264 Sector YH-X c16-0','Unknown','NGC 2264 Sector',756.15625,183.15625,-1814.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8900,'NGC 2264 Sector YI-C b15-0','Unknown','NGC 2264 Sector',495.9375,36.78125,-2191.71875,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8905,'NGC 2264 Sector YK-F b27-0','Unknown','NGC 2264 Sector',496.78125,35.75,-1939.125,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8910,'NGC 2264 Sector YN-W a74-0','Unknown','NGC 2264 Sector',517.09375,-34.125,-1722.09375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8915,'NGC 2264 Sector YS-F c12-1','Unknown','NGC 2264 Sector',356.5,121.46875,-2014.84375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8920,'NGC 2264 Sector YW-I c10-0','Unknown','NGC 2264 Sector',497.59375,32.53125,-2093.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8925,'NGC 2264 Sector ZD-L c23-0','Unknown','NGC 2264 Sector',777.25,220,-1544.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8930,'NGC 2264 Sector ZO-D b1-0','Unknown','NGC 2264 Sector',838.15625,120.4375,-2500.15625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8935,'NGC 2264 Sector ZT-K b24-0','Unknown','NGC 2264 Sector',1294.34375,47.375,-2003.9375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8940,'NGC 2264 Sector ZY-B b28-0','Unknown','NGC 2264 Sector',599.15625,-141.84375,-1923.90625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8945,'NGC 2286 Sector AE-J b12-0','Unknown','NGC 2264 Sector',5308.8125,-112.75,-7827.375,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8950,'NGC 2286 Sector GS-S d4-30','Unknown','NGC 2264 Sector',5259.65625,-120,-7686.5625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8955,'NGC 2286 Sector WD-T d3-1','Unknown','NGC 2264 Sector',5695.53125,-674,-7754.625,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8960,'NGC 3603 Sector GW-W d1-44','Unknown','NGC 3603 Sector',18614.875,-173.3125,7370.25,'2019-09-10 10:00:48','2019-09-10 10:00:48'),(8965,'NGC 3603 Sector MX-U d2-16','Unknown','NGC 3603 Sector',18653.4375,-189.0625,7432.78125,'2019-09-10 10:00:48','2019-09-10 10:00:48');
/*!40000 ALTER TABLE `permitlock` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `pointofinterests`
--

LOCK TABLES `pointofinterests` WRITE;
/*!40000 ALTER TABLE `pointofinterests` DISABLE KEYS */;
/*!40000 ALTER TABLE `pointofinterests` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'Galactic Centre','Codex_RegionName_1',1),(2,'Empyrean Straits','Codex_RegionName_2',2),(3,'Ryker\'s Hope','Codex_RegionName_3',3),(4,'Odin\'s Hold','Codex_RegionName_4',4),(5,'Norma Arm','Codex_RegionName_5',5),(6,'Arcadian Stream','Codex_RegionName_6',6),(7,'Izanami','Codex_RegionName_7',7),(8,'Inner Orion-Perseus Conflux','Codex_RegionName_8',8),(9,'Inner Scutum-Centaurus Arm','Codex_RegionName_9',9),(10,'Norma Expanse','Codex_RegionName_10',10),(11,'Trojan Belt','Codex_RegionName_11',11),(12,'The Veils','Codex_RegionName_12',12),(13,'Newton\'s Vault','Codex_RegionName_13',13),(14,'The Conduit','Codex_RegionName_14',14),(15,'Outer Orion-Perseus Conflux','Codex_RegionName_15',15),(16,'Orion-Cygnus Arm','Codex_RegionName_16',16),(17,'Temple','Codex_RegionName_17',17),(18,'Inner Orion Spur','Codex_RegionName_18',18),(19,'Hawking\'s Gap','Codex_RegionName_19',19),(20,'Dryman\'s Point','Codex_RegionName_20',20),(21,'Sagittarius-Carina Arm','Codex_RegionName_21',21),(22,'Mare Somnia','Codex_RegionName_22',22),(23,'Acheron','Codex_RegionName_23',23),(24,'Formorian Frontier','Codex_RegionName_24',24),(25,'Hieronymus Delta','Codex_RegionName_25',25),(26,'Outer Scutum-Centaurus Arm','Codex_RegionName_26',26),(27,'Outer Arm','Codex_RegionName_27',27),(28,'Aquila\'s Halo','Codex_RegionName_28',28),(29,'Errant Marches','Codex_RegionName_29',29),(30,'Perseus Arm','Codex_RegionName_30',30),(31,'The Formidine Rift','Codex_RegionName_31',31),(32,'Vulcan Gate','Codex_RegionName_32',32),(33,'Elysian Shore','Codex_RegionName_33',33),(34,'Sanguineous Rim','Codex_RegionName_34',34),(35,'Outer Orion Spur','Codex_RegionName_35',35),(36,'Achilles\'s Altar','Codex_RegionName_36',36),(37,'Xibalba','Codex_RegionName_37',37),(38,'Lyra\'s Song','Codex_RegionName_38',38),(39,'Tenebrae','Codex_RegionName_39',39),(40,'The Abyss','Codex_RegionName_40',40),(41,'Kepler\'s Crest','Codex_RegionName_41',41),(42,'The Void','Codex_RegionName_42',42);
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportcodices`
--

DROP TABLE IF EXISTS `reportcodices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportcodices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cmdrName` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
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
  `clientVersion` varchar(255) NOT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `rawJson` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportcodices`
--

LOCK TABLES `reportcodices` WRITE;
/*!40000 ALTER TABLE `reportcodices` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportcodices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportevents`
--

DROP TABLE IF EXISTS `reportevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportevents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventName` varchar(255) NOT NULL,
  `eventAltName` varchar(255) DEFAULT NULL,
  `cmdrName` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `stationName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) NOT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `rawJson` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportevents`
--

LOCK TABLES `reportevents` WRITE;
/*!40000 ALTER TABLE `reportevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportfsses`
--

DROP TABLE IF EXISTS `reportfsses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportfsses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cmdrName` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
  `signalName` varchar(255) DEFAULT NULL,
  `signalNameLocalised` varchar(255) DEFAULT NULL,
  `ussType` varchar(255) DEFAULT NULL,
  `ussTypeLocalised` varchar(255) DEFAULT NULL,
  `spawningState` varchar(255) DEFAULT NULL,
  `spawningStateLocalised` varchar(255) DEFAULT NULL,
  `spawningFaction` varchar(255) DEFAULT NULL,
  `threatLevel` int(11) DEFAULT NULL,
  `isBeta` tinyint(1) DEFAULT NULL,
  `clientVersion` varchar(255) NOT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `rawJson` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportfsses`
--

LOCK TABLES `reportfsses` WRITE;
/*!40000 ALTER TABLE `reportfsses` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportfsses` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporttypes`
--

LOCK TABLES `reporttypes` WRITE;
/*!40000 ALTER TABLE `reporttypes` DISABLE KEYS */;
INSERT INTO `reporttypes` VALUES (1,'Bark Mound','body','codex_ent_cone',2100301,'codex','bmreports'),(2,'Silicate Vapour Fumarole','body','codex_ent_fumarole_silicatevapourgeysers',1400114,'codex','fmreports'),(3,'Sulphur Dioxide Fumarole','body','codex_ent_fumarole_sulphurdioxidemagma',1400102,'codex','fmreports'),(4,'Water Fumarole','body','codex_ent_fumarole_watergeysers',1400108,'codex','fmreports'),(5,'Carbon Dioxide Gas Vent','body','codex_ent_gas_vents_carbondioxidegeysers',1400409,'codex','gvreports'),(6,'Silicate Vapour Gas Vent','body','codex_ent_gas_vents_silicatevapourgeysers',1400414,'codex','gvreports'),(7,'Sulphur Dioxide Gas Vent','body','codex_ent_gas_vents_sulphurdioxidemagma',1400402,'codex','gvreports'),(8,'Water Gas Vent','body','codex_ent_gas_vents_watergeysers',1400408,'codex','gvreports'),(9,'Water Geyser','body','codex_ent_geysers_watergeysers',1400208,'codex','gyreports'),(10,'Crystalline Shards','body','codex_ent_ground_struct_ice',2101500,'event','csreports'),(11,'Ammonia Ice Fumarole','body','codex_ent_icefumarole_ammoniageysers',1400160,'codex','fmreports'),(12,'Carbon Dioxide Ice Fumarole','body','codex_ent_icefumarole_carbondioxidegeysers',1400159,'codex','fmreports'),(13,'Methane Ice Fumarole','body','codex_ent_icefumarole_methanegeysers',1400161,'codex','fmreports'),(14,'Nitrogen Ice Fumarole','body','codex_ent_icefumarole_nitrogengeysers',1400162,'codex','fmreports'),(15,'Silicate Vapour Ice Fumarole','body','codex_ent_icefumarole_silicatevapourgeysers',1400164,'codex','fmreports'),(16,'Sulphur Dioxide Ice Fumarole','body','codex_ent_icefumarole_sulphurdioxidemagma',1400152,'codex','fmreports'),(17,'Water Ice Fumarole','body','codex_ent_icefumarole_watergeysers',1400158,'codex','fmreports'),(18,'Ammonia Ice Geyser','body','codex_ent_icegeysers_ammoniageysers',1400260,'codex','gyreports'),(19,'Carbon Dioxide Ice Geyser','body','codex_ent_icegeysers_carbondioxidegeysers',1400259,'codex','gyreports'),(20,'Methane Ice Geyser','body','codex_ent_icegeysers_methanegeysers',1400261,'codex','gyreports'),(21,'Nitrogen Ice Geyser','body','codex_ent_icegeysers_nitrogengeysers',1400262,'codex','gyreports'),(22,'Water Ice Geyser','body','codex_ent_icegeysers_watergeysers',1400258,'codex','gyreports'),(23,'Iron Magma Lava Spout','body','codex_ent_lava_spouts_ironmagma',1400307,'codex','lsreports'),(24,'Silicate Magma Lava Spout','body','codex_ent_lava_spouts_silicatemagma',1400306,'codex','lsreports'),(25,'Roseum Brain Tree','body','codex_ent_seed',2100201,'codex','btreports'),(26,'Gypseeum Brain Tree','body','codex_ent_seedabcd_01',2100202,'codex','btreports'),(27,'Ostrinum Brain Tree','body','codex_ent_seedabcd_02',2100203,'codex','btreports'),(28,'Viride Brain Tree','body','codex_ent_seedabcd_03',2100204,'codex','btreports'),(29,'Lividum Brain Tree','body','codex_ent_seedefgh',2100205,'codex','btreports'),(30,'Aureum Brain Tree','body','codex_ent_seedefgh_01',2100206,'codex','btreports'),(31,'Puniceum Brain Tree','body','codex_ent_seedefgh_02',2100207,'codex','btreports'),(32,'Lindigoticum Brain Tree','body','codex_ent_seedefgh_03',2100208,'codex','btreports'),(33,'Luteolum Anemone','body','codex_ent_sphere',2100401,'codex','fgreports'),(34,'Croceum Anemone','body','codex_ent_sphereabcd_01',2100402,'codex','fgreports'),(35,'Puniceum Anemone','body','codex_ent_sphereabcd_02',2100403,'codex','fgreports'),(36,'Roseum Anemone','body','codex_ent_sphereabcd_03',2100404,'codex','fgreports'),(37,'Blatteum Bioluminescent Anemone','body','codex_ent_sphereefgh',2100405,'codex','fgreports'),(38,'Rubeum Bioluminescent Anemone','body','codex_ent_sphereefgh_01',2100406,'codex','fgreports'),(39,'Prasinum Bioluminescent Anemone','body','codex_ent_sphereefgh_02',2100407,'codex','fgreports'),(40,'Roseum Bioluminescent Anemone','body','codex_ent_sphereefgh_03',2100408,'codex','fgreports'),(41,'Roseum Sinuous Tubers','body','codex_ent_tube',2100501,'codex','twreports'),(42,'Amphora Plant','body','codex_ent_vents',2101400,'codex','apreports'),(43,'Common Thargoid Barnacle','body','codex_ent_thargoid_barnacle_01',2100101,'codex','tbreports'),(44,'Large Thargoid Barnacle','body','codex_ent_thargoid_barnacle_02',2100102,'codex','tbreports'),(46,'Albidum Sinuous Tubers','body','codex_ent_tubeabcd_02',2100503,'codex','twreports'),(48,'Prasinum Sinuous Tubers','body','codex_ent_tubeabcd_01',2100502,'codex','twreports'),(49,'Blatteum Sinuous Tubers','body','codex_ent_tubeefgh',2100505,'codex','twreports'),(50,'Lindigoticum Sinuous Tubers','body','codex_ent_tubeefgh_01',2100506,'codex','twreports'),(53,'Violaceum Sinuous Tubers','body','codex_ent_tubeefgh_02',2100507,'codex','twreports'),(54,'Viride Sinuous Tubers','body','codex_ent_tubeefgh_03',2100508,'codex','twreports'),(57,'Guardian Beacon','orbital','codex_ent_guardian_beacons',3200800,'codex','gbreports'),(63,'Carbon Dioxide Fumarole','body','codex_ent_fumarole_carbondioxidegeysers',1400109,'codex','fmreports');
/*!40000 ALTER TABLE `reporttypes` ENABLE KEYS */;
UNLOCK TABLES;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_RINGS` (`ringName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rings`
--

LOCK TABLES `rings` WRITE;
/*!40000 ALTER TABLE `rings` DISABLE KEYS */;
/*!40000 ALTER TABLE `rings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_administrator`
--

DROP TABLE IF EXISTS `strapi_administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_administrator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_administrator_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_administrator`
--

LOCK TABLES `strapi_administrator` WRITE;
/*!40000 ALTER TABLE `strapi_administrator` DISABLE KEYS */;
INSERT INTO `strapi_administrator` VALUES (1,'canonntest','rd@canonn.tech','$2a$10$OuezItI8UE6156d2i5AFqeSZVpgD6Usqw4u4qjfyBSXAaePSy2F4y',NULL,0);
/*!40000 ALTER TABLE `strapi_administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_webhooks`
--

DROP TABLE IF EXISTS `strapi_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `headers` longtext DEFAULT NULL,
  `events` longtext DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_STRAPI_WEBHOOKS` (`name`,`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_webhooks`
--

LOCK TABLES `strapi_webhooks` WRITE;
/*!40000 ALTER TABLE `strapi_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systems`
--

DROP TABLE IF EXISTS `systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) NOT NULL,
  `id64` bigint(20) DEFAULT NULL,
  `edsmID` int(11) DEFAULT NULL,
  `edsmCoordX` double DEFAULT NULL,
  `edsmCoordY` double DEFAULT NULL,
  `edsmCoordZ` double DEFAULT NULL,
  `edsmCoordLocked` tinyint(1) DEFAULT NULL,
  `missingSkipCount` int(11) DEFAULT NULL,
  `region` int(11) DEFAULT NULL,
  `primaryStar` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `systems_systemName_unique` (`systemName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systems`
--

LOCK TABLES `systems` WRITE;
/*!40000 ALTER TABLE `systems` DISABLE KEYS */;
/*!40000 ALTER TABLE `systems` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbcycles`
--

LOCK TABLES `tbcycles` WRITE;
/*!40000 ALTER TABLE `tbcycles` DISABLE KEYS */;
INSERT INTO `tbcycles` VALUES (2,'A'),(5,'ABC'),(3,'B'),(4,'C'),(1,'Unknown');
/*!40000 ALTER TABLE `tbcycles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbreports`
--

DROP TABLE IF EXISTS `tbreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  `reportType` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `type` varchar(255) NOT NULL,
  `subtype` varchar(255) NOT NULL,
  `cycle` varchar(255) NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbreports`
--

LOCK TABLES `tbreports` WRITE;
/*!40000 ALTER TABLE `tbreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbsites`
--

DROP TABLE IF EXISTS `tbsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbsites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) NOT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `type` int(11) DEFAULT NULL,
  `subtype` int(11) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `cycle` int(11) DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbsites_siteID_unique` (`siteID`),
  UNIQUE KEY `tbsites_extoolID_unique` (`extoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbsites`
--

LOCK TABLES `tbsites` WRITE;
/*!40000 ALTER TABLE `tbsites` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbsites` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbsubtypes`
--

LOCK TABLES `tbsubtypes` WRITE;
/*!40000 ALTER TABLE `tbsubtypes` DISABLE KEYS */;
INSERT INTO `tbsubtypes` VALUES (1,'Unknown',NULL),(2,'Mega',NULL),(3,'Alpha',1),(4,'Beta',2),(5,'Gamma',3),(6,'Delta',4),(7,'Epsilon',5),(8,'Zeta',NULL);
/*!40000 ALTER TABLE `tbsubtypes` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tbtypes`
--

LOCK TABLES `tbtypes` WRITE;
/*!40000 ALTER TABLE `tbtypes` DISABLE KEYS */;
INSERT INTO `tbtypes` VALUES (1,'Unknown','',NULL),(2,'Common Thargoid Barnacle','codex_ent_thargoid_barnacle_01',2100101),(3,'Large Thargoid Barnacle','codex_ent_thargoid_barnacle_02',2100102);
/*!40000 ALTER TABLE `tbtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsreports`
--

DROP TABLE IF EXISTS `tsreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  `reportType` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
  `regionID` int(11) DEFAULT NULL,
  `coordX` double DEFAULT NULL,
  `coordY` double DEFAULT NULL,
  `coordZ` double DEFAULT NULL,
  `bodyName` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `status` varchar(255) NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsreports`
--

LOCK TABLES `tsreports` WRITE;
/*!40000 ALTER TABLE `tsreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tssites`
--

DROP TABLE IF EXISTS `tssites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tssites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) NOT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `status` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `msg1Site` int(11) DEFAULT NULL,
  `msg2Site` int(11) DEFAULT NULL,
  `msg3Site` int(11) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `tssites_siteID_unique` (`siteID`),
  UNIQUE KEY `tssites_extoolID_unique` (`extoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tssites`
--

LOCK TABLES `tssites` WRITE;
/*!40000 ALTER TABLE `tssites` DISABLE KEYS */;
/*!40000 ALTER TABLE `tssites` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tsstatuses`
--

LOCK TABLES `tsstatuses` WRITE;
/*!40000 ALTER TABLE `tsstatuses` DISABLE KEYS */;
INSERT INTO `tsstatuses` VALUES (2,'Active'),(3,'Inactive'),(1,'Unknown');
/*!40000 ALTER TABLE `tsstatuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twreports`
--

DROP TABLE IF EXISTS `twreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twreports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  `reportType` varchar(255) NOT NULL,
  `systemName` varchar(255) NOT NULL,
  `systemAddress` bigint(20) DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twreports`
--

LOCK TABLES `twreports` WRITE;
/*!40000 ALTER TABLE `twreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `twreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twsites`
--

DROP TABLE IF EXISTS `twsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twsites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `siteID` int(11) NOT NULL,
  `extoolID` int(11) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `type` int(11) DEFAULT NULL,
  `frontierID` int(11) DEFAULT NULL,
  `verified` tinyint(1) NOT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `twsites_siteID_unique` (`siteID`),
  UNIQUE KEY `twsites_extoolID_unique` (`extoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twsites`
--

LOCK TABLES `twsites` WRITE;
/*!40000 ALTER TABLE `twsites` DISABLE KEYS */;
/*!40000 ALTER TABLE `twsites` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twtypes`
--

LOCK TABLES `twtypes` WRITE;
/*!40000 ALTER TABLE `twtypes` DISABLE KEYS */;
INSERT INTO `twtypes` VALUES (1,'Unknown','',NULL),(2,'Roseum Sinuous Tubers','codex_ent_tube',2100501),(4,'Albidum Sinuous Tubers','codex_ent_tubeabcd_02',2100503),(8,'Prasinum Sinuous Tubers','codex_ent_tubeabcd_01',2100502),(10,'Blatteum Sinuous Tubers','codex_ent_tubeefgh',2100505),(12,'Lindigoticum Sinuous Tubers','codex_ent_tubeefgh_01',2100506),(17,'Violaceum Sinuous Tubers','codex_ent_tubeefgh_02',2100507),(19,'Viride Sinuous Tubers','codex_ent_tubeefgh_03',2100508);
/*!40000 ALTER TABLE `twtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file`
--

DROP TABLE IF EXISTS `upload_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alternativeText` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext DEFAULT NULL,
  `hash` varchar(255) NOT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) NOT NULL,
  `size` decimal(10,2) NOT NULL,
  `url` varchar(255) NOT NULL,
  `previewUrl` varchar(255) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `provider_metadata` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file`
--

LOCK TABLES `upload_file` WRITE;
/*!40000 ALTER TABLE `upload_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_morph`
--

DROP TABLE IF EXISTS `upload_file_morph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_file_morph` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` longtext DEFAULT NULL,
  `field` longtext DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_morph`
--

LOCK TABLES `upload_file_morph` WRITE;
/*!40000 ALTER TABLE `upload_file_morph` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_morph` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2020-05-22  3:19:35
