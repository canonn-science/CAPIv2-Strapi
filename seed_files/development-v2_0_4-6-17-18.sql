-- MySQL dump 10.16  Distrib 10.2.15-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: cdb.ad.canonn.technology    Database: capiv2_dev
-- ------------------------------------------------------
-- Server version	10.2.12-MariaDB-10.2.12+maria~xenial-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bmreports`
--

DROP TABLE IF EXISTS `bmreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bmreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_BMREPORTS` (`systemName`,`bodyName`,`cmdrName`,`comment`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
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
-- Table structure for table `bodies`
--

DROP TABLE IF EXISTS `bodies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `edsmID` double DEFAULT NULL,
  `edsmID64` double DEFAULT NULL,
  `bodyType` int(11) DEFAULT NULL,
  `bodySubtype` int(11) DEFAULT NULL,
  `edsmOffset` int(11) DEFAULT NULL,
  `edsmDistanceToArrival` double DEFAULT NULL,
  `edsmIsMainStar` tinyint(1) DEFAULT NULL,
  `edsmIsScoopable` tinyint(1) DEFAULT NULL,
  `edsmIsLandable` tinyint(1) DEFAULT NULL,
  `edsmAge` int(11) DEFAULT NULL,
  `edsmLuminosity` varchar(255) DEFAULT NULL,
  `edsmAbsoluteMagnitude` double DEFAULT NULL,
  `edsmSolarMasses` double DEFAULT NULL,
  `edsmSolarRadius` double DEFAULT NULL,
  `edsmGravity` double DEFAULT NULL,
  `edsmEarthMasses` double DEFAULT NULL,
  `edsmRadius` double DEFAULT NULL,
  `edsmSurfaceTemperature` double DEFAULT NULL,
  `edsmVolcanismType` varchar(255) DEFAULT NULL,
  `edsmAtmosphereType` varchar(255) DEFAULT NULL,
  `bodyAtmosphere` int(11) DEFAULT NULL,
  `bodyMaterial` int(11) DEFAULT NULL,
  `edsmTerraformingState` varchar(255) DEFAULT NULL,
  `edsmOrbitalPeriod` double DEFAULT NULL,
  `edsmSemiMajorAxis` double DEFAULT NULL,
  `edsmOrbitalEccentricity` double DEFAULT NULL,
  `edsmOrbitalInclination` double DEFAULT NULL,
  `edsmArgOfPeriapsis` double DEFAULT NULL,
  `edsmRotationalPeriod` double DEFAULT NULL,
  `edsmRotationalPeriodTidallyLocked` tinyint(1) DEFAULT NULL,
  `edsmAxialTilt` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_BODIES` (`bodyName`,`edsmLuminosity`,`edsmVolcanismType`,`edsmAtmosphereType`,`edsmTerraformingState`)
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
-- Table structure for table `bodyatmospheres`
--

DROP TABLE IF EXISTS `bodyatmospheres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodyatmospheres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` int(11) DEFAULT NULL,
  `argon` double DEFAULT NULL,
  `ammonia` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodyatmospheres`
--

LOCK TABLES `bodyatmospheres` WRITE;
/*!40000 ALTER TABLE `bodyatmospheres` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodyatmospheres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bodymaterials`
--

DROP TABLE IF EXISTS `bodymaterials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodymaterials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` int(11) DEFAULT NULL,
  `antimony` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodymaterials`
--

LOCK TABLES `bodymaterials` WRITE;
/*!40000 ALTER TABLE `bodymaterials` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodymaterials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bodysubtypes`
--

DROP TABLE IF EXISTS `bodysubtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodysubtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subtype` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_BODYSUBTYPES` (`subtype`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodysubtypes`
--

LOCK TABLES `bodysubtypes` WRITE;
/*!40000 ALTER TABLE `bodysubtypes` DISABLE KEYS */;
INSERT INTO `bodysubtypes` VALUES (1,'O (Blue-White) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(2,'B (Blue-White) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(3,'A (Blue-White) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(4,'A (Blue-White super giant) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(5,'F (White) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(6,'F (White super giant) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(7,'G (White-Yellow) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(8,'K (Yellow-Orange) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(9,'K (Yellow-Orange giant) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(10,'M (Red dwarf) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(11,'M (Red giant) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(12,'M (Red super giant) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(13,'L (Brown dwarf) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(14,'T (Brown dwarf) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(15,'Y (Brown dwarf) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(16,'T Tauri Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(17,'Herbig Ae/Be Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(18,'Wolf-Rayet Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(19,'Wolf-Rayet N Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(20,'Wolf-Rayet NC Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(21,'Wolf-Rayet C Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(22,'Wolf-Rayet O Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(23,'CS Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(24,'C Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(25,'CN Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(26,'CJ Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(27,'CH Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(28,'CHd Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(29,'MS-type Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(30,'S-type Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(31,'White Dwarf (D) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(32,'White Dwarf (DA) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(33,'White Dwarf (DAB) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(34,'White Dwarf (DAO) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(35,'White Dwarf (DAZ) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(36,'White Dwarf (DAV) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(37,'White Dwarf (DB) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(38,'White Dwarf (DBZ) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(39,'White Dwarf (DBV) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(40,'White Dwarf (DO) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(41,'White Dwarf (DOV) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(42,'White Dwarf (DQ) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(43,'White Dwarf (DC) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(44,'White Dwarf (DCV) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(45,'White Dwarf (DX) Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(46,'Neutron Star','2018-06-17 12:29:20','2018-06-17 12:29:20'),(47,'Black Hole','2018-06-17 12:29:20','2018-06-17 12:29:20'),(48,'Supermassive Black Hole','2018-06-17 12:29:20','2018-06-17 12:29:20'),(49,'X','2018-06-17 12:29:20','2018-06-17 12:29:20'),(50,'RoguePlanet','2018-06-17 12:29:20','2018-06-17 12:29:20'),(51,'Nebula','2018-06-17 12:29:20','2018-06-17 12:29:20'),(52,'StellarRemnantNebula','2018-06-17 12:29:20','2018-06-17 12:29:20'),(53,'Metal-rich body','2018-06-17 12:29:20','2018-06-17 12:29:20'),(54,'High metal content world','2018-06-17 12:29:20','2018-06-17 12:29:20'),(55,'Rocky body','2018-06-17 12:29:20','2018-06-17 12:29:20'),(56,'Rocky Ice world','2018-06-17 12:29:20','2018-06-17 12:29:20'),(57,'Icy body','2018-06-17 12:29:20','2018-06-17 12:29:20'),(58,'Earth-like world','2018-06-17 12:29:20','2018-06-17 12:29:20'),(59,'Water world','2018-06-17 12:29:20','2018-06-17 12:29:20'),(60,'Water giant','2018-06-17 12:29:20','2018-06-17 12:29:20'),(61,'Water giant with life','2018-06-17 12:29:20','2018-06-17 12:29:20'),(62,'Ammonia world','2018-06-17 12:29:20','2018-06-17 12:29:20'),(63,'Gas giant with water-based life','2018-06-17 12:29:20','2018-06-17 12:29:20'),(64,'Gas giant with ammonia-based life','2018-06-17 12:29:20','2018-06-17 12:29:20'),(65,'Class I gas giant','2018-06-17 12:29:20','2018-06-17 12:29:20'),(66,'Class II gas giant','2018-06-17 12:29:20','2018-06-17 12:29:20'),(67,'Class III gas giant','2018-06-17 12:29:20','2018-06-17 12:29:20'),(68,'Class IV gas giant','2018-06-17 12:29:20','2018-06-17 12:29:20'),(69,'Class V gas giant','2018-06-17 12:29:20','2018-06-17 12:29:20'),(70,'Helium-rich gas giant','2018-06-17 12:29:20','2018-06-17 12:29:20'),(71,'Helium gas giant','2018-06-17 12:29:20','2018-06-17 12:29:20');
/*!40000 ALTER TABLE `bodysubtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bodytypes`
--

DROP TABLE IF EXISTS `bodytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_BODYTYPES` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodytypes`
--

LOCK TABLES `bodytypes` WRITE;
/*!40000 ALTER TABLE `bodytypes` DISABLE KEYS */;
INSERT INTO `bodytypes` VALUES (1,'Star','2018-06-17 12:29:47','2018-06-17 12:30:05'),(2,'Planet','2018-06-17 12:29:53','2018-06-17 12:30:05');
/*!40000 ALTER TABLE `bodytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `btreports`
--

DROP TABLE IF EXISTS `btreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `btreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_BTREPORTS` (`systemName`,`bodyName`,`cmdrName`,`comment`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
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
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_CMDRS` (`cmdrName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmdrs`
--

LOCK TABLES `cmdrs` WRITE;
/*!40000 ALTER TABLE `cmdrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmdrs` ENABLE KEYS */;
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
  `value` text DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_CORE_STORE` (`key`,`value`,`type`,`environment`,`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_store`
--

LOCK TABLES `core_store` WRITE;
/*!40000 ALTER TABLE `core_store` DISABLE KEYS */;
INSERT INTO `core_store` VALUES (4,'core_application','{\"name\":\"Default Application\",\"description\":\"This API is going to be awesome!\"}','object','',''),(10,'plugin_users-permissions_grant','{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-official\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"redirect_uri\":\"/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitter/callback\"}}','object','',''),(16,'plugin_upload_provider','{\"provider\":\"local\",\"name\":\"Local server\",\"enabled\":true,\"sizeLimit\":1000000}','object','development',''),(19,'plugin_users-permissions_email','{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"refresh\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"­Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}}}','object','',''),(22,'plugin_users-permissions_advanced','{\"unique_email\":true,\"allow_register\":true,\"default_role\":\"authenticated\"}','object','','');
/*!40000 ALTER TABLE `core_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fgreports`
--

DROP TABLE IF EXISTS `fgreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fgreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_FGREPORTS` (`systemName`,`bodyName`,`cmdrName`,`comment`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
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
-- Table structure for table `fmreports`
--

DROP TABLE IF EXISTS `fmreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fmreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_FMREPORTS` (`systemName`,`bodyName`,`type`,`cmdrName`,`comment`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_FMTYPES` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fmtypes`
--

LOCK TABLES `fmtypes` WRITE;
/*!40000 ALTER TABLE `fmtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `fmtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genreports`
--

DROP TABLE IF EXISTS `genreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) DEFAULT NULL,
  `shipName` varchar(255) DEFAULT NULL,
  `directionSystem` varchar(255) DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GENREPORTS` (`systemName`,`shipName`,`directionSystem`,`cmdrName`,`comment`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `shipName` varchar(255) DEFAULT NULL,
  `directionSystem` int(11) DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GENSITES` (`shipName`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grSite` int(11) DEFAULT NULL,
  `activeGroup` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grSite` int(11) DEFAULT NULL,
  `activeObelisk` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GRARTIFACTS` (`artifactName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grartifacts`
--

LOCK TABLES `grartifacts` WRITE;
/*!40000 ALTER TABLE `grartifacts` DISABLE KEYS */;
INSERT INTO `grartifacts` VALUES (1,'Casket','2018-06-17 12:31:26','2018-06-17 12:31:26'),(2,'Orb','2018-06-17 12:31:26','2018-06-17 12:31:26'),(3,'Relic','2018-06-17 12:31:26','2018-06-17 12:31:26'),(4,'Tablet','2018-06-17 12:31:26','2018-06-17 12:31:26'),(5,'Totem','2018-06-17 12:31:26','2018-06-17 12:31:26'),(6,'Urn','2018-06-17 12:31:26','2018-06-17 12:31:26');
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GRCODEXCATEGORIES` (`categoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grcodexcategories`
--

LOCK TABLES `grcodexcategories` WRITE;
/*!40000 ALTER TABLE `grcodexcategories` DISABLE KEYS */;
INSERT INTO `grcodexcategories` VALUES (1,'Biology','2018-06-17 12:31:41','2018-06-17 12:31:41'),(2,'Culture','2018-06-17 12:31:41','2018-06-17 12:31:41'),(3,'History','2018-06-17 12:31:41','2018-06-17 12:31:41'),(4,'Language','2018-06-17 12:31:41','2018-06-17 12:31:41'),(5,'Technology','2018-06-17 12:31:41','2018-06-17 12:31:41');
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
  `text` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GRCODEXDATA` (`text`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grcodexdata`
--

LOCK TABLES `grcodexdata` WRITE;
/*!40000 ALTER TABLE `grcodexdata` DISABLE KEYS */;
INSERT INTO `grcodexdata` VALUES (1,1,6,3,1,'Thank you commander, this data has proven vital to my ongoing research. While it seemed logical that the alpha-pattern data corresponded with the core information on the Guardians\' biology and ecology, I couldn\'t be certain until I received the data from your scan. I\'m pleased my hypothesis has proved correct, and I\'ve started to unlock some fascinating details about the Guardians. The extracted data relates to individuals rather than their species as a whole, but thanks to the information you have transmitted, I believe I will be able to merge the data to create a general picture.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(2,1,6,6,2,'The information you\'ve uncovered is very interesting and regards the Guardians\' anatomy and physiology, you might be surprised to learn they weren\'t that different to us. Their morphology was bipedal, although they were generally taller and more slender than the average human. Their skin tone was red, encompassing the whole spectrum of red hues. There were various reasons for these changes in pigmentation, including genetic disposition and the fact that they darkened as they aged','2018-06-17 12:32:00','2018-06-17 12:32:00'),(3,1,6,1,3,'Details on the facial structure of the Guardians. Their faces were proportionally smaller than ours and they had round eyes, darkened from their evolution under a very strong sunlight. The colouration and structure of the eye indicates that not only they have keener vision than us, but they could also see a wider spectrum.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(4,1,6,4,4,'This data details the facial structure of the Guardians. The nose appears to have been vestigial - I believe it was once more pronounced, but that some environmental change made it less useful - so their sense of smell would have been less developed than the human average. Their ears were very tightly formed against the skull, and the interesting array of internal acoustic chambers suggest they perceived sounds differently to us','2018-06-17 12:32:00','2018-06-17 12:32:00'),(5,1,6,2,5,'This data offers more details about the physical appearance of the Guardians. Most remarkable are their limbs. Their forelimbs had a serrated edge and were no doubt used as killing implements during the pack-hunting period. They had two more more joints in their arms than we do, facilitating complex articulation and the use of sophisticated sign language. The skeleton was flexible yet resilient and their muscles were long, thin and ropey. They had two hands, each with four digits.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(6,1,6,5,6,'We\'ve barely scratched the surface with the Guardians. There is so much yet to discover. But this new data contains one tantalising detail that stands out: their biochemistry was very similar to our own. They had blood in the same fashion as us, and it fulfilled exactly the same role as it does for us. Beyond this, they share a similar genetic structure, with DNA and RNA their core building blocks. Although a full analysis has not yet been conducted, this might be evidence of a common ancestor, but also of a branching in their genetic history. This is an astounding discovery!','2018-06-17 12:32:00','2018-06-17 12:32:00'),(7,1,6,3,7,'This data offers more details about the physical appearance of the Guardians, specifically regarding genders. The similarities between humans and the Guardians continue to delight me. They had two distinct genders and reproduced sexually. There don\'t appear to have been any taboos surrounding sexual activity, as the data contains a large quantity of graphic images and recordings – not unlike some of our data nets!','2018-06-17 12:32:00','2018-06-17 12:32:00'),(8,1,6,6,8,'This data contains more details about the Guardians\' sexual behaviour and reproduction. Their body form encouraged sex while standing, but although this was the most comfortable pose, they entertained a variety of positions. I\'ve concluded that sex was a recreational behaviour and not only for procreation. They didn\'t use birth control as they could manipulate their bodies to become temporarily sterile at will, although I\'ve not yet identified the precise mechanism for this. It\'s clear their biological-manipulation technology was quite sophisticated. This data has huge applications for Medical treatments if we can unlock the secret.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(9,1,6,1,9,'This data contains more details about the Guardians\' procreation and reproduction. Procreation was a matter of personal choice, although they were required to be a parent at least once during their lives to ensure the continuation of their genetic line. I\'ve not yet established their metric for measuring time, but it\'s clear that the period of gestation was quite long, to allow substantial development of the young prior to birth. The infants were effectively helpless for a period after delivery.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(10,1,6,4,10,'This data contains more details about the Guardians\' approach to raising their young. Care of the young was the duty of the wider community. Infants were raised in communal crèches rather than by their parents, the cultural significance of which I\'m eager to unravel. I have established that prenatal care of the young involved genetic manipulation to remove hereditary diseases and other complications.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(11,1,6,2,11,'Although the alpha-pattern data encapsulates biological information, it also contains a treasure trove of cultural data. This is particularly true of the data you uncovered here. The data package appears to contain records pertaining to their food. I already knew that as pack hunters they were carnivores. I subsequently discovered that not only were their arm ridges excellent for killing prey, they also used for cutting meat into little pieces to fit in their small mouths.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(12,1,6,5,12,'This data contains details about etiquette and hunting. The imperative of the kill was retained even as their society advanced. Food killed in the hunt was a delicacy. For guests, it was an honour to provide their host with something that had been hunted, but the host was expected to provide the same. Meat that had been hunted by a lone individual was given even greater accord. For a kill to be valid, it had to be achieved without weapons. Weaponry was only for civil defence or law enforcement.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(13,1,6,NULL,13,'This data contains details about etiquette feeding habits and hunting. Non-indigenous animals were considered a particular delicacy. The Guardians\' expansion into space introduced them to new ecologies and, consequently, to new food. So far I\'ve had little success in determining the details of these alien creatures or where they were obtained, but it was certainly a valuable trade for the Guardians. Huge parks and reserves were constructed on their worlds where they could hunt both local and imported animals.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(14,1,6,6,14,'This data is particularly interesting. It appears that another indication of their prowess in biological manipulation was the creation of unique creatures for consumption. This was done to ensure adequate supplies for the general population, although there was also a specialist trade. Having an animal created for a specific celebration demonstrated the owner\'s status and wealth, but being the creator of such a delicacy meant even greater honour. This part of the research could aid us in food production and make famine a thing of the past.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(15,1,6,1,15,'It seems that most of this data package has become corrupted, however I have been able to decipher one section. It seems that the Guardians retained the ability to digest raw meat, and most meals were served uncooked, although they did appreciate cooked meat. This became an almost ceremonial aspect of their eating, and was often incorporated into formal meals.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(16,1,6,4,16,'This data is fascinating commander. I now have a better understanding of the types of environment and how that relates to the Guardians\' development. The alpha-pattern data has yielded a wealth of information on the Guardians, but throughout my research I\'ve also been looking for information on their homeworld...and now I think I\'ve found what we need! The location of their homeworld still eludes me, but this new data may give enough for us to narrow the search criteria.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(17,1,6,2,17,'This data contains more details about the Guardians\' physiology regarding their environment. Looking through previous data collected by pilots like yourself, It came as no surprise to learn that their environmental requirements were very similar to our own. Barring any local biological threats, we could easily live on their worlds - they wouldn\'t even need terraforming. In fact, we would find their worlds more comfortable than the Guardians would ours.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(18,1,6,5,18,'This data contains more details about the Guardians\' physiology regarding their environment. I can see from this data that humanity would indeed be able to cope if not thrive on the same worlds as the Guardians and vice versa. The first key difference is gravity. Most of their worlds have a lower gravity rating than we would consider normal, which no doubt explains their taller, more slender frame. Their flexible bone structure would adapt to high gravity with little discomfort or loss in physical strength.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(19,1,6,3,19,'This data contains more details about the Guardians\' physiology regarding their environment. This data shows that they preferred warmer worlds than we do, and don\'t appear to have been well suited to colder climates. Fragments of their history reveal that they experienced changes in climate in their early history, and it was that - rather than conflict - that prompted their technological development. They had thick skins but lacked a fatty layer, which I think reduced their ability to function in cold temperatures. More and more, the alpha-pattern data extends to include aspects of their culture. It\'s fascinating subject matter, but I still need more data.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(20,2,5,3,1,'This is very interesting commander. This is a new data pattern. I have given it the designation beta-pattern data. I can already report that it contains some fascinating insights into the Guardians culture. The first is that religion formed a large part of their lives. Strangely this seems to have occurred late in their development, after various technological revolutions. The details are a bit vague in this data package. There must be others that hold more cultural details. Please continue the search.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(21,2,5,5,2,'Your hard work is paying off commander. This data holds more details about the Guardians\' culture, specifically spiritual matters. Almost from the dawn of their civilisation they possessed a strong spiritual sense - one that reflected their close connection to the natural world. Even when they\'d developed industrial-scale machinery, they maintained a balance with the world around them. Their ongoing love of hunting presumably played a significant part in this','2018-06-17 12:32:00','2018-06-17 12:32:00'),(22,2,5,1,3,'This data holds more details about the Guardians\' culture, specifically spiritual matters. This spiritual awareness sustained them through most of their history, but did not evolve into a formal religion. It was not until the development of machine intelligence, during the most rapid era of their development, that any sort of organised religion emerged. I speculate that this technological singularity alienated much of the population, who responded by rejecting this technology.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(23,2,5,6,4,'This data holds more details about the Guardians\' culture. The tipping point that gave rise to organised religion amongst the Guardians doesn\'t appear to have been the creation of thinking machines, but other technological developments - in particular a kind of implant that interfaced with the brain. Up to this point, biological enhancement and repair had utilised only organic-based systems, so this sudden change frightened many.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(24,2,5,4,5,'This is very interesting, very interesting indeed. This data holds more details about the Guardians\' culture. There was an anti-technology movement that rejected not only specific developments, but also inventions such as virtual reality. The loose customs associated with their affinity for nature formed the basis for a new belief system. It evolved rapidly - almost as quickly as the technological advancements produced by the scientists and machine intelligences. It\'s interesting to note the parallels with human-made sentient technology, and how its development threatened humanity during the golden age of technological advancement. The growth of this new religion divided the population, and conflict soon erupted','2018-06-17 12:32:00','2018-06-17 12:32:00'),(25,2,5,2,6,'This data holds some shocking revelations. it talks about the religion that emerged towards the end of the guardians civilisation and I wont lie it has shocked me. while religion remains a feature of human society, unless you live in one of the more extreme theocracies, its generally a matter of personal faith rather than a generally accepted consequence of the human condition. I know some of my fellow researchers would disagree with me. but it is generally assumed that religious beliefs tends to reduce their potency as scientific understanding grows in the case of the guardians, the opposite holds true, it truly divided them.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(26,2,5,NULL,7,'This data does not paint a bright picture of the Guardians culture at the point it was recorded. As I examined the data in this beta pattern and crossed references from other data I have received, I have learned that the truth wasn\'t quite so clear cut. The information I\'ve extracted regarding their legal system indicates a stable and mature society. Given the physical similarities between us and them, I\'m amazed at the cultural and societal differences and the speed at which they rose to become part of their lives.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(27,2,5,5,8,'This data contains cultural data, specifically regarding the legal system of the Guardians. In contrast to many of our legal systems, the fundamental laws do not concern individual right, but instead focus on defining the individual\'s responsibilities to society. I\'m sure this is another reflection of their pack mentality, where the requirements of the group supersede those of a single person. Naturally it isn\'t as simple as that in practice – for example, individuals were expected to come to another\'s aid if necessary.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(28,2,5,1,9,'This data contains cultural data, specifically regarding the legal system of the Guardians. An individuals responsibility extended, past simply obeying the law to include elements of law enforcement. Society was self regulated, with everyone required to ensure laws were obeyed. These values were instilled in the young as part of their education in the communal crèches.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(29,2,5,6,10,'This data contains cultural data, specifically further details regarding social responsibility. As well as being regulated, there was still hierarchical form of administration within the legal system. These were defined by areas of responsibility, but as with all the Guardians’ social structures, everyone was expected to participate, meaning that individuals were required to fill certain legislative roles as part of their everyday life. Some of the concepts aren’t completely clear, but I believe individuals were nominated and couldn’t hold office for more than a single term.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(30,2,5,4,11,'An excellent discovery commander. I was wondering when we would find this type of cultural data. I had begun to fear it might not exist. You can tell a lot about a people from their art. Humanity has demonstrated great creativity in artistic expression throughout history, and I\'m keen to compare our art with the Guardians\'. Fortunately I\'ve been able to tease some details from the beta-pattern data abstracts in this data package. We already knew they were capable of fabulous architecture, but these records show that buildings, statues, monoliths and even city layouts were a common outlet for aesthetic expression.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(31,2,5,2,12,'This is truly fascinating data commander, as an engineer myself I have to admit I’m highly curious about the Guardians technology. It seems that the Guardians had a particular fascination with geometric shapes, which they used to illustrate connections between themselves and the world around them. This predilection manifested itself in their technology as well - specifically their monolith network. With this data and the help of the galactic community we’ve partially mapped the monolith network, which formed the backbone of their communications technology, and discovered that they too are arranged in geometric patterns. Whilst this does not give us full access to the network, I believe it is the first step to unlocking the entire system and maybe more.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(32,2,5,3,13,'This data contains more details on the Guardians\' culture, specifically art. Many of the records I\'ve now extracted include the data you\'ve just sent through, show that most of the Guardians\' art had a religious basis. It seems that their shift to a religious society affected all aspects of their lives. I have found older records that indicate other art forms did exist, with realistic and abstract techniques evident. I hoping that some of the data we\'ve yet to decode will contain images of these art works.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(33,2,5,NULL,14,'This data contains more details on the Guardians\' culture, specifically art and how it fitted into social responsibility. It appears each individual Guardian had a cultural commitment to create and share works of art. While it\'s clear that the quality varied between individuals, all works were considered worthy by virtue of their efforts alone. This package does in fact contain many images of their works. It is truly interesting, such a pity we might never know the meaning behind many of these pieces.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(34,2,5,5,15,'A human observer might find the Guardians\' visual art severe and lacking in emotion, but the same could not be said of their music. They didn\'t use musical instruments, so strictly speaking it\'s singing, although I think they might have used their bodies for rhythm and percussion. I\'ve extracted audio from the data you have collected and have listened to, for want of a better term, their “songs”. The range of their voices is something to be admired. And it\'s so rich with emotion – many pieces are so haunting, it breaks the heart to listen them.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(35,2,5,1,16,'This is very interesting data commander. The data describes what must have been a kind of counter culture. Dancing was considered taboo, especially when combined with language gestures, but there is evidence that gesture dances were popular with adolescents, possibly as a form of rebellion. I\'m not sure why such activity was prohibited, but it might have something to do with potentially conflicting information - something they took great pains to avoid.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(36,2,5,6,17,'This data contains details of other past times and cultural events. As a consequence of their extensive industrial automation, the Guardians had a lot more time for social pursuits than we do. It\'s another interesting contrast - we have a similar capability, but our fear of surrendering control to machine intelligence means we remain wedded to idiosyncratic working practices. We could learn so much from this species - I only hope that in some small measure my research guides us toward such enlightenment.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(37,2,5,4,18,'This data contains details of other past times and cultural events. The Guardians didn\'t waste the freedom their technological advancements offered: leisure activities were encouraged, even expected, as part of normal social intercourse. Time was devoted to social responsibilities and furthering personal abilities. Scientific research is a good example of this. Although they stagnated in their later period, throughout their early history the Guardians had a societal obligation to seek out and share knowledge. Research was often conducted in vast collaborative programmes, which were also seen as vital learning experiences.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(38,2,5,2,19,'This data contains more cultural information. Their attitude towards their varied endeavours sets them apart from humans. Their social obligations were not seen as chores - in fact they enjoyed participating in these roles. Because all were obligated to take part, it meant social responsibilities were often a short-term diversion, as well as allowing individuals to accrue a variety of experience. I also think there was a biochemical component that enhanced their enjoyment of such tasks, but I haven\'t been able to prove that supposition yet.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(39,2,5,3,20,'This data contains more details about entertainment as a cultural activity. I believe this data show that the Guardians enjoyed what we would consider traditional entertainment. The performance of classical stories and historical epics seem to have been very popular. Their equivalent to theatre was more participatory than ours, with less of a distinction between audience and performer - so much so that the term \'enactment\' might be more accurate than \'theatre\'. It\'s just another example of this species\' incredible social dynamics.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(40,3,1,NULL,1,'While I haven’t been able to establish a granular time frame for the Guardians, This data you have uncovered has allowed me to identify general eras. Once again I am indebted to you for gathering valuable research data - particularly the gamma-pattern data packages that have helped me unlock this information. The new data illustrates the Guardians’ impressive development. Details of the Guardians’ very early history are sketchy at best, but there’s enough detail for me to reach a few conclusions. We know they evolved as pack hunters with tribal groups of 20 to 30 individuals. They lived in jungle regions similar to those found on Earth, and preferred very hot and humid climates.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(41,3,1,1,2,'This data is remarkable and covers the early history of the Guardians. They were highly intelligent, and developed sophisticated and effective hunting strategies that quickly saw them become the apex predator in their biomes. Their agility allowed them to take advantage of varied terrain and so avoid predation themselves. I was surprised to learn they were nomadic rather than territorial, but this appears to have been motivated by a desire to mix with other groups and increase genetic diversity rather than a lack of prey. The Guardians developed their core vocal and gestural methods of communication quite early, although it wasn\'t until they developed tools that they were able to record suck communication.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(42,3,1,6,3,'This data is very interesting and covers the early history of the Guardians. The Guardians\' recorded history begins much earlier than it does in human history. Their early art appears to be concerned more with recording practical activity than with personal expression, so maybe this practicality was a factor. Their earliest records tell of a great upheaval caused by climate change, and although the exact cause isn\'t recorded, there are references to a dimming of the sun. Whatever the cause, the effect was a drop in global temperature. Having evolved to operate in a tropical environment, the Guardians were unsuited to the suddenly colder climate. But their intelligence allowed the to adapt better than other creatures in their ecology by building primitive shelters from plants','2018-06-17 12:32:00','2018-06-17 12:32:00'),(43,3,1,4,4,'The data provides more details regarding the development of the Guardians in their early history. The worsening weather after what I understand as global climate change or possibly a cosmic event, precipitated the development of tools, which allowed the Guardians to build more durable structures. They soon learned to use stone in their buildings, and with this greater permanence they developed a deeper appreciation for the visual arts, using them to decorate the inside of their homes. Even at this early stage they were conscious of the need for urban planning, and one can clearly see a relationship between the layout of these early villages and the form of their later cities.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(44,3,1,2,5,'This data holds details of the Guardians continue development. It appears that their early nomadic existence came to an end in the same period as the development of more permanent buildings - although the young were still encouraged to journey to other camps - and this switch to a more settled existence brought with it various social changes. For example, the Guardians began to use statues to mark out the regions occupied by a specific clan. It\'s interesting to note, however, that I have found little evidence of conflict between neighbouring clans. Evidently, the careful management of their populations resulted in cooperative strategies rather than competitive ones.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(45,3,1,5,6,'This data contains evidence of increased animal husbandry within the first early settlements, no doubt to ensure adequate food supplies. More startling is the fact that they also practised selective breeding. They possessed a reasonable understanding of inherited traits, which is remarkable given their level of technological development','2018-06-17 12:32:00','2018-06-17 12:32:00'),(46,3,1,3,7,'This data contains evidence that in their late history the Guardians entered an era of great technological development, although this process also precipitated a period of conflict. Their most notable advances were in the field of genetic manipulation. Early experiments involved captive animals before moving on to micro-organisms, the latter triggering advances in medical sciences and engineering. One example is the development of virus-like organisms used to combat specific diseases and supplement the Guardians’ immune systems. This data will be priceless to medical teams throughout the galaxy. More and more I feel we need to publish our results to all. I think that would have been in keeping with the social responsibility shown by the Guardians.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(47,3,1,NULL,8,'This data contains details regarding the rise of new technologies. It appears that the development of these technologies varied between clans, creating inequality and, ultimately, conflict. Initially, that conflict was resolved through personal combat between individual champions, but as clans started using numbers to overwhelm their opponents, the practice of warfare began to spread. This led to a surge in weapons development, with biological warfare quickly established as the weapon of choice. An arms race began, focused on the development of biological agents and various counter measures. It saddens me to discover this as I had hoped the Guardians would prove to be more advanced. A little naive I know as conflict is a common element of many species throughout the galaxy. Whether for resources, land or power over others. We all seem too share this shame.','2018-06-17 12:32:00','2018-06-17 12:32:00'),(48,3,1,1,9,'This data contains the details of the weaponry the Guardians developed during the various conflicts that swept over their civilization. As well as biological weapons, the first flight systems (in the form of airships) and computers were developed around this period. These early computers were used to model the effects of large-scale biological attacks. The spread of war had a devastating impact on the Guardians\' social systems. Population control vanished as the clans realised they needed to be able to absorb large numbers of casualties. The cooperative social Paradigm collapsed and schisms of appeared between populations. I haven\'t determined exact dates yet, but I\'m confident this era of conflict lasted for several centuries.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(49,3,1,6,10,'This data tells of the end of a major conflict in the Guardians history and he rise of their modern society. It took the leadership of a few clans, from the north of the main continent, to restore peace. These clans had endured considerable hardship during their early development, perhaps resulting in a stronger breed. Banding together, they fought a swift war of conquest and brought the entire race under their leadership. It was from this that the Guardians\' modern society, with its rules and balance, developed. Interestingly I\'ve noticed evidence of a genetic break along the north-south divide and of redder skins among the northern clans, suggesting a racial element to the division.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(50,3,1,4,11,'This data speaks about Guardians history and the development of their modern society and the first interest in off world exploration. The Guardian city-states continued to operate for over a thousand years, and the ancient forms of cooperative advancement resulted not only in a large population but also a peaceful and generally happy one. But with a finite amount of land available this population growth couldn\'t continue forever, and as the Guardians neared the limits a conference was organised. Astronomical research had become vogue in the previous decades, and the Guardians had identified a number of accessible planets capable of supporting life. Many individuals aspired to travel among the stars and colonise other planets. At first, such ambitions did not receive much support, but after options such as stricter population control were deemed undesirable, off-world colonisation became the most popular option','2018-06-17 12:32:01','2018-06-17 12:32:01'),(51,3,1,2,12,'This data is incredible. The information regarding the Guardians first attempts at space travel are particularly interesting. Although the Guardians clearly had the capacity for sophisticated flight technology, they had not built anything more advanced than dirigibles, no doubt because airships were more in keeping with their ecologically conscientious philosophy. With rocket technology deemed environmentally unfriendly, they developed vast launchers that used electro-magnetic propulsion to catapult ships into space. Breathable gel cocoons helped pilots and passengers withstand the huge G-forces experienced on launch, and served as hibernation pods during long journeys. Having not yet developed faster-than-light technology, the Guardians constructed three large arks for their first interstellar colonies. Much like the Generation ships in our own history.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(52,3,1,5,13,'This data is extremely exciting commander. Contained in this package is information regarding the Guardians use of faster than light communication. Almost the entirety of the Guardians\' society was devoted to researching interstellar travel and communication. A breakthrough in faster-than-light communication was made before the arks reached their destinations, but the information was transmitted to the arks while they were still in transit, allowing the colonists to establish faster-than-light communications when they landed. Consequently, the interstellar network was developed extremely quickly. The arks kept the population at a manageable level long enough for the Guardians to develop hyperspace technology, which fuelled their expansion into the galaxy. The project also cemented the cooperative city-state model, which would serve the Guardians until their ultimate demise.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(53,3,1,3,14,'This data describes what the guardians referred to as an age of information. Although the Guardians had used computers for generations, it wasn\'t until the development of artificial intelligence that they truly entered an information age. This saw the construction of what ultimately became the monolith network – an interstellar communication and computing system. The network existed before the development of AI, but it was the creation of machine intelligence, along with the development of neural implants, that brought this network into the heart of the Guardians\' society.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(54,3,1,5,15,'Commander this data has proven vital in our attempt to understand the Guardians Technology. It appear the the development of AI increased their technology very quickly. This sudden increase in computational ability – a result of the new implants, allowed the AIs to adapt and eventually evolve true sentience. This sparked a technological singularity – a rapid advancement across the whole landscape of science and technology. As the AIs developed further, this effect snowballed. In conjunction, many Guardians received implants so they could keep up with the extraordinary pace.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(55,3,1,3,16,'This data contains evidence that not all individuals adopted the new technologies and received implants, and the rapid pace of the technological revolution resulted in new forms of inequality and threatened the very fabric of society. Unfortunately, they were unable to muster a unified response to these changes, which widened the gap between those who accepted the changed and those who resisted them. The politicians were the first to react to the changing social landscape, but soon the resistance to the technological revolution took on a religious overtone.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(56,3,1,5,17,'According to this data, the Guardians\' homeworld served as a powerbase for this new religious order, which eventually succeeded in ostracising or exiling all of its opponents. I can find no other reference to these exiles in the historical record. This development should have resulted in peace, but a further division arose over the fate of the AIs. At that time, the AIs were virtual entities, and so were reliant on the monolith network to exist. Because this made them vulnerable, they searched for a way to achieve independence from the network. Their research aroused the fear of the abolitionists, who used violent methods to prevent the AIs from achieving independence, and even to combat those Guardians who accepted the AIs.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(57,3,1,1,18,'This data describes details about the Guardians second civil war. The war was ostensibly fought between the people of the homeworld and the colonies, but in truth there were divisions even among individual city-states. The scale of the conflict far exceeded that of the first civil war. In human terms, the first Guardian civil war was little more than a political clash, albeit with some violent conflict, but the second was an all-out war between the abolitionists and the rest of society. The war eventually destroyed the Guardians\' habitats, forcing them to retreat into \'sacred\' domes protected by powerful shields','2018-06-17 12:32:01','2018-06-17 12:32:01'),(58,3,1,6,19,'This data describes details about the Guardians second civil war. The war raged for many years and eventually destroyed the Guardians\' habitats, forcing them to retreat into \'sacred\' domes protected by powerful shields. Eventually even the domes were destroyed, or their shields failed, and ultimately the population died out. Their predilection for expending resources on honouring the dead - a key tenet of their religion - only served to accelerate their extinction. Records indicate some variation in the nature of this devastation, most obviously at sites consisting of multiple domes. In these locations it appears the inner domes were destroyed later than the outer ones, as indicated by the slightly lower radiation signatures in the inner areas. I can only surmise that the attackers returned, after an initial assault, to finish the job.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(59,3,1,4,20,'This data describes details about the Guardians second civil war. It appears that the Guardians approach to warfare vastly changed as the war continued. Warfare was conducted using automated battle fleets. At first these were controlled by the Guardians via brain implants, but later they became entirely autonomous. In the early stages of the war the Guardians fought each other directly, but within a decade - and after much loss of life - most of the fighting was conducted remotely. Soldiers were deployed only to occupy areas that had been captured by autonomous or remote vehicles, and eventually were not used at all.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(60,3,1,2,21,'This data describes details about the Guardians second civil war. The war raged for over a hundred years, and Guardian populations fell dramatically during this time. Fertility rates dropped due to increased radiation levels and because the Guardians considered it blasphemous to use technology to address a biological issue. Eventually, one of the competing forces triumphed, but by that point, all the Guardians other than those who had been exiled a century earlier were dying.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(61,4,4,NULL,1,'This is fascinating! The obelisks are clearly some form of data storage, but so far I haven\'t been able to determine what other purposes they might have had. I am very much indebted to the you commander for searching for the information I need, although I wish I could see the obelisks for myself. Perhaps closer proximity would inspire greater understanding! Unfortunately my responsibilities here preclude me from such adventure. I believe these are the first clues to understanding the alien language.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(62,4,4,4,2,'I\'m not disheartened, our early interactions have provided the basis for my research. The illuminated patterns are of obvious importance, and I believe represent a form of writing. Their illumination and movement suggest some additional meaning - so much so that I can\'t accept that they\'re merely signs or labels. There is a definite structure here, one that I intend to decipher. The more data you can collect the more I can correlate in the hope of assembling a kind of Rosetta Stone for their language.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(63,4,4,1,3,'It appears I was correct in my theory that the delta-pattern data was the key to unlocking the language of this dead race. Sometimes you have to operate on intuition, but this data you\'ve uncovered makes a connection between some of the glyphs on the obelisks and the forms in the data you have provided. I believe the delta patterns could be the building blocks of a lexicon.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(64,4,4,6,4,'From the data packet you\'ve discovered here I\'ve gained a sense of a very cooperative society - one in which all elements worked in unison towards a common purpose. I also believe they shared an expectation of mutual protection. I\'m still delving into these mysteries, but I believe \'Guardians\' would be a good name for this species.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(65,4,4,2,5,'It\'s dawned on me that the task ahead of us is colossal, and one I eagerly throw myself into. With the help of brave pilots like you, my analysis has revealed there is variation in the data blocks which you are discovering, which I think represents their equivalent of words. This indicates that their language was almost a universal one, which will make my efforts to understand it easier.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(66,4,4,4,6,'This data packet indicates that the guardians used two different forms of communication with the same - or at the very least similar - language constructs, its slow but fascinating work, using this data I believe I can establish a rudimentary understanding of the oldest two forms - verbal communication. like us they had a vocal language, and the range of sounds appears to be similar to that used in human vocalisation.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(67,4,4,3,7,'This is a great find commander. According to this data I\'ve been able to deduce that verbal communication emerged early in their history. The scale of the archaeological sites suggests a social society with large populations. There is some supposition on my part, but the data you just found seems to support this contention','2018-06-17 12:32:01','2018-06-17 12:32:01'),(68,4,4,NULL,8,'Excitingly, this group of delta-pattern recordings contain audio data. Not only will this help me establish the range of sounds they could make, it has should also allow me to confirm that they spoke with accents, as there are regional variations in the sound of their words.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(69,4,4,4,9,'The decoder is having a problem deciphering this data packet and is running slower than I\'d hoped. The data is formulated in such a way that individual constructs are easily extracted, but there seems to be stopping the decoder putting it all back together. I had assumed it would be simpler to establish a list of words even if I didn\'t know the meanings. The relationship between the audio data and the constructs, which I believe to represent their written form, Has revealed to be more complicated than I originally thought. Here is comes. This data seems to suggest that their spoken language was of a tonal form, similar to some human languages, meaning that the exact meaning of a word was determined by how it was said.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(70,4,4,1,10,'With this data we\'ve made a significant advancement. I believe we have identified what might be full sentences for the first time. Words are only fragments of a language – sentences illustrate the rules of it. It\'s only natural that an alien language would be structurally different to human ones. I\'m realising that what I\'d deciphered from the previous data packets were simply nouns. So I decided they must be lists, and looked for other more varied forms. Unfortunately I met with no success, until now.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(71,4,4,6,11,'This Data is just what I’ve been looking for. I had been in a deadlock until the pattern-recognition software highlighted some repeating motifs in this data package. Delving deeper, I think I can establish that not only did variance in sound produce different meanings, but that the placement in relation to other words also altered the meaning. This is a real breakthrough!','2018-06-17 12:32:01','2018-06-17 12:32:01'),(72,4,4,2,12,'This data package is huge. I could all too easily be distracted by the wealth of audio data in these delta patterns. To actually hear the Guardians\' language as it would have been spoken proving too great a temptation. But this data reveals that the formal basis of their communication was visual rather than verbal. This seems logical, as the written word has more portability ad permanence than speech. I plan to dig deeper into the information collected by you and other explorers to learn the visual form, which I believe originated much earlier in the Guardians\' development than I originally thought','2018-06-17 12:32:01','2018-06-17 12:32:01'),(73,4,4,5,13,'This data proves a theory I had that the written form of the Guardians’ language is based around glyphs, with each glyph representing a single word. Once I’ve fully identified these, the process of separating tonal meanings should become much easier. The glyphs seem to be able to be combined to describe complex concepts, but could also communicate additional layers of meaning through the inclusion of movement. Each glyph is a symbol. They are more abstract than pictorial hieroglyphics, but its possible to identify a simplistic reference to the shape of the thing being described - for example, the glyph for ‘moon’ incorporates the waxing and waning as it would have appeared from the Guardians’ homeworld','2018-06-17 12:32:01','2018-06-17 12:32:01'),(74,4,4,3,14,'This data contains the most amazing revelation. It appears to be the key to tracing the origins of the language embedded in the glyph formats. It\'s almost as if their glyphs contained a form of version control that represented the glyphs\' evolution, and this ha given me a glimpse into their history. These glyphs actually evolved from a form of sign language that the guardians developed when hunting. The Guardians were originally pack hunters, and this sign language functioned as a stealthy means of communication','2018-06-17 12:32:01','2018-06-17 12:32:01'),(75,4,4,NULL,15,'Judging from the shape and movement of these primitive glyphs, I have surmised the Guardians had tremendous dexterity and freedom of movement in their forelimbs and hands, and this has provided the first real glimpse of their physiology.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(76,4,4,4,16,'The data here contains details of how the glyphs evolved into a formal form of communication, but there appears to be a conceptual gaps between speech and the glyphs. From the results of your scan, I can see that while all glyphs have a matching vocalisation, not all vocalisations have a matching glyph. Although the dictionary is still quite sparse there is evidence to suggest that particular vocalisations were for emotive terms. With this in mind, I think the Guardians\' spoken language was used primarily for social bonding.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(77,4,4,1,17,'This data regards the markings on the obelisks. These were the starting point for my research into the Guardians\' language as explorers documented them, so it\'s fitting that I\'ve come full circle and now have a better understanding of those markings. I\'ve already established that the written form of the Guardians\' language evolved from the sign language they developed during their pre-history as pack hunters.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(78,4,4,6,18,'The data you\'ve extracted from the delta patterns has granted me further insights - so much so that I\'m confident I can establish a proper dictionary for future research. The limited understanding I\'ve derived from their language reveals a fascinating species. Although the written glyphs share the shape and motion of the original sign language, they also evolved in response to new media, such as electronic representation. The glyphs on the obelisks and other structures provided the primary mechanism for recognising the patterns, and also gave me clues as to what the other data patterns might contain.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(79,4,4,2,19,'The data contained in this obelisk talks about the history of the Guardians\' language. They started to transcribe their signs in pictorial form very early in their development - something akin to the cave paintings from humanity\'s early history - although it\'s clear that even at an early stage their communication was more sophisticated than ours. This clearly speaks of a people with high intelligence and a keen desire to share information. Even though my research has barely begun, I believe we have much to learn from this magnificent people.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(80,4,4,5,20,'This data contain information regarding the formal nature of their written communication and has reinforced what I\'ve learnt about its use so far. As well as the obelisks, it was used for ceremonial and decorative purposes. I\'ve also gained the impression that they found their glyphs aesthetically pleasing.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(81,4,4,3,21,'As is always the case with research of this nature, finding answers tends to raise further questions. I\'ve found references to another form of communication in this data packet, but not one used by the Guardians, or not all of them, at least. As far as I can tell it references some kind of foe or adversary. Combined with the devastation seen at a number of sites, it indicates the Guardians may not have been the cause of their own demise.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(82,5,2,NULL,1,'This data stream is unlike the others. More complex with a lot more layers than the others. Intriguing, this data seems to be about the Guardians technology. This is very exciting, I was hoping we would find this kind of information. The epsilon-pattern data contains a lot of information about the Guardians\' science and engineering, and extracting their historical records has helped isolate some of the specifics, adding to what we know about this fascinating species.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(83,5,2,2,2,'As I have established from other data packages the guardians had the ability to manipulate genetics and active biology to achieve specific results, and it seems their healthcare revolved around this technology. As a species they were susceptible to maladies similar to those that affect us: they could get sick, develop cancers and suffer from parasites. They approached these issues from two different directions: they improved their immune systems to defend against infection, and engineered specific micro-organisms to tackle threats. If we can harness this type of technology we could effectively eradicate disease from our lives.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(84,5,2,1,3,'This data will need further analysis from someone with a greater knowledge of medicine than I possess. It appears that the Guardians’ experimented with biological manipulation extending it to other creatures in their environment. These techniques were used not only to improve life for the other creatures, but also to address ecological issues, although the Guardians took great care to influence things only as much as was needed. There is a lot of data here that while I can generally understand needs a biologist to truly decipher all the information. After all I’m an engineer not a a(sic) doctor.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(85,5,2,6,4,'This data details the social aspects of the Guardians Technology. Although obviously an intelligent species, it was the Guardians\' social constructs that allowed them to progress so quickly. They were required to involve themselves in various socially progressive activities, from caring for the young to researching cutting-edge physics. This was facilitated by institutions, which made research data and education available to all. The development of implants and the monolith network created a kind of shared virtual workspace, and the direct brain interface allowed thoughts to be shared and manipulated. I wonder how much they could have achieved if religious strife hadn\'t brought about their destruction?','2018-06-17 12:32:01','2018-06-17 12:32:01'),(86,5,2,4,5,'This data is incomplete by what we can decipher relates to the communication systems the Guardians used. As with human civilisation, communication systems were key to establishing a stable society. In many respects, the technology the Guardians used was the same as ours, in that they utilised various electro-magnetic wavelengths and physical optical mediums. I suspect their faster-than-light technology shared the same principles as our own, too, although I haven\'t extracted enough technical data to be certain','2018-06-17 12:32:01','2018-06-17 12:32:01'),(87,5,2,5,6,'This data gives some more information about the monolith network - the imposing structures explorers have discovered at various Guardian sites - served as a foundation for all their communication systems. It\'s clear, however, that the monoliths had ceremonial significance as well as being functional, so I mustn\'t underestimate their importance','2018-06-17 12:32:01','2018-06-17 12:32:01'),(88,5,2,NULL,7,'This is very interesting. According to the data package you just sent me they monolith network was used for most if not all communications regardless of importance. In keeping with their predilection for sharing knowledge, few restrictions were placed on the network. I thought there might have been separate networks for military and administrative use, but I haven\'t found any evidence of that. Everything points to an extremely open society, which would have made them even more vulnerable when significant social divisions arose.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(89,5,2,2,8,'Now I understand. This was the missing piece. The monolith network was augmented by vehicle-based communication systems, personal devices and even implants. These were designed to operate seamlessly with the network to provide ad-hoc coverage. Having implants that you can direct communications to you directly would revolutionise communications as we know it. I can only speculate what this would have felt like, but it might have even gone as far as a technological telepathy of sorts.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(90,5,2,1,9,'This data, while unremarkable at first glance has proven something that I long suspected to be true. The networks were content agnostic, and the full range of language forms was supported. I\'ve even found extracts of virtual entertainment experiences that supported full audience participation','2018-06-17 12:32:01','2018-06-17 12:32:01'),(91,5,2,6,10,'This data is only partially intact but I have been able to decode the following information. For a species that experienced only brief periods of war, the Guardians developed very sophisticated means of waging it, although their arsenal was nowhere near as varied as ours. In terms of flight and small-class spaceships, humanity has surpassed the Guardians, but in other respects their technology outmatched ours.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(92,5,2,4,11,'Once area I was unsure about until now was whether the Guardians used their abilities in genetic and biological manipulation to advance their technology and weapons. While some might argue that our technology is equal to the Guardians\', I would counter that their integration of such technology at a societal level gave them a greater knowledge of its application. As well as biological warfare agents, they also created creatures expressly for use in battle, and these remained effective even into the modern era.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(93,5,2,3,12,'This data you have collected contains details of weaponry the Guardians developed. The guardians\' projectile weapons utilised electro-magnetic propulsion, much like their space technology. Such weapons were manufactured in a range of scaled, from personal weapons to capital-ship class. Generally the Guardians used kinetic energy in combat, and explosives were rarely deployed. Nuclear fission and fusion were developed during the Guardians\' astro-expansion period, but when it came to large-scale destructive weaponry they relied on bespoke biological weapons. Predictably, these were of little use against the AIs.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(94,5,2,3,13,'This data contains details of shield technology. The Guardians developed powerful shields that were far in advance of our own. Whole cities were protected by huge shields able to resist even bombardment from space, at least for a time, although these defences were ultimately overwhelmed during the second civil war','2018-06-17 12:32:01','2018-06-17 12:32:01'),(95,5,2,NULL,14,'This data makes up a group of entries regarding the Guardians military. For most of their history the Guardians made use of small forces that combined the roles of military and police. These forces were comprised of volunteers, whose conscription was part of a tacit social contract. In times of war these forces could be expanded rapidly, as most of the adult population had already received basic training.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(96,5,2,2,15,'This data makes up a group of entries regarding the Guardians military. From a military perspective the Guardians had an obvious weakness. Most of their history was peaceful, meaning there was no institutional knowledge or experience of combat. Consequently, tactics and strategy were for the most part theoretical. This, combined with various other factors, resulted in a devastating number of casualties during the second civil war.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(97,5,2,1,16,'This data contains some details regarding AI in the Guardians society. The rise of the artificial intelligence almost elevated the Guardians\' society to a whole new level. There are parallels between the Guardians\' experience of machine sentience and our own, but as with other aspects of their society, the key difference was the way AIs were socially integrated in to the Guardians\' lives. If this process had not been hindered by the rise of the religious abolitionist movement, I believe a technological symbiosis and utopia could have been achieved, but alas id was not to be.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(98,5,2,6,17,'This data gives details of the Guardians research into computer techonolgies. The Guardians\' computer hardware operated on the same principles as our own. Their engineering was more sophisticated, but even to a layperson such as myself if it comprehensible. They experimented with organic computers, but ultimately these failed to meet expectations, except in a few areas such as bio-monitoring. Even then, genetically modified organisms usually performed better.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(99,5,2,4,18,'This data contains some details regarding AI in the Guardians society. What really sets the Guardians apart from humanity, technologically, was the way they embraced neutral implantation and artificial intelligence. Not only did the implants enhance one\'s mental capacity, they also provided one with a direct connection to the monolith network and the fledgling AIs. It was this symbiosis that fuelled the rapid advancement of technology during this era, but unfortunately this same advancement also resulted in the ultimate destruction of their species.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(100,5,2,5,19,'This data contains some details regarding AI in the Guardians\' society. The early AIs were designed with two goals in mind. The first was to augment the abilities of the Guardian operators who were responsible for managing the monolith network and interaction with the AIs - a goal they achieved. The development of shared thought-space technology and neural networking gave their civilisation an unprecedented intellectual boost. The second was for the AIs to actually drive their own development, which they also achieved. The first few generations of AI relied heavily on the monolith network, but they soon evolved into a more distributed model by storing their consciousness within the implants.','2018-06-17 12:32:01','2018-06-17 12:32:01'),(101,5,2,3,20,'This data contains some details regarding AI in the Guardians society. At this stage, social engineering was being used to ensure the AIs adhered to the same user model as their progenitors. But during the first civil war, most implanted Guardians were exiled, and the AIs recognised their vulnerability. They responded by developing their own operational hardware, independent of implanted Guardian users. Frustratingly, the details of these mechanisms have been purged from the record, possibly by the religious extremists who formed the last of the Guardians\' species.','2018-06-17 12:32:01','2018-06-17 12:32:01');
/*!40000 ALTER TABLE `grcodexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grobeliskgroup`
--

DROP TABLE IF EXISTS `grobeliskgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grobeliskgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grType` int(11) DEFAULT NULL,
  `groupName` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GROBELISKGROUP` (`groupName`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grobeliskgroup`
--

LOCK TABLES `grobeliskgroup` WRITE;
/*!40000 ALTER TABLE `grobeliskgroup` DISABLE KEYS */;
INSERT INTO `grobeliskgroup` VALUES (1,1,'A',20,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(2,1,'B',21,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(3,1,'C',14,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(4,1,'D',14,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(5,1,'E',10,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(6,1,'F',22,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(7,1,'G',4,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(8,1,'H',7,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(9,1,'I',20,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(10,1,'J',8,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(11,1,'K',22,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(12,1,'L',10,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(13,1,'M',24,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(14,1,'N',10,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(15,1,'O',20,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(16,1,'P',13,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(17,1,'Q',29,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(18,2,'A',10,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(19,2,'B',6,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(20,2,'C',25,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(21,2,'D',12,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(22,2,'E',27,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(23,2,'F',8,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(24,2,'G',18,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(25,2,'H',10,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(26,2,'I',12,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(27,2,'J',10,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(28,2,'K',27,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(29,2,'L',6,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(30,2,'M',3,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(31,2,'N',25,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(32,2,'O',3,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(33,2,'P',27,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(34,2,'Q',8,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(35,2,'R',27,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(36,2,'S',3,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(37,2,'T',18,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(38,2,'U',55,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(39,3,'A',27,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(40,3,'B',27,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(41,3,'C',15,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(42,3,'D',16,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(43,3,'E',10,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(44,3,'F',15,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(45,3,'G',14,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(46,3,'H',57,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(47,3,'I',18,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(48,3,'J',9,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(49,3,'K',15,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(50,3,'L',14,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(51,3,'M',14,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(52,3,'N',14,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(53,3,'O',8,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(54,3,'P',27,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(55,3,'Q',10,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(56,3,'R',27,'2018-06-17 12:32:21','2018-06-17 12:32:21'),(57,3,'S',8,'2018-06-17 12:32:21','2018-06-17 12:32:21');
/*!40000 ALTER TABLE `grobeliskgroup` ENABLE KEYS */;
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=956 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grobelisks`
--

LOCK TABLES `grobelisks` WRITE;
/*!40000 ALTER TABLE `grobelisks` DISABLE KEYS */;
INSERT INTO `grobelisks` VALUES (1,1,1,1,0,61,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(2,1,1,2,0,61,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(3,1,1,3,0,66,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(4,1,1,4,0,67,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(5,1,1,5,0,1,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(6,1,1,6,0,2,1,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(7,1,1,7,0,3,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(8,1,1,8,0,4,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(9,1,1,9,0,20,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(10,1,1,10,0,21,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(11,1,1,11,0,22,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(12,1,1,12,0,23,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(13,1,1,13,0,40,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(14,1,1,14,0,41,1,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(15,1,1,15,0,42,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(16,1,1,16,0,43,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(17,1,1,17,0,82,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(18,1,1,18,0,83,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(19,1,1,19,0,84,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(20,1,1,20,0,85,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(21,1,2,1,0,22,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(22,1,2,2,0,21,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(23,1,2,3,0,20,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(24,1,2,4,0,22,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(25,1,2,5,0,21,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(26,1,2,6,0,20,1,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(27,1,2,7,0,25,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(28,1,2,8,1,NULL,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(29,1,2,9,0,23,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(30,1,2,10,1,NULL,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(31,1,2,11,1,NULL,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(32,1,2,12,0,23,1,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(33,1,2,13,1,NULL,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(34,1,2,14,0,24,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(35,1,2,15,0,23,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(36,1,2,16,0,22,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(37,1,2,17,0,21,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(38,1,2,18,0,20,1,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(39,1,2,19,0,22,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(40,1,2,20,0,21,1,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(41,1,2,21,0,20,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(42,1,3,1,0,23,1,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(43,1,3,2,0,23,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(44,1,3,3,0,22,1,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(45,1,3,4,0,22,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(46,1,3,5,1,NULL,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(47,1,3,6,0,24,1,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(48,1,3,7,0,24,1,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(49,1,3,8,0,21,1,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(50,1,3,9,1,NULL,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(51,1,3,10,1,NULL,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(52,1,3,11,0,25,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(53,1,3,12,0,25,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(54,1,3,13,0,20,1,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(55,1,3,14,1,NULL,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(56,1,4,1,0,25,1,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(57,1,4,2,0,24,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(58,1,4,3,0,85,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(59,1,4,4,0,84,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(60,1,4,5,1,NULL,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(61,1,4,6,0,25,1,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(62,1,4,7,0,24,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(63,1,4,8,0,86,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(64,1,4,9,1,NULL,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(65,1,4,10,1,NULL,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(66,1,4,11,0,25,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(67,1,4,12,0,24,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(68,1,4,13,0,87,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(69,1,4,14,1,NULL,0,'2018-06-17 12:32:35','2018-06-17 12:32:35'),(70,1,5,1,0,42,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(71,1,5,2,0,43,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(72,1,5,3,0,44,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(73,1,5,4,0,46,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(74,1,5,5,0,45,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(75,1,5,6,0,46,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(76,1,5,7,0,45,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(77,1,5,8,0,41,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(78,1,5,9,0,40,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(79,1,5,10,1,NULL,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(80,1,6,1,0,1,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(81,1,6,2,1,NULL,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(82,1,6,3,0,1,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(83,1,6,4,0,1,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(84,1,6,5,0,2,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(85,1,6,6,0,2,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(86,1,6,7,0,2,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(87,1,6,8,0,2,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(88,1,6,9,0,3,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(89,1,6,10,0,3,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(90,1,6,11,0,NULL,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(91,1,6,12,0,4,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(92,1,6,13,0,3,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(93,1,6,14,0,3,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(94,1,6,15,0,4,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(95,1,6,16,0,NULL,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(96,1,6,17,0,6,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(97,1,6,18,0,6,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(98,1,6,19,0,5,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(99,1,6,20,0,6,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(100,1,6,21,0,6,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(101,1,6,22,0,5,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(102,1,7,1,0,41,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(103,1,7,2,0,42,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(104,1,7,3,0,44,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(105,1,7,4,1,NULL,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(106,1,8,1,0,43,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(107,1,8,2,1,NULL,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(108,1,8,3,0,42,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(109,1,8,4,0,41,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(110,1,8,5,0,40,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(111,1,8,6,1,NULL,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(112,1,8,7,1,NULL,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(113,1,8,8,1,NULL,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(114,1,8,9,1,NULL,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(115,1,9,1,0,1,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(116,1,9,2,1,NULL,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(117,1,9,3,0,1,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(118,1,9,4,0,1,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(119,1,9,5,0,2,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(120,1,9,6,0,3,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(121,1,9,7,0,3,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(122,1,9,8,0,2,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(123,1,9,9,0,5,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(124,1,9,10,0,4,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(125,1,9,11,0,4,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(126,1,9,12,0,6,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(127,1,9,13,0,5,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(128,1,9,14,0,5,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(129,1,9,15,0,5,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(130,1,9,16,0,6,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(131,1,9,17,0,6,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(132,1,9,18,0,6,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(133,1,9,19,0,5,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(134,1,9,20,0,6,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(135,1,10,1,0,40,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(136,1,10,2,0,46,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(137,1,10,3,0,42,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(138,1,10,4,0,45,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(139,1,10,5,0,43,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(140,1,10,6,0,44,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(141,1,10,7,0,41,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(142,1,10,8,1,NULL,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(143,1,11,1,0,82,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(144,1,11,2,1,NULL,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(145,1,11,3,0,82,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(146,1,11,4,0,82,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(147,1,11,5,0,83,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(148,1,11,6,0,83,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(149,1,11,7,0,84,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(150,1,11,8,0,84,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(151,1,11,9,0,40,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(152,1,11,10,0,44,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(153,1,11,11,0,44,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(154,1,11,12,0,43,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(155,1,11,13,0,40,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(156,1,11,14,0,44,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(157,1,11,15,0,44,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(158,1,11,16,0,43,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(159,1,11,17,0,20,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(160,1,11,18,0,21,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(161,1,11,19,0,23,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(162,1,11,20,0,24,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(163,1,11,21,0,25,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(164,1,11,22,0,25,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(165,1,12,1,0,42,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(166,1,12,2,0,43,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(167,1,12,3,0,44,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(168,1,12,4,0,46,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(169,1,12,5,0,45,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(170,1,12,6,0,46,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(171,1,12,7,0,45,1,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(172,1,12,8,0,41,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(173,1,12,9,0,40,0,'2018-06-17 12:32:36','2018-06-17 12:32:36'),(174,1,12,10,1,NULL,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(175,1,13,1,0,61,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(176,1,13,2,0,62,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(177,1,13,3,0,63,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(178,1,13,4,0,64,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(179,1,13,5,0,65,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(180,1,13,6,0,66,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(181,1,13,7,0,67,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(182,1,13,8,1,NULL,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(183,1,13,9,0,61,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(184,1,13,10,0,62,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(185,1,13,11,0,63,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(186,1,13,12,0,64,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(187,1,13,13,0,65,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(188,1,13,14,0,66,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(189,1,13,15,1,NULL,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(190,1,13,16,1,NULL,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(191,1,13,17,0,61,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(192,1,13,18,0,62,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(193,1,13,19,0,63,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(194,1,13,20,0,64,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(195,1,13,21,0,65,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(196,1,13,22,0,66,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(197,1,13,23,1,NULL,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(198,1,13,24,0,67,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(199,1,14,1,0,42,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(200,1,14,2,0,43,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(201,1,14,3,0,44,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(202,1,14,4,0,46,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(203,1,14,5,0,45,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(204,1,14,6,0,46,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(205,1,14,7,0,45,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(206,1,14,8,0,NULL,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(207,1,14,9,0,40,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(208,1,14,10,1,NULL,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(209,1,15,1,0,82,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(210,1,15,2,0,83,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(211,1,15,3,0,84,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(212,1,15,4,0,85,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(213,1,15,5,0,86,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(214,1,15,6,0,87,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(215,1,15,7,0,82,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(216,1,15,8,0,83,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(217,1,15,9,0,84,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(218,1,15,10,0,85,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(219,1,15,11,0,86,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(220,1,15,12,0,87,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(221,1,15,13,1,NULL,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(222,1,15,14,1,NULL,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(223,1,15,15,0,83,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(224,1,15,16,0,84,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(225,1,15,17,0,85,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(226,1,15,18,0,86,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(227,1,15,19,0,86,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(228,1,15,20,0,87,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(229,1,16,1,0,87,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(230,1,16,2,0,87,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(231,1,16,3,0,87,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(232,1,16,4,0,86,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(233,1,16,5,0,86,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(234,1,16,6,0,84,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(235,1,16,7,0,84,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(236,1,16,8,0,85,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(237,1,16,9,0,85,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(238,1,16,10,0,83,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(239,1,16,11,0,83,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(240,1,16,12,0,82,1,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(241,1,16,13,0,82,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(242,1,17,1,0,62,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(243,1,17,2,1,NULL,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(244,1,17,3,0,63,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(245,1,17,4,0,63,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(246,1,17,5,0,64,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(247,1,17,6,0,65,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(248,1,17,7,0,66,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(249,1,17,8,0,67,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(250,1,17,9,0,67,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(251,1,17,10,0,65,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(252,1,17,11,1,NULL,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(253,1,17,12,1,NULL,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(254,1,17,13,0,62,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(255,1,17,14,0,63,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(256,1,17,15,0,64,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(257,1,17,16,0,65,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(258,1,17,17,0,66,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(259,1,17,18,0,67,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(260,1,17,19,0,67,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(261,1,17,20,1,NULL,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(262,1,17,21,0,62,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(263,1,17,22,0,62,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(264,1,17,23,0,63,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(265,1,17,24,0,64,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(266,1,17,25,0,65,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(267,1,17,26,0,66,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(268,1,17,27,0,67,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(269,1,17,28,0,66,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(270,1,17,29,0,64,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(271,2,18,1,0,55,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(272,2,18,2,0,54,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(273,2,18,3,0,53,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(274,2,18,4,0,47,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(275,2,18,5,0,52,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(276,2,18,6,0,47,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(277,2,18,7,0,NULL,0,'2018-06-17 12:32:37','2018-06-17 12:32:37'),(278,2,18,8,0,48,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(279,2,18,9,0,49,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(280,2,18,10,1,NULL,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(281,2,19,1,0,88,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(282,2,19,2,0,89,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(283,2,19,3,0,91,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(284,2,19,4,0,90,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(285,2,19,5,1,NULL,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(286,2,19,6,0,92,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(287,2,20,1,0,72,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(288,2,20,2,1,NULL,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(289,2,20,3,1,NULL,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(290,2,20,4,1,NULL,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(291,2,20,5,0,72,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(292,2,20,6,1,NULL,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(293,2,20,7,1,NULL,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(294,2,20,8,1,NULL,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(295,2,20,9,0,72,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(296,2,20,10,0,70,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(297,2,20,11,0,69,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(298,2,20,12,0,68,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(299,2,20,13,0,68,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(300,2,20,14,0,71,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(301,2,20,15,0,70,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(302,2,20,16,0,69,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(303,2,20,17,0,68,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(304,2,20,18,0,71,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(305,2,20,19,0,70,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(306,2,20,20,0,69,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(307,2,20,21,0,68,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(308,2,20,22,0,71,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(309,2,20,23,0,70,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(310,2,20,24,0,NULL,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(311,2,20,25,0,68,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(312,2,21,1,0,51,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(313,2,21,2,0,49,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(314,2,21,3,0,NULL,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(315,2,21,4,0,52,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(316,2,21,5,0,50,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(317,2,21,6,0,48,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(318,2,21,7,0,52,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(319,2,21,8,0,50,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(320,2,21,9,0,48,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(321,2,21,10,0,51,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(322,2,21,11,0,49,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(323,2,21,12,0,47,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(324,2,22,1,0,88,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(325,2,22,2,0,89,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(326,2,22,3,0,90,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(327,2,22,4,0,91,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(328,2,22,5,0,92,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(329,2,22,6,0,93,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(330,2,22,7,0,94,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(331,2,22,8,0,12,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(332,2,22,9,0,11,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(333,2,22,10,0,26,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(334,2,22,11,0,27,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(335,2,22,12,0,28,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(336,2,22,13,0,29,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(337,2,22,14,0,30,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(338,2,22,15,0,31,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(339,2,22,16,0,32,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(340,2,22,17,0,10,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(341,2,22,18,0,9,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(342,2,22,19,0,68,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(343,2,22,20,0,69,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(344,2,22,21,0,70,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(345,2,22,22,0,71,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(346,2,22,23,0,72,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(347,2,22,24,0,73,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(348,2,22,25,0,74,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(349,2,22,26,0,7,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(350,2,22,27,0,8,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(351,2,23,1,1,NULL,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(352,2,23,2,0,50,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(353,2,23,3,0,48,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(354,2,23,4,0,51,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(355,2,23,5,0,53,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(356,2,23,6,0,52,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(357,2,23,7,0,54,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(358,2,23,8,0,55,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(359,2,24,1,0,53,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(360,2,24,2,0,54,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(361,2,24,3,0,54,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(362,2,24,4,0,53,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(363,2,24,5,0,48,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(364,2,24,6,0,48,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(365,2,24,7,0,52,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(366,2,24,8,0,55,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(367,2,24,9,0,54,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(368,2,24,10,0,53,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(369,2,24,11,0,49,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(370,2,24,12,0,NULL,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(371,2,24,13,0,51,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(372,2,24,14,0,55,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(373,2,24,15,0,55,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(374,2,24,16,0,49,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(375,2,24,17,0,49,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(376,2,24,18,0,47,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(377,2,25,1,1,NULL,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(378,2,25,2,1,NULL,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(379,2,25,3,0,93,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(380,2,25,4,1,NULL,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(381,2,25,5,0,92,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(382,2,25,6,1,NULL,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(383,2,25,7,0,91,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(384,2,25,8,0,90,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(385,2,25,9,0,89,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(386,2,25,10,0,88,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(387,2,26,1,0,50,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(388,2,26,2,0,29,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(389,2,26,3,0,71,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(390,2,26,4,0,49,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(391,2,26,5,0,28,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(392,2,26,6,0,70,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(393,2,26,7,0,48,0,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(394,2,26,8,0,27,1,'2018-06-17 12:32:38','2018-06-17 12:32:38'),(395,2,26,9,0,NULL,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(396,2,26,10,0,47,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(397,2,26,11,0,26,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(398,2,26,12,0,68,1,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(399,2,27,1,1,NULL,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(400,2,27,2,1,NULL,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(401,2,27,3,0,89,1,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(402,2,27,4,1,NULL,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(403,2,27,5,0,90,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(404,2,27,6,1,NULL,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(405,2,27,7,0,91,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(406,2,27,8,0,92,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(407,2,27,9,0,93,1,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(408,2,27,10,0,94,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(409,2,28,1,1,NULL,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(410,2,28,2,0,32,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(411,2,28,3,0,31,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(412,2,28,4,0,30,1,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(413,2,28,5,0,29,1,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(414,2,28,6,0,28,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(415,2,28,7,0,27,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(416,2,28,8,0,26,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(417,2,28,9,0,32,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(418,2,28,10,1,NULL,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(419,2,28,11,1,NULL,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(420,2,28,12,0,31,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(421,2,28,13,0,30,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(422,2,28,14,0,29,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(423,2,28,15,0,28,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(424,2,28,16,0,27,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(425,2,28,17,0,26,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(426,2,28,18,0,31,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(427,2,28,19,0,32,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(428,2,28,20,1,NULL,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(429,2,28,21,0,31,1,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(430,2,28,22,0,30,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(431,2,28,23,0,29,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(432,2,28,24,0,28,1,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(433,2,28,25,0,27,1,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(434,2,28,26,0,26,1,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(435,2,28,27,0,NULL,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(436,2,29,1,0,90,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(437,2,29,2,0,91,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(438,2,29,3,0,92,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(439,2,29,4,1,NULL,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(440,2,29,5,0,93,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(441,2,29,6,0,94,1,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(442,2,30,1,0,88,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(443,2,30,2,0,88,1,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(444,2,30,3,0,89,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(445,2,31,1,0,73,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(446,2,31,2,0,74,1,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(447,2,31,3,0,73,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(448,2,31,4,0,72,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(449,2,31,5,0,74,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(450,2,31,6,0,74,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(451,2,31,7,0,73,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(452,2,31,8,0,72,1,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(453,2,31,9,0,74,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(454,2,31,10,0,74,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(455,2,31,11,0,73,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(456,2,31,12,0,72,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(457,2,31,13,0,68,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(458,2,31,14,0,NULL,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(459,2,31,15,0,74,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(460,2,31,16,0,73,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(461,2,31,17,0,72,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(462,2,31,18,0,NULL,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(463,2,31,19,0,73,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(464,2,31,20,0,73,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(465,2,31,21,0,72,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(466,2,31,22,0,NULL,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(467,2,31,23,0,74,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(468,2,31,24,0,73,1,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(469,2,31,25,0,72,1,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(470,2,32,1,0,94,0,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(471,2,32,2,0,94,1,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(472,2,32,3,0,93,1,'2018-06-17 12:32:39','2018-06-17 12:32:39'),(473,2,33,1,1,NULL,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(474,2,33,2,0,32,1,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(475,2,33,3,0,27,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(476,2,33,4,0,28,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(477,2,33,5,0,29,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(478,2,33,6,0,30,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(479,2,33,7,0,31,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(480,2,33,8,0,32,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(481,2,33,9,0,31,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(482,2,33,10,1,NULL,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(483,2,33,11,1,NULL,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(484,2,33,12,0,27,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(485,2,33,13,0,28,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(486,2,33,14,0,29,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(487,2,33,15,0,30,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(488,2,33,16,0,31,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(489,2,33,17,0,NULL,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(490,2,33,18,0,NULL,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(491,2,33,19,0,26,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(492,2,33,20,1,NULL,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(493,2,33,21,0,27,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(494,2,33,22,0,28,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(495,2,33,23,0,29,1,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(496,2,33,24,0,30,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(497,2,33,25,0,31,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(498,2,33,26,0,32,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(499,2,33,27,0,26,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(500,2,34,1,0,88,1,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(501,2,34,2,1,NULL,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(502,2,34,3,0,90,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(503,2,34,4,0,90,1,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(504,2,34,5,0,91,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(505,2,34,6,0,92,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(506,2,34,7,1,NULL,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(507,2,34,8,1,NULL,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(508,2,35,1,0,29,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(509,2,35,2,0,29,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(510,2,35,3,0,49,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(511,2,35,4,0,NULL,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(512,2,35,5,0,6,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(513,2,35,6,0,29,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(514,2,35,7,0,NULL,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(515,2,35,8,0,26,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(516,2,35,9,0,NULL,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(517,2,35,10,0,32,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(518,2,35,11,0,48,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(519,2,35,12,0,8,1,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(520,2,35,13,0,50,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(521,2,35,14,0,10,1,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(522,2,35,15,0,52,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(523,2,35,16,0,12,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(524,2,35,17,0,54,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(525,2,35,18,0,27,1,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(526,2,35,19,0,47,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(527,2,35,20,0,NULL,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(528,2,35,21,0,29,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(529,2,35,22,0,29,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(530,2,35,23,0,51,1,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(531,2,35,24,0,11,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(532,2,35,25,0,29,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(533,2,35,26,0,5,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(534,2,35,27,0,55,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(535,2,36,1,0,94,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(536,2,36,2,0,93,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(537,2,36,3,0,94,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(538,2,37,1,0,55,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(539,2,37,2,0,54,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(540,2,37,3,0,53,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(541,2,37,4,0,52,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(542,2,37,5,0,51,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(543,2,37,6,0,50,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(544,2,37,7,0,55,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(545,2,37,8,0,54,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(546,2,37,9,0,53,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(547,2,37,10,0,52,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(548,2,37,11,0,51,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(549,2,37,12,0,50,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(550,2,37,13,0,55,1,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(551,2,37,14,0,54,1,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(552,2,37,15,0,53,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(553,2,37,16,0,52,1,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(554,2,37,17,0,51,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(555,2,37,18,0,50,1,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(556,2,38,1,0,7,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(557,2,38,2,0,12,1,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(558,2,38,3,0,NULL,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(559,2,38,4,0,11,1,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(560,2,38,5,0,11,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(561,2,38,6,0,11,0,'2018-06-17 12:32:40','2018-06-17 12:32:40'),(562,2,38,7,0,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(563,2,38,8,0,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(564,2,38,9,0,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(565,2,38,10,0,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(566,2,38,11,0,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(567,2,38,12,0,8,1,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(568,2,38,13,0,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(569,2,38,14,0,7,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(570,2,38,15,0,7,1,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(571,2,38,16,0,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(572,2,38,17,0,89,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(573,2,38,18,0,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(574,2,38,19,1,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(575,2,38,20,0,12,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(576,2,38,21,0,12,1,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(577,2,38,22,0,12,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(578,2,38,23,0,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(579,2,38,24,0,11,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(580,2,38,25,0,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(581,2,38,26,0,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(582,2,38,27,0,9,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(583,2,38,28,0,9,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(584,2,38,29,0,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(585,2,38,30,0,8,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(586,2,38,31,0,8,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(587,2,38,32,0,7,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(588,2,38,33,0,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(589,2,38,34,0,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(590,2,38,35,0,88,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(591,2,38,36,0,91,1,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(592,2,38,37,1,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(593,2,38,38,1,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(594,2,38,39,0,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(595,2,38,40,0,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(596,2,38,41,0,11,1,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(597,2,38,42,0,11,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(598,2,38,43,0,10,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(599,2,38,44,0,10,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(600,2,38,45,0,9,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(601,2,38,46,0,9,1,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(602,2,38,47,0,8,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(603,2,38,48,0,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(604,2,38,49,0,8,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(605,2,38,50,0,7,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(606,2,38,51,0,7,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(607,2,38,52,0,90,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(608,2,38,53,0,93,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(609,2,38,54,0,90,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(610,2,38,55,0,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(611,3,39,1,1,NULL,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(612,3,39,2,0,13,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(613,3,39,3,0,19,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(614,3,39,4,0,18,1,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(615,3,39,5,0,17,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(616,3,39,6,0,16,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(617,3,39,7,0,15,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(618,3,39,8,0,14,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(619,3,39,9,0,13,0,'2018-06-17 12:32:41','2018-06-17 12:32:41'),(620,3,39,10,1,NULL,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(621,3,39,11,1,NULL,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(622,3,39,12,0,19,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(623,3,39,13,0,18,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(624,3,39,14,0,17,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(625,3,39,15,0,16,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(626,3,39,16,0,15,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(627,3,39,17,0,14,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(628,3,39,18,0,13,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(629,3,39,19,0,14,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(630,3,39,20,1,NULL,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(631,3,39,21,0,19,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(632,3,39,22,0,18,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(633,3,39,23,0,17,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(634,3,39,24,0,16,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(635,3,39,25,0,15,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(636,3,39,26,0,14,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(637,3,39,27,0,13,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(638,3,40,1,1,NULL,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(639,3,40,2,0,13,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(640,3,40,3,0,19,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(641,3,40,4,0,18,1,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(642,3,40,5,0,17,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(643,3,40,6,0,16,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(644,3,40,7,0,15,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(645,3,40,8,0,14,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(646,3,40,9,0,13,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(647,3,40,10,1,NULL,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(648,3,40,11,1,NULL,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(649,3,40,12,0,19,1,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(650,3,40,13,0,18,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(651,3,40,14,0,17,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(652,3,40,15,0,16,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(653,3,40,16,0,15,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(654,3,40,17,0,14,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(655,3,40,18,0,13,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(656,3,40,19,0,18,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(657,3,40,20,1,NULL,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(658,3,40,21,0,19,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(659,3,40,22,0,18,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(660,3,40,23,0,17,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(661,3,40,24,0,16,1,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(662,3,40,25,0,15,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(663,3,40,26,0,14,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(664,3,40,27,0,13,1,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(665,3,41,1,1,NULL,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(666,3,41,2,0,38,1,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(667,3,41,3,0,37,1,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(668,3,41,4,0,36,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(669,3,41,5,0,33,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(670,3,41,6,1,NULL,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(671,3,41,7,0,37,1,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(672,3,41,8,0,38,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(673,3,41,9,0,36,1,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(674,3,41,10,0,34,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(675,3,41,11,1,NULL,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(676,3,41,12,1,NULL,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(677,3,41,13,0,39,1,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(678,3,41,14,0,35,1,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(679,3,41,15,0,35,1,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(680,3,42,1,0,60,1,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(681,3,42,2,0,81,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(682,3,42,3,0,78,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(683,3,42,4,0,77,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(684,3,42,5,1,NULL,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(685,3,42,6,0,81,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(686,3,42,7,0,79,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(687,3,42,8,0,76,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(688,3,42,9,1,NULL,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(689,3,42,10,1,NULL,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(690,3,42,11,0,60,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(691,3,42,12,0,80,1,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(692,3,42,13,0,80,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(693,3,42,14,0,75,1,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(694,3,42,15,0,75,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(695,3,42,16,1,NULL,0,'2018-06-17 12:32:42','2018-06-17 12:32:42'),(696,3,43,1,0,58,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(697,3,43,2,0,59,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(698,3,43,3,0,60,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(699,3,43,4,0,58,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(700,3,43,5,0,59,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(701,3,43,6,0,57,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(702,3,43,7,0,56,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(703,3,43,8,0,57,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(704,3,43,9,0,56,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(705,3,43,10,1,NULL,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(706,3,44,1,1,NULL,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(707,3,44,2,0,98,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(708,3,44,3,0,97,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(709,3,44,4,0,96,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(710,3,44,5,0,95,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(711,3,44,6,0,99,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(712,3,44,7,0,98,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(713,3,44,8,0,97,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(714,3,44,9,0,96,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(715,3,44,10,0,95,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(716,3,44,11,1,NULL,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(717,3,44,12,0,98,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(718,3,44,13,0,97,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(719,3,44,14,0,96,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(720,3,44,15,0,95,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(721,3,45,1,1,NULL,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(722,3,45,2,1,NULL,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(723,3,45,3,0,101,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(724,3,45,4,0,100,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(725,3,45,5,0,99,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(726,3,45,6,1,NULL,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(727,3,45,7,0,101,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(728,3,45,8,0,100,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(729,3,45,9,0,99,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(730,3,45,10,1,NULL,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(731,3,45,11,1,NULL,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(732,3,45,12,0,101,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(733,3,45,13,0,100,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(734,3,45,14,0,99,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(735,3,46,1,0,NULL,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(736,3,46,2,0,75,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(737,3,46,3,0,76,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(738,3,46,4,0,77,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(739,3,46,5,0,78,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(740,3,46,6,0,79,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(741,3,46,7,0,80,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(742,3,46,8,0,78,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(743,3,46,9,0,77,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(744,3,46,10,0,76,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(745,3,46,11,0,79,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(746,3,46,12,0,81,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(747,3,46,13,0,81,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(748,3,46,14,0,80,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(749,3,46,15,0,79,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(750,3,46,16,0,78,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(751,3,46,17,0,77,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(752,3,46,18,0,76,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(753,3,46,19,1,NULL,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(754,3,46,20,0,75,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(755,3,46,21,0,75,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(756,3,46,22,0,76,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(757,3,46,23,0,77,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(758,3,46,24,0,78,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(759,3,46,25,0,79,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(760,3,46,26,0,80,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(761,3,46,27,0,81,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(762,3,46,28,0,78,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(763,3,46,29,0,75,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(764,3,46,30,0,75,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(765,3,46,31,0,76,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(766,3,46,32,0,81,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(767,3,46,33,0,80,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(768,3,46,34,0,79,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(769,3,46,35,0,78,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(770,3,46,36,0,77,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(771,3,46,37,0,76,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(772,3,46,38,1,NULL,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(773,3,46,39,1,NULL,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(774,3,46,40,0,76,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(775,3,46,41,0,77,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(776,3,46,42,0,78,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(777,3,46,43,0,79,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(778,3,46,44,0,80,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(779,3,46,45,0,81,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(780,3,46,46,0,NULL,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(781,3,46,47,0,79,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(782,3,46,48,0,78,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(783,3,46,49,0,77,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(784,3,46,50,0,81,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(785,3,46,51,0,80,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(786,3,46,52,0,79,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(787,3,46,53,0,78,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(788,3,46,54,0,77,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(789,3,46,55,0,76,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(790,3,46,56,0,75,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(791,3,46,57,1,NULL,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(792,3,47,1,0,15,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(793,3,47,2,0,16,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(794,3,47,3,0,17,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(795,3,47,4,0,18,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(796,3,47,5,0,19,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(797,3,47,6,0,13,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(798,3,47,7,0,14,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(799,3,47,8,0,15,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(800,3,47,9,0,16,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(801,3,47,10,0,17,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(802,3,47,11,0,18,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(803,3,47,12,0,14,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(804,3,47,13,0,13,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(805,3,47,14,0,19,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(806,3,47,15,0,18,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(807,3,47,16,0,17,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(808,3,47,17,0,16,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(809,3,47,18,0,15,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(810,3,48,1,1,NULL,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(811,3,48,2,1,NULL,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(812,3,48,3,0,60,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(813,3,48,4,0,57,1,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(814,3,48,5,0,59,0,'2018-06-17 12:32:43','2018-06-17 12:32:43'),(815,3,48,6,1,NULL,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(816,3,48,7,0,60,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(817,3,48,8,0,56,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(818,3,48,9,0,58,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(819,3,49,1,1,NULL,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(820,3,49,2,0,97,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(821,3,49,3,0,96,1,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(822,3,49,4,0,95,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(823,3,49,5,0,101,1,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(824,3,49,6,0,98,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(825,3,49,7,0,97,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(826,3,49,8,0,96,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(827,3,49,9,0,95,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(828,3,49,10,0,101,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(829,3,49,11,0,98,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(830,3,49,12,0,97,1,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(831,3,49,13,0,96,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(832,3,49,14,0,95,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(833,3,49,15,0,101,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(834,3,50,1,1,NULL,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(835,3,50,2,0,98,1,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(836,3,50,3,0,99,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(837,3,50,4,0,100,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(838,3,50,5,0,101,1,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(839,3,50,6,1,NULL,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(840,3,50,7,0,98,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(841,3,50,8,0,99,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(842,3,50,9,0,100,1,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(843,3,50,10,0,101,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(844,3,50,11,1,NULL,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(845,3,50,12,0,99,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(846,3,50,13,0,100,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(847,3,50,14,0,101,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(848,3,51,1,0,39,1,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(849,3,51,2,0,39,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(850,3,51,3,0,36,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(851,3,51,4,0,36,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(852,3,51,5,0,33,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(853,3,51,6,0,38,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(854,3,51,7,0,38,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(855,3,51,8,0,35,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(856,3,51,9,0,35,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(857,3,51,10,0,37,1,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(858,3,51,11,0,37,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(859,3,51,12,0,34,1,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(860,3,51,13,0,34,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(861,3,51,14,0,33,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(862,3,52,1,0,95,1,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(863,3,52,2,0,96,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(864,3,52,3,0,97,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(865,3,52,4,1,NULL,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(866,3,52,5,0,95,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(867,3,52,6,0,96,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(868,3,52,7,0,97,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(869,3,52,8,0,98,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(870,3,52,9,1,NULL,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(871,3,52,10,0,95,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(872,3,52,11,0,96,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(873,3,52,12,0,97,1,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(874,3,52,13,0,98,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(875,3,52,14,1,NULL,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(876,3,53,1,0,58,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(877,3,53,2,0,59,1,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(878,3,53,3,0,56,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(879,3,53,4,0,60,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(880,3,53,5,0,56,1,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(881,3,53,6,0,60,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(882,3,53,7,0,57,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(883,3,53,8,1,NULL,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(884,3,54,1,1,NULL,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(885,3,54,2,0,NULL,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(886,3,54,3,0,39,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(887,3,54,4,0,38,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(888,3,54,5,0,37,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(889,3,54,6,0,36,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(890,3,54,7,0,35,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(891,3,54,8,0,34,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(892,3,54,9,0,33,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(893,3,54,10,1,NULL,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(894,3,54,11,1,NULL,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(895,3,54,12,0,39,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(896,3,54,13,0,38,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(897,3,54,14,0,37,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(898,3,54,15,0,36,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(899,3,54,16,0,35,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(900,3,54,17,0,36,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(901,3,54,18,0,33,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(902,3,54,19,0,36,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(903,3,54,20,1,NULL,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(904,3,54,21,0,39,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(905,3,54,22,0,38,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(906,3,54,23,0,37,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(907,3,54,24,0,36,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(908,3,54,25,0,35,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(909,3,54,26,0,34,1,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(910,3,54,27,0,33,1,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(911,3,55,1,0,58,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(912,3,55,2,0,59,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(913,3,55,3,0,60,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(914,3,55,4,0,58,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(915,3,55,5,0,60,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(916,3,55,6,0,57,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(917,3,55,7,0,59,1,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(918,3,55,8,0,57,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(919,3,55,9,0,56,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(920,3,55,10,1,NULL,0,'2018-06-17 12:32:44','2018-06-17 12:32:44'),(921,3,56,1,0,33,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(922,3,56,2,0,34,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(923,3,56,3,0,35,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(924,3,56,4,0,36,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(925,3,56,5,0,37,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(926,3,56,6,0,38,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(927,3,56,7,0,39,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(928,3,56,8,0,59,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(929,3,56,9,0,58,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(930,3,56,10,0,33,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(931,3,56,11,0,34,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(932,3,56,12,0,35,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(933,3,56,13,0,36,1,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(934,3,56,14,0,NULL,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(935,3,56,15,0,38,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(936,3,56,16,0,39,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(937,3,56,17,0,57,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(938,3,56,18,0,56,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(939,3,56,19,0,33,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(940,3,56,20,0,34,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(941,3,56,21,0,35,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(942,3,56,22,0,36,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(943,3,56,23,0,37,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(944,3,56,24,0,38,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(945,3,56,25,0,38,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(946,3,56,26,1,NULL,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(947,3,56,27,1,NULL,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(948,3,57,1,0,57,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(949,3,57,2,0,57,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(950,3,57,3,0,56,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(951,3,57,4,0,56,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(952,3,57,5,0,58,1,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(953,3,57,6,0,58,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(954,3,57,7,0,59,0,'2018-06-17 12:32:45','2018-06-17 12:32:45'),(955,3,57,8,0,59,0,'2018-06-17 12:32:45','2018-06-17 12:32:45');
/*!40000 ALTER TABLE `grobelisks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grreports`
--

DROP TABLE IF EXISTS `grreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GRREPORTS` (`systemName`,`bodyName`,`cmdrName`,`comment`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GRTYPES` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grtypes`
--

LOCK TABLES `grtypes` WRITE;
/*!40000 ALTER TABLE `grtypes` DISABLE KEYS */;
INSERT INTO `grtypes` VALUES (1,'Alpha','2018-06-17 12:33:08','2018-06-17 12:33:08'),(2,'Beta','2018-06-17 12:33:08','2018-06-17 12:33:08'),(3,'Gamma','2018-06-17 12:33:08','2018-06-17 12:33:08');
/*!40000 ALTER TABLE `grtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gsactivegroups`
--

DROP TABLE IF EXISTS `gsactivegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsactivegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grSite` int(11) DEFAULT NULL,
  `activeGroup` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gsSite` int(11) DEFAULT NULL,
  `gsObelisk` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GSARTIFACTS` (`artifactName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gsartifacts`
--

LOCK TABLES `gsartifacts` WRITE;
/*!40000 ALTER TABLE `gsartifacts` DISABLE KEYS */;
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GSCODEXCATEGORIES` (`categoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gscodexcategories`
--

LOCK TABLES `gscodexcategories` WRITE;
/*!40000 ALTER TABLE `gscodexcategories` DISABLE KEYS */;
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
  `text` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GSCODEXDATA` (`text`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gscodexdata`
--

LOCK TABLES `gscodexdata` WRITE;
/*!40000 ALTER TABLE `gscodexdata` DISABLE KEYS */;
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GSOBELISKGROUPS` (`groupName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gsobeliskgroups`
--

LOCK TABLES `gsobeliskgroups` WRITE;
/*!40000 ALTER TABLE `gsobeliskgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `gsobeliskgroups` ENABLE KEYS */;
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gsobelisks`
--

LOCK TABLES `gsobelisks` WRITE;
/*!40000 ALTER TABLE `gsobelisks` DISABLE KEYS */;
/*!40000 ALTER TABLE `gsobelisks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gsreports`
--

DROP TABLE IF EXISTS `gsreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GSREPORTS` (`systemName`,`bodyName`,`cmdrName`,`comment`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `hasDatabank` tinyint(1) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GSTYPES` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gstypes`
--

LOCK TABLES `gstypes` WRITE;
/*!40000 ALTER TABLE `gstypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `gstypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gysites`
--

DROP TABLE IF EXISTS `gysites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gysites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GYTYPES` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gytypes`
--

LOCK TABLES `gytypes` WRITE;
/*!40000 ALTER TABLE `gytypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `gytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `ring` int(11) DEFAULT NULL,
  `locationType` varchar(255) DEFAULT NULL,
  `bmSite` int(11) DEFAULT NULL,
  `btSite` int(11) DEFAULT NULL,
  `fgSite` int(11) DEFAULT NULL,
  `fmSite` int(11) DEFAULT NULL,
  `genSite` int(11) DEFAULT NULL,
  `grSite` int(11) DEFAULT NULL,
  `gsSite` int(11) DEFAULT NULL,
  `gySite` int(11) DEFAULT NULL,
  `lsSite` int(11) DEFAULT NULL,
  `msSite` int(11) DEFAULT NULL,
  `tbSite` int(11) DEFAULT NULL,
  `tsSite` int(11) DEFAULT NULL,
  `twSite` int(11) DEFAULT NULL,
  `ussSite` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsreports`
--

DROP TABLE IF EXISTS `lsreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_LSREPORTS` (`systemName`,`bodyName`,`type`,`cmdrName`,`comment`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_LSTYPES` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lstypes`
--

LOCK TABLES `lstypes` WRITE;
/*!40000 ALTER TABLE `lstypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lstypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msreports`
--

DROP TABLE IF EXISTS `msreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) DEFAULT NULL,
  `shipName` varchar(255) DEFAULT NULL,
  `shipTag` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `flightOps` tinyint(1) DEFAULT NULL,
  `flightSchedule` tinyint(1) DEFAULT NULL,
  `dockable` tinyint(1) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_MSREPORTS` (`systemName`,`shipName`,`shipTag`,`type`,`cmdrName`,`comment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msreports`
--

LOCK TABLES `msreports` WRITE;
/*!40000 ALTER TABLE `msreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `msreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mssites`
--

DROP TABLE IF EXISTS `mssites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mssites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `shipName` varchar(255) DEFAULT NULL,
  `shipTag` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `flightOps` tinyint(1) DEFAULT NULL,
  `flightSchedule` tinyint(1) DEFAULT NULL,
  `dockable` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_MSSITES` (`shipName`,`shipTag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mssites`
--

LOCK TABLES `mssites` WRITE;
/*!40000 ALTER TABLE `mssites` DISABLE KEYS */;
/*!40000 ALTER TABLE `mssites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstypes`
--

DROP TABLE IF EXISTS `mstypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_MSTYPES` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstypes`
--

LOCK TABLES `mstypes` WRITE;
/*!40000 ALTER TABLE `mstypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mstypes` ENABLE KEYS */;
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
  `edsmType` int(11) DEFAULT NULL,
  `edsmMass` double DEFAULT NULL,
  `edsmInnerRadius` double DEFAULT NULL,
  `edsmOuterRadius` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_RINGS` (`ringName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rings`
--

LOCK TABLES `rings` WRITE;
/*!40000 ALTER TABLE `rings` DISABLE KEYS */;
/*!40000 ALTER TABLE `rings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ringtypes`
--

DROP TABLE IF EXISTS `ringtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ringtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_RINGTYPES` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ringtypes`
--

LOCK TABLES `ringtypes` WRITE;
/*!40000 ALTER TABLE `ringtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ringtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systems`
--

DROP TABLE IF EXISTS `systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) DEFAULT NULL,
  `edsmID` double DEFAULT NULL,
  `edsmID64` double DEFAULT NULL,
  `edsmCoordX` double DEFAULT NULL,
  `edsmCoordY` double DEFAULT NULL,
  `edsmCoordZ` double DEFAULT NULL,
  `edsmCoordLocked` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_SYSTEMS` (`systemName`)
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
-- Table structure for table `tbreports`
--

DROP TABLE IF EXISTS `tbreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_TBREPORTS` (`systemName`,`bodyName`,`cmdrName`,`comment`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
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
-- Table structure for table `tbtypes`
--

DROP TABLE IF EXISTS `tbtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_TBTYPES` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtypes`
--

LOCK TABLES `tbtypes` WRITE;
/*!40000 ALTER TABLE `tbtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsreports`
--

DROP TABLE IF EXISTS `tsreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_TSREPORTS` (`systemName`,`bodyName`,`cmdrName`,`comment`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_TSSTATUSES` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsstatuses`
--

LOCK TABLES `tsstatuses` WRITE;
/*!40000 ALTER TABLE `tsstatuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsstatuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twreports`
--

DROP TABLE IF EXISTS `twreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) DEFAULT NULL,
  `bodyName` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) DEFAULT NULL,
  `reportStatus` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_TWREPORTS` (`systemName`,`bodyName`,`cmdrName`,`comment`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
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
-- Table structure for table `upload_file`
--

DROP TABLE IF EXISTS `upload_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_UPLOAD_FILE` (`name`,`hash`,`ext`,`mime`,`size`,`url`,`provider`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` text DEFAULT NULL,
  `field` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_UPLOAD_FILE_MORPH` (`related_type`,`field`)
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
-- Table structure for table `users-permissions_permission`
--

DROP TABLE IF EXISTS `users-permissions_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users-permissions_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `policy` text DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_USERS_PERMISSIONS_PERMISSION` (`type`,`controller`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=5440 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_permission`
--

LOCK TABLES `users-permissions_permission` WRITE;
/*!40000 ALTER TABLE `users-permissions_permission` DISABLE KEYS */;
INSERT INTO `users-permissions_permission` VALUES (4,'application','bmreport','find',1,'',4),(10,'application','bmreport','findone',1,'',4),(16,'application','bmreport','count',1,'',4),(22,'application','bmreport','create',1,'',4),(28,'application','bmreport','update',1,'',4),(34,'application','bmreport','destroy',1,'',4),(40,'application','bmreport','createrelation',1,'',4),(46,'application','bmreport','updaterelation',1,'',4),(52,'application','bmreport','destroyrelation',1,'',4),(58,'application','bmsite','find',1,'',4),(61,'application','bmsite','findone',1,'',4),(64,'application','bmsite','count',1,'',4),(67,'application','bmsite','create',1,'',4),(70,'application','bmsite','update',1,'',4),(73,'application','bmsite','destroy',1,'',4),(76,'application','bmsite','createrelation',1,'',4),(79,'application','bmsite','updaterelation',1,'',4),(82,'application','bmsite','destroyrelation',1,'',4),(85,'application','body','find',1,'',4),(88,'application','body','findone',1,'',4),(91,'application','body','count',1,'',4),(94,'application','body','create',1,'',4),(97,'application','body','update',1,'',4),(100,'application','body','destroy',1,'',4),(103,'application','body','createrelation',1,'',4),(106,'application','body','updaterelation',1,'',4),(109,'application','body','destroyrelation',1,'',4),(112,'application','bodyatmosphere','find',1,'',4),(115,'application','bodyatmosphere','findone',1,'',4),(118,'application','bodyatmosphere','count',1,'',4),(121,'application','bodyatmosphere','create',1,'',4),(124,'application','bodyatmosphere','update',1,'',4),(127,'application','bodyatmosphere','destroy',1,'',4),(130,'application','bodyatmosphere','createrelation',1,'',4),(133,'application','bodyatmosphere','updaterelation',1,'',4),(136,'application','bodyatmosphere','destroyrelation',1,'',4),(139,'application','bodymaterial','find',1,'',4),(142,'application','bodymaterial','findone',1,'',4),(145,'application','bodymaterial','count',1,'',4),(148,'application','bodymaterial','create',1,'',4),(151,'application','bodymaterial','update',1,'',4),(154,'application','bodymaterial','destroy',1,'',4),(157,'application','bodymaterial','createrelation',1,'',4),(160,'application','bodymaterial','updaterelation',1,'',4),(163,'application','bodymaterial','destroyrelation',1,'',4),(166,'application','bodysubtype','find',1,'',4),(169,'application','bodysubtype','findone',1,'',4),(172,'application','bodysubtype','count',1,'',4),(175,'application','bodysubtype','create',1,'',4),(178,'application','bodysubtype','update',1,'',4),(181,'application','bodysubtype','destroy',1,'',4),(184,'application','bodysubtype','createrelation',1,'',4),(187,'application','bodysubtype','updaterelation',1,'',4),(190,'application','bodysubtype','destroyrelation',1,'',4),(193,'application','bodytype','find',1,'',4),(196,'application','bodytype','findone',1,'',4),(199,'application','bodytype','count',1,'',4),(202,'application','bodytype','create',1,'',4),(205,'application','bodytype','update',1,'',4),(208,'application','bodytype','destroy',1,'',4),(211,'application','bodytype','createrelation',1,'',4),(214,'application','bodytype','updaterelation',1,'',4),(217,'application','bodytype','destroyrelation',1,'',4),(220,'application','btreport','find',1,'',4),(223,'application','btreport','findone',1,'',4),(226,'application','btreport','count',1,'',4),(229,'application','btreport','create',1,'',4),(232,'application','btreport','update',1,'',4),(235,'application','btreport','destroy',1,'',4),(238,'application','btreport','createrelation',1,'',4),(241,'application','btreport','updaterelation',1,'',4),(244,'application','btreport','destroyrelation',1,'',4),(247,'application','btsite','find',1,'',4),(250,'application','btsite','findone',1,'',4),(253,'application','btsite','count',1,'',4),(256,'application','btsite','create',1,'',4),(259,'application','btsite','update',1,'',4),(262,'application','btsite','destroy',1,'',4),(265,'application','btsite','createrelation',1,'',4),(268,'application','btsite','updaterelation',1,'',4),(271,'application','btsite','destroyrelation',1,'',4),(274,'application','cmdr','find',1,'',4),(277,'application','cmdr','findone',1,'',4),(280,'application','cmdr','count',1,'',4),(283,'application','cmdr','create',1,'',4),(286,'application','cmdr','update',1,'',4),(289,'application','cmdr','destroy',1,'',4),(292,'application','cmdr','createrelation',1,'',4),(295,'application','cmdr','updaterelation',1,'',4),(298,'application','cmdr','destroyrelation',1,'',4),(301,'application','fgreport','find',1,'',4),(304,'application','fgreport','findone',1,'',4),(307,'application','fgreport','count',1,'',4),(310,'application','fgreport','create',1,'',4),(313,'application','fgreport','update',1,'',4),(316,'application','fgreport','destroy',1,'',4),(319,'application','fgreport','createrelation',1,'',4),(322,'application','fgreport','updaterelation',1,'',4),(325,'application','fgreport','destroyrelation',1,'',4),(328,'application','fgsite','find',1,'',4),(331,'application','fgsite','findone',1,'',4),(334,'application','fgsite','count',1,'',4),(337,'application','fgsite','create',1,'',4),(340,'application','fgsite','update',1,'',4),(343,'application','fgsite','destroy',1,'',4),(346,'application','fgsite','createrelation',1,'',4),(349,'application','fgsite','updaterelation',1,'',4),(352,'application','fgsite','destroyrelation',1,'',4),(355,'application','fmreport','find',1,'',4),(358,'application','fmreport','findone',1,'',4),(361,'application','fmreport','count',1,'',4),(364,'application','fmreport','create',1,'',4),(367,'application','fmreport','update',1,'',4),(370,'application','fmreport','destroy',1,'',4),(373,'application','fmreport','createrelation',1,'',4),(376,'application','fmreport','updaterelation',1,'',4),(379,'application','fmreport','destroyrelation',1,'',4),(382,'application','fmsite','find',1,'',4),(385,'application','fmsite','findone',1,'',4),(388,'application','fmsite','count',1,'',4),(391,'application','fmsite','create',1,'',4),(394,'application','fmsite','update',1,'',4),(397,'application','fmsite','destroy',1,'',4),(400,'application','fmsite','createrelation',1,'',4),(403,'application','fmsite','updaterelation',1,'',4),(406,'application','fmsite','destroyrelation',1,'',4),(409,'application','fmtype','find',1,'',4),(412,'application','fmtype','findone',1,'',4),(415,'application','fmtype','count',1,'',4),(418,'application','fmtype','create',1,'',4),(421,'application','fmtype','update',1,'',4),(424,'application','fmtype','destroy',1,'',4),(427,'application','fmtype','createrelation',1,'',4),(430,'application','fmtype','updaterelation',1,'',4),(433,'application','fmtype','destroyrelation',1,'',4),(436,'application','genreport','find',1,'',4),(439,'application','genreport','findone',1,'',4),(442,'application','genreport','count',1,'',4),(445,'application','genreport','create',1,'',4),(448,'application','genreport','update',1,'',4),(451,'application','genreport','destroy',1,'',4),(454,'application','genreport','createrelation',1,'',4),(457,'application','genreport','updaterelation',1,'',4),(460,'application','genreport','destroyrelation',1,'',4),(463,'application','gensite','find',1,'',4),(466,'application','gensite','findone',1,'',4),(469,'application','gensite','count',1,'',4),(472,'application','gensite','create',1,'',4),(475,'application','gensite','update',1,'',4),(478,'application','gensite','destroy',1,'',4),(481,'application','gensite','createrelation',1,'',4),(484,'application','gensite','updaterelation',1,'',4),(487,'application','gensite','destroyrelation',1,'',4),(490,'application','gractivegroup','find',1,'',4),(493,'application','gractivegroup','findone',1,'',4),(496,'application','gractivegroup','count',1,'',4),(499,'application','gractivegroup','create',1,'',4),(502,'application','gractivegroup','update',1,'',4),(505,'application','gractivegroup','destroy',1,'',4),(508,'application','gractivegroup','createrelation',1,'',4),(511,'application','gractivegroup','updaterelation',1,'',4),(514,'application','gractivegroup','destroyrelation',1,'',4),(517,'application','gractiveobelisk','find',1,'',4),(520,'application','gractiveobelisk','findone',1,'',4),(523,'application','gractiveobelisk','count',1,'',4),(526,'application','gractiveobelisk','create',1,'',4),(529,'application','gractiveobelisk','update',1,'',4),(532,'application','gractiveobelisk','destroy',1,'',4),(535,'application','gractiveobelisk','createrelation',1,'',4),(538,'application','gractiveobelisk','updaterelation',1,'',4),(541,'application','gractiveobelisk','destroyrelation',1,'',4),(544,'application','grartifact','find',1,'',4),(547,'application','grartifact','findone',1,'',4),(550,'application','grartifact','count',1,'',4),(553,'application','grartifact','create',1,'',4),(556,'application','grartifact','update',1,'',4),(559,'application','grartifact','destroy',1,'',4),(562,'application','grartifact','createrelation',1,'',4),(565,'application','grartifact','updaterelation',1,'',4),(568,'application','grartifact','destroyrelation',1,'',4),(571,'application','grcodexcategories','find',1,'',4),(574,'application','grcodexcategories','findone',1,'',4),(577,'application','grcodexcategories','count',1,'',4),(580,'application','grcodexcategories','create',1,'',4),(583,'application','grcodexcategories','update',1,'',4),(586,'application','grcodexcategories','destroy',1,'',4),(589,'application','grcodexcategories','createrelation',1,'',4),(592,'application','grcodexcategories','updaterelation',1,'',4),(595,'application','grcodexcategories','destroyrelation',1,'',4),(598,'application','grcodexdata','find',1,'',4),(601,'application','grcodexdata','findone',1,'',4),(604,'application','grcodexdata','count',1,'',4),(607,'application','grcodexdata','create',1,'',4),(610,'application','grcodexdata','update',1,'',4),(613,'application','grcodexdata','destroy',1,'',4),(616,'application','grcodexdata','createrelation',1,'',4),(619,'application','grcodexdata','updaterelation',1,'',4),(622,'application','grcodexdata','destroyrelation',1,'',4),(625,'application','grobelisk','find',1,'',4),(628,'application','grobelisk','findone',1,'',4),(631,'application','grobelisk','count',1,'',4),(634,'application','grobelisk','create',1,'',4),(637,'application','grobelisk','update',1,'',4),(640,'application','grobelisk','destroy',1,'',4),(643,'application','grobelisk','createrelation',1,'',4),(646,'application','grobelisk','updaterelation',1,'',4),(649,'application','grobelisk','destroyrelation',1,'',4),(652,'application','grobeliskgroup','find',1,'',4),(655,'application','grobeliskgroup','findone',1,'',4),(658,'application','grobeliskgroup','count',1,'',4),(661,'application','grobeliskgroup','create',1,'',4),(664,'application','grobeliskgroup','update',1,'',4),(667,'application','grobeliskgroup','destroy',1,'',4),(670,'application','grobeliskgroup','createrelation',1,'',4),(673,'application','grobeliskgroup','updaterelation',1,'',4),(676,'application','grobeliskgroup','destroyrelation',1,'',4),(679,'application','grreport','find',1,'',4),(682,'application','grreport','findone',1,'',4),(685,'application','grreport','count',1,'',4),(688,'application','grreport','create',1,'',4),(691,'application','grreport','update',1,'',4),(694,'application','grreport','destroy',1,'',4),(697,'application','grreport','createrelation',1,'',4),(700,'application','grreport','updaterelation',1,'',4),(703,'application','grreport','destroyrelation',1,'',4),(706,'application','grsite','find',1,'',4),(709,'application','grsite','findone',1,'',4),(712,'application','grsite','count',1,'',4),(715,'application','grsite','create',1,'',4),(718,'application','grsite','update',1,'',4),(721,'application','grsite','destroy',1,'',4),(724,'application','grsite','createrelation',1,'',4),(727,'application','grsite','updaterelation',1,'',4),(730,'application','grsite','destroyrelation',1,'',4),(733,'application','grtype','find',1,'',4),(736,'application','grtype','findone',1,'',4),(739,'application','grtype','count',1,'',4),(742,'application','grtype','create',1,'',4),(745,'application','grtype','update',1,'',4),(748,'application','grtype','destroy',1,'',4),(751,'application','grtype','createrelation',1,'',4),(754,'application','grtype','updaterelation',1,'',4),(757,'application','grtype','destroyrelation',1,'',4),(760,'application','gsactivegroup','find',1,'',4),(763,'application','gsactivegroup','findone',1,'',4),(766,'application','gsactivegroup','count',1,'',4),(769,'application','gsactivegroup','create',1,'',4),(772,'application','gsactivegroup','update',1,'',4),(775,'application','gsactivegroup','destroy',1,'',4),(778,'application','gsactivegroup','createrelation',1,'',4),(781,'application','gsactivegroup','updaterelation',1,'',4),(784,'application','gsactivegroup','destroyrelation',1,'',4),(787,'application','gsactiveobelisk','find',1,'',4),(790,'application','gsactiveobelisk','findone',1,'',4),(793,'application','gsactiveobelisk','count',1,'',4),(796,'application','gsactiveobelisk','create',1,'',4),(799,'application','gsactiveobelisk','update',1,'',4),(802,'application','gsactiveobelisk','destroy',1,'',4),(805,'application','gsactiveobelisk','createrelation',1,'',4),(808,'application','gsactiveobelisk','updaterelation',1,'',4),(811,'application','gsactiveobelisk','destroyrelation',1,'',4),(814,'application','gsartifact','find',1,'',4),(817,'application','gsartifact','findone',1,'',4),(820,'application','gsartifact','count',1,'',4),(823,'application','gsartifact','create',1,'',4),(826,'application','gsartifact','update',1,'',4),(829,'application','gsartifact','destroy',1,'',4),(832,'application','gsartifact','createrelation',1,'',4),(835,'application','gsartifact','updaterelation',1,'',4),(838,'application','gsartifact','destroyrelation',1,'',4),(841,'application','gscodexcategory','find',1,'',4),(844,'application','gscodexcategory','findone',1,'',4),(847,'application','gscodexcategory','count',1,'',4),(850,'application','gscodexcategory','create',1,'',4),(853,'application','gscodexcategory','update',1,'',4),(856,'application','gscodexcategory','destroy',1,'',4),(859,'application','gscodexcategory','createrelation',1,'',4),(862,'application','gscodexcategory','updaterelation',1,'',4),(865,'application','gscodexcategory','destroyrelation',1,'',4),(868,'application','gscodexdata','find',1,'',4),(871,'application','gscodexdata','findone',1,'',4),(874,'application','gscodexdata','count',1,'',4),(877,'application','gscodexdata','create',1,'',4),(880,'application','gscodexdata','update',1,'',4),(883,'application','gscodexdata','destroy',1,'',4),(886,'application','gscodexdata','createrelation',1,'',4),(889,'application','gscodexdata','updaterelation',1,'',4),(892,'application','gscodexdata','destroyrelation',1,'',4),(895,'application','gsobelisk','find',1,'',4),(898,'application','gsobelisk','findone',1,'',4),(901,'application','gsobelisk','count',1,'',4),(904,'application','gsobelisk','create',1,'',4),(907,'application','gsobelisk','update',1,'',4),(910,'application','gsobelisk','destroy',1,'',4),(913,'application','gsobelisk','createrelation',1,'',4),(916,'application','gsobelisk','updaterelation',1,'',4),(919,'application','gsobelisk','destroyrelation',1,'',4),(922,'application','gsobeliskgroup','find',1,'',4),(925,'application','gsobeliskgroup','findone',1,'',4),(928,'application','gsobeliskgroup','count',1,'',4),(931,'application','gsobeliskgroup','create',1,'',4),(934,'application','gsobeliskgroup','update',1,'',4),(937,'application','gsobeliskgroup','destroy',1,'',4),(940,'application','gsobeliskgroup','createrelation',1,'',4),(943,'application','gsobeliskgroup','updaterelation',1,'',4),(946,'application','gsobeliskgroup','destroyrelation',1,'',4),(949,'application','gsreport','find',1,'',4),(952,'application','gsreport','findone',1,'',4),(955,'application','gsreport','count',1,'',4),(958,'application','gsreport','create',1,'',4),(961,'application','gsreport','update',1,'',4),(964,'application','gsreport','destroy',1,'',4),(967,'application','gsreport','createrelation',1,'',4),(970,'application','gsreport','updaterelation',1,'',4),(973,'application','gsreport','destroyrelation',1,'',4),(976,'application','gssite','find',1,'',4),(979,'application','gssite','findone',1,'',4),(982,'application','gssite','count',1,'',4),(985,'application','gssite','create',1,'',4),(988,'application','gssite','update',1,'',4),(991,'application','gssite','destroy',1,'',4),(994,'application','gssite','createrelation',1,'',4),(997,'application','gssite','updaterelation',1,'',4),(1000,'application','gssite','destroyrelation',1,'',4),(1003,'application','gstype','find',1,'',4),(1006,'application','gstype','findone',1,'',4),(1009,'application','gstype','count',1,'',4),(1012,'application','gstype','create',1,'',4),(1015,'application','gstype','update',1,'',4),(1018,'application','gstype','destroy',1,'',4),(1021,'application','gstype','createrelation',1,'',4),(1024,'application','gstype','updaterelation',1,'',4),(1027,'application','gstype','destroyrelation',1,'',4),(1030,'application','gysite','find',1,'',4),(1033,'application','gysite','findone',1,'',4),(1036,'application','gysite','count',1,'',4),(1039,'application','gysite','create',1,'',4),(1042,'application','gysite','update',1,'',4),(1045,'application','gysite','destroy',1,'',4),(1048,'application','gysite','createrelation',1,'',4),(1051,'application','gysite','updaterelation',1,'',4),(1054,'application','gysite','destroyrelation',1,'',4),(1057,'application','gytype','find',1,'',4),(1060,'application','gytype','findone',1,'',4),(1063,'application','gytype','count',1,'',4),(1066,'application','gytype','create',1,'',4),(1069,'application','gytype','update',1,'',4),(1072,'application','gytype','destroy',1,'',4),(1075,'application','gytype','createrelation',1,'',4),(1078,'application','gytype','updaterelation',1,'',4),(1081,'application','gytype','destroyrelation',1,'',4),(1084,'application','location','find',1,'',4),(1087,'application','location','findone',1,'',4),(1090,'application','location','count',1,'',4),(1093,'application','location','create',1,'',4),(1096,'application','location','update',1,'',4),(1099,'application','location','destroy',1,'',4),(1102,'application','location','createrelation',1,'',4),(1105,'application','location','updaterelation',1,'',4),(1108,'application','location','destroyrelation',1,'',4),(1111,'application','lsreport','find',1,'',4),(1114,'application','lsreport','findone',1,'',4),(1117,'application','lsreport','count',1,'',4),(1120,'application','lsreport','create',1,'',4),(1123,'application','lsreport','update',1,'',4),(1126,'application','lsreport','destroy',1,'',4),(1129,'application','lsreport','createrelation',1,'',4),(1132,'application','lsreport','updaterelation',1,'',4),(1135,'application','lsreport','destroyrelation',1,'',4),(1138,'application','lssite','find',1,'',4),(1141,'application','lssite','findone',1,'',4),(1144,'application','lssite','count',1,'',4),(1147,'application','lssite','create',1,'',4),(1150,'application','lssite','update',1,'',4),(1153,'application','lssite','destroy',1,'',4),(1156,'application','lssite','createrelation',1,'',4),(1159,'application','lssite','updaterelation',1,'',4),(1162,'application','lssite','destroyrelation',1,'',4),(1165,'application','lstype','find',1,'',4),(1168,'application','lstype','findone',1,'',4),(1171,'application','lstype','count',1,'',4),(1174,'application','lstype','create',1,'',4),(1177,'application','lstype','update',1,'',4),(1180,'application','lstype','destroy',1,'',4),(1183,'application','lstype','createrelation',1,'',4),(1186,'application','lstype','updaterelation',1,'',4),(1189,'application','lstype','destroyrelation',1,'',4),(1192,'application','msreport','find',1,'',4),(1195,'application','msreport','findone',1,'',4),(1198,'application','msreport','count',1,'',4),(1201,'application','msreport','create',1,'',4),(1204,'application','msreport','update',1,'',4),(1207,'application','msreport','destroy',1,'',4),(1210,'application','msreport','createrelation',1,'',4),(1213,'application','msreport','updaterelation',1,'',4),(1216,'application','msreport','destroyrelation',1,'',4),(1219,'application','mssite','find',1,'',4),(1222,'application','mssite','findone',1,'',4),(1225,'application','mssite','count',1,'',4),(1228,'application','mssite','create',1,'',4),(1231,'application','mssite','update',1,'',4),(1234,'application','mssite','destroy',1,'',4),(1237,'application','mssite','createrelation',1,'',4),(1240,'application','mssite','updaterelation',1,'',4),(1243,'application','mssite','destroyrelation',1,'',4),(1246,'application','mstype','find',1,'',4),(1249,'application','mstype','findone',1,'',4),(1252,'application','mstype','count',1,'',4),(1255,'application','mstype','create',1,'',4),(1258,'application','mstype','update',1,'',4),(1261,'application','mstype','destroy',1,'',4),(1264,'application','mstype','createrelation',1,'',4),(1267,'application','mstype','updaterelation',1,'',4),(1270,'application','mstype','destroyrelation',1,'',4),(1273,'application','ring','find',1,'',4),(1276,'application','ring','findone',1,'',4),(1279,'application','ring','count',1,'',4),(1282,'application','ring','create',1,'',4),(1285,'application','ring','update',1,'',4),(1288,'application','ring','destroy',1,'',4),(1291,'application','ring','createrelation',1,'',4),(1294,'application','ring','updaterelation',1,'',4),(1297,'application','ring','destroyrelation',1,'',4),(1300,'application','ringtype','find',1,'',4),(1303,'application','ringtype','findone',1,'',4),(1306,'application','ringtype','count',1,'',4),(1309,'application','ringtype','create',1,'',4),(1312,'application','ringtype','update',1,'',4),(1315,'application','ringtype','destroy',1,'',4),(1318,'application','ringtype','createrelation',1,'',4),(1321,'application','ringtype','updaterelation',1,'',4),(1324,'application','ringtype','destroyrelation',1,'',4),(1327,'application','system','find',1,'',4),(1330,'application','system','findone',1,'',4),(1333,'application','system','count',1,'',4),(1336,'application','system','create',1,'',4),(1339,'application','system','update',1,'',4),(1342,'application','system','destroy',1,'',4),(1345,'application','system','createrelation',1,'',4),(1348,'application','system','updaterelation',1,'',4),(1351,'application','system','destroyrelation',1,'',4),(1354,'application','tbreport','find',1,'',4),(1357,'application','tbreport','findone',1,'',4),(1360,'application','tbreport','count',1,'',4),(1363,'application','tbreport','create',1,'',4),(1366,'application','tbreport','update',1,'',4),(1369,'application','tbreport','destroy',1,'',4),(1372,'application','tbreport','createrelation',1,'',4),(1375,'application','tbreport','updaterelation',1,'',4),(1378,'application','tbreport','destroyrelation',1,'',4),(1381,'application','tbsite','find',1,'',4),(1384,'application','tbsite','findone',1,'',4),(1387,'application','tbsite','count',1,'',4),(1390,'application','tbsite','create',1,'',4),(1393,'application','tbsite','update',1,'',4),(1396,'application','tbsite','destroy',1,'',4),(1399,'application','tbsite','createrelation',1,'',4),(1402,'application','tbsite','updaterelation',1,'',4),(1405,'application','tbsite','destroyrelation',1,'',4),(1408,'application','tbtype','find',1,'',4),(1411,'application','tbtype','findone',1,'',4),(1414,'application','tbtype','count',1,'',4),(1417,'application','tbtype','create',1,'',4),(1420,'application','tbtype','update',1,'',4),(1423,'application','tbtype','destroy',1,'',4),(1426,'application','tbtype','createrelation',1,'',4),(1429,'application','tbtype','updaterelation',1,'',4),(1432,'application','tbtype','destroyrelation',1,'',4),(1435,'application','tsreport','find',1,'',4),(1438,'application','tsreport','findone',1,'',4),(1441,'application','tsreport','count',1,'',4),(1444,'application','tsreport','create',1,'',4),(1447,'application','tsreport','update',1,'',4),(1450,'application','tsreport','destroy',1,'',4),(1453,'application','tsreport','createrelation',1,'',4),(1456,'application','tsreport','updaterelation',1,'',4),(1459,'application','tsreport','destroyrelation',1,'',4),(1462,'application','tssite','find',1,'',4),(1465,'application','tssite','findone',1,'',4),(1468,'application','tssite','count',1,'',4),(1471,'application','tssite','create',1,'',4),(1474,'application','tssite','update',1,'',4),(1477,'application','tssite','destroy',1,'',4),(1480,'application','tssite','createrelation',1,'',4),(1483,'application','tssite','updaterelation',1,'',4),(1486,'application','tssite','destroyrelation',1,'',4),(1489,'application','tsstatus','find',1,'',4),(1492,'application','tsstatus','findone',1,'',4),(1495,'application','tsstatus','count',1,'',4),(1498,'application','tsstatus','create',1,'',4),(1501,'application','tsstatus','update',1,'',4),(1504,'application','tsstatus','destroy',1,'',4),(1507,'application','tsstatus','createrelation',1,'',4),(1510,'application','tsstatus','updaterelation',1,'',4),(1513,'application','tsstatus','destroyrelation',1,'',4),(1516,'application','twreport','find',1,'',4),(1519,'application','twreport','findone',1,'',4),(1522,'application','twreport','count',1,'',4),(1525,'application','twreport','create',1,'',4),(1528,'application','twreport','update',1,'',4),(1531,'application','twreport','destroy',1,'',4),(1534,'application','twreport','createrelation',1,'',4),(1537,'application','twreport','updaterelation',1,'',4),(1540,'application','twreport','destroyrelation',1,'',4),(1543,'application','twsite','find',1,'',4),(1546,'application','twsite','findone',1,'',4),(1549,'application','twsite','count',1,'',4),(1552,'application','twsite','create',1,'',4),(1555,'application','twsite','update',1,'',4),(1558,'application','twsite','destroy',1,'',4),(1561,'application','twsite','createrelation',1,'',4),(1564,'application','twsite','updaterelation',1,'',4),(1567,'application','twsite','destroyrelation',1,'',4),(1570,'application','usssite','find',1,'',4),(1573,'application','usssite','findone',1,'',4),(1576,'application','usssite','count',1,'',4),(1579,'application','usssite','create',1,'',4),(1582,'application','usssite','update',1,'',4),(1585,'application','usssite','destroy',1,'',4),(1588,'application','usssite','createrelation',1,'',4),(1591,'application','usssite','updaterelation',1,'',4),(1594,'application','usssite','destroyrelation',1,'',4),(1597,'application','usstype','find',1,'',4),(1600,'application','usstype','findone',1,'',4),(1603,'application','usstype','count',1,'',4),(1606,'application','usstype','create',1,'',4),(1609,'application','usstype','update',1,'',4),(1612,'application','usstype','destroy',1,'',4),(1615,'application','usstype','createrelation',1,'',4),(1618,'application','usstype','updaterelation',1,'',4),(1621,'application','usstype','destroyrelation',1,'',4),(1624,'content-manager','contentmanager','layout',1,'',4),(1627,'content-manager','contentmanager','models',1,'',4),(1630,'content-manager','contentmanager','find',1,'',4),(1633,'content-manager','contentmanager','count',1,'',4),(1636,'content-manager','contentmanager','findone',1,'',4),(1639,'content-manager','contentmanager','create',1,'',4),(1642,'content-manager','contentmanager','update',1,'',4),(1645,'content-manager','contentmanager','delete',1,'',4),(1648,'content-manager','contentmanager','deleteall',1,'',4),(1651,'content-type-builder','contenttypebuilder','getmodels',1,'',4),(1654,'content-type-builder','contenttypebuilder','getmodel',1,'',4),(1657,'content-type-builder','contenttypebuilder','getconnections',1,'',4),(1660,'content-type-builder','contenttypebuilder','createmodel',1,'',4),(1663,'content-type-builder','contenttypebuilder','updatemodel',1,'',4),(1666,'content-type-builder','contenttypebuilder','deletemodel',1,'',4),(1669,'content-type-builder','contenttypebuilder','autoreload',1,'',4),(1672,'content-type-builder','contenttypebuilder','checktableexists',1,'',4),(1675,'settings-manager','settingsmanager','menu',1,'',4),(1678,'settings-manager','settingsmanager','environments',1,'',4),(1681,'settings-manager','settingsmanager','languages',1,'',4),(1684,'settings-manager','settingsmanager','databases',1,'',4),(1687,'settings-manager','settingsmanager','database',1,'',4),(1690,'settings-manager','settingsmanager','databasemodel',1,'',4),(1693,'settings-manager','settingsmanager','get',1,'',4),(1696,'settings-manager','settingsmanager','update',1,'',4),(1699,'settings-manager','settingsmanager','createlanguage',1,'',4),(1702,'settings-manager','settingsmanager','deletelanguage',1,'',4),(1705,'settings-manager','settingsmanager','createdatabase',1,'',4),(1708,'settings-manager','settingsmanager','updatedatabase',1,'',4),(1711,'settings-manager','settingsmanager','deletedatabase',1,'',4),(1714,'settings-manager','settingsmanager','autoreload',1,'',4),(1717,'upload','upload','upload',1,'',4),(1720,'upload','upload','getenvironments',1,'',4),(1723,'upload','upload','getsettings',1,'',4),(1726,'upload','upload','updatesettings',1,'',4),(1729,'upload','upload','find',1,'',4),(1732,'upload','upload','findone',1,'',4),(1735,'upload','upload','count',1,'',4),(1738,'upload','upload','destroy',1,'',4),(1741,'upload','upload','search',1,'',4),(1744,'users-permissions','auth','callback',1,'',4),(1747,'users-permissions','auth','changepassword',1,'',4),(1750,'users-permissions','auth','connect',1,'',4),(1753,'users-permissions','auth','forgotpassword',1,'',4),(1756,'users-permissions','auth','register',1,'',4),(1759,'users-permissions','user','find',1,'',4),(1762,'users-permissions','user','me',1,'',4),(1765,'users-permissions','user','findone',1,'',4),(1768,'users-permissions','user','create',1,'',4),(1771,'users-permissions','user','update',1,'',4),(1774,'users-permissions','user','destroy',1,'',4),(1777,'users-permissions','user','destroyall',1,'',4),(1780,'users-permissions','userspermissions','createrole',1,'',4),(1783,'users-permissions','userspermissions','deleteprovider',1,'',4),(1786,'users-permissions','userspermissions','deleterole',1,'',4),(1789,'users-permissions','userspermissions','getpermissions',1,'',4),(1792,'users-permissions','userspermissions','getpolicies',1,'',4),(1795,'users-permissions','userspermissions','getrole',1,'',4),(1798,'users-permissions','userspermissions','getroles',1,'',4),(1801,'users-permissions','userspermissions','getroutes',1,'',4),(1804,'users-permissions','userspermissions','index',1,'',4),(1807,'users-permissions','userspermissions','init',1,'',4),(1810,'users-permissions','userspermissions','searchusers',1,'',4),(1813,'users-permissions','userspermissions','updaterole',1,'',4),(1816,'users-permissions','userspermissions','getemailtemplate',1,'',4),(1819,'users-permissions','userspermissions','updateemailtemplate',1,'',4),(1822,'users-permissions','userspermissions','getadvancedsettings',1,'',4),(1825,'users-permissions','userspermissions','updateadvancedsettings',1,'',4),(1828,'users-permissions','userspermissions','getproviders',1,'',4),(1831,'users-permissions','userspermissions','updateproviders',1,'',4),(1834,'application','bmreport','find',0,'',10),(1837,'application','bmreport','findone',0,'',10),(1840,'application','bmreport','count',0,'',10),(1843,'application','bmreport','create',0,'',10),(1846,'application','bmreport','update',0,'',10),(1849,'application','bmreport','destroy',0,'',10),(1852,'application','bmreport','createrelation',0,'',10),(1855,'application','bmreport','updaterelation',0,'',10),(1858,'application','bmreport','destroyrelation',0,'',10),(1861,'application','bmsite','find',0,'',10),(1864,'application','bmsite','findone',0,'',10),(1867,'application','bmsite','count',0,'',10),(1870,'application','bmsite','create',0,'',10),(1873,'application','bmsite','update',0,'',10),(1876,'application','bmsite','destroy',0,'',10),(1879,'application','bmsite','createrelation',0,'',10),(1882,'application','bmsite','updaterelation',0,'',10),(1885,'application','bmsite','destroyrelation',0,'',10),(1888,'application','body','find',0,'',10),(1891,'application','body','findone',0,'',10),(1894,'application','body','count',0,'',10),(1897,'application','body','create',0,'',10),(1900,'application','body','update',0,'',10),(1903,'application','body','destroy',0,'',10),(1906,'application','body','createrelation',0,'',10),(1909,'application','body','updaterelation',0,'',10),(1912,'application','body','destroyrelation',0,'',10),(1915,'application','bodyatmosphere','find',0,'',10),(1918,'application','bodyatmosphere','findone',0,'',10),(1921,'application','bodyatmosphere','count',0,'',10),(1924,'application','bodyatmosphere','create',0,'',10),(1927,'application','bodyatmosphere','update',0,'',10),(1930,'application','bodyatmosphere','destroy',0,'',10),(1933,'application','bodyatmosphere','createrelation',0,'',10),(1936,'application','bodyatmosphere','updaterelation',0,'',10),(1939,'application','bodyatmosphere','destroyrelation',0,'',10),(1942,'application','bodymaterial','find',0,'',10),(1945,'application','bodymaterial','findone',0,'',10),(1948,'application','bodymaterial','count',0,'',10),(1951,'application','bodymaterial','create',0,'',10),(1954,'application','bodymaterial','update',0,'',10),(1957,'application','bodymaterial','destroy',0,'',10),(1960,'application','bodymaterial','createrelation',0,'',10),(1963,'application','bodymaterial','updaterelation',0,'',10),(1966,'application','bodymaterial','destroyrelation',0,'',10),(1969,'application','bodysubtype','find',0,'',10),(1972,'application','bodysubtype','findone',0,'',10),(1975,'application','bodysubtype','count',0,'',10),(1978,'application','bodysubtype','create',0,'',10),(1981,'application','bodysubtype','update',0,'',10),(1984,'application','bodysubtype','destroy',0,'',10),(1987,'application','bodysubtype','createrelation',0,'',10),(1990,'application','bodysubtype','updaterelation',0,'',10),(1993,'application','bodysubtype','destroyrelation',0,'',10),(1996,'application','bodytype','find',0,'',10),(1999,'application','bodytype','findone',0,'',10),(2002,'application','bodytype','count',0,'',10),(2005,'application','bodytype','create',0,'',10),(2008,'application','bodytype','update',0,'',10),(2011,'application','bodytype','destroy',0,'',10),(2014,'application','bodytype','createrelation',0,'',10),(2017,'application','bodytype','updaterelation',0,'',10),(2020,'application','bodytype','destroyrelation',0,'',10),(2023,'application','btreport','find',0,'',10),(2026,'application','btreport','findone',0,'',10),(2029,'application','btreport','count',0,'',10),(2032,'application','btreport','create',0,'',10),(2035,'application','btreport','update',0,'',10),(2038,'application','btreport','destroy',0,'',10),(2041,'application','btreport','createrelation',0,'',10),(2044,'application','btreport','updaterelation',0,'',10),(2047,'application','btreport','destroyrelation',0,'',10),(2050,'application','btsite','find',0,'',10),(2053,'application','btsite','findone',0,'',10),(2056,'application','btsite','count',0,'',10),(2059,'application','btsite','create',0,'',10),(2062,'application','btsite','update',0,'',10),(2065,'application','btsite','destroy',0,'',10),(2068,'application','btsite','createrelation',0,'',10),(2071,'application','btsite','updaterelation',0,'',10),(2074,'application','btsite','destroyrelation',0,'',10),(2077,'application','cmdr','find',0,'',10),(2080,'application','cmdr','findone',0,'',10),(2083,'application','cmdr','count',0,'',10),(2086,'application','cmdr','create',0,'',10),(2089,'application','cmdr','update',0,'',10),(2092,'application','cmdr','destroy',0,'',10),(2095,'application','cmdr','createrelation',0,'',10),(2098,'application','cmdr','updaterelation',0,'',10),(2101,'application','cmdr','destroyrelation',0,'',10),(2104,'application','fgreport','find',0,'',10),(2107,'application','fgreport','findone',0,'',10),(2110,'application','fgreport','count',0,'',10),(2113,'application','fgreport','create',0,'',10),(2116,'application','fgreport','update',0,'',10),(2119,'application','fgreport','destroy',0,'',10),(2122,'application','fgreport','createrelation',0,'',10),(2125,'application','fgreport','updaterelation',0,'',10),(2128,'application','fgreport','destroyrelation',0,'',10),(2131,'application','fgsite','find',0,'',10),(2134,'application','fgsite','findone',0,'',10),(2137,'application','fgsite','count',0,'',10),(2140,'application','fgsite','create',0,'',10),(2143,'application','fgsite','update',0,'',10),(2146,'application','fgsite','destroy',0,'',10),(2149,'application','fgsite','createrelation',0,'',10),(2152,'application','fgsite','updaterelation',0,'',10),(2155,'application','fgsite','destroyrelation',0,'',10),(2158,'application','fmreport','find',0,'',10),(2161,'application','fmreport','findone',0,'',10),(2164,'application','fmreport','count',0,'',10),(2167,'application','fmreport','create',0,'',10),(2170,'application','fmreport','update',0,'',10),(2173,'application','fmreport','destroy',0,'',10),(2176,'application','fmreport','createrelation',0,'',10),(2179,'application','fmreport','updaterelation',0,'',10),(2182,'application','fmreport','destroyrelation',0,'',10),(2185,'application','fmsite','find',0,'',10),(2188,'application','fmsite','findone',0,'',10),(2191,'application','fmsite','count',0,'',10),(2194,'application','fmsite','create',0,'',10),(2197,'application','fmsite','update',0,'',10),(2200,'application','fmsite','destroy',0,'',10),(2203,'application','fmsite','createrelation',0,'',10),(2206,'application','fmsite','updaterelation',0,'',10),(2209,'application','fmsite','destroyrelation',0,'',10),(2212,'application','fmtype','find',0,'',10),(2215,'application','fmtype','findone',0,'',10),(2218,'application','fmtype','count',0,'',10),(2221,'application','fmtype','create',0,'',10),(2224,'application','fmtype','update',0,'',10),(2227,'application','fmtype','destroy',0,'',10),(2230,'application','fmtype','createrelation',0,'',10),(2233,'application','fmtype','updaterelation',0,'',10),(2236,'application','fmtype','destroyrelation',0,'',10),(2239,'application','genreport','find',0,'',10),(2242,'application','genreport','findone',0,'',10),(2245,'application','genreport','count',0,'',10),(2248,'application','genreport','create',0,'',10),(2251,'application','genreport','update',0,'',10),(2254,'application','genreport','destroy',0,'',10),(2257,'application','genreport','createrelation',0,'',10),(2260,'application','genreport','updaterelation',0,'',10),(2263,'application','genreport','destroyrelation',0,'',10),(2266,'application','gensite','find',0,'',10),(2269,'application','gensite','findone',0,'',10),(2272,'application','gensite','count',0,'',10),(2275,'application','gensite','create',0,'',10),(2278,'application','gensite','update',0,'',10),(2281,'application','gensite','destroy',0,'',10),(2284,'application','gensite','createrelation',0,'',10),(2287,'application','gensite','updaterelation',0,'',10),(2290,'application','gensite','destroyrelation',0,'',10),(2293,'application','gractivegroup','find',0,'',10),(2296,'application','gractivegroup','findone',0,'',10),(2299,'application','gractivegroup','count',0,'',10),(2302,'application','gractivegroup','create',0,'',10),(2305,'application','gractivegroup','update',0,'',10),(2308,'application','gractivegroup','destroy',0,'',10),(2311,'application','gractivegroup','createrelation',0,'',10),(2314,'application','gractivegroup','updaterelation',0,'',10),(2317,'application','gractivegroup','destroyrelation',0,'',10),(2320,'application','gractiveobelisk','find',0,'',10),(2323,'application','gractiveobelisk','findone',0,'',10),(2326,'application','gractiveobelisk','count',0,'',10),(2329,'application','gractiveobelisk','create',0,'',10),(2332,'application','gractiveobelisk','update',0,'',10),(2335,'application','gractiveobelisk','destroy',0,'',10),(2338,'application','gractiveobelisk','createrelation',0,'',10),(2341,'application','gractiveobelisk','updaterelation',0,'',10),(2344,'application','gractiveobelisk','destroyrelation',0,'',10),(2347,'application','grartifact','find',0,'',10),(2350,'application','grartifact','findone',0,'',10),(2353,'application','grartifact','count',0,'',10),(2356,'application','grartifact','create',0,'',10),(2359,'application','grartifact','update',0,'',10),(2362,'application','grartifact','destroy',0,'',10),(2365,'application','grartifact','createrelation',0,'',10),(2368,'application','grartifact','updaterelation',0,'',10),(2371,'application','grartifact','destroyrelation',0,'',10),(2374,'application','grcodexcategories','find',0,'',10),(2377,'application','grcodexcategories','findone',0,'',10),(2380,'application','grcodexcategories','count',0,'',10),(2383,'application','grcodexcategories','create',0,'',10),(2386,'application','grcodexcategories','update',0,'',10),(2389,'application','grcodexcategories','destroy',0,'',10),(2392,'application','grcodexcategories','createrelation',0,'',10),(2395,'application','grcodexcategories','updaterelation',0,'',10),(2398,'application','grcodexcategories','destroyrelation',0,'',10),(2401,'application','grcodexdata','find',0,'',10),(2404,'application','grcodexdata','findone',0,'',10),(2407,'application','grcodexdata','count',0,'',10),(2410,'application','grcodexdata','create',0,'',10),(2413,'application','grcodexdata','update',0,'',10),(2416,'application','grcodexdata','destroy',0,'',10),(2419,'application','grcodexdata','createrelation',0,'',10),(2422,'application','grcodexdata','updaterelation',0,'',10),(2425,'application','grcodexdata','destroyrelation',0,'',10),(2428,'application','grobelisk','find',0,'',10),(2431,'application','grobelisk','findone',0,'',10),(2434,'application','grobelisk','count',0,'',10),(2437,'application','grobelisk','create',0,'',10),(2440,'application','grobelisk','update',0,'',10),(2443,'application','grobelisk','destroy',0,'',10),(2446,'application','grobelisk','createrelation',0,'',10),(2449,'application','grobelisk','updaterelation',0,'',10),(2452,'application','grobelisk','destroyrelation',0,'',10),(2455,'application','grobeliskgroup','find',0,'',10),(2458,'application','grobeliskgroup','findone',0,'',10),(2461,'application','grobeliskgroup','count',0,'',10),(2464,'application','grobeliskgroup','create',0,'',10),(2467,'application','grobeliskgroup','update',0,'',10),(2470,'application','grobeliskgroup','destroy',0,'',10),(2473,'application','grobeliskgroup','createrelation',0,'',10),(2476,'application','grobeliskgroup','updaterelation',0,'',10),(2479,'application','grobeliskgroup','destroyrelation',0,'',10),(2482,'application','grreport','find',0,'',10),(2485,'application','grreport','findone',0,'',10),(2488,'application','grreport','count',0,'',10),(2491,'application','grreport','create',0,'',10),(2494,'application','grreport','update',0,'',10),(2497,'application','grreport','destroy',0,'',10),(2500,'application','grreport','createrelation',0,'',10),(2503,'application','grreport','updaterelation',0,'',10),(2506,'application','grreport','destroyrelation',0,'',10),(2509,'application','grsite','find',0,'',10),(2512,'application','grsite','findone',0,'',10),(2515,'application','grsite','count',0,'',10),(2518,'application','grsite','create',0,'',10),(2521,'application','grsite','update',0,'',10),(2524,'application','grsite','destroy',0,'',10),(2527,'application','grsite','createrelation',0,'',10),(2530,'application','grsite','updaterelation',0,'',10),(2533,'application','grsite','destroyrelation',0,'',10),(2536,'application','grtype','find',0,'',10),(2539,'application','grtype','findone',0,'',10),(2542,'application','grtype','count',0,'',10),(2545,'application','grtype','create',0,'',10),(2548,'application','grtype','update',0,'',10),(2551,'application','grtype','destroy',0,'',10),(2554,'application','grtype','createrelation',0,'',10),(2557,'application','grtype','updaterelation',0,'',10),(2560,'application','grtype','destroyrelation',0,'',10),(2563,'application','gsactivegroup','find',0,'',10),(2566,'application','gsactivegroup','findone',0,'',10),(2569,'application','gsactivegroup','count',0,'',10),(2572,'application','gsactivegroup','create',0,'',10),(2575,'application','gsactivegroup','update',0,'',10),(2578,'application','gsactivegroup','destroy',0,'',10),(2581,'application','gsactivegroup','createrelation',0,'',10),(2584,'application','gsactivegroup','updaterelation',0,'',10),(2587,'application','gsactivegroup','destroyrelation',0,'',10),(2590,'application','gsactiveobelisk','find',0,'',10),(2593,'application','gsactiveobelisk','findone',0,'',10),(2596,'application','gsactiveobelisk','count',0,'',10),(2599,'application','gsactiveobelisk','create',0,'',10),(2602,'application','gsactiveobelisk','update',0,'',10),(2605,'application','gsactiveobelisk','destroy',0,'',10),(2608,'application','gsactiveobelisk','createrelation',0,'',10),(2611,'application','gsactiveobelisk','updaterelation',0,'',10),(2614,'application','gsactiveobelisk','destroyrelation',0,'',10),(2617,'application','gsartifact','find',0,'',10),(2620,'application','gsartifact','findone',0,'',10),(2623,'application','gsartifact','count',0,'',10),(2626,'application','gsartifact','create',0,'',10),(2629,'application','gsartifact','update',0,'',10),(2632,'application','gsartifact','destroy',0,'',10),(2635,'application','gsartifact','createrelation',0,'',10),(2638,'application','gsartifact','updaterelation',0,'',10),(2641,'application','gsartifact','destroyrelation',0,'',10),(2644,'application','gscodexcategory','find',0,'',10),(2647,'application','gscodexcategory','findone',0,'',10),(2650,'application','gscodexcategory','count',0,'',10),(2653,'application','gscodexcategory','create',0,'',10),(2656,'application','gscodexcategory','update',0,'',10),(2659,'application','gscodexcategory','destroy',0,'',10),(2662,'application','gscodexcategory','createrelation',0,'',10),(2665,'application','gscodexcategory','updaterelation',0,'',10),(2668,'application','gscodexcategory','destroyrelation',0,'',10),(2671,'application','gscodexdata','find',0,'',10),(2674,'application','gscodexdata','findone',0,'',10),(2677,'application','gscodexdata','count',0,'',10),(2680,'application','gscodexdata','create',0,'',10),(2683,'application','gscodexdata','update',0,'',10),(2686,'application','gscodexdata','destroy',0,'',10),(2689,'application','gscodexdata','createrelation',0,'',10),(2692,'application','gscodexdata','updaterelation',0,'',10),(2695,'application','gscodexdata','destroyrelation',0,'',10),(2698,'application','gsobelisk','find',0,'',10),(2701,'application','gsobelisk','findone',0,'',10),(2704,'application','gsobelisk','count',0,'',10),(2707,'application','gsobelisk','create',0,'',10),(2710,'application','gsobelisk','update',0,'',10),(2713,'application','gsobelisk','destroy',0,'',10),(2716,'application','gsobelisk','createrelation',0,'',10),(2719,'application','gsobelisk','updaterelation',0,'',10),(2722,'application','gsobelisk','destroyrelation',0,'',10),(2725,'application','gsobeliskgroup','find',0,'',10),(2728,'application','gsobeliskgroup','findone',0,'',10),(2731,'application','gsobeliskgroup','count',0,'',10),(2734,'application','gsobeliskgroup','create',0,'',10),(2737,'application','gsobeliskgroup','update',0,'',10),(2740,'application','gsobeliskgroup','destroy',0,'',10),(2743,'application','gsobeliskgroup','createrelation',0,'',10),(2746,'application','gsobeliskgroup','updaterelation',0,'',10),(2749,'application','gsobeliskgroup','destroyrelation',0,'',10),(2752,'application','gsreport','find',0,'',10),(2755,'application','gsreport','findone',0,'',10),(2758,'application','gsreport','count',0,'',10),(2761,'application','gsreport','create',0,'',10),(2764,'application','gsreport','update',0,'',10),(2767,'application','gsreport','destroy',0,'',10),(2770,'application','gsreport','createrelation',0,'',10),(2773,'application','gsreport','updaterelation',0,'',10),(2776,'application','gsreport','destroyrelation',0,'',10),(2779,'application','gssite','find',0,'',10),(2782,'application','gssite','findone',0,'',10),(2785,'application','gssite','count',0,'',10),(2788,'application','gssite','create',0,'',10),(2791,'application','gssite','update',0,'',10),(2794,'application','gssite','destroy',0,'',10),(2797,'application','gssite','createrelation',0,'',10),(2800,'application','gssite','updaterelation',0,'',10),(2803,'application','gssite','destroyrelation',0,'',10),(2806,'application','gstype','find',0,'',10),(2809,'application','gstype','findone',0,'',10),(2812,'application','gstype','count',0,'',10),(2815,'application','gstype','create',0,'',10),(2818,'application','gstype','update',0,'',10),(2821,'application','gstype','destroy',0,'',10),(2824,'application','gstype','createrelation',0,'',10),(2827,'application','gstype','updaterelation',0,'',10),(2830,'application','gstype','destroyrelation',0,'',10),(2833,'application','gysite','find',0,'',10),(2836,'application','gysite','findone',0,'',10),(2839,'application','gysite','count',0,'',10),(2842,'application','gysite','create',0,'',10),(2845,'application','gysite','update',0,'',10),(2848,'application','gysite','destroy',0,'',10),(2851,'application','gysite','createrelation',0,'',10),(2854,'application','gysite','updaterelation',0,'',10),(2857,'application','gysite','destroyrelation',0,'',10),(2860,'application','gytype','find',0,'',10),(2863,'application','gytype','findone',0,'',10),(2866,'application','gytype','count',0,'',10),(2869,'application','gytype','create',0,'',10),(2872,'application','gytype','update',0,'',10),(2875,'application','gytype','destroy',0,'',10),(2878,'application','gytype','createrelation',0,'',10),(2881,'application','gytype','updaterelation',0,'',10),(2884,'application','gytype','destroyrelation',0,'',10),(2887,'application','location','find',0,'',10),(2890,'application','location','findone',0,'',10),(2893,'application','location','count',0,'',10),(2896,'application','location','create',0,'',10),(2899,'application','location','update',0,'',10),(2902,'application','location','destroy',0,'',10),(2905,'application','location','createrelation',0,'',10),(2908,'application','location','updaterelation',0,'',10),(2911,'application','location','destroyrelation',0,'',10),(2914,'application','lsreport','find',0,'',10),(2917,'application','lsreport','findone',0,'',10),(2920,'application','lsreport','count',0,'',10),(2923,'application','lsreport','create',0,'',10),(2926,'application','lsreport','update',0,'',10),(2929,'application','lsreport','destroy',0,'',10),(2932,'application','lsreport','createrelation',0,'',10),(2935,'application','lsreport','updaterelation',0,'',10),(2938,'application','lsreport','destroyrelation',0,'',10),(2941,'application','lssite','find',0,'',10),(2944,'application','lssite','findone',0,'',10),(2947,'application','lssite','count',0,'',10),(2950,'application','lssite','create',0,'',10),(2953,'application','lssite','update',0,'',10),(2956,'application','lssite','destroy',0,'',10),(2959,'application','lssite','createrelation',0,'',10),(2962,'application','lssite','updaterelation',0,'',10),(2965,'application','lssite','destroyrelation',0,'',10),(2968,'application','lstype','find',0,'',10),(2971,'application','lstype','findone',0,'',10),(2974,'application','lstype','count',0,'',10),(2977,'application','lstype','create',0,'',10),(2980,'application','lstype','update',0,'',10),(2983,'application','lstype','destroy',0,'',10),(2986,'application','lstype','createrelation',0,'',10),(2989,'application','lstype','updaterelation',0,'',10),(2992,'application','lstype','destroyrelation',0,'',10),(2995,'application','msreport','find',0,'',10),(2998,'application','msreport','findone',0,'',10),(3001,'application','msreport','count',0,'',10),(3004,'application','msreport','create',0,'',10),(3007,'application','msreport','update',0,'',10),(3010,'application','msreport','destroy',0,'',10),(3013,'application','msreport','createrelation',0,'',10),(3016,'application','msreport','updaterelation',0,'',10),(3019,'application','msreport','destroyrelation',0,'',10),(3022,'application','mssite','find',0,'',10),(3025,'application','mssite','findone',0,'',10),(3028,'application','mssite','count',0,'',10),(3031,'application','mssite','create',0,'',10),(3034,'application','mssite','update',0,'',10),(3037,'application','mssite','destroy',0,'',10),(3040,'application','mssite','createrelation',0,'',10),(3043,'application','mssite','updaterelation',0,'',10),(3046,'application','mssite','destroyrelation',0,'',10),(3049,'application','mstype','find',0,'',10),(3052,'application','mstype','findone',0,'',10),(3055,'application','mstype','count',0,'',10),(3058,'application','mstype','create',0,'',10),(3061,'application','mstype','update',0,'',10),(3064,'application','mstype','destroy',0,'',10),(3067,'application','mstype','createrelation',0,'',10),(3070,'application','mstype','updaterelation',0,'',10),(3073,'application','mstype','destroyrelation',0,'',10),(3076,'application','ring','find',0,'',10),(3079,'application','ring','findone',0,'',10),(3082,'application','ring','count',0,'',10),(3085,'application','ring','create',0,'',10),(3088,'application','ring','update',0,'',10),(3091,'application','ring','destroy',0,'',10),(3094,'application','ring','createrelation',0,'',10),(3097,'application','ring','updaterelation',0,'',10),(3100,'application','ring','destroyrelation',0,'',10),(3103,'application','ringtype','find',0,'',10),(3106,'application','ringtype','findone',0,'',10),(3109,'application','ringtype','count',0,'',10),(3112,'application','ringtype','create',0,'',10),(3115,'application','ringtype','update',0,'',10),(3118,'application','ringtype','destroy',0,'',10),(3121,'application','ringtype','createrelation',0,'',10),(3124,'application','ringtype','updaterelation',0,'',10),(3127,'application','ringtype','destroyrelation',0,'',10),(3130,'application','system','find',0,'',10),(3133,'application','system','findone',0,'',10),(3136,'application','system','count',0,'',10),(3139,'application','system','create',0,'',10),(3142,'application','system','update',0,'',10),(3145,'application','system','destroy',0,'',10),(3148,'application','system','createrelation',0,'',10),(3151,'application','system','updaterelation',0,'',10),(3154,'application','system','destroyrelation',0,'',10),(3157,'application','tbreport','find',0,'',10),(3160,'application','tbreport','findone',0,'',10),(3163,'application','tbreport','count',0,'',10),(3166,'application','tbreport','create',0,'',10),(3169,'application','tbreport','update',0,'',10),(3172,'application','tbreport','destroy',0,'',10),(3175,'application','tbreport','createrelation',0,'',10),(3178,'application','tbreport','updaterelation',0,'',10),(3181,'application','tbreport','destroyrelation',0,'',10),(3184,'application','tbsite','find',0,'',10),(3187,'application','tbsite','findone',0,'',10),(3190,'application','tbsite','count',0,'',10),(3193,'application','tbsite','create',0,'',10),(3196,'application','tbsite','update',0,'',10),(3199,'application','tbsite','destroy',0,'',10),(3202,'application','tbsite','createrelation',0,'',10),(3205,'application','tbsite','updaterelation',0,'',10),(3208,'application','tbsite','destroyrelation',0,'',10),(3211,'application','tbtype','find',0,'',10),(3214,'application','tbtype','findone',0,'',10),(3217,'application','tbtype','count',0,'',10),(3220,'application','tbtype','create',0,'',10),(3223,'application','tbtype','update',0,'',10),(3226,'application','tbtype','destroy',0,'',10),(3229,'application','tbtype','createrelation',0,'',10),(3232,'application','tbtype','updaterelation',0,'',10),(3235,'application','tbtype','destroyrelation',0,'',10),(3238,'application','tsreport','find',0,'',10),(3241,'application','tsreport','findone',0,'',10),(3244,'application','tsreport','count',0,'',10),(3247,'application','tsreport','create',0,'',10),(3250,'application','tsreport','update',0,'',10),(3253,'application','tsreport','destroy',0,'',10),(3256,'application','tsreport','createrelation',0,'',10),(3259,'application','tsreport','updaterelation',0,'',10),(3262,'application','tsreport','destroyrelation',0,'',10),(3265,'application','tssite','find',0,'',10),(3268,'application','tssite','findone',0,'',10),(3271,'application','tssite','count',0,'',10),(3274,'application','tssite','create',0,'',10),(3277,'application','tssite','update',0,'',10),(3280,'application','tssite','destroy',0,'',10),(3283,'application','tssite','createrelation',0,'',10),(3286,'application','tssite','updaterelation',0,'',10),(3289,'application','tssite','destroyrelation',0,'',10),(3292,'application','tsstatus','find',0,'',10),(3295,'application','tsstatus','findone',0,'',10),(3298,'application','tsstatus','count',0,'',10),(3301,'application','tsstatus','create',0,'',10),(3304,'application','tsstatus','update',0,'',10),(3307,'application','tsstatus','destroy',0,'',10),(3310,'application','tsstatus','createrelation',0,'',10),(3313,'application','tsstatus','updaterelation',0,'',10),(3316,'application','tsstatus','destroyrelation',0,'',10),(3319,'application','twreport','find',0,'',10),(3322,'application','twreport','findone',0,'',10),(3325,'application','twreport','count',0,'',10),(3328,'application','twreport','create',0,'',10),(3331,'application','twreport','update',0,'',10),(3334,'application','twreport','destroy',0,'',10),(3337,'application','twreport','createrelation',0,'',10),(3340,'application','twreport','updaterelation',0,'',10),(3343,'application','twreport','destroyrelation',0,'',10),(3346,'application','twsite','find',0,'',10),(3349,'application','twsite','findone',0,'',10),(3352,'application','twsite','count',0,'',10),(3355,'application','twsite','create',0,'',10),(3358,'application','twsite','update',0,'',10),(3361,'application','twsite','destroy',0,'',10),(3364,'application','twsite','createrelation',0,'',10),(3367,'application','twsite','updaterelation',0,'',10),(3370,'application','twsite','destroyrelation',0,'',10),(3373,'application','usssite','find',0,'',10),(3376,'application','usssite','findone',0,'',10),(3379,'application','usssite','count',0,'',10),(3382,'application','usssite','create',0,'',10),(3385,'application','usssite','update',0,'',10),(3388,'application','usssite','destroy',0,'',10),(3391,'application','usssite','createrelation',0,'',10),(3394,'application','usssite','updaterelation',0,'',10),(3397,'application','usssite','destroyrelation',0,'',10),(3400,'application','usstype','find',0,'',10),(3403,'application','usstype','findone',0,'',10),(3406,'application','usstype','count',0,'',10),(3409,'application','usstype','create',0,'',10),(3412,'application','usstype','update',0,'',10),(3415,'application','usstype','destroy',0,'',10),(3418,'application','usstype','createrelation',0,'',10),(3421,'application','usstype','updaterelation',0,'',10),(3424,'application','usstype','destroyrelation',0,'',10),(3427,'content-manager','contentmanager','layout',0,'',10),(3430,'content-manager','contentmanager','models',0,'',10),(3433,'content-manager','contentmanager','find',0,'',10),(3436,'content-manager','contentmanager','count',0,'',10),(3439,'content-manager','contentmanager','findone',0,'',10),(3442,'content-manager','contentmanager','create',0,'',10),(3445,'content-manager','contentmanager','update',0,'',10),(3448,'content-manager','contentmanager','delete',0,'',10),(3451,'content-manager','contentmanager','deleteall',0,'',10),(3454,'content-type-builder','contenttypebuilder','getmodels',0,'',10),(3457,'content-type-builder','contenttypebuilder','getmodel',0,'',10),(3460,'content-type-builder','contenttypebuilder','getconnections',0,'',10),(3463,'content-type-builder','contenttypebuilder','createmodel',0,'',10),(3466,'content-type-builder','contenttypebuilder','updatemodel',0,'',10),(3469,'content-type-builder','contenttypebuilder','deletemodel',0,'',10),(3472,'content-type-builder','contenttypebuilder','autoreload',1,'',10),(3475,'content-type-builder','contenttypebuilder','checktableexists',0,'',10),(3478,'settings-manager','settingsmanager','menu',0,'',10),(3481,'settings-manager','settingsmanager','environments',0,'',10),(3484,'settings-manager','settingsmanager','languages',0,'',10),(3487,'settings-manager','settingsmanager','databases',0,'',10),(3490,'settings-manager','settingsmanager','database',0,'',10),(3493,'settings-manager','settingsmanager','databasemodel',0,'',10),(3496,'settings-manager','settingsmanager','get',0,'',10),(3499,'settings-manager','settingsmanager','update',0,'',10),(3502,'settings-manager','settingsmanager','createlanguage',0,'',10),(3505,'settings-manager','settingsmanager','deletelanguage',0,'',10),(3508,'settings-manager','settingsmanager','createdatabase',0,'',10),(3511,'settings-manager','settingsmanager','updatedatabase',0,'',10),(3514,'settings-manager','settingsmanager','deletedatabase',0,'',10),(3517,'settings-manager','settingsmanager','autoreload',1,'',10),(3520,'upload','upload','upload',0,'',10),(3523,'upload','upload','getenvironments',0,'',10),(3526,'upload','upload','getsettings',0,'',10),(3529,'upload','upload','updatesettings',0,'',10),(3532,'upload','upload','find',0,'',10),(3535,'upload','upload','findone',0,'',10),(3538,'upload','upload','count',0,'',10),(3541,'upload','upload','destroy',0,'',10),(3544,'upload','upload','search',0,'',10),(3547,'users-permissions','auth','callback',0,'',10),(3550,'users-permissions','auth','changepassword',0,'',10),(3553,'users-permissions','auth','connect',1,'',10),(3556,'users-permissions','auth','forgotpassword',0,'',10),(3559,'users-permissions','auth','register',0,'',10),(3562,'users-permissions','user','find',0,'',10),(3565,'users-permissions','user','me',1,'',10),(3568,'users-permissions','user','findone',0,'',10),(3571,'users-permissions','user','create',0,'',10),(3574,'users-permissions','user','update',0,'',10),(3577,'users-permissions','user','destroy',0,'',10),(3580,'users-permissions','user','destroyall',0,'',10),(3583,'users-permissions','userspermissions','createrole',0,'',10),(3586,'users-permissions','userspermissions','deleteprovider',0,'',10),(3589,'users-permissions','userspermissions','deleterole',0,'',10),(3592,'users-permissions','userspermissions','getpermissions',0,'',10),(3595,'users-permissions','userspermissions','getpolicies',0,'',10),(3598,'users-permissions','userspermissions','getrole',0,'',10),(3601,'users-permissions','userspermissions','getroles',0,'',10),(3604,'users-permissions','userspermissions','getroutes',0,'',10),(3607,'users-permissions','userspermissions','index',0,'',10),(3610,'users-permissions','userspermissions','init',1,'',10),(3613,'users-permissions','userspermissions','searchusers',0,'',10),(3616,'users-permissions','userspermissions','updaterole',0,'',10),(3619,'users-permissions','userspermissions','getemailtemplate',0,'',10),(3622,'users-permissions','userspermissions','updateemailtemplate',0,'',10),(3625,'users-permissions','userspermissions','getadvancedsettings',0,'',10),(3628,'users-permissions','userspermissions','updateadvancedsettings',0,'',10),(3631,'users-permissions','userspermissions','getproviders',0,'',10),(3634,'users-permissions','userspermissions','updateproviders',0,'',10),(3637,'application','bmreport','find',1,'',16),(3640,'application','bmreport','findone',1,'',16),(3643,'application','bmreport','count',1,'',16),(3646,'application','bmreport','create',1,'',16),(3649,'application','bmreport','update',1,'',16),(3652,'application','bmreport','destroy',0,'',16),(3655,'application','bmreport','createrelation',0,'',16),(3658,'application','bmreport','updaterelation',0,'',16),(3661,'application','bmreport','destroyrelation',0,'',16),(3664,'application','bmsite','find',1,'',16),(3667,'application','bmsite','findone',1,'',16),(3670,'application','bmsite','count',1,'',16),(3673,'application','bmsite','create',0,'',16),(3676,'application','bmsite','update',0,'',16),(3679,'application','bmsite','destroy',0,'',16),(3682,'application','bmsite','createrelation',0,'',16),(3685,'application','bmsite','updaterelation',0,'',16),(3688,'application','bmsite','destroyrelation',0,'',16),(3691,'application','body','find',1,'',16),(3694,'application','body','findone',1,'',16),(3697,'application','body','count',1,'',16),(3700,'application','body','create',0,'',16),(3703,'application','body','update',0,'',16),(3706,'application','body','destroy',0,'',16),(3709,'application','body','createrelation',0,'',16),(3712,'application','body','updaterelation',0,'',16),(3715,'application','body','destroyrelation',0,'',16),(3718,'application','bodyatmosphere','find',1,'',16),(3721,'application','bodyatmosphere','findone',1,'',16),(3724,'application','bodyatmosphere','count',1,'',16),(3727,'application','bodyatmosphere','create',0,'',16),(3730,'application','bodyatmosphere','update',0,'',16),(3733,'application','bodyatmosphere','destroy',0,'',16),(3736,'application','bodyatmosphere','createrelation',0,'',16),(3739,'application','bodyatmosphere','updaterelation',0,'',16),(3742,'application','bodyatmosphere','destroyrelation',0,'',16),(3745,'application','bodymaterial','find',1,'',16),(3748,'application','bodymaterial','findone',1,'',16),(3751,'application','bodymaterial','count',1,'',16),(3754,'application','bodymaterial','create',0,'',16),(3757,'application','bodymaterial','update',0,'',16),(3760,'application','bodymaterial','destroy',0,'',16),(3763,'application','bodymaterial','createrelation',0,'',16),(3766,'application','bodymaterial','updaterelation',0,'',16),(3769,'application','bodymaterial','destroyrelation',0,'',16),(3772,'application','bodysubtype','find',1,'',16),(3775,'application','bodysubtype','findone',1,'',16),(3778,'application','bodysubtype','count',1,'',16),(3781,'application','bodysubtype','create',0,'',16),(3784,'application','bodysubtype','update',0,'',16),(3787,'application','bodysubtype','destroy',0,'',16),(3790,'application','bodysubtype','createrelation',0,'',16),(3793,'application','bodysubtype','updaterelation',0,'',16),(3796,'application','bodysubtype','destroyrelation',0,'',16),(3799,'application','bodytype','find',1,'',16),(3802,'application','bodytype','findone',1,'',16),(3805,'application','bodytype','count',1,'',16),(3808,'application','bodytype','create',0,'',16),(3811,'application','bodytype','update',0,'',16),(3814,'application','bodytype','destroy',0,'',16),(3817,'application','bodytype','createrelation',0,'',16),(3820,'application','bodytype','updaterelation',0,'',16),(3823,'application','bodytype','destroyrelation',0,'',16),(3826,'application','btreport','find',1,'',16),(3829,'application','btreport','findone',1,'',16),(3832,'application','btreport','count',1,'',16),(3835,'application','btreport','create',1,'',16),(3838,'application','btreport','update',1,'',16),(3841,'application','btreport','destroy',0,'',16),(3844,'application','btreport','createrelation',0,'',16),(3847,'application','btreport','updaterelation',0,'',16),(3850,'application','btreport','destroyrelation',0,'',16),(3853,'application','btsite','find',1,'',16),(3856,'application','btsite','findone',1,'',16),(3859,'application','btsite','count',1,'',16),(3862,'application','btsite','create',0,'',16),(3865,'application','btsite','update',0,'',16),(3868,'application','btsite','destroy',0,'',16),(3871,'application','btsite','createrelation',0,'',16),(3874,'application','btsite','updaterelation',0,'',16),(3877,'application','btsite','destroyrelation',0,'',16),(3880,'application','cmdr','find',1,'',16),(3883,'application','cmdr','findone',1,'',16),(3886,'application','cmdr','count',1,'',16),(3889,'application','cmdr','create',0,'',16),(3892,'application','cmdr','update',0,'',16),(3895,'application','cmdr','destroy',0,'',16),(3898,'application','cmdr','createrelation',0,'',16),(3901,'application','cmdr','updaterelation',0,'',16),(3904,'application','cmdr','destroyrelation',0,'',16),(3907,'application','fgreport','find',1,'',16),(3910,'application','fgreport','findone',1,'',16),(3913,'application','fgreport','count',1,'',16),(3916,'application','fgreport','create',1,'',16),(3919,'application','fgreport','update',1,'',16),(3922,'application','fgreport','destroy',0,'',16),(3925,'application','fgreport','createrelation',0,'',16),(3928,'application','fgreport','updaterelation',0,'',16),(3931,'application','fgreport','destroyrelation',0,'',16),(3934,'application','fgsite','find',1,'',16),(3937,'application','fgsite','findone',1,'',16),(3940,'application','fgsite','count',1,'',16),(3943,'application','fgsite','create',0,'',16),(3946,'application','fgsite','update',0,'',16),(3949,'application','fgsite','destroy',0,'',16),(3952,'application','fgsite','createrelation',0,'',16),(3955,'application','fgsite','updaterelation',0,'',16),(3958,'application','fgsite','destroyrelation',0,'',16),(3961,'application','fmreport','find',1,'',16),(3964,'application','fmreport','findone',1,'',16),(3967,'application','fmreport','count',1,'',16),(3970,'application','fmreport','create',1,'',16),(3973,'application','fmreport','update',1,'',16),(3976,'application','fmreport','destroy',0,'',16),(3979,'application','fmreport','createrelation',0,'',16),(3982,'application','fmreport','updaterelation',0,'',16),(3985,'application','fmreport','destroyrelation',0,'',16),(3988,'application','fmsite','find',1,'',16),(3991,'application','fmsite','findone',1,'',16),(3994,'application','fmsite','count',1,'',16),(3997,'application','fmsite','create',0,'',16),(4000,'application','fmsite','update',0,'',16),(4003,'application','fmsite','destroy',0,'',16),(4006,'application','fmsite','createrelation',0,'',16),(4009,'application','fmsite','updaterelation',0,'',16),(4012,'application','fmsite','destroyrelation',0,'',16),(4015,'application','fmtype','find',1,'',16),(4018,'application','fmtype','findone',1,'',16),(4021,'application','fmtype','count',1,'',16),(4024,'application','fmtype','create',0,'',16),(4027,'application','fmtype','update',0,'',16),(4030,'application','fmtype','destroy',0,'',16),(4033,'application','fmtype','createrelation',0,'',16),(4036,'application','fmtype','updaterelation',0,'',16),(4039,'application','fmtype','destroyrelation',0,'',16),(4042,'application','genreport','find',1,'',16),(4045,'application','genreport','findone',1,'',16),(4048,'application','genreport','count',1,'',16),(4051,'application','genreport','create',1,'',16),(4054,'application','genreport','update',1,'',16),(4057,'application','genreport','destroy',0,'',16),(4060,'application','genreport','createrelation',0,'',16),(4063,'application','genreport','updaterelation',0,'',16),(4066,'application','genreport','destroyrelation',0,'',16),(4069,'application','gensite','find',1,'',16),(4072,'application','gensite','findone',1,'',16),(4075,'application','gensite','count',1,'',16),(4078,'application','gensite','create',0,'',16),(4081,'application','gensite','update',0,'',16),(4084,'application','gensite','destroy',0,'',16),(4087,'application','gensite','createrelation',0,'',16),(4090,'application','gensite','updaterelation',0,'',16),(4093,'application','gensite','destroyrelation',0,'',16),(4096,'application','gractivegroup','find',1,'',16),(4099,'application','gractivegroup','findone',1,'',16),(4102,'application','gractivegroup','count',1,'',16),(4105,'application','gractivegroup','create',0,'',16),(4108,'application','gractivegroup','update',0,'',16),(4111,'application','gractivegroup','destroy',0,'',16),(4114,'application','gractivegroup','createrelation',0,'',16),(4117,'application','gractivegroup','updaterelation',0,'',16),(4120,'application','gractivegroup','destroyrelation',0,'',16),(4123,'application','gractiveobelisk','find',1,'',16),(4126,'application','gractiveobelisk','findone',1,'',16),(4129,'application','gractiveobelisk','count',1,'',16),(4132,'application','gractiveobelisk','create',0,'',16),(4135,'application','gractiveobelisk','update',0,'',16),(4138,'application','gractiveobelisk','destroy',0,'',16),(4141,'application','gractiveobelisk','createrelation',0,'',16),(4144,'application','gractiveobelisk','updaterelation',0,'',16),(4147,'application','gractiveobelisk','destroyrelation',0,'',16),(4150,'application','grartifact','find',1,'',16),(4153,'application','grartifact','findone',1,'',16),(4156,'application','grartifact','count',1,'',16),(4159,'application','grartifact','create',0,'',16),(4162,'application','grartifact','update',0,'',16),(4165,'application','grartifact','destroy',0,'',16),(4168,'application','grartifact','createrelation',0,'',16),(4171,'application','grartifact','updaterelation',0,'',16),(4174,'application','grartifact','destroyrelation',0,'',16),(4177,'application','grcodexcategories','find',1,'',16),(4180,'application','grcodexcategories','findone',1,'',16),(4183,'application','grcodexcategories','count',1,'',16),(4186,'application','grcodexcategories','create',0,'',16),(4189,'application','grcodexcategories','update',0,'',16),(4192,'application','grcodexcategories','destroy',0,'',16),(4195,'application','grcodexcategories','createrelation',0,'',16),(4198,'application','grcodexcategories','updaterelation',0,'',16),(4201,'application','grcodexcategories','destroyrelation',0,'',16),(4204,'application','grcodexdata','find',1,'',16),(4207,'application','grcodexdata','findone',1,'',16),(4210,'application','grcodexdata','count',1,'',16),(4213,'application','grcodexdata','create',0,'',16),(4216,'application','grcodexdata','update',0,'',16),(4219,'application','grcodexdata','destroy',0,'',16),(4222,'application','grcodexdata','createrelation',0,'',16),(4225,'application','grcodexdata','updaterelation',0,'',16),(4228,'application','grcodexdata','destroyrelation',0,'',16),(4231,'application','grobelisk','find',1,'',16),(4234,'application','grobelisk','findone',1,'',16),(4237,'application','grobelisk','count',1,'',16),(4240,'application','grobelisk','create',0,'',16),(4243,'application','grobelisk','update',0,'',16),(4246,'application','grobelisk','destroy',0,'',16),(4249,'application','grobelisk','createrelation',0,'',16),(4252,'application','grobelisk','updaterelation',0,'',16),(4255,'application','grobelisk','destroyrelation',0,'',16),(4258,'application','grobeliskgroup','find',1,'',16),(4261,'application','grobeliskgroup','findone',1,'',16),(4264,'application','grobeliskgroup','count',1,'',16),(4267,'application','grobeliskgroup','create',0,'',16),(4270,'application','grobeliskgroup','update',0,'',16),(4273,'application','grobeliskgroup','destroy',0,'',16),(4276,'application','grobeliskgroup','createrelation',0,'',16),(4279,'application','grobeliskgroup','updaterelation',0,'',16),(4282,'application','grobeliskgroup','destroyrelation',0,'',16),(4285,'application','grreport','find',1,'',16),(4288,'application','grreport','findone',1,'',16),(4291,'application','grreport','count',1,'',16),(4294,'application','grreport','create',1,'',16),(4297,'application','grreport','update',1,'',16),(4300,'application','grreport','destroy',0,'',16),(4303,'application','grreport','createrelation',0,'',16),(4306,'application','grreport','updaterelation',0,'',16),(4309,'application','grreport','destroyrelation',0,'',16),(4312,'application','grsite','find',1,'',16),(4315,'application','grsite','findone',1,'',16),(4318,'application','grsite','count',1,'',16),(4321,'application','grsite','create',0,'',16),(4324,'application','grsite','update',0,'',16),(4327,'application','grsite','destroy',0,'',16),(4330,'application','grsite','createrelation',0,'',16),(4333,'application','grsite','updaterelation',0,'',16),(4336,'application','grsite','destroyrelation',0,'',16),(4339,'application','grtype','find',1,'',16),(4342,'application','grtype','findone',1,'',16),(4345,'application','grtype','count',1,'',16),(4348,'application','grtype','create',0,'',16),(4351,'application','grtype','update',0,'',16),(4354,'application','grtype','destroy',0,'',16),(4357,'application','grtype','createrelation',0,'',16),(4360,'application','grtype','updaterelation',0,'',16),(4363,'application','grtype','destroyrelation',0,'',16),(4366,'application','gsactivegroup','find',1,'',16),(4369,'application','gsactivegroup','findone',1,'',16),(4372,'application','gsactivegroup','count',1,'',16),(4375,'application','gsactivegroup','create',0,'',16),(4378,'application','gsactivegroup','update',0,'',16),(4381,'application','gsactivegroup','destroy',0,'',16),(4384,'application','gsactivegroup','createrelation',0,'',16),(4387,'application','gsactivegroup','updaterelation',0,'',16),(4390,'application','gsactivegroup','destroyrelation',0,'',16),(4393,'application','gsactiveobelisk','find',1,'',16),(4396,'application','gsactiveobelisk','findone',1,'',16),(4399,'application','gsactiveobelisk','count',1,'',16),(4402,'application','gsactiveobelisk','create',0,'',16),(4405,'application','gsactiveobelisk','update',0,'',16),(4408,'application','gsactiveobelisk','destroy',0,'',16),(4411,'application','gsactiveobelisk','createrelation',0,'',16),(4414,'application','gsactiveobelisk','updaterelation',0,'',16),(4417,'application','gsactiveobelisk','destroyrelation',0,'',16),(4420,'application','gsartifact','find',1,'',16),(4423,'application','gsartifact','findone',1,'',16),(4426,'application','gsartifact','count',1,'',16),(4429,'application','gsartifact','create',0,'',16),(4432,'application','gsartifact','update',0,'',16),(4435,'application','gsartifact','destroy',0,'',16),(4438,'application','gsartifact','createrelation',0,'',16),(4441,'application','gsartifact','updaterelation',0,'',16),(4444,'application','gsartifact','destroyrelation',0,'',16),(4447,'application','gscodexcategory','find',1,'',16),(4450,'application','gscodexcategory','findone',1,'',16),(4453,'application','gscodexcategory','count',1,'',16),(4456,'application','gscodexcategory','create',0,'',16),(4459,'application','gscodexcategory','update',0,'',16),(4462,'application','gscodexcategory','destroy',0,'',16),(4465,'application','gscodexcategory','createrelation',0,'',16),(4468,'application','gscodexcategory','updaterelation',0,'',16),(4471,'application','gscodexcategory','destroyrelation',0,'',16),(4474,'application','gscodexdata','find',1,'',16),(4477,'application','gscodexdata','findone',1,'',16),(4480,'application','gscodexdata','count',1,'',16),(4483,'application','gscodexdata','create',0,'',16),(4486,'application','gscodexdata','update',0,'',16),(4489,'application','gscodexdata','destroy',0,'',16),(4492,'application','gscodexdata','createrelation',0,'',16),(4495,'application','gscodexdata','updaterelation',0,'',16),(4498,'application','gscodexdata','destroyrelation',0,'',16),(4501,'application','gsobelisk','find',1,'',16),(4504,'application','gsobelisk','findone',1,'',16),(4507,'application','gsobelisk','count',1,'',16),(4510,'application','gsobelisk','create',0,'',16),(4513,'application','gsobelisk','update',0,'',16),(4516,'application','gsobelisk','destroy',0,'',16),(4519,'application','gsobelisk','createrelation',0,'',16),(4522,'application','gsobelisk','updaterelation',0,'',16),(4525,'application','gsobelisk','destroyrelation',0,'',16),(4528,'application','gsobeliskgroup','find',1,'',16),(4531,'application','gsobeliskgroup','findone',1,'',16),(4534,'application','gsobeliskgroup','count',1,'',16),(4537,'application','gsobeliskgroup','create',0,'',16),(4540,'application','gsobeliskgroup','update',0,'',16),(4543,'application','gsobeliskgroup','destroy',0,'',16),(4546,'application','gsobeliskgroup','createrelation',0,'',16),(4549,'application','gsobeliskgroup','updaterelation',0,'',16),(4552,'application','gsobeliskgroup','destroyrelation',0,'',16),(4555,'application','gsreport','find',1,'',16),(4558,'application','gsreport','findone',1,'',16),(4561,'application','gsreport','count',1,'',16),(4564,'application','gsreport','create',1,'',16),(4567,'application','gsreport','update',1,'',16),(4570,'application','gsreport','destroy',0,'',16),(4573,'application','gsreport','createrelation',0,'',16),(4576,'application','gsreport','updaterelation',0,'',16),(4579,'application','gsreport','destroyrelation',0,'',16),(4582,'application','gssite','find',1,'',16),(4585,'application','gssite','findone',1,'',16),(4588,'application','gssite','count',1,'',16),(4591,'application','gssite','create',0,'',16),(4594,'application','gssite','update',0,'',16),(4597,'application','gssite','destroy',0,'',16),(4600,'application','gssite','createrelation',0,'',16),(4603,'application','gssite','updaterelation',0,'',16),(4606,'application','gssite','destroyrelation',0,'',16),(4609,'application','gstype','find',1,'',16),(4612,'application','gstype','findone',1,'',16),(4615,'application','gstype','count',1,'',16),(4618,'application','gstype','create',0,'',16),(4621,'application','gstype','update',0,'',16),(4624,'application','gstype','destroy',0,'',16),(4627,'application','gstype','createrelation',0,'',16),(4630,'application','gstype','updaterelation',0,'',16),(4633,'application','gstype','destroyrelation',0,'',16),(4636,'application','gysite','find',1,'',16),(4639,'application','gysite','findone',1,'',16),(4642,'application','gysite','count',1,'',16),(4645,'application','gysite','create',0,'',16),(4648,'application','gysite','update',0,'',16),(4651,'application','gysite','destroy',0,'',16),(4654,'application','gysite','createrelation',0,'',16),(4657,'application','gysite','updaterelation',0,'',16),(4660,'application','gysite','destroyrelation',0,'',16),(4663,'application','gytype','find',1,'',16),(4666,'application','gytype','findone',1,'',16),(4669,'application','gytype','count',1,'',16),(4672,'application','gytype','create',0,'',16),(4675,'application','gytype','update',0,'',16),(4678,'application','gytype','destroy',0,'',16),(4681,'application','gytype','createrelation',0,'',16),(4684,'application','gytype','updaterelation',0,'',16),(4687,'application','gytype','destroyrelation',0,'',16),(4690,'application','location','find',1,'',16),(4693,'application','location','findone',1,'',16),(4696,'application','location','count',1,'',16),(4699,'application','location','create',0,'',16),(4702,'application','location','update',0,'',16),(4705,'application','location','destroy',0,'',16),(4708,'application','location','createrelation',0,'',16),(4711,'application','location','updaterelation',0,'',16),(4714,'application','location','destroyrelation',0,'',16),(4717,'application','lsreport','find',1,'',16),(4720,'application','lsreport','findone',1,'',16),(4723,'application','lsreport','count',1,'',16),(4726,'application','lsreport','create',1,'',16),(4729,'application','lsreport','update',1,'',16),(4732,'application','lsreport','destroy',0,'',16),(4735,'application','lsreport','createrelation',0,'',16),(4738,'application','lsreport','updaterelation',0,'',16),(4741,'application','lsreport','destroyrelation',0,'',16),(4744,'application','lssite','find',1,'',16),(4747,'application','lssite','findone',1,'',16),(4750,'application','lssite','count',1,'',16),(4753,'application','lssite','create',0,'',16),(4756,'application','lssite','update',0,'',16),(4759,'application','lssite','destroy',0,'',16),(4762,'application','lssite','createrelation',0,'',16),(4765,'application','lssite','updaterelation',0,'',16),(4768,'application','lssite','destroyrelation',0,'',16),(4771,'application','lstype','find',1,'',16),(4774,'application','lstype','findone',1,'',16),(4777,'application','lstype','count',1,'',16),(4780,'application','lstype','create',0,'',16),(4783,'application','lstype','update',0,'',16),(4786,'application','lstype','destroy',0,'',16),(4789,'application','lstype','createrelation',0,'',16),(4792,'application','lstype','updaterelation',0,'',16),(4795,'application','lstype','destroyrelation',0,'',16),(4798,'application','msreport','find',1,'',16),(4801,'application','msreport','findone',1,'',16),(4804,'application','msreport','count',1,'',16),(4807,'application','msreport','create',1,'',16),(4810,'application','msreport','update',1,'',16),(4813,'application','msreport','destroy',0,'',16),(4816,'application','msreport','createrelation',0,'',16),(4819,'application','msreport','updaterelation',0,'',16),(4822,'application','msreport','destroyrelation',0,'',16),(4825,'application','mssite','find',1,'',16),(4828,'application','mssite','findone',1,'',16),(4831,'application','mssite','count',1,'',16),(4834,'application','mssite','create',0,'',16),(4837,'application','mssite','update',0,'',16),(4840,'application','mssite','destroy',0,'',16),(4843,'application','mssite','createrelation',0,'',16),(4846,'application','mssite','updaterelation',0,'',16),(4849,'application','mssite','destroyrelation',0,'',16),(4852,'application','mstype','find',1,'',16),(4855,'application','mstype','findone',1,'',16),(4858,'application','mstype','count',1,'',16),(4861,'application','mstype','create',0,'',16),(4864,'application','mstype','update',0,'',16),(4867,'application','mstype','destroy',0,'',16),(4870,'application','mstype','createrelation',0,'',16),(4873,'application','mstype','updaterelation',0,'',16),(4876,'application','mstype','destroyrelation',0,'',16),(4879,'application','ring','find',1,'',16),(4882,'application','ring','findone',1,'',16),(4885,'application','ring','count',1,'',16),(4888,'application','ring','create',0,'',16),(4891,'application','ring','update',0,'',16),(4894,'application','ring','destroy',0,'',16),(4897,'application','ring','createrelation',0,'',16),(4900,'application','ring','updaterelation',0,'',16),(4903,'application','ring','destroyrelation',0,'',16),(4906,'application','ringtype','find',1,'',16),(4909,'application','ringtype','findone',1,'',16),(4912,'application','ringtype','count',1,'',16),(4915,'application','ringtype','create',0,'',16),(4918,'application','ringtype','update',0,'',16),(4921,'application','ringtype','destroy',0,'',16),(4924,'application','ringtype','createrelation',0,'',16),(4927,'application','ringtype','updaterelation',0,'',16),(4930,'application','ringtype','destroyrelation',0,'',16),(4933,'application','system','find',1,'',16),(4936,'application','system','findone',1,'',16),(4939,'application','system','count',1,'',16),(4942,'application','system','create',0,'',16),(4945,'application','system','update',0,'',16),(4948,'application','system','destroy',0,'',16),(4951,'application','system','createrelation',0,'',16),(4954,'application','system','updaterelation',0,'',16),(4957,'application','system','destroyrelation',0,'',16),(4960,'application','tbreport','find',1,'',16),(4963,'application','tbreport','findone',1,'',16),(4966,'application','tbreport','count',1,'',16),(4969,'application','tbreport','create',1,'',16),(4972,'application','tbreport','update',1,'',16),(4975,'application','tbreport','destroy',0,'',16),(4978,'application','tbreport','createrelation',0,'',16),(4981,'application','tbreport','updaterelation',0,'',16),(4984,'application','tbreport','destroyrelation',0,'',16),(4987,'application','tbsite','find',1,'',16),(4990,'application','tbsite','findone',1,'',16),(4993,'application','tbsite','count',1,'',16),(4996,'application','tbsite','create',0,'',16),(4999,'application','tbsite','update',0,'',16),(5002,'application','tbsite','destroy',0,'',16),(5005,'application','tbsite','createrelation',0,'',16),(5008,'application','tbsite','updaterelation',0,'',16),(5011,'application','tbsite','destroyrelation',0,'',16),(5014,'application','tbtype','find',1,'',16),(5017,'application','tbtype','findone',1,'',16),(5020,'application','tbtype','count',1,'',16),(5023,'application','tbtype','create',0,'',16),(5026,'application','tbtype','update',0,'',16),(5029,'application','tbtype','destroy',0,'',16),(5032,'application','tbtype','createrelation',0,'',16),(5035,'application','tbtype','updaterelation',0,'',16),(5038,'application','tbtype','destroyrelation',0,'',16),(5041,'application','tsreport','find',1,'',16),(5044,'application','tsreport','findone',1,'',16),(5047,'application','tsreport','count',1,'',16),(5050,'application','tsreport','create',1,'',16),(5053,'application','tsreport','update',1,'',16),(5056,'application','tsreport','destroy',0,'',16),(5059,'application','tsreport','createrelation',0,'',16),(5062,'application','tsreport','updaterelation',0,'',16),(5065,'application','tsreport','destroyrelation',0,'',16),(5068,'application','tssite','find',1,'',16),(5071,'application','tssite','findone',1,'',16),(5074,'application','tssite','count',1,'',16),(5077,'application','tssite','create',0,'',16),(5080,'application','tssite','update',0,'',16),(5083,'application','tssite','destroy',0,'',16),(5086,'application','tssite','createrelation',0,'',16),(5089,'application','tssite','updaterelation',0,'',16),(5092,'application','tssite','destroyrelation',0,'',16),(5095,'application','tsstatus','find',1,'',16),(5098,'application','tsstatus','findone',1,'',16),(5101,'application','tsstatus','count',1,'',16),(5104,'application','tsstatus','create',0,'',16),(5107,'application','tsstatus','update',0,'',16),(5110,'application','tsstatus','destroy',0,'',16),(5113,'application','tsstatus','createrelation',0,'',16),(5116,'application','tsstatus','updaterelation',0,'',16),(5119,'application','tsstatus','destroyrelation',0,'',16),(5122,'application','twreport','find',1,'',16),(5125,'application','twreport','findone',1,'',16),(5128,'application','twreport','count',1,'',16),(5131,'application','twreport','create',1,'',16),(5134,'application','twreport','update',1,'',16),(5137,'application','twreport','destroy',0,'',16),(5140,'application','twreport','createrelation',0,'',16),(5143,'application','twreport','updaterelation',0,'',16),(5146,'application','twreport','destroyrelation',0,'',16),(5149,'application','twsite','find',1,'',16),(5152,'application','twsite','findone',1,'',16),(5155,'application','twsite','count',1,'',16),(5158,'application','twsite','create',0,'',16),(5161,'application','twsite','update',0,'',16),(5164,'application','twsite','destroy',0,'',16),(5167,'application','twsite','createrelation',0,'',16),(5170,'application','twsite','updaterelation',0,'',16),(5173,'application','twsite','destroyrelation',0,'',16),(5176,'application','usssite','find',1,'',16),(5179,'application','usssite','findone',1,'',16),(5182,'application','usssite','count',1,'',16),(5185,'application','usssite','create',0,'',16),(5188,'application','usssite','update',0,'',16),(5191,'application','usssite','destroy',0,'',16),(5194,'application','usssite','createrelation',0,'',16),(5197,'application','usssite','updaterelation',0,'',16),(5200,'application','usssite','destroyrelation',0,'',16),(5203,'application','usstype','find',1,'',16),(5206,'application','usstype','findone',1,'',16),(5209,'application','usstype','count',1,'',16),(5212,'application','usstype','create',0,'',16),(5215,'application','usstype','update',0,'',16),(5218,'application','usstype','destroy',0,'',16),(5221,'application','usstype','createrelation',0,'',16),(5224,'application','usstype','updaterelation',0,'',16),(5227,'application','usstype','destroyrelation',0,'',16),(5230,'content-manager','contentmanager','layout',0,'',16),(5233,'content-manager','contentmanager','models',0,'',16),(5236,'content-manager','contentmanager','find',0,'',16),(5239,'content-manager','contentmanager','count',0,'',16),(5242,'content-manager','contentmanager','findone',0,'',16),(5245,'content-manager','contentmanager','create',0,'',16),(5248,'content-manager','contentmanager','update',0,'',16),(5251,'content-manager','contentmanager','delete',0,'',16),(5254,'content-manager','contentmanager','deleteall',0,'',16),(5257,'content-type-builder','contenttypebuilder','getmodels',0,'',16),(5260,'content-type-builder','contenttypebuilder','getmodel',0,'',16),(5263,'content-type-builder','contenttypebuilder','getconnections',0,'',16),(5266,'content-type-builder','contenttypebuilder','createmodel',0,'',16),(5269,'content-type-builder','contenttypebuilder','updatemodel',0,'',16),(5272,'content-type-builder','contenttypebuilder','deletemodel',0,'',16),(5275,'content-type-builder','contenttypebuilder','autoreload',1,'',16),(5278,'content-type-builder','contenttypebuilder','checktableexists',0,'',16),(5281,'settings-manager','settingsmanager','menu',0,'',16),(5284,'settings-manager','settingsmanager','environments',0,'',16),(5287,'settings-manager','settingsmanager','languages',0,'',16),(5290,'settings-manager','settingsmanager','databases',0,'',16),(5293,'settings-manager','settingsmanager','database',0,'',16),(5296,'settings-manager','settingsmanager','databasemodel',0,'',16),(5299,'settings-manager','settingsmanager','get',0,'',16),(5302,'settings-manager','settingsmanager','update',0,'',16),(5305,'settings-manager','settingsmanager','createlanguage',0,'',16),(5308,'settings-manager','settingsmanager','deletelanguage',0,'',16),(5311,'settings-manager','settingsmanager','createdatabase',0,'',16),(5314,'settings-manager','settingsmanager','updatedatabase',0,'',16),(5317,'settings-manager','settingsmanager','deletedatabase',0,'',16),(5320,'settings-manager','settingsmanager','autoreload',1,'',16),(5323,'upload','upload','upload',0,'',16),(5326,'upload','upload','getenvironments',0,'',16),(5329,'upload','upload','getsettings',0,'',16),(5332,'upload','upload','updatesettings',0,'',16),(5335,'upload','upload','find',0,'',16),(5338,'upload','upload','findone',0,'',16),(5341,'upload','upload','count',0,'',16),(5344,'upload','upload','destroy',0,'',16),(5347,'upload','upload','search',0,'',16),(5350,'users-permissions','auth','callback',1,'',16),(5353,'users-permissions','auth','changepassword',1,'',16),(5356,'users-permissions','auth','connect',1,'',16),(5359,'users-permissions','auth','forgotpassword',1,'',16),(5362,'users-permissions','auth','register',1,'',16),(5365,'users-permissions','user','find',0,'',16),(5368,'users-permissions','user','me',1,'',16),(5371,'users-permissions','user','findone',0,'',16),(5374,'users-permissions','user','create',0,'',16),(5377,'users-permissions','user','update',0,'',16),(5380,'users-permissions','user','destroy',0,'',16),(5383,'users-permissions','user','destroyall',0,'',16),(5386,'users-permissions','userspermissions','createrole',0,'',16),(5389,'users-permissions','userspermissions','deleteprovider',0,'',16),(5392,'users-permissions','userspermissions','deleterole',0,'',16),(5395,'users-permissions','userspermissions','getpermissions',0,'',16),(5398,'users-permissions','userspermissions','getpolicies',0,'',16),(5401,'users-permissions','userspermissions','getrole',0,'',16),(5404,'users-permissions','userspermissions','getroles',0,'',16),(5407,'users-permissions','userspermissions','getroutes',0,'',16),(5410,'users-permissions','userspermissions','index',0,'',16),(5413,'users-permissions','userspermissions','init',1,'',16),(5416,'users-permissions','userspermissions','searchusers',0,'',16),(5419,'users-permissions','userspermissions','updaterole',0,'',16),(5422,'users-permissions','userspermissions','getemailtemplate',0,'',16),(5425,'users-permissions','userspermissions','updateemailtemplate',0,'',16),(5428,'users-permissions','userspermissions','getadvancedsettings',0,'',16),(5431,'users-permissions','userspermissions','updateadvancedsettings',0,'',16),(5434,'users-permissions','userspermissions','getproviders',0,'',16),(5437,'users-permissions','userspermissions','updateproviders',0,'',16);
/*!40000 ALTER TABLE `users-permissions_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users-permissions_role`
--

DROP TABLE IF EXISTS `users-permissions_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users-permissions_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_USERS_PERMISSIONS_ROLE` (`name`,`description`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_role`
--

LOCK TABLES `users-permissions_role` WRITE;
/*!40000 ALTER TABLE `users-permissions_role` DISABLE KEYS */;
INSERT INTO `users-permissions_role` VALUES (4,'Administrator','These users have all access in the project.','root'),(10,'Authenticated','Default role given to authenticated user.','authenticated'),(16,'Public','Default role given to unauthenticated user.','public');
/*!40000 ALTER TABLE `users-permissions_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users-permissions_user`
--

DROP TABLE IF EXISTS `users-permissions_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users-permissions_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_USERS_PERMISSIONS_USER` (`username`,`provider`,`resetPasswordToken`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_user`
--

LOCK TABLES `users-permissions_user` WRITE;
/*!40000 ALTER TABLE `users-permissions_user` DISABLE KEYS */;
INSERT INTO `users-permissions_user` VALUES (4,'canonntest','rd@canonn.technology','local','$2a$10$XYGghEla/mAX05mTYHmyWO2fsBDAfNgn0xNHd5tSc/ztpPKulNsSy',NULL,4);
/*!40000 ALTER TABLE `users-permissions_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usssites`
--

DROP TABLE IF EXISTS `usssites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usssites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `threatLevel` int(11) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usssites`
--

LOCK TABLES `usssites` WRITE;
/*!40000 ALTER TABLE `usssites` DISABLE KEYS */;
/*!40000 ALTER TABLE `usssites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usstypes`
--

DROP TABLE IF EXISTS `usstypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usstypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_USSTYPES` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usstypes`
--

LOCK TABLES `usstypes` WRITE;
/*!40000 ALTER TABLE `usstypes` DISABLE KEYS */;
INSERT INTO `usstypes` VALUES (1,'Anomaly','2018-06-17 12:36:57','2018-06-17 12:36:57'),(2,'Ceremonial Comms','2018-06-17 12:36:57','2018-06-17 12:36:57'),(3,'Combat Aftermath','2018-06-17 12:36:57','2018-06-17 12:36:57'),(4,'Convoy Dispersal Pattern','2018-06-17 12:36:57','2018-06-17 12:36:57'),(5,'Degraded Emissions','2018-06-17 12:36:57','2018-06-17 12:36:57'),(6,'Distress Call','2018-06-17 12:36:57','2018-06-17 12:36:57'),(7,'Encoded Emissions','2018-06-17 12:36:57','2018-06-17 12:36:57'),(8,'High Grade Emissions','2018-06-17 12:36:57','2018-06-17 12:36:57'),(9,'Mission Target','2018-06-17 12:36:57','2018-06-17 12:36:57'),(10,'Non-Human Signal Source','2018-06-17 12:36:57','2018-06-17 12:36:57'),(11,'Trading Beacon','2018-06-17 12:36:57','2018-06-17 12:36:57'),(12,'Weapons Fire','2018-06-17 12:36:57','2018-06-17 12:36:57');
/*!40000 ALTER TABLE `usstypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'capiv2_dev'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-17  5:39:06
