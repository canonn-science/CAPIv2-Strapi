-- MySQL dump 10.16  Distrib 10.2.15-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: capiv2_dev
-- ------------------------------------------------------
-- Server version	10.2.15-MariaDB-10.2.15+maria~xenial-log

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
  `systemName` varchar(255) NOT NULL,
  `bodyName` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `count` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) NOT NULL,
  `cmdrComment` text DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_BMREPORTS` (`systemName`,`bodyName`,`cmdrName`,`cmdrComment`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `siteID` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `count` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `bodyName` varchar(255) NOT NULL,
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
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_BODIES` (`bodyName`,`edsmLuminosity`,`edsmVolcanismType`,`edsmAtmosphereType`,`edsmTerraformingState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `carbonDioxide` double DEFAULT NULL,
  `hydrogen` double DEFAULT NULL,
  `helium` double DEFAULT NULL,
  `iron` double DEFAULT NULL,
  `neon` double DEFAULT NULL,
  `methane` double DEFAULT NULL,
  `nitrogen` double DEFAULT NULL,
  `oxygen` double DEFAULT NULL,
  `silicates` double DEFAULT NULL,
  `sulphurDioxide` double DEFAULT NULL,
  `water` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `arsenic` double DEFAULT NULL,
  `boron` double DEFAULT NULL,
  `cadmium` double DEFAULT NULL,
  `carbon` double DEFAULT NULL,
  `chromium` double DEFAULT NULL,
  `germanium` double DEFAULT NULL,
  `iron` double DEFAULT NULL,
  `lead` double DEFAULT NULL,
  `manganese` double DEFAULT NULL,
  `mercury` double DEFAULT NULL,
  `molybdenum` double DEFAULT NULL,
  `nickel` double DEFAULT NULL,
  `niobium` double DEFAULT NULL,
  `phosphorus` double DEFAULT NULL,
  `polonium` double DEFAULT NULL,
  `rhenium` double DEFAULT NULL,
  `ruthenium` double DEFAULT NULL,
  `selenium` double DEFAULT NULL,
  `sulphur` double DEFAULT NULL,
  `technetium` double DEFAULT NULL,
  `tellurium` double DEFAULT NULL,
  `tin` double DEFAULT NULL,
  `tungsten` double DEFAULT NULL,
  `vanadium` double DEFAULT NULL,
  `yttrium` double DEFAULT NULL,
  `zinc` double DEFAULT NULL,
  `zirconium` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `subtype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_BODYSUBTYPES` (`subtype`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodysubtypes`
--

LOCK TABLES `bodysubtypes` WRITE;
/*!40000 ALTER TABLE `bodysubtypes` DISABLE KEYS */;
INSERT INTO `bodysubtypes` VALUES (1,'O (Blue-White) Star'),(2,'B (Blue-White) Star'),(3,'A (Blue-White) Star'),(4,'A (Blue-White super giant) Star'),(5,'F (White) Star'),(6,'F (White super giant) Star'),(7,'G (White-Yellow) Star'),(8,'K (Yellow-Orange) Star'),(9,'K (Yellow-Orange giant) Star'),(10,'M (Red dwarf) Star'),(11,'M (Red giant) Star'),(12,'M (Red super giant) Star'),(13,'L (Brown dwarf) Star'),(14,'T (Brown dwarf) Star'),(15,'Y (Brown dwarf) Star'),(16,'T Tauri Star'),(17,'Herbig Ae/Be Star'),(18,'Wolf-Rayet Star'),(19,'Wolf-Rayet N Star'),(20,'Wolf-Rayet NC Star'),(21,'Wolf-Rayet C Star'),(22,'Wolf-Rayet O Star'),(23,'CS Star'),(24,'C Star'),(25,'CN Star'),(26,'CJ Star'),(27,'CH Star'),(28,'CHd Star'),(29,'MS-type Star'),(30,'S-type Star'),(31,'White Dwarf (D) Star'),(32,'White Dwarf (DA) Star'),(33,'White Dwarf (DAB) Star'),(34,'White Dwarf (DAO) Star'),(35,'White Dwarf (DAZ) Star'),(36,'White Dwarf (DAV) Star'),(37,'White Dwarf (DB) Star'),(38,'White Dwarf (DBZ) Star'),(39,'White Dwarf (DBV) Star'),(40,'White Dwarf (DO) Star'),(41,'White Dwarf (DOV) Star'),(42,'White Dwarf (DQ) Star'),(43,'White Dwarf (DC) Star'),(44,'White Dwarf (DCV) Star'),(45,'White Dwarf (DX) Star'),(46,'Neutron Star'),(47,'Black Hole'),(48,'Supermassive Black Hole'),(49,'X'),(50,'RoguePlanet'),(51,'Nebula'),(52,'StellarRemnantNebula'),(53,'Metal-rich body'),(54,'High metal content world'),(55,'Rocky body'),(56,'Rocky Ice world'),(57,'Icy body'),(58,'Earth-like world'),(59,'Water world'),(60,'Water giant'),(61,'Water giant with life'),(62,'Ammonia world'),(63,'Gas giant with water-based life'),(64,'Gas giant with ammonia-based life'),(65,'Class I gas giant'),(66,'Class II gas giant'),(67,'Class III gas giant'),(68,'Class IV gas giant'),(69,'Class V gas giant'),(70,'Helium-rich gas giant'),(71,'Helium gas giant');
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
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_BODYTYPES` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodytypes`
--

LOCK TABLES `bodytypes` WRITE;
/*!40000 ALTER TABLE `bodytypes` DISABLE KEYS */;
INSERT INTO `bodytypes` VALUES (1,'Star'),(2,'Planet');
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
  `systemName` varchar(255) NOT NULL,
  `bodyName` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `count` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) NOT NULL,
  `cmdrComment` text DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_BTREPORTS` (`systemName`,`bodyName`,`cmdrName`,`cmdrComment`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `siteID` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `count` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `cmdrName` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_CMDRS` (`cmdrName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_store`
--

LOCK TABLES `core_store` WRITE;
/*!40000 ALTER TABLE `core_store` DISABLE KEYS */;
INSERT INTO `core_store` VALUES (1,'core_application','{\"name\":\"CAPIv2\",\"description\":\"Canonn APIv2\"}','object','',''),(2,'plugin_users-permissions_grant','{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-official\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"redirect_uri\":\"/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitter/callback\"}}','object','',''),(3,'plugin_email_provider','{\"provider\":\"sendmail\",\"name\":\"Sendmail\",\"auth\":{\"sendmail_default_from\":{\"label\":\"Sendmail Default From\",\"type\":\"text\"},\"sendmail_default_replyto\":{\"label\":\"Sendmail Default Reply-To\",\"type\":\"text\"}}}','object','development',''),(4,'plugin_upload_provider','{\"provider\":\"local\",\"name\":\"Local server\",\"enabled\":true,\"sizeLimit\":1000000}','object','development',''),(5,'plugin_users-permissions_email','{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"refresh\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"­Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}}}','object','',''),(6,'plugin_users-permissions_advanced','{\"unique_email\":true,\"allow_register\":true,\"default_role\":\"authenticated\"}','object','','');
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
  `systemName` varchar(255) NOT NULL,
  `bodyName` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `count` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) NOT NULL,
  `cmdrComment` text DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_FGREPORTS` (`systemName`,`bodyName`,`cmdrName`,`cmdrComment`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `siteID` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `count` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `systemName` varchar(255) NOT NULL,
  `bodyName` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) NOT NULL,
  `cmdrComment` text DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_FMREPORTS` (`systemName`,`bodyName`,`type`,`cmdrName`,`cmdrComment`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `siteID` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `count` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_FMTYPES` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fmtypes`
--

LOCK TABLES `fmtypes` WRITE;
/*!40000 ALTER TABLE `fmtypes` DISABLE KEYS */;
INSERT INTO `fmtypes` VALUES (1,'Water Magma'),(2,'Sulphur Dioxide Magma'),(3,'Ammonia Magma'),(4,'Methane Magma'),(5,'Silicate Magma');
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
  `systemName` varchar(255) NOT NULL,
  `orbitBody` varchar(255) DEFAULT NULL,
  `shipName` varchar(255) NOT NULL,
  `directionSystem` varchar(255) DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `cmdrName` varchar(255) NOT NULL,
  `cmdrComment` text DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GENREPORTS` (`systemName`,`orbitBody`,`shipName`,`directionSystem`,`cmdrName`,`cmdrComment`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `siteID` int(11) NOT NULL,
  `shipName` varchar(255) NOT NULL,
  `directionSystem` int(11) DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GENSITES` (`shipName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `artifactName` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GRARTIFACTS` (`artifactName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grartifacts`
--

LOCK TABLES `grartifacts` WRITE;
/*!40000 ALTER TABLE `grartifacts` DISABLE KEYS */;
INSERT INTO `grartifacts` VALUES (1,'Casket','2018-06-27 09:26:45','2018-06-27 09:26:45'),(2,'Orb','2018-06-27 09:26:45','2018-06-27 09:26:45'),(3,'Relic','2018-06-27 09:26:45','2018-06-27 09:26:45'),(4,'Tablet','2018-06-27 09:26:45','2018-06-27 09:26:45'),(5,'Totem','2018-06-27 09:26:45','2018-06-27 09:26:45'),(6,'Urn','2018-06-27 09:26:45','2018-06-27 09:26:45');
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
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GRCODEXCATEGORIES` (`categoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grcodexcategories`
--

LOCK TABLES `grcodexcategories` WRITE;
/*!40000 ALTER TABLE `grcodexcategories` DISABLE KEYS */;
INSERT INTO `grcodexcategories` VALUES (1,'Biology','2018-06-27 09:26:57','2018-06-27 09:26:57'),(2,'Culture','2018-06-27 09:26:57','2018-06-27 09:26:57'),(3,'History','2018-06-27 09:26:57','2018-06-27 09:26:57'),(4,'Language','2018-06-27 09:26:57','2018-06-27 09:26:57'),(5,'Technology','2018-06-27 09:26:57','2018-06-27 09:26:57');
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
  `codexNumber` int(11) NOT NULL,
  `text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GRCODEXDATA` (`text`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grcodexdata`
--

LOCK TABLES `grcodexdata` WRITE;
/*!40000 ALTER TABLE `grcodexdata` DISABLE KEYS */;
INSERT INTO `grcodexdata` VALUES (1,1,6,3,1,'Thank you commander, this data has proven vital to my ongoing research. While it seemed logical that the alpha-pattern data corresponded with the core information on the Guardians\' biology and ecology, I couldn\'t be certain until I received the data from your scan. I\'m pleased my hypothesis has proved correct, and I\'ve started to unlock some fascinating details about the Guardians. The extracted data relates to individuals rather than their species as a whole, but thanks to the information you have transmitted, I believe I will be able to merge the data to create a general picture.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(2,1,6,6,2,'The information you\'ve uncovered is very interesting and regards the Guardians\' anatomy and physiology, you might be surprised to learn they weren\'t that different to us. Their morphology was bipedal, although they were generally taller and more slender than the average human. Their skin tone was red, encompassing the whole spectrum of red hues. There were various reasons for these changes in pigmentation, including genetic disposition and the fact that they darkened as they aged','2018-06-27 09:27:09','2018-06-27 09:27:09'),(3,1,6,1,3,'Details on the facial structure of the Guardians. Their faces were proportionally smaller than ours and they had round eyes, darkened from their evolution under a very strong sunlight. The colouration and structure of the eye indicates that not only they have keener vision than us, but they could also see a wider spectrum.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(4,1,6,4,4,'This data details the facial structure of the Guardians. The nose appears to have been vestigial - I believe it was once more pronounced, but that some environmental change made it less useful - so their sense of smell would have been less developed than the human average. Their ears were very tightly formed against the skull, and the interesting array of internal acoustic chambers suggest they perceived sounds differently to us','2018-06-27 09:27:09','2018-06-27 09:27:09'),(5,1,6,2,5,'This data offers more details about the physical appearance of the Guardians. Most remarkable are their limbs. Their forelimbs had a serrated edge and were no doubt used as killing implements during the pack-hunting period. They had two more more joints in their arms than we do, facilitating complex articulation and the use of sophisticated sign language. The skeleton was flexible yet resilient and their muscles were long, thin and ropey. They had two hands, each with four digits.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(6,1,6,5,6,'We\'ve barely scratched the surface with the Guardians. There is so much yet to discover. But this new data contains one tantalising detail that stands out: their biochemistry was very similar to our own. They had blood in the same fashion as us, and it fulfilled exactly the same role as it does for us. Beyond this, they share a similar genetic structure, with DNA and RNA their core building blocks. Although a full analysis has not yet been conducted, this might be evidence of a common ancestor, but also of a branching in their genetic history. This is an astounding discovery!','2018-06-27 09:27:09','2018-06-27 09:27:09'),(7,1,6,3,7,'This data offers more details about the physical appearance of the Guardians, specifically regarding genders. The similarities between humans and the Guardians continue to delight me. They had two distinct genders and reproduced sexually. There don\'t appear to have been any taboos surrounding sexual activity, as the data contains a large quantity of graphic images and recordings – not unlike some of our data nets!','2018-06-27 09:27:09','2018-06-27 09:27:09'),(8,1,6,6,8,'This data contains more details about the Guardians\' sexual behaviour and reproduction. Their body form encouraged sex while standing, but although this was the most comfortable pose, they entertained a variety of positions. I\'ve concluded that sex was a recreational behaviour and not only for procreation. They didn\'t use birth control as they could manipulate their bodies to become temporarily sterile at will, although I\'ve not yet identified the precise mechanism for this. It\'s clear their biological-manipulation technology was quite sophisticated. This data has huge applications for Medical treatments if we can unlock the secret.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(9,1,6,1,9,'This data contains more details about the Guardians\' procreation and reproduction. Procreation was a matter of personal choice, although they were required to be a parent at least once during their lives to ensure the continuation of their genetic line. I\'ve not yet established their metric for measuring time, but it\'s clear that the period of gestation was quite long, to allow substantial development of the young prior to birth. The infants were effectively helpless for a period after delivery.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(10,1,6,4,10,'This data contains more details about the Guardians\' approach to raising their young. Care of the young was the duty of the wider community. Infants were raised in communal crèches rather than by their parents, the cultural significance of which I\'m eager to unravel. I have established that prenatal care of the young involved genetic manipulation to remove hereditary diseases and other complications.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(11,1,6,2,11,'Although the alpha-pattern data encapsulates biological information, it also contains a treasure trove of cultural data. This is particularly true of the data you uncovered here. The data package appears to contain records pertaining to their food. I already knew that as pack hunters they were carnivores. I subsequently discovered that not only were their arm ridges excellent for killing prey, they also used for cutting meat into little pieces to fit in their small mouths.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(12,1,6,5,12,'This data contains details about etiquette and hunting. The imperative of the kill was retained even as their society advanced. Food killed in the hunt was a delicacy. For guests, it was an honour to provide their host with something that had been hunted, but the host was expected to provide the same. Meat that had been hunted by a lone individual was given even greater accord. For a kill to be valid, it had to be achieved without weapons. Weaponry was only for civil defence or law enforcement.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(13,1,6,NULL,13,'This data contains details about etiquette feeding habits and hunting. Non-indigenous animals were considered a particular delicacy. The Guardians\' expansion into space introduced them to new ecologies and, consequently, to new food. So far I\'ve had little success in determining the details of these alien creatures or where they were obtained, but it was certainly a valuable trade for the Guardians. Huge parks and reserves were constructed on their worlds where they could hunt both local and imported animals.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(14,1,6,6,14,'This data is particularly interesting. It appears that another indication of their prowess in biological manipulation was the creation of unique creatures for consumption. This was done to ensure adequate supplies for the general population, although there was also a specialist trade. Having an animal created for a specific celebration demonstrated the owner\'s status and wealth, but being the creator of such a delicacy meant even greater honour. This part of the research could aid us in food production and make famine a thing of the past.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(15,1,6,1,15,'It seems that most of this data package has become corrupted, however I have been able to decipher one section. It seems that the Guardians retained the ability to digest raw meat, and most meals were served uncooked, although they did appreciate cooked meat. This became an almost ceremonial aspect of their eating, and was often incorporated into formal meals.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(16,1,6,4,16,'This data is fascinating commander. I now have a better understanding of the types of environment and how that relates to the Guardians\' development. The alpha-pattern data has yielded a wealth of information on the Guardians, but throughout my research I\'ve also been looking for information on their homeworld...and now I think I\'ve found what we need! The location of their homeworld still eludes me, but this new data may give enough for us to narrow the search criteria.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(17,1,6,2,17,'This data contains more details about the Guardians\' physiology regarding their environment. Looking through previous data collected by pilots like yourself, It came as no surprise to learn that their environmental requirements were very similar to our own. Barring any local biological threats, we could easily live on their worlds - they wouldn\'t even need terraforming. In fact, we would find their worlds more comfortable than the Guardians would ours.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(18,1,6,5,18,'This data contains more details about the Guardians\' physiology regarding their environment. I can see from this data that humanity would indeed be able to cope if not thrive on the same worlds as the Guardians and vice versa. The first key difference is gravity. Most of their worlds have a lower gravity rating than we would consider normal, which no doubt explains their taller, more slender frame. Their flexible bone structure would adapt to high gravity with little discomfort or loss in physical strength.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(19,1,6,3,19,'This data contains more details about the Guardians\' physiology regarding their environment. This data shows that they preferred warmer worlds than we do, and don\'t appear to have been well suited to colder climates. Fragments of their history reveal that they experienced changes in climate in their early history, and it was that - rather than conflict - that prompted their technological development. They had thick skins but lacked a fatty layer, which I think reduced their ability to function in cold temperatures. More and more, the alpha-pattern data extends to include aspects of their culture. It\'s fascinating subject matter, but I still need more data.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(20,2,5,3,1,'This is very interesting commander. This is a new data pattern. I have given it the designation beta-pattern data. I can already report that it contains some fascinating insights into the Guardians culture. The first is that religion formed a large part of their lives. Strangely this seems to have occurred late in their development, after various technological revolutions. The details are a bit vague in this data package. There must be others that hold more cultural details. Please continue the search.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(21,2,5,5,2,'Your hard work is paying off commander. This data holds more details about the Guardians\' culture, specifically spiritual matters. Almost from the dawn of their civilisation they possessed a strong spiritual sense - one that reflected their close connection to the natural world. Even when they\'d developed industrial-scale machinery, they maintained a balance with the world around them. Their ongoing love of hunting presumably played a significant part in this','2018-06-27 09:27:09','2018-06-27 09:27:09'),(22,2,5,1,3,'This data holds more details about the Guardians\' culture, specifically spiritual matters. This spiritual awareness sustained them through most of their history, but did not evolve into a formal religion. It was not until the development of machine intelligence, during the most rapid era of their development, that any sort of organised religion emerged. I speculate that this technological singularity alienated much of the population, who responded by rejecting this technology.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(23,2,5,6,4,'This data holds more details about the Guardians\' culture. The tipping point that gave rise to organised religion amongst the Guardians doesn\'t appear to have been the creation of thinking machines, but other technological developments - in particular a kind of implant that interfaced with the brain. Up to this point, biological enhancement and repair had utilised only organic-based systems, so this sudden change frightened many.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(24,2,5,4,5,'This is very interesting, very interesting indeed. This data holds more details about the Guardians\' culture. There was an anti-technology movement that rejected not only specific developments, but also inventions such as virtual reality. The loose customs associated with their affinity for nature formed the basis for a new belief system. It evolved rapidly - almost as quickly as the technological advancements produced by the scientists and machine intelligences. It\'s interesting to note the parallels with human-made sentient technology, and how its development threatened humanity during the golden age of technological advancement. The growth of this new religion divided the population, and conflict soon erupted','2018-06-27 09:27:09','2018-06-27 09:27:09'),(25,2,5,2,6,'This data holds some shocking revelations. it talks about the religion that emerged towards the end of the guardians civilisation and I wont lie it has shocked me. while religion remains a feature of human society, unless you live in one of the more extreme theocracies, its generally a matter of personal faith rather than a generally accepted consequence of the human condition. I know some of my fellow researchers would disagree with me. but it is generally assumed that religious beliefs tends to reduce their potency as scientific understanding grows in the case of the guardians, the opposite holds true, it truly divided them.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(26,2,5,NULL,7,'This data does not paint a bright picture of the Guardians culture at the point it was recorded. As I examined the data in this beta pattern and crossed references from other data I have received, I have learned that the truth wasn\'t quite so clear cut. The information I\'ve extracted regarding their legal system indicates a stable and mature society. Given the physical similarities between us and them, I\'m amazed at the cultural and societal differences and the speed at which they rose to become part of their lives.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(27,2,5,5,8,'This data contains cultural data, specifically regarding the legal system of the Guardians. In contrast to many of our legal systems, the fundamental laws do not concern individual right, but instead focus on defining the individual\'s responsibilities to society. I\'m sure this is another reflection of their pack mentality, where the requirements of the group supersede those of a single person. Naturally it isn\'t as simple as that in practice – for example, individuals were expected to come to another\'s aid if necessary.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(28,2,5,1,9,'This data contains cultural data, specifically regarding the legal system of the Guardians. An individuals responsibility extended, past simply obeying the law to include elements of law enforcement. Society was self regulated, with everyone required to ensure laws were obeyed. These values were instilled in the young as part of their education in the communal crèches.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(29,2,5,6,10,'This data contains cultural data, specifically further details regarding social responsibility. As well as being regulated, there was still hierarchical form of administration within the legal system. These were defined by areas of responsibility, but as with all the Guardians’ social structures, everyone was expected to participate, meaning that individuals were required to fill certain legislative roles as part of their everyday life. Some of the concepts aren’t completely clear, but I believe individuals were nominated and couldn’t hold office for more than a single term.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(30,2,5,4,11,'An excellent discovery commander. I was wondering when we would find this type of cultural data. I had begun to fear it might not exist. You can tell a lot about a people from their art. Humanity has demonstrated great creativity in artistic expression throughout history, and I\'m keen to compare our art with the Guardians\'. Fortunately I\'ve been able to tease some details from the beta-pattern data abstracts in this data package. We already knew they were capable of fabulous architecture, but these records show that buildings, statues, monoliths and even city layouts were a common outlet for aesthetic expression.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(31,2,5,2,12,'This is truly fascinating data commander, as an engineer myself I have to admit I’m highly curious about the Guardians technology. It seems that the Guardians had a particular fascination with geometric shapes, which they used to illustrate connections between themselves and the world around them. This predilection manifested itself in their technology as well - specifically their monolith network. With this data and the help of the galactic community we’ve partially mapped the monolith network, which formed the backbone of their communications technology, and discovered that they too are arranged in geometric patterns. Whilst this does not give us full access to the network, I believe it is the first step to unlocking the entire system and maybe more.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(32,2,5,3,13,'This data contains more details on the Guardians\' culture, specifically art. Many of the records I\'ve now extracted include the data you\'ve just sent through, show that most of the Guardians\' art had a religious basis. It seems that their shift to a religious society affected all aspects of their lives. I have found older records that indicate other art forms did exist, with realistic and abstract techniques evident. I hoping that some of the data we\'ve yet to decode will contain images of these art works.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(33,2,5,NULL,14,'This data contains more details on the Guardians\' culture, specifically art and how it fitted into social responsibility. It appears each individual Guardian had a cultural commitment to create and share works of art. While it\'s clear that the quality varied between individuals, all works were considered worthy by virtue of their efforts alone. This package does in fact contain many images of their works. It is truly interesting, such a pity we might never know the meaning behind many of these pieces.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(34,2,5,5,15,'A human observer might find the Guardians\' visual art severe and lacking in emotion, but the same could not be said of their music. They didn\'t use musical instruments, so strictly speaking it\'s singing, although I think they might have used their bodies for rhythm and percussion. I\'ve extracted audio from the data you have collected and have listened to, for want of a better term, their “songs”. The range of their voices is something to be admired. And it\'s so rich with emotion – many pieces are so haunting, it breaks the heart to listen them.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(35,2,5,1,16,'This is very interesting data commander. The data describes what must have been a kind of counter culture. Dancing was considered taboo, especially when combined with language gestures, but there is evidence that gesture dances were popular with adolescents, possibly as a form of rebellion. I\'m not sure why such activity was prohibited, but it might have something to do with potentially conflicting information - something they took great pains to avoid.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(36,2,5,6,17,'This data contains details of other past times and cultural events. As a consequence of their extensive industrial automation, the Guardians had a lot more time for social pursuits than we do. It\'s another interesting contrast - we have a similar capability, but our fear of surrendering control to machine intelligence means we remain wedded to idiosyncratic working practices. We could learn so much from this species - I only hope that in some small measure my research guides us toward such enlightenment.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(37,2,5,4,18,'This data contains details of other past times and cultural events. The Guardians didn\'t waste the freedom their technological advancements offered: leisure activities were encouraged, even expected, as part of normal social intercourse. Time was devoted to social responsibilities and furthering personal abilities. Scientific research is a good example of this. Although they stagnated in their later period, throughout their early history the Guardians had a societal obligation to seek out and share knowledge. Research was often conducted in vast collaborative programmes, which were also seen as vital learning experiences.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(38,2,5,2,19,'This data contains more cultural information. Their attitude towards their varied endeavours sets them apart from humans. Their social obligations were not seen as chores - in fact they enjoyed participating in these roles. Because all were obligated to take part, it meant social responsibilities were often a short-term diversion, as well as allowing individuals to accrue a variety of experience. I also think there was a biochemical component that enhanced their enjoyment of such tasks, but I haven\'t been able to prove that supposition yet.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(39,2,5,3,20,'This data contains more details about entertainment as a cultural activity. I believe this data show that the Guardians enjoyed what we would consider traditional entertainment. The performance of classical stories and historical epics seem to have been very popular. Their equivalent to theatre was more participatory than ours, with less of a distinction between audience and performer - so much so that the term \'enactment\' might be more accurate than \'theatre\'. It\'s just another example of this species\' incredible social dynamics.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(40,3,1,NULL,1,'While I haven’t been able to establish a granular time frame for the Guardians, This data you have uncovered has allowed me to identify general eras. Once again I am indebted to you for gathering valuable research data - particularly the gamma-pattern data packages that have helped me unlock this information. The new data illustrates the Guardians’ impressive development. Details of the Guardians’ very early history are sketchy at best, but there’s enough detail for me to reach a few conclusions. We know they evolved as pack hunters with tribal groups of 20 to 30 individuals. They lived in jungle regions similar to those found on Earth, and preferred very hot and humid climates.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(41,3,1,1,2,'This data is remarkable and covers the early history of the Guardians. They were highly intelligent, and developed sophisticated and effective hunting strategies that quickly saw them become the apex predator in their biomes. Their agility allowed them to take advantage of varied terrain and so avoid predation themselves. I was surprised to learn they were nomadic rather than territorial, but this appears to have been motivated by a desire to mix with other groups and increase genetic diversity rather than a lack of prey. The Guardians developed their core vocal and gestural methods of communication quite early, although it wasn\'t until they developed tools that they were able to record suck communication.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(42,3,1,6,3,'This data is very interesting and covers the early history of the Guardians. The Guardians\' recorded history begins much earlier than it does in human history. Their early art appears to be concerned more with recording practical activity than with personal expression, so maybe this practicality was a factor. Their earliest records tell of a great upheaval caused by climate change, and although the exact cause isn\'t recorded, there are references to a dimming of the sun. Whatever the cause, the effect was a drop in global temperature. Having evolved to operate in a tropical environment, the Guardians were unsuited to the suddenly colder climate. But their intelligence allowed the to adapt better than other creatures in their ecology by building primitive shelters from plants','2018-06-27 09:27:09','2018-06-27 09:27:09'),(43,3,1,4,4,'The data provides more details regarding the development of the Guardians in their early history. The worsening weather after what I understand as global climate change or possibly a cosmic event, precipitated the development of tools, which allowed the Guardians to build more durable structures. They soon learned to use stone in their buildings, and with this greater permanence they developed a deeper appreciation for the visual arts, using them to decorate the inside of their homes. Even at this early stage they were conscious of the need for urban planning, and one can clearly see a relationship between the layout of these early villages and the form of their later cities.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(44,3,1,2,5,'This data holds details of the Guardians continue development. It appears that their early nomadic existence came to an end in the same period as the development of more permanent buildings - although the young were still encouraged to journey to other camps - and this switch to a more settled existence brought with it various social changes. For example, the Guardians began to use statues to mark out the regions occupied by a specific clan. It\'s interesting to note, however, that I have found little evidence of conflict between neighbouring clans. Evidently, the careful management of their populations resulted in cooperative strategies rather than competitive ones.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(45,3,1,5,6,'This data contains evidence of increased animal husbandry within the first early settlements, no doubt to ensure adequate food supplies. More startling is the fact that they also practised selective breeding. They possessed a reasonable understanding of inherited traits, which is remarkable given their level of technological development','2018-06-27 09:27:09','2018-06-27 09:27:09'),(46,3,1,3,7,'This data contains evidence that in their late history the Guardians entered an era of great technological development, although this process also precipitated a period of conflict. Their most notable advances were in the field of genetic manipulation. Early experiments involved captive animals before moving on to micro-organisms, the latter triggering advances in medical sciences and engineering. One example is the development of virus-like organisms used to combat specific diseases and supplement the Guardians’ immune systems. This data will be priceless to medical teams throughout the galaxy. More and more I feel we need to publish our results to all. I think that would have been in keeping with the social responsibility shown by the Guardians.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(47,3,1,NULL,8,'This data contains details regarding the rise of new technologies. It appears that the development of these technologies varied between clans, creating inequality and, ultimately, conflict. Initially, that conflict was resolved through personal combat between individual champions, but as clans started using numbers to overwhelm their opponents, the practice of warfare began to spread. This led to a surge in weapons development, with biological warfare quickly established as the weapon of choice. An arms race began, focused on the development of biological agents and various counter measures. It saddens me to discover this as I had hoped the Guardians would prove to be more advanced. A little naive I know as conflict is a common element of many species throughout the galaxy. Whether for resources, land or power over others. We all seem too share this shame.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(48,3,1,1,9,'This data contains the details of the weaponry the Guardians developed during the various conflicts that swept over their civilization. As well as biological weapons, the first flight systems (in the form of airships) and computers were developed around this period. These early computers were used to model the effects of large-scale biological attacks. The spread of war had a devastating impact on the Guardians\' social systems. Population control vanished as the clans realised they needed to be able to absorb large numbers of casualties. The cooperative social Paradigm collapsed and schisms of appeared between populations. I haven\'t determined exact dates yet, but I\'m confident this era of conflict lasted for several centuries.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(49,3,1,6,10,'This data tells of the end of a major conflict in the Guardians history and he rise of their modern society. It took the leadership of a few clans, from the north of the main continent, to restore peace. These clans had endured considerable hardship during their early development, perhaps resulting in a stronger breed. Banding together, they fought a swift war of conquest and brought the entire race under their leadership. It was from this that the Guardians\' modern society, with its rules and balance, developed. Interestingly I\'ve noticed evidence of a genetic break along the north-south divide and of redder skins among the northern clans, suggesting a racial element to the division.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(50,3,1,4,11,'This data speaks about Guardians history and the development of their modern society and the first interest in off world exploration. The Guardian city-states continued to operate for over a thousand years, and the ancient forms of cooperative advancement resulted not only in a large population but also a peaceful and generally happy one. But with a finite amount of land available this population growth couldn\'t continue forever, and as the Guardians neared the limits a conference was organised. Astronomical research had become vogue in the previous decades, and the Guardians had identified a number of accessible planets capable of supporting life. Many individuals aspired to travel among the stars and colonise other planets. At first, such ambitions did not receive much support, but after options such as stricter population control were deemed undesirable, off-world colonisation became the most popular option','2018-06-27 09:27:09','2018-06-27 09:27:09'),(51,3,1,2,12,'This data is incredible. The information regarding the Guardians first attempts at space travel are particularly interesting. Although the Guardians clearly had the capacity for sophisticated flight technology, they had not built anything more advanced than dirigibles, no doubt because airships were more in keeping with their ecologically conscientious philosophy. With rocket technology deemed environmentally unfriendly, they developed vast launchers that used electro-magnetic propulsion to catapult ships into space. Breathable gel cocoons helped pilots and passengers withstand the huge G-forces experienced on launch, and served as hibernation pods during long journeys. Having not yet developed faster-than-light technology, the Guardians constructed three large arks for their first interstellar colonies. Much like the Generation ships in our own history.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(52,3,1,5,13,'This data is extremely exciting commander. Contained in this package is information regarding the Guardians use of faster than light communication. Almost the entirety of the Guardians\' society was devoted to researching interstellar travel and communication. A breakthrough in faster-than-light communication was made before the arks reached their destinations, but the information was transmitted to the arks while they were still in transit, allowing the colonists to establish faster-than-light communications when they landed. Consequently, the interstellar network was developed extremely quickly. The arks kept the population at a manageable level long enough for the Guardians to develop hyperspace technology, which fuelled their expansion into the galaxy. The project also cemented the cooperative city-state model, which would serve the Guardians until their ultimate demise.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(53,3,1,3,14,'This data describes what the guardians referred to as an age of information. Although the Guardians had used computers for generations, it wasn\'t until the development of artificial intelligence that they truly entered an information age. This saw the construction of what ultimately became the monolith network – an interstellar communication and computing system. The network existed before the development of AI, but it was the creation of machine intelligence, along with the development of neural implants, that brought this network into the heart of the Guardians\' society.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(54,3,1,5,15,'Commander this data has proven vital in our attempt to understand the Guardians Technology. It appear the the development of AI increased their technology very quickly. This sudden increase in computational ability – a result of the new implants, allowed the AIs to adapt and eventually evolve true sentience. This sparked a technological singularity – a rapid advancement across the whole landscape of science and technology. As the AIs developed further, this effect snowballed. In conjunction, many Guardians received implants so they could keep up with the extraordinary pace.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(55,3,1,3,16,'This data contains evidence that not all individuals adopted the new technologies and received implants, and the rapid pace of the technological revolution resulted in new forms of inequality and threatened the very fabric of society. Unfortunately, they were unable to muster a unified response to these changes, which widened the gap between those who accepted the changed and those who resisted them. The politicians were the first to react to the changing social landscape, but soon the resistance to the technological revolution took on a religious overtone.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(56,3,1,5,17,'According to this data, the Guardians\' homeworld served as a powerbase for this new religious order, which eventually succeeded in ostracising or exiling all of its opponents. I can find no other reference to these exiles in the historical record. This development should have resulted in peace, but a further division arose over the fate of the AIs. At that time, the AIs were virtual entities, and so were reliant on the monolith network to exist. Because this made them vulnerable, they searched for a way to achieve independence from the network. Their research aroused the fear of the abolitionists, who used violent methods to prevent the AIs from achieving independence, and even to combat those Guardians who accepted the AIs.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(57,3,1,1,18,'This data describes details about the Guardians second civil war. The war was ostensibly fought between the people of the homeworld and the colonies, but in truth there were divisions even among individual city-states. The scale of the conflict far exceeded that of the first civil war. In human terms, the first Guardian civil war was little more than a political clash, albeit with some violent conflict, but the second was an all-out war between the abolitionists and the rest of society. The war eventually destroyed the Guardians\' habitats, forcing them to retreat into \'sacred\' domes protected by powerful shields','2018-06-27 09:27:09','2018-06-27 09:27:09'),(58,3,1,6,19,'This data describes details about the Guardians second civil war. The war raged for many years and eventually destroyed the Guardians\' habitats, forcing them to retreat into \'sacred\' domes protected by powerful shields. Eventually even the domes were destroyed, or their shields failed, and ultimately the population died out. Their predilection for expending resources on honouring the dead - a key tenet of their religion - only served to accelerate their extinction. Records indicate some variation in the nature of this devastation, most obviously at sites consisting of multiple domes. In these locations it appears the inner domes were destroyed later than the outer ones, as indicated by the slightly lower radiation signatures in the inner areas. I can only surmise that the attackers returned, after an initial assault, to finish the job.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(59,3,1,4,20,'This data describes details about the Guardians second civil war. It appears that the Guardians approach to warfare vastly changed as the war continued. Warfare was conducted using automated battle fleets. At first these were controlled by the Guardians via brain implants, but later they became entirely autonomous. In the early stages of the war the Guardians fought each other directly, but within a decade - and after much loss of life - most of the fighting was conducted remotely. Soldiers were deployed only to occupy areas that had been captured by autonomous or remote vehicles, and eventually were not used at all.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(60,3,1,2,21,'This data describes details about the Guardians second civil war. The war raged for over a hundred years, and Guardian populations fell dramatically during this time. Fertility rates dropped due to increased radiation levels and because the Guardians considered it blasphemous to use technology to address a biological issue. Eventually, one of the competing forces triumphed, but by that point, all the Guardians other than those who had been exiled a century earlier were dying.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(61,4,4,NULL,1,'This is fascinating! The obelisks are clearly some form of data storage, but so far I haven\'t been able to determine what other purposes they might have had. I am very much indebted to the you commander for searching for the information I need, although I wish I could see the obelisks for myself. Perhaps closer proximity would inspire greater understanding! Unfortunately my responsibilities here preclude me from such adventure. I believe these are the first clues to understanding the alien language.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(62,4,4,4,2,'I\'m not disheartened, our early interactions have provided the basis for my research. The illuminated patterns are of obvious importance, and I believe represent a form of writing. Their illumination and movement suggest some additional meaning - so much so that I can\'t accept that they\'re merely signs or labels. There is a definite structure here, one that I intend to decipher. The more data you can collect the more I can correlate in the hope of assembling a kind of Rosetta Stone for their language.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(63,4,4,1,3,'It appears I was correct in my theory that the delta-pattern data was the key to unlocking the language of this dead race. Sometimes you have to operate on intuition, but this data you\'ve uncovered makes a connection between some of the glyphs on the obelisks and the forms in the data you have provided. I believe the delta patterns could be the building blocks of a lexicon.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(64,4,4,6,4,'From the data packet you\'ve discovered here I\'ve gained a sense of a very cooperative society - one in which all elements worked in unison towards a common purpose. I also believe they shared an expectation of mutual protection. I\'m still delving into these mysteries, but I believe \'Guardians\' would be a good name for this species.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(65,4,4,2,5,'It\'s dawned on me that the task ahead of us is colossal, and one I eagerly throw myself into. With the help of brave pilots like you, my analysis has revealed there is variation in the data blocks which you are discovering, which I think represents their equivalent of words. This indicates that their language was almost a universal one, which will make my efforts to understand it easier.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(66,4,4,4,6,'This data packet indicates that the guardians used two different forms of communication with the same - or at the very least similar - language constructs, its slow but fascinating work, using this data I believe I can establish a rudimentary understanding of the oldest two forms - verbal communication. like us they had a vocal language, and the range of sounds appears to be similar to that used in human vocalisation.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(67,4,4,3,7,'This is a great find commander. According to this data I\'ve been able to deduce that verbal communication emerged early in their history. The scale of the archaeological sites suggests a social society with large populations. There is some supposition on my part, but the data you just found seems to support this contention','2018-06-27 09:27:09','2018-06-27 09:27:09'),(68,4,4,NULL,8,'Excitingly, this group of delta-pattern recordings contain audio data. Not only will this help me establish the range of sounds they could make, it has should also allow me to confirm that they spoke with accents, as there are regional variations in the sound of their words.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(69,4,4,4,9,'The decoder is having a problem deciphering this data packet and is running slower than I\'d hoped. The data is formulated in such a way that individual constructs are easily extracted, but there seems to be stopping the decoder putting it all back together. I had assumed it would be simpler to establish a list of words even if I didn\'t know the meanings. The relationship between the audio data and the constructs, which I believe to represent their written form, Has revealed to be more complicated than I originally thought. Here is comes. This data seems to suggest that their spoken language was of a tonal form, similar to some human languages, meaning that the exact meaning of a word was determined by how it was said.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(70,4,4,1,10,'With this data we\'ve made a significant advancement. I believe we have identified what might be full sentences for the first time. Words are only fragments of a language – sentences illustrate the rules of it. It\'s only natural that an alien language would be structurally different to human ones. I\'m realising that what I\'d deciphered from the previous data packets were simply nouns. So I decided they must be lists, and looked for other more varied forms. Unfortunately I met with no success, until now.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(71,4,4,6,11,'This Data is just what I’ve been looking for. I had been in a deadlock until the pattern-recognition software highlighted some repeating motifs in this data package. Delving deeper, I think I can establish that not only did variance in sound produce different meanings, but that the placement in relation to other words also altered the meaning. This is a real breakthrough!','2018-06-27 09:27:09','2018-06-27 09:27:09'),(72,4,4,2,12,'This data package is huge. I could all too easily be distracted by the wealth of audio data in these delta patterns. To actually hear the Guardians\' language as it would have been spoken proving too great a temptation. But this data reveals that the formal basis of their communication was visual rather than verbal. This seems logical, as the written word has more portability ad permanence than speech. I plan to dig deeper into the information collected by you and other explorers to learn the visual form, which I believe originated much earlier in the Guardians\' development than I originally thought','2018-06-27 09:27:09','2018-06-27 09:27:09'),(73,4,4,5,13,'This data proves a theory I had that the written form of the Guardians’ language is based around glyphs, with each glyph representing a single word. Once I’ve fully identified these, the process of separating tonal meanings should become much easier. The glyphs seem to be able to be combined to describe complex concepts, but could also communicate additional layers of meaning through the inclusion of movement. Each glyph is a symbol. They are more abstract than pictorial hieroglyphics, but its possible to identify a simplistic reference to the shape of the thing being described - for example, the glyph for ‘moon’ incorporates the waxing and waning as it would have appeared from the Guardians’ homeworld','2018-06-27 09:27:09','2018-06-27 09:27:09'),(74,4,4,3,14,'This data contains the most amazing revelation. It appears to be the key to tracing the origins of the language embedded in the glyph formats. It\'s almost as if their glyphs contained a form of version control that represented the glyphs\' evolution, and this ha given me a glimpse into their history. These glyphs actually evolved from a form of sign language that the guardians developed when hunting. The Guardians were originally pack hunters, and this sign language functioned as a stealthy means of communication','2018-06-27 09:27:09','2018-06-27 09:27:09'),(75,4,4,NULL,15,'Judging from the shape and movement of these primitive glyphs, I have surmised the Guardians had tremendous dexterity and freedom of movement in their forelimbs and hands, and this has provided the first real glimpse of their physiology.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(76,4,4,4,16,'The data here contains details of how the glyphs evolved into a formal form of communication, but there appears to be a conceptual gaps between speech and the glyphs. From the results of your scan, I can see that while all glyphs have a matching vocalisation, not all vocalisations have a matching glyph. Although the dictionary is still quite sparse there is evidence to suggest that particular vocalisations were for emotive terms. With this in mind, I think the Guardians\' spoken language was used primarily for social bonding.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(77,4,4,1,17,'This data regards the markings on the obelisks. These were the starting point for my research into the Guardians\' language as explorers documented them, so it\'s fitting that I\'ve come full circle and now have a better understanding of those markings. I\'ve already established that the written form of the Guardians\' language evolved from the sign language they developed during their pre-history as pack hunters.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(78,4,4,6,18,'The data you\'ve extracted from the delta patterns has granted me further insights - so much so that I\'m confident I can establish a proper dictionary for future research. The limited understanding I\'ve derived from their language reveals a fascinating species. Although the written glyphs share the shape and motion of the original sign language, they also evolved in response to new media, such as electronic representation. The glyphs on the obelisks and other structures provided the primary mechanism for recognising the patterns, and also gave me clues as to what the other data patterns might contain.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(79,4,4,2,19,'The data contained in this obelisk talks about the history of the Guardians\' language. They started to transcribe their signs in pictorial form very early in their development - something akin to the cave paintings from humanity\'s early history - although it\'s clear that even at an early stage their communication was more sophisticated than ours. This clearly speaks of a people with high intelligence and a keen desire to share information. Even though my research has barely begun, I believe we have much to learn from this magnificent people.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(80,4,4,5,20,'This data contain information regarding the formal nature of their written communication and has reinforced what I\'ve learnt about its use so far. As well as the obelisks, it was used for ceremonial and decorative purposes. I\'ve also gained the impression that they found their glyphs aesthetically pleasing.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(81,4,4,3,21,'As is always the case with research of this nature, finding answers tends to raise further questions. I\'ve found references to another form of communication in this data packet, but not one used by the Guardians, or not all of them, at least. As far as I can tell it references some kind of foe or adversary. Combined with the devastation seen at a number of sites, it indicates the Guardians may not have been the cause of their own demise.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(82,5,2,NULL,1,'This data stream is unlike the others. More complex with a lot more layers than the others. Intriguing, this data seems to be about the Guardians technology. This is very exciting, I was hoping we would find this kind of information. The epsilon-pattern data contains a lot of information about the Guardians\' science and engineering, and extracting their historical records has helped isolate some of the specifics, adding to what we know about this fascinating species.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(83,5,2,2,2,'As I have established from other data packages the guardians had the ability to manipulate genetics and active biology to achieve specific results, and it seems their healthcare revolved around this technology. As a species they were susceptible to maladies similar to those that affect us: they could get sick, develop cancers and suffer from parasites. They approached these issues from two different directions: they improved their immune systems to defend against infection, and engineered specific micro-organisms to tackle threats. If we can harness this type of technology we could effectively eradicate disease from our lives.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(84,5,2,1,3,'This data will need further analysis from someone with a greater knowledge of medicine than I possess. It appears that the Guardians’ experimented with biological manipulation extending it to other creatures in their environment. These techniques were used not only to improve life for the other creatures, but also to address ecological issues, although the Guardians took great care to influence things only as much as was needed. There is a lot of data here that while I can generally understand needs a biologist to truly decipher all the information. After all I’m an engineer not a a(sic) doctor.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(85,5,2,6,4,'This data details the social aspects of the Guardians Technology. Although obviously an intelligent species, it was the Guardians\' social constructs that allowed them to progress so quickly. They were required to involve themselves in various socially progressive activities, from caring for the young to researching cutting-edge physics. This was facilitated by institutions, which made research data and education available to all. The development of implants and the monolith network created a kind of shared virtual workspace, and the direct brain interface allowed thoughts to be shared and manipulated. I wonder how much they could have achieved if religious strife hadn\'t brought about their destruction?','2018-06-27 09:27:09','2018-06-27 09:27:09'),(86,5,2,4,5,'This data is incomplete by what we can decipher relates to the communication systems the Guardians used. As with human civilisation, communication systems were key to establishing a stable society. In many respects, the technology the Guardians used was the same as ours, in that they utilised various electro-magnetic wavelengths and physical optical mediums. I suspect their faster-than-light technology shared the same principles as our own, too, although I haven\'t extracted enough technical data to be certain','2018-06-27 09:27:09','2018-06-27 09:27:09'),(87,5,2,5,6,'This data gives some more information about the monolith network - the imposing structures explorers have discovered at various Guardian sites - served as a foundation for all their communication systems. It\'s clear, however, that the monoliths had ceremonial significance as well as being functional, so I mustn\'t underestimate their importance','2018-06-27 09:27:09','2018-06-27 09:27:09'),(88,5,2,NULL,7,'This is very interesting. According to the data package you just sent me they monolith network was used for most if not all communications regardless of importance. In keeping with their predilection for sharing knowledge, few restrictions were placed on the network. I thought there might have been separate networks for military and administrative use, but I haven\'t found any evidence of that. Everything points to an extremely open society, which would have made them even more vulnerable when significant social divisions arose.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(89,5,2,2,8,'Now I understand. This was the missing piece. The monolith network was augmented by vehicle-based communication systems, personal devices and even implants. These were designed to operate seamlessly with the network to provide ad-hoc coverage. Having implants that you can direct communications to you directly would revolutionise communications as we know it. I can only speculate what this would have felt like, but it might have even gone as far as a technological telepathy of sorts.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(90,5,2,1,9,'This data, while unremarkable at first glance has proven something that I long suspected to be true. The networks were content agnostic, and the full range of language forms was supported. I\'ve even found extracts of virtual entertainment experiences that supported full audience participation','2018-06-27 09:27:09','2018-06-27 09:27:09'),(91,5,2,6,10,'This data is only partially intact but I have been able to decode the following information. For a species that experienced only brief periods of war, the Guardians developed very sophisticated means of waging it, although their arsenal was nowhere near as varied as ours. In terms of flight and small-class spaceships, humanity has surpassed the Guardians, but in other respects their technology outmatched ours.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(92,5,2,4,11,'Once area I was unsure about until now was whether the Guardians used their abilities in genetic and biological manipulation to advance their technology and weapons. While some might argue that our technology is equal to the Guardians\', I would counter that their integration of such technology at a societal level gave them a greater knowledge of its application. As well as biological warfare agents, they also created creatures expressly for use in battle, and these remained effective even into the modern era.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(93,5,2,3,12,'This data you have collected contains details of weaponry the Guardians developed. The guardians\' projectile weapons utilised electro-magnetic propulsion, much like their space technology. Such weapons were manufactured in a range of scaled, from personal weapons to capital-ship class. Generally the Guardians used kinetic energy in combat, and explosives were rarely deployed. Nuclear fission and fusion were developed during the Guardians\' astro-expansion period, but when it came to large-scale destructive weaponry they relied on bespoke biological weapons. Predictably, these were of little use against the AIs.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(94,5,2,3,13,'This data contains details of shield technology. The Guardians developed powerful shields that were far in advance of our own. Whole cities were protected by huge shields able to resist even bombardment from space, at least for a time, although these defences were ultimately overwhelmed during the second civil war','2018-06-27 09:27:09','2018-06-27 09:27:09'),(95,5,2,NULL,14,'This data makes up a group of entries regarding the Guardians military. For most of their history the Guardians made use of small forces that combined the roles of military and police. These forces were comprised of volunteers, whose conscription was part of a tacit social contract. In times of war these forces could be expanded rapidly, as most of the adult population had already received basic training.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(96,5,2,2,15,'This data makes up a group of entries regarding the Guardians military. From a military perspective the Guardians had an obvious weakness. Most of their history was peaceful, meaning there was no institutional knowledge or experience of combat. Consequently, tactics and strategy were for the most part theoretical. This, combined with various other factors, resulted in a devastating number of casualties during the second civil war.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(97,5,2,1,16,'This data contains some details regarding AI in the Guardians society. The rise of the artificial intelligence almost elevated the Guardians\' society to a whole new level. There are parallels between the Guardians\' experience of machine sentience and our own, but as with other aspects of their society, the key difference was the way AIs were socially integrated in to the Guardians\' lives. If this process had not been hindered by the rise of the religious abolitionist movement, I believe a technological symbiosis and utopia could have been achieved, but alas id was not to be.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(98,5,2,6,17,'This data gives details of the Guardians research into computer techonolgies. The Guardians\' computer hardware operated on the same principles as our own. Their engineering was more sophisticated, but even to a layperson such as myself if it comprehensible. They experimented with organic computers, but ultimately these failed to meet expectations, except in a few areas such as bio-monitoring. Even then, genetically modified organisms usually performed better.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(99,5,2,4,18,'This data contains some details regarding AI in the Guardians society. What really sets the Guardians apart from humanity, technologically, was the way they embraced neutral implantation and artificial intelligence. Not only did the implants enhance one\'s mental capacity, they also provided one with a direct connection to the monolith network and the fledgling AIs. It was this symbiosis that fuelled the rapid advancement of technology during this era, but unfortunately this same advancement also resulted in the ultimate destruction of their species.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(100,5,2,5,19,'This data contains some details regarding AI in the Guardians\' society. The early AIs were designed with two goals in mind. The first was to augment the abilities of the Guardian operators who were responsible for managing the monolith network and interaction with the AIs - a goal they achieved. The development of shared thought-space technology and neural networking gave their civilisation an unprecedented intellectual boost. The second was for the AIs to actually drive their own development, which they also achieved. The first few generations of AI relied heavily on the monolith network, but they soon evolved into a more distributed model by storing their consciousness within the implants.','2018-06-27 09:27:09','2018-06-27 09:27:09'),(101,5,2,3,20,'This data contains some details regarding AI in the Guardians society. At this stage, social engineering was being used to ensure the AIs adhered to the same user model as their progenitors. But during the first civil war, most implanted Guardians were exiled, and the AIs recognised their vulnerability. They responded by developing their own operational hardware, independent of implanted Guardian users. Frustratingly, the details of these mechanisms have been purged from the record, possibly by the religious extremists who formed the last of the Guardians\' species.','2018-06-27 09:27:09','2018-06-27 09:27:09');
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
  `groupName` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GROBELISKGROUP` (`groupName`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grobeliskgroup`
--

LOCK TABLES `grobeliskgroup` WRITE;
/*!40000 ALTER TABLE `grobeliskgroup` DISABLE KEYS */;
INSERT INTO `grobeliskgroup` VALUES (1,1,'A',20,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(2,1,'B',21,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(3,1,'C',14,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(4,1,'D',14,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(5,1,'E',10,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(6,1,'F',22,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(7,1,'G',4,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(8,1,'H',7,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(9,1,'I',20,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(10,1,'J',8,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(11,1,'K',22,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(12,1,'L',10,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(13,1,'M',24,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(14,1,'N',10,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(15,1,'O',20,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(16,1,'P',13,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(17,1,'Q',29,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(18,2,'A',10,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(19,2,'B',6,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(20,2,'C',25,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(21,2,'D',12,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(22,2,'E',27,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(23,2,'F',8,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(24,2,'G',18,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(25,2,'H',10,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(26,2,'I',12,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(27,2,'J',10,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(28,2,'K',27,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(29,2,'L',6,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(30,2,'M',3,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(31,2,'N',25,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(32,2,'O',3,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(33,2,'P',27,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(34,2,'Q',8,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(35,2,'R',27,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(36,2,'S',3,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(37,2,'T',18,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(38,2,'U',55,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(39,3,'A',27,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(40,3,'B',27,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(41,3,'C',15,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(42,3,'D',16,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(43,3,'E',10,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(44,3,'F',15,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(45,3,'G',14,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(46,3,'H',57,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(47,3,'I',18,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(48,3,'J',9,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(49,3,'K',15,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(50,3,'L',14,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(51,3,'M',14,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(52,3,'N',14,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(53,3,'O',8,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(54,3,'P',27,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(55,3,'Q',10,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(56,3,'R',27,'2018-06-27 09:27:22','2018-06-27 09:27:22'),(57,3,'S',8,'2018-06-27 09:27:22','2018-06-27 09:27:22');
/*!40000 ALTER TABLE `grobeliskgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grobeliskgroupreports`
--

DROP TABLE IF EXISTS `grobeliskgroupreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grobeliskgroupreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grreport` int(11) DEFAULT NULL,
  `grobeliskgroup` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grobeliskgroupreports`
--

LOCK TABLES `grobeliskgroupreports` WRITE;
/*!40000 ALTER TABLE `grobeliskgroupreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `grobeliskgroupreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grobeliskreports`
--

DROP TABLE IF EXISTS `grobeliskreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grobeliskreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grreport` int(11) DEFAULT NULL,
  `grobelisk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `obeliskNumber` int(11) NOT NULL,
  `broken` tinyint(1) DEFAULT NULL,
  `grCodexData` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=956 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grobelisks`
--

LOCK TABLES `grobelisks` WRITE;
/*!40000 ALTER TABLE `grobelisks` DISABLE KEYS */;
INSERT INTO `grobelisks` VALUES (1,1,1,1,0,61,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(2,1,1,2,0,61,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(3,1,1,3,0,66,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(4,1,1,4,0,67,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(5,1,1,5,0,1,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(6,1,1,6,0,2,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(7,1,1,7,0,3,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(8,1,1,8,0,4,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(9,1,1,9,0,20,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(10,1,1,10,0,21,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(11,1,1,11,0,22,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(12,1,1,12,0,23,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(13,1,1,13,0,40,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(14,1,1,14,0,41,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(15,1,1,15,0,42,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(16,1,1,16,0,43,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(17,1,1,17,0,82,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(18,1,1,18,0,83,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(19,1,1,19,0,84,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(20,1,1,20,0,85,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(21,1,2,1,0,22,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(22,1,2,2,0,21,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(23,1,2,3,0,20,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(24,1,2,4,0,22,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(25,1,2,5,0,21,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(26,1,2,6,0,20,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(27,1,2,7,0,25,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(28,1,2,8,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(29,1,2,9,0,23,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(30,1,2,10,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(31,1,2,11,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(32,1,2,12,0,23,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(33,1,2,13,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(34,1,2,14,0,24,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(35,1,2,15,0,23,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(36,1,2,16,0,22,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(37,1,2,17,0,21,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(38,1,2,18,0,20,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(39,1,2,19,0,22,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(40,1,2,20,0,21,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(41,1,2,21,0,20,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(42,1,3,1,0,23,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(43,1,3,2,0,23,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(44,1,3,3,0,22,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(45,1,3,4,0,22,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(46,1,3,5,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(47,1,3,6,0,24,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(48,1,3,7,0,24,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(49,1,3,8,0,21,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(50,1,3,9,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(51,1,3,10,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(52,1,3,11,0,25,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(53,1,3,12,0,25,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(54,1,3,13,0,20,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(55,1,3,14,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(56,1,4,1,0,25,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(57,1,4,2,0,24,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(58,1,4,3,0,85,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(59,1,4,4,0,84,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(60,1,4,5,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(61,1,4,6,0,25,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(62,1,4,7,0,24,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(63,1,4,8,0,86,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(64,1,4,9,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(65,1,4,10,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(66,1,4,11,0,25,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(67,1,4,12,0,24,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(68,1,4,13,0,87,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(69,1,4,14,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(70,1,5,1,0,42,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(71,1,5,2,0,43,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(72,1,5,3,0,44,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(73,1,5,4,0,46,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(74,1,5,5,0,45,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(75,1,5,6,0,46,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(76,1,5,7,0,45,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(77,1,5,8,0,41,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(78,1,5,9,0,40,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(79,1,5,10,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(80,1,6,1,0,1,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(81,1,6,2,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(82,1,6,3,0,1,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(83,1,6,4,0,1,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(84,1,6,5,0,2,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(85,1,6,6,0,2,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(86,1,6,7,0,2,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(87,1,6,8,0,2,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(88,1,6,9,0,3,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(89,1,6,10,0,3,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(90,1,6,11,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(91,1,6,12,0,4,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(92,1,6,13,0,3,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(93,1,6,14,0,3,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(94,1,6,15,0,4,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(95,1,6,16,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(96,1,6,17,0,6,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(97,1,6,18,0,6,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(98,1,6,19,0,5,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(99,1,6,20,0,6,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(100,1,6,21,0,6,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(101,1,6,22,0,5,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(102,1,7,1,0,41,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(103,1,7,2,0,42,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(104,1,7,3,0,44,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(105,1,7,4,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(106,1,8,1,0,43,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(107,1,8,2,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(108,1,8,3,0,42,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(109,1,8,4,0,41,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(110,1,8,5,0,40,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(111,1,8,6,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(112,1,8,7,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(113,1,8,8,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(114,1,8,9,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(115,1,9,1,0,1,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(116,1,9,2,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(117,1,9,3,0,1,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(118,1,9,4,0,1,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(119,1,9,5,0,2,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(120,1,9,6,0,3,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(121,1,9,7,0,3,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(122,1,9,8,0,2,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(123,1,9,9,0,5,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(124,1,9,10,0,4,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(125,1,9,11,0,4,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(126,1,9,12,0,6,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(127,1,9,13,0,5,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(128,1,9,14,0,5,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(129,1,9,15,0,5,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(130,1,9,16,0,6,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(131,1,9,17,0,6,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(132,1,9,18,0,6,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(133,1,9,19,0,5,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(134,1,9,20,0,6,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(135,1,10,1,0,40,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(136,1,10,2,0,46,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(137,1,10,3,0,42,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(138,1,10,4,0,45,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(139,1,10,5,0,43,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(140,1,10,6,0,44,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(141,1,10,7,0,41,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(142,1,10,8,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(143,1,11,1,0,82,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(144,1,11,2,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(145,1,11,3,0,82,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(146,1,11,4,0,82,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(147,1,11,5,0,83,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(148,1,11,6,0,83,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(149,1,11,7,0,84,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(150,1,11,8,0,84,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(151,1,11,9,0,40,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(152,1,11,10,0,44,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(153,1,11,11,0,44,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(154,1,11,12,0,43,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(155,1,11,13,0,40,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(156,1,11,14,0,44,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(157,1,11,15,0,44,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(158,1,11,16,0,43,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(159,1,11,17,0,20,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(160,1,11,18,0,21,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(161,1,11,19,0,23,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(162,1,11,20,0,24,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(163,1,11,21,0,25,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(164,1,11,22,0,25,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(165,1,12,1,0,42,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(166,1,12,2,0,43,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(167,1,12,3,0,44,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(168,1,12,4,0,46,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(169,1,12,5,0,45,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(170,1,12,6,0,46,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(171,1,12,7,0,45,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(172,1,12,8,0,41,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(173,1,12,9,0,40,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(174,1,12,10,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(175,1,13,1,0,61,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(176,1,13,2,0,62,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(177,1,13,3,0,63,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(178,1,13,4,0,64,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(179,1,13,5,0,65,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(180,1,13,6,0,66,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(181,1,13,7,0,67,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(182,1,13,8,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(183,1,13,9,0,61,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(184,1,13,10,0,62,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(185,1,13,11,0,63,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(186,1,13,12,0,64,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(187,1,13,13,0,65,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(188,1,13,14,0,66,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(189,1,13,15,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(190,1,13,16,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(191,1,13,17,0,61,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(192,1,13,18,0,62,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(193,1,13,19,0,63,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(194,1,13,20,0,64,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(195,1,13,21,0,65,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(196,1,13,22,0,66,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(197,1,13,23,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(198,1,13,24,0,67,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(199,1,14,1,0,42,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(200,1,14,2,0,43,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(201,1,14,3,0,44,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(202,1,14,4,0,46,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(203,1,14,5,0,45,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(204,1,14,6,0,46,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(205,1,14,7,0,45,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(206,1,14,8,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(207,1,14,9,0,40,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(208,1,14,10,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(209,1,15,1,0,82,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(210,1,15,2,0,83,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(211,1,15,3,0,84,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(212,1,15,4,0,85,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(213,1,15,5,0,86,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(214,1,15,6,0,87,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(215,1,15,7,0,82,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(216,1,15,8,0,83,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(217,1,15,9,0,84,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(218,1,15,10,0,85,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(219,1,15,11,0,86,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(220,1,15,12,0,87,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(221,1,15,13,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(222,1,15,14,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(223,1,15,15,0,83,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(224,1,15,16,0,84,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(225,1,15,17,0,85,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(226,1,15,18,0,86,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(227,1,15,19,0,86,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(228,1,15,20,0,87,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(229,1,16,1,0,87,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(230,1,16,2,0,87,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(231,1,16,3,0,87,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(232,1,16,4,0,86,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(233,1,16,5,0,86,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(234,1,16,6,0,84,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(235,1,16,7,0,84,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(236,1,16,8,0,85,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(237,1,16,9,0,85,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(238,1,16,10,0,83,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(239,1,16,11,0,83,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(240,1,16,12,0,82,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(241,1,16,13,0,82,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(242,1,17,1,0,62,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(243,1,17,2,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(244,1,17,3,0,63,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(245,1,17,4,0,63,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(246,1,17,5,0,64,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(247,1,17,6,0,65,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(248,1,17,7,0,66,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(249,1,17,8,0,67,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(250,1,17,9,0,67,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(251,1,17,10,0,65,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(252,1,17,11,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(253,1,17,12,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(254,1,17,13,0,62,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(255,1,17,14,0,63,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(256,1,17,15,0,64,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(257,1,17,16,0,65,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(258,1,17,17,0,66,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(259,1,17,18,0,67,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(260,1,17,19,0,67,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(261,1,17,20,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(262,1,17,21,0,62,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(263,1,17,22,0,62,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(264,1,17,23,0,63,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(265,1,17,24,0,64,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(266,1,17,25,0,65,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(267,1,17,26,0,66,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(268,1,17,27,0,67,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(269,1,17,28,0,66,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(270,1,17,29,0,64,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(271,2,18,1,0,55,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(272,2,18,2,0,54,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(273,2,18,3,0,53,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(274,2,18,4,0,47,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(275,2,18,5,0,52,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(276,2,18,6,0,47,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(277,2,18,7,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(278,2,18,8,0,48,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(279,2,18,9,0,49,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(280,2,18,10,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(281,2,19,1,0,88,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(282,2,19,2,0,89,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(283,2,19,3,0,91,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(284,2,19,4,0,90,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(285,2,19,5,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(286,2,19,6,0,92,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(287,2,20,1,0,72,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(288,2,20,2,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(289,2,20,3,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(290,2,20,4,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(291,2,20,5,0,72,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(292,2,20,6,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(293,2,20,7,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(294,2,20,8,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(295,2,20,9,0,72,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(296,2,20,10,0,70,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(297,2,20,11,0,69,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(298,2,20,12,0,68,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(299,2,20,13,0,68,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(300,2,20,14,0,71,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(301,2,20,15,0,70,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(302,2,20,16,0,69,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(303,2,20,17,0,68,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(304,2,20,18,0,71,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(305,2,20,19,0,70,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(306,2,20,20,0,69,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(307,2,20,21,0,68,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(308,2,20,22,0,71,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(309,2,20,23,0,70,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(310,2,20,24,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(311,2,20,25,0,68,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(312,2,21,1,0,51,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(313,2,21,2,0,49,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(314,2,21,3,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(315,2,21,4,0,52,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(316,2,21,5,0,50,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(317,2,21,6,0,48,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(318,2,21,7,0,52,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(319,2,21,8,0,50,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(320,2,21,9,0,48,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(321,2,21,10,0,51,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(322,2,21,11,0,49,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(323,2,21,12,0,47,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(324,2,22,1,0,88,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(325,2,22,2,0,89,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(326,2,22,3,0,90,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(327,2,22,4,0,91,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(328,2,22,5,0,92,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(329,2,22,6,0,93,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(330,2,22,7,0,94,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(331,2,22,8,0,12,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(332,2,22,9,0,11,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(333,2,22,10,0,26,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(334,2,22,11,0,27,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(335,2,22,12,0,28,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(336,2,22,13,0,29,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(337,2,22,14,0,30,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(338,2,22,15,0,31,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(339,2,22,16,0,32,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(340,2,22,17,0,10,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(341,2,22,18,0,9,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(342,2,22,19,0,68,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(343,2,22,20,0,69,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(344,2,22,21,0,70,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(345,2,22,22,0,71,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(346,2,22,23,0,72,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(347,2,22,24,0,73,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(348,2,22,25,0,74,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(349,2,22,26,0,7,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(350,2,22,27,0,8,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(351,2,23,1,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(352,2,23,2,0,50,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(353,2,23,3,0,48,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(354,2,23,4,0,51,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(355,2,23,5,0,53,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(356,2,23,6,0,52,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(357,2,23,7,0,54,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(358,2,23,8,0,55,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(359,2,24,1,0,53,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(360,2,24,2,0,54,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(361,2,24,3,0,54,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(362,2,24,4,0,53,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(363,2,24,5,0,48,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(364,2,24,6,0,48,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(365,2,24,7,0,52,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(366,2,24,8,0,55,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(367,2,24,9,0,54,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(368,2,24,10,0,53,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(369,2,24,11,0,49,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(370,2,24,12,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(371,2,24,13,0,51,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(372,2,24,14,0,55,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(373,2,24,15,0,55,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(374,2,24,16,0,49,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(375,2,24,17,0,49,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(376,2,24,18,0,47,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(377,2,25,1,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(378,2,25,2,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(379,2,25,3,0,93,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(380,2,25,4,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(381,2,25,5,0,92,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(382,2,25,6,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(383,2,25,7,0,91,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(384,2,25,8,0,90,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(385,2,25,9,0,89,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(386,2,25,10,0,88,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(387,2,26,1,0,50,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(388,2,26,2,0,29,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(389,2,26,3,0,71,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(390,2,26,4,0,49,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(391,2,26,5,0,28,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(392,2,26,6,0,70,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(393,2,26,7,0,48,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(394,2,26,8,0,27,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(395,2,26,9,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(396,2,26,10,0,47,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(397,2,26,11,0,26,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(398,2,26,12,0,68,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(399,2,27,1,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(400,2,27,2,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(401,2,27,3,0,89,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(402,2,27,4,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(403,2,27,5,0,90,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(404,2,27,6,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(405,2,27,7,0,91,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(406,2,27,8,0,92,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(407,2,27,9,0,93,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(408,2,27,10,0,94,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(409,2,28,1,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(410,2,28,2,0,32,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(411,2,28,3,0,31,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(412,2,28,4,0,30,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(413,2,28,5,0,29,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(414,2,28,6,0,28,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(415,2,28,7,0,27,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(416,2,28,8,0,26,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(417,2,28,9,0,32,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(418,2,28,10,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(419,2,28,11,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(420,2,28,12,0,31,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(421,2,28,13,0,30,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(422,2,28,14,0,29,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(423,2,28,15,0,28,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(424,2,28,16,0,27,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(425,2,28,17,0,26,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(426,2,28,18,0,31,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(427,2,28,19,0,32,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(428,2,28,20,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(429,2,28,21,0,31,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(430,2,28,22,0,30,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(431,2,28,23,0,29,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(432,2,28,24,0,28,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(433,2,28,25,0,27,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(434,2,28,26,0,26,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(435,2,28,27,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(436,2,29,1,0,90,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(437,2,29,2,0,91,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(438,2,29,3,0,92,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(439,2,29,4,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(440,2,29,5,0,93,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(441,2,29,6,0,94,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(442,2,30,1,0,88,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(443,2,30,2,0,88,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(444,2,30,3,0,89,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(445,2,31,1,0,73,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(446,2,31,2,0,74,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(447,2,31,3,0,73,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(448,2,31,4,0,72,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(449,2,31,5,0,74,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(450,2,31,6,0,74,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(451,2,31,7,0,73,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(452,2,31,8,0,72,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(453,2,31,9,0,74,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(454,2,31,10,0,74,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(455,2,31,11,0,73,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(456,2,31,12,0,72,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(457,2,31,13,0,68,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(458,2,31,14,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(459,2,31,15,0,74,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(460,2,31,16,0,73,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(461,2,31,17,0,72,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(462,2,31,18,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(463,2,31,19,0,73,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(464,2,31,20,0,73,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(465,2,31,21,0,72,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(466,2,31,22,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(467,2,31,23,0,74,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(468,2,31,24,0,73,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(469,2,31,25,0,72,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(470,2,32,1,0,94,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(471,2,32,2,0,94,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(472,2,32,3,0,93,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(473,2,33,1,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(474,2,33,2,0,32,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(475,2,33,3,0,27,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(476,2,33,4,0,28,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(477,2,33,5,0,29,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(478,2,33,6,0,30,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(479,2,33,7,0,31,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(480,2,33,8,0,32,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(481,2,33,9,0,31,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(482,2,33,10,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(483,2,33,11,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(484,2,33,12,0,27,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(485,2,33,13,0,28,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(486,2,33,14,0,29,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(487,2,33,15,0,30,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(488,2,33,16,0,31,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(489,2,33,17,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(490,2,33,18,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(491,2,33,19,0,26,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(492,2,33,20,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(493,2,33,21,0,27,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(494,2,33,22,0,28,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(495,2,33,23,0,29,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(496,2,33,24,0,30,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(497,2,33,25,0,31,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(498,2,33,26,0,32,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(499,2,33,27,0,26,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(500,2,34,1,0,88,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(501,2,34,2,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(502,2,34,3,0,90,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(503,2,34,4,0,90,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(504,2,34,5,0,91,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(505,2,34,6,0,92,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(506,2,34,7,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(507,2,34,8,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(508,2,35,1,0,29,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(509,2,35,2,0,29,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(510,2,35,3,0,49,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(511,2,35,4,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(512,2,35,5,0,6,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(513,2,35,6,0,29,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(514,2,35,7,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(515,2,35,8,0,26,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(516,2,35,9,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(517,2,35,10,0,32,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(518,2,35,11,0,48,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(519,2,35,12,0,8,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(520,2,35,13,0,50,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(521,2,35,14,0,10,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(522,2,35,15,0,52,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(523,2,35,16,0,12,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(524,2,35,17,0,54,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(525,2,35,18,0,27,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(526,2,35,19,0,47,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(527,2,35,20,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(528,2,35,21,0,29,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(529,2,35,22,0,29,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(530,2,35,23,0,51,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(531,2,35,24,0,11,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(532,2,35,25,0,29,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(533,2,35,26,0,5,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(534,2,35,27,0,55,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(535,2,36,1,0,94,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(536,2,36,2,0,93,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(537,2,36,3,0,94,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(538,2,37,1,0,55,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(539,2,37,2,0,54,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(540,2,37,3,0,53,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(541,2,37,4,0,52,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(542,2,37,5,0,51,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(543,2,37,6,0,50,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(544,2,37,7,0,55,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(545,2,37,8,0,54,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(546,2,37,9,0,53,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(547,2,37,10,0,52,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(548,2,37,11,0,51,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(549,2,37,12,0,50,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(550,2,37,13,0,55,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(551,2,37,14,0,54,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(552,2,37,15,0,53,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(553,2,37,16,0,52,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(554,2,37,17,0,51,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(555,2,37,18,0,50,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(556,2,38,1,0,7,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(557,2,38,2,0,12,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(558,2,38,3,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(559,2,38,4,0,11,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(560,2,38,5,0,11,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(561,2,38,6,0,11,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(562,2,38,7,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(563,2,38,8,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(564,2,38,9,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(565,2,38,10,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(566,2,38,11,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(567,2,38,12,0,8,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(568,2,38,13,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(569,2,38,14,0,7,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(570,2,38,15,0,7,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(571,2,38,16,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(572,2,38,17,0,89,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(573,2,38,18,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(574,2,38,19,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(575,2,38,20,0,12,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(576,2,38,21,0,12,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(577,2,38,22,0,12,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(578,2,38,23,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(579,2,38,24,0,11,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(580,2,38,25,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(581,2,38,26,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(582,2,38,27,0,9,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(583,2,38,28,0,9,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(584,2,38,29,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(585,2,38,30,0,8,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(586,2,38,31,0,8,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(587,2,38,32,0,7,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(588,2,38,33,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(589,2,38,34,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(590,2,38,35,0,88,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(591,2,38,36,0,91,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(592,2,38,37,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(593,2,38,38,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(594,2,38,39,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(595,2,38,40,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(596,2,38,41,0,11,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(597,2,38,42,0,11,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(598,2,38,43,0,10,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(599,2,38,44,0,10,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(600,2,38,45,0,9,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(601,2,38,46,0,9,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(602,2,38,47,0,8,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(603,2,38,48,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(604,2,38,49,0,8,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(605,2,38,50,0,7,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(606,2,38,51,0,7,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(607,2,38,52,0,90,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(608,2,38,53,0,93,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(609,2,38,54,0,90,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(610,2,38,55,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(611,3,39,1,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(612,3,39,2,0,13,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(613,3,39,3,0,19,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(614,3,39,4,0,18,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(615,3,39,5,0,17,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(616,3,39,6,0,16,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(617,3,39,7,0,15,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(618,3,39,8,0,14,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(619,3,39,9,0,13,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(620,3,39,10,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(621,3,39,11,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(622,3,39,12,0,19,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(623,3,39,13,0,18,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(624,3,39,14,0,17,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(625,3,39,15,0,16,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(626,3,39,16,0,15,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(627,3,39,17,0,14,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(628,3,39,18,0,13,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(629,3,39,19,0,14,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(630,3,39,20,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(631,3,39,21,0,19,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(632,3,39,22,0,18,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(633,3,39,23,0,17,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(634,3,39,24,0,16,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(635,3,39,25,0,15,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(636,3,39,26,0,14,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(637,3,39,27,0,13,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(638,3,40,1,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(639,3,40,2,0,13,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(640,3,40,3,0,19,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(641,3,40,4,0,18,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(642,3,40,5,0,17,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(643,3,40,6,0,16,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(644,3,40,7,0,15,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(645,3,40,8,0,14,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(646,3,40,9,0,13,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(647,3,40,10,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(648,3,40,11,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(649,3,40,12,0,19,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(650,3,40,13,0,18,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(651,3,40,14,0,17,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(652,3,40,15,0,16,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(653,3,40,16,0,15,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(654,3,40,17,0,14,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(655,3,40,18,0,13,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(656,3,40,19,0,18,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(657,3,40,20,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(658,3,40,21,0,19,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(659,3,40,22,0,18,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(660,3,40,23,0,17,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(661,3,40,24,0,16,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(662,3,40,25,0,15,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(663,3,40,26,0,14,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(664,3,40,27,0,13,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(665,3,41,1,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(666,3,41,2,0,38,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(667,3,41,3,0,37,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(668,3,41,4,0,36,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(669,3,41,5,0,33,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(670,3,41,6,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(671,3,41,7,0,37,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(672,3,41,8,0,38,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(673,3,41,9,0,36,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(674,3,41,10,0,34,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(675,3,41,11,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(676,3,41,12,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(677,3,41,13,0,39,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(678,3,41,14,0,35,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(679,3,41,15,0,35,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(680,3,42,1,0,60,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(681,3,42,2,0,81,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(682,3,42,3,0,78,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(683,3,42,4,0,77,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(684,3,42,5,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(685,3,42,6,0,81,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(686,3,42,7,0,79,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(687,3,42,8,0,76,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(688,3,42,9,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(689,3,42,10,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(690,3,42,11,0,60,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(691,3,42,12,0,80,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(692,3,42,13,0,80,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(693,3,42,14,0,75,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(694,3,42,15,0,75,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(695,3,42,16,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(696,3,43,1,0,58,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(697,3,43,2,0,59,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(698,3,43,3,0,60,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(699,3,43,4,0,58,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(700,3,43,5,0,59,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(701,3,43,6,0,57,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(702,3,43,7,0,56,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(703,3,43,8,0,57,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(704,3,43,9,0,56,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(705,3,43,10,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(706,3,44,1,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(707,3,44,2,0,98,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(708,3,44,3,0,97,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(709,3,44,4,0,96,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(710,3,44,5,0,95,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(711,3,44,6,0,99,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(712,3,44,7,0,98,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(713,3,44,8,0,97,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(714,3,44,9,0,96,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(715,3,44,10,0,95,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(716,3,44,11,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(717,3,44,12,0,98,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(718,3,44,13,0,97,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(719,3,44,14,0,96,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(720,3,44,15,0,95,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(721,3,45,1,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(722,3,45,2,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(723,3,45,3,0,101,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(724,3,45,4,0,100,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(725,3,45,5,0,99,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(726,3,45,6,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(727,3,45,7,0,101,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(728,3,45,8,0,100,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(729,3,45,9,0,99,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(730,3,45,10,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(731,3,45,11,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(732,3,45,12,0,101,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(733,3,45,13,0,100,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(734,3,45,14,0,99,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(735,3,46,1,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(736,3,46,2,0,75,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(737,3,46,3,0,76,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(738,3,46,4,0,77,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(739,3,46,5,0,78,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(740,3,46,6,0,79,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(741,3,46,7,0,80,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(742,3,46,8,0,78,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(743,3,46,9,0,77,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(744,3,46,10,0,76,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(745,3,46,11,0,79,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(746,3,46,12,0,81,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(747,3,46,13,0,81,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(748,3,46,14,0,80,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(749,3,46,15,0,79,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(750,3,46,16,0,78,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(751,3,46,17,0,77,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(752,3,46,18,0,76,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(753,3,46,19,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(754,3,46,20,0,75,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(755,3,46,21,0,75,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(756,3,46,22,0,76,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(757,3,46,23,0,77,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(758,3,46,24,0,78,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(759,3,46,25,0,79,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(760,3,46,26,0,80,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(761,3,46,27,0,81,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(762,3,46,28,0,78,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(763,3,46,29,0,75,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(764,3,46,30,0,75,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(765,3,46,31,0,76,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(766,3,46,32,0,81,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(767,3,46,33,0,80,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(768,3,46,34,0,79,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(769,3,46,35,0,78,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(770,3,46,36,0,77,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(771,3,46,37,0,76,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(772,3,46,38,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(773,3,46,39,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(774,3,46,40,0,76,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(775,3,46,41,0,77,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(776,3,46,42,0,78,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(777,3,46,43,0,79,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(778,3,46,44,0,80,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(779,3,46,45,0,81,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(780,3,46,46,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(781,3,46,47,0,79,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(782,3,46,48,0,78,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(783,3,46,49,0,77,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(784,3,46,50,0,81,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(785,3,46,51,0,80,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(786,3,46,52,0,79,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(787,3,46,53,0,78,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(788,3,46,54,0,77,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(789,3,46,55,0,76,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(790,3,46,56,0,75,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(791,3,46,57,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(792,3,47,1,0,15,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(793,3,47,2,0,16,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(794,3,47,3,0,17,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(795,3,47,4,0,18,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(796,3,47,5,0,19,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(797,3,47,6,0,13,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(798,3,47,7,0,14,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(799,3,47,8,0,15,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(800,3,47,9,0,16,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(801,3,47,10,0,17,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(802,3,47,11,0,18,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(803,3,47,12,0,14,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(804,3,47,13,0,13,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(805,3,47,14,0,19,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(806,3,47,15,0,18,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(807,3,47,16,0,17,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(808,3,47,17,0,16,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(809,3,47,18,0,15,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(810,3,48,1,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(811,3,48,2,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(812,3,48,3,0,60,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(813,3,48,4,0,57,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(814,3,48,5,0,59,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(815,3,48,6,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(816,3,48,7,0,60,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(817,3,48,8,0,56,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(818,3,48,9,0,58,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(819,3,49,1,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(820,3,49,2,0,97,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(821,3,49,3,0,96,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(822,3,49,4,0,95,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(823,3,49,5,0,101,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(824,3,49,6,0,98,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(825,3,49,7,0,97,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(826,3,49,8,0,96,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(827,3,49,9,0,95,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(828,3,49,10,0,101,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(829,3,49,11,0,98,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(830,3,49,12,0,97,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(831,3,49,13,0,96,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(832,3,49,14,0,95,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(833,3,49,15,0,101,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(834,3,50,1,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(835,3,50,2,0,98,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(836,3,50,3,0,99,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(837,3,50,4,0,100,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(838,3,50,5,0,101,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(839,3,50,6,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(840,3,50,7,0,98,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(841,3,50,8,0,99,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(842,3,50,9,0,100,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(843,3,50,10,0,101,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(844,3,50,11,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(845,3,50,12,0,99,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(846,3,50,13,0,100,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(847,3,50,14,0,101,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(848,3,51,1,0,39,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(849,3,51,2,0,39,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(850,3,51,3,0,36,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(851,3,51,4,0,36,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(852,3,51,5,0,33,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(853,3,51,6,0,38,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(854,3,51,7,0,38,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(855,3,51,8,0,35,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(856,3,51,9,0,35,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(857,3,51,10,0,37,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(858,3,51,11,0,37,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(859,3,51,12,0,34,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(860,3,51,13,0,34,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(861,3,51,14,0,33,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(862,3,52,1,0,95,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(863,3,52,2,0,96,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(864,3,52,3,0,97,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(865,3,52,4,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(866,3,52,5,0,95,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(867,3,52,6,0,96,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(868,3,52,7,0,97,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(869,3,52,8,0,98,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(870,3,52,9,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(871,3,52,10,0,95,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(872,3,52,11,0,96,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(873,3,52,12,0,97,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(874,3,52,13,0,98,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(875,3,52,14,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(876,3,53,1,0,58,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(877,3,53,2,0,59,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(878,3,53,3,0,56,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(879,3,53,4,0,60,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(880,3,53,5,0,56,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(881,3,53,6,0,60,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(882,3,53,7,0,57,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(883,3,53,8,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(884,3,54,1,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(885,3,54,2,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(886,3,54,3,0,39,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(887,3,54,4,0,38,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(888,3,54,5,0,37,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(889,3,54,6,0,36,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(890,3,54,7,0,35,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(891,3,54,8,0,34,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(892,3,54,9,0,33,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(893,3,54,10,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(894,3,54,11,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(895,3,54,12,0,39,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(896,3,54,13,0,38,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(897,3,54,14,0,37,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(898,3,54,15,0,36,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(899,3,54,16,0,35,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(900,3,54,17,0,36,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(901,3,54,18,0,33,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(902,3,54,19,0,36,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(903,3,54,20,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(904,3,54,21,0,39,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(905,3,54,22,0,38,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(906,3,54,23,0,37,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(907,3,54,24,0,36,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(908,3,54,25,0,35,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(909,3,54,26,0,34,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(910,3,54,27,0,33,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(911,3,55,1,0,58,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(912,3,55,2,0,59,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(913,3,55,3,0,60,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(914,3,55,4,0,58,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(915,3,55,5,0,60,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(916,3,55,6,0,57,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(917,3,55,7,0,59,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(918,3,55,8,0,57,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(919,3,55,9,0,56,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(920,3,55,10,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(921,3,56,1,0,33,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(922,3,56,2,0,34,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(923,3,56,3,0,35,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(924,3,56,4,0,36,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(925,3,56,5,0,37,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(926,3,56,6,0,38,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(927,3,56,7,0,39,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(928,3,56,8,0,59,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(929,3,56,9,0,58,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(930,3,56,10,0,33,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(931,3,56,11,0,34,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(932,3,56,12,0,35,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(933,3,56,13,0,36,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(934,3,56,14,0,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(935,3,56,15,0,38,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(936,3,56,16,0,39,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(937,3,56,17,0,57,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(938,3,56,18,0,56,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(939,3,56,19,0,33,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(940,3,56,20,0,34,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(941,3,56,21,0,35,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(942,3,56,22,0,36,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(943,3,56,23,0,37,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(944,3,56,24,0,38,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(945,3,56,25,0,38,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(946,3,56,26,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(947,3,56,27,1,NULL,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(948,3,57,1,0,57,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(949,3,57,2,0,57,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(950,3,57,3,0,56,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(951,3,57,4,0,56,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(952,3,57,5,0,58,1,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(953,3,57,6,0,58,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(954,3,57,7,0,59,0,'2018-06-27 09:27:38','2018-06-27 09:27:38'),(955,3,57,8,0,59,0,'2018-06-27 09:27:38','2018-06-27 09:27:38');
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
  `systemName` varchar(255) NOT NULL,
  `bodyName` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `type` varchar(255) NOT NULL,
  `cmdrName` varchar(255) NOT NULL,
  `cmdrComment` text DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GRREPORTS` (`systemName`,`bodyName`,`cmdrName`,`cmdrComment`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `siteID` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `type` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GRTYPES` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grtypes`
--

LOCK TABLES `grtypes` WRITE;
/*!40000 ALTER TABLE `grtypes` DISABLE KEYS */;
INSERT INTO `grtypes` VALUES (1,'Alpha'),(2,'Beta'),(3,'Gamma');
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
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `artifactName` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GSARTIFACTS` (`artifactName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `categoryName` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GSCODEXCATEGORIES` (`categoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `codexNumber` int(11) NOT NULL,
  `text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GSCODEXDATA` (`text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gscodexdata`
--

LOCK TABLES `gscodexdata` WRITE;
/*!40000 ALTER TABLE `gscodexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `gscodexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gsobeliskgroupreports`
--

DROP TABLE IF EXISTS `gsobeliskgroupreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsobeliskgroupreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gsreport` int(11) DEFAULT NULL,
  `gsobeliskgroup` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gsobeliskgroupreports`
--

LOCK TABLES `gsobeliskgroupreports` WRITE;
/*!40000 ALTER TABLE `gsobeliskgroupreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `gsobeliskgroupreports` ENABLE KEYS */;
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
  `groupName` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GSOBELISKGROUPS` (`groupName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gsobeliskgroups`
--

LOCK TABLES `gsobeliskgroups` WRITE;
/*!40000 ALTER TABLE `gsobeliskgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `gsobeliskgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gsobeliskreports`
--

DROP TABLE IF EXISTS `gsobeliskreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gsobeliskreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gsreport` int(11) DEFAULT NULL,
  `gsobelisk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `obeliskNumber` int(11) NOT NULL,
  `broken` tinyint(1) DEFAULT NULL,
  `gsCodexData` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `systemName` varchar(255) NOT NULL,
  `bodyName` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `type` varchar(255) NOT NULL,
  `cmdrName` varchar(255) NOT NULL,
  `cmdrComment` text DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GSREPORTS` (`systemName`,`bodyName`,`cmdrName`,`cmdrComment`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `siteID` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `type` int(11) DEFAULT NULL,
  `hasDatabank` tinyint(1) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GSTYPES` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gstypes`
--

LOCK TABLES `gstypes` WRITE;
/*!40000 ALTER TABLE `gstypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `gstypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gyreports`
--

DROP TABLE IF EXISTS `gyreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gyreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) NOT NULL,
  `bodyName` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) NOT NULL,
  `cmdrComment` text DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GYREPORTS` (`systemName`,`bodyName`,`type`,`cmdrName`,`cmdrComment`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) DEFAULT NULL,
  `siteID` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `count` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_GYTYPES` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gytypes`
--

LOCK TABLES `gytypes` WRITE;
/*!40000 ALTER TABLE `gytypes` DISABLE KEYS */;
INSERT INTO `gytypes` VALUES (1,'Ammonia'),(2,'Carbon Dioxide'),(3,'Helium'),(4,'Methane'),(5,'Nitrogen'),(6,'Silicate Vapour'),(7,'Water');
/*!40000 ALTER TABLE `gytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journaldata`
--

DROP TABLE IF EXISTS `journaldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journaldata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jsonData` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journaldata`
--

LOCK TABLES `journaldata` WRITE;
/*!40000 ALTER TABLE `journaldata` DISABLE KEYS */;
/*!40000 ALTER TABLE `journaldata` ENABLE KEYS */;
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
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `systemName` varchar(255) NOT NULL,
  `bodyName` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `count` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) NOT NULL,
  `cmdrComment` text DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_LSREPORTS` (`systemName`,`bodyName`,`cmdrName`,`cmdrComment`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `siteID` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `count` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lssites`
--

LOCK TABLES `lssites` WRITE;
/*!40000 ALTER TABLE `lssites` DISABLE KEYS */;
/*!40000 ALTER TABLE `lssites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msreports`
--

DROP TABLE IF EXISTS `msreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(255) NOT NULL,
  `orbitBody` varchar(255) DEFAULT NULL,
  `shipName` varchar(255) NOT NULL,
  `shipTag` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `flightOps` tinyint(1) DEFAULT NULL,
  `flightSchedule` tinyint(1) DEFAULT NULL,
  `dockable` tinyint(1) DEFAULT NULL,
  `cmdrName` varchar(255) NOT NULL,
  `cmdrComment` text DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_MSREPORTS` (`systemName`,`orbitBody`,`shipName`,`shipTag`,`type`,`cmdrName`,`cmdrComment`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `siteID` int(11) NOT NULL,
  `shipName` varchar(255) NOT NULL,
  `shipTag` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `flightOps` tinyint(1) DEFAULT NULL,
  `flightSchedule` tinyint(1) DEFAULT NULL,
  `dockable` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_MSSITES` (`shipName`,`shipTag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_MSTYPES` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstypes`
--

LOCK TABLES `mstypes` WRITE;
/*!40000 ALTER TABLE `mstypes` DISABLE KEYS */;
INSERT INTO `mstypes` VALUES (1,'Alcatraz Class Prison Ship'),(2,'Aquarius Class Tanker'),(3,'Banner Class Bulk Cargo Ship'),(4,'Bellmarsh Class Prison Ship'),(5,'Bowman Class Science Vessel'),(6,'Demeter Class Agricultural Vessel'),(7,'Dionysus Class Agricultural Vessel'),(8,'Gordon Class Bulk Cargo Ship'),(9,'Henry Class Bulk Cargo Ship'),(10,'Hercules Class Bulk Cargo Ship'),(11,'Hogan Class Bulk Cargo Ship'),(12,'Lowell Class Science Vessel'),(13,'Megaship'),(14,'Naphtha Class Tanker'),(15,'Riker Class Prison Ship'),(16,'Sagan Class Tourist Ship'),(17,'Samson Class Bulk Cargo Ship'),(18,'Sanchez Class Science Vessel'),(19,'Survey Vessel'),(20,'Thomas Class Bulk Cargo Ship'),(21,'Unknown');
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
  `ringName` varchar(255) NOT NULL,
  `edsmType` int(11) DEFAULT NULL,
  `edsmMass` double DEFAULT NULL,
  `edsmInnerRadius` double DEFAULT NULL,
  `edsmOuterRadius` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
-- Table structure for table `ringtypes`
--

DROP TABLE IF EXISTS `ringtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ringtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_RINGTYPES` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ringtypes`
--

LOCK TABLES `ringtypes` WRITE;
/*!40000 ALTER TABLE `ringtypes` DISABLE KEYS */;
INSERT INTO `ringtypes` VALUES (1,'Icy'),(2,'Metallic'),(3,'Metal Rich'),(4,'Rocky');
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
  `systemName` varchar(255) NOT NULL,
  `edsmID` double DEFAULT NULL,
  `edsmID64` double DEFAULT NULL,
  `edsmCoordX` double DEFAULT NULL,
  `edsmCoordY` double DEFAULT NULL,
  `edsmCoordZ` double DEFAULT NULL,
  `edsmCoordLocked` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_SYSTEMS` (`systemName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `systemName` varchar(255) NOT NULL,
  `bodyName` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `type` varchar(255) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) NOT NULL,
  `cmdrComment` text DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_TBREPORTS` (`systemName`,`bodyName`,`cmdrName`,`cmdrComment`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `siteID` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `count` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_TBTYPES` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtypes`
--

LOCK TABLES `tbtypes` WRITE;
/*!40000 ALTER TABLE `tbtypes` DISABLE KEYS */;
INSERT INTO `tbtypes` VALUES (1,'Barnacle'),(2,'Mega-Barnacle');
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
  `systemName` varchar(255) NOT NULL,
  `bodyName` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `status` varchar(255) NOT NULL,
  `cmdrName` varchar(255) NOT NULL,
  `cmdrComment` text DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_TSREPORTS` (`systemName`,`bodyName`,`cmdrName`,`cmdrComment`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `siteID` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `status` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_TSSTATUSES` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsstatuses`
--

LOCK TABLES `tsstatuses` WRITE;
/*!40000 ALTER TABLE `tsstatuses` DISABLE KEYS */;
INSERT INTO `tsstatuses` VALUES (1,'Active'),(2,'Inactive');
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
  `systemName` varchar(255) NOT NULL,
  `bodyName` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `count` int(11) DEFAULT NULL,
  `cmdrName` varchar(255) NOT NULL,
  `cmdrComment` text DEFAULT NULL,
  `reportStatus` varchar(255) NOT NULL,
  `reportComment` text DEFAULT NULL,
  `voteCount` int(11) DEFAULT NULL,
  `added` tinyint(1) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_TWREPORTS` (`systemName`,`bodyName`,`cmdrName`,`cmdrComment`,`reportComment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `siteID` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `count` int(11) DEFAULT NULL,
  `verified` tinyint(1) NOT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `discoveredBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `name` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_UPLOAD_FILE` (`name`,`hash`,`ext`,`mime`,`size`,`url`,`provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `type` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `policy` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_USERS_PERMISSIONS_PERMISSION` (`type`,`controller`,`action`,`policy`)
) ENGINE=InnoDB AUTO_INCREMENT=1951 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_permission`
--

LOCK TABLES `users-permissions_permission` WRITE;
/*!40000 ALTER TABLE `users-permissions_permission` DISABLE KEYS */;
INSERT INTO `users-permissions_permission` VALUES (1,'application','bmreport','count',1,'',1),(2,'application','bmreport','count',1,'',2),(3,'application','bmreport','count',1,'',3),(4,'application','bmreport','create',1,'',1),(5,'application','bmreport','create',1,'',2),(6,'application','bmreport','create',1,'',3),(7,'application','bmreport','createrelation',1,'',1),(8,'application','bmreport','createrelation',0,'',2),(9,'application','bmreport','createrelation',0,'',3),(10,'application','bmreport','destroy',1,'',1),(11,'application','bmreport','destroy',0,'',2),(12,'application','bmreport','destroy',0,'',3),(13,'application','bmreport','destroyrelation',1,'',1),(14,'application','bmreport','destroyrelation',0,'',2),(15,'application','bmreport','destroyrelation',0,'',3),(16,'application','bmreport','find',1,'',1),(17,'application','bmreport','find',1,'',2),(18,'application','bmreport','find',1,'',3),(19,'application','bmreport','findone',1,'',1),(20,'application','bmreport','findone',1,'',2),(21,'application','bmreport','findone',1,'',3),(22,'application','bmreport','update',1,'',1),(23,'application','bmreport','update',1,'',2),(24,'application','bmreport','update',1,'',3),(25,'application','bmreport','updaterelation',1,'',1),(26,'application','bmreport','updaterelation',0,'',2),(27,'application','bmreport','updaterelation',0,'',3),(28,'application','bmsite','count',1,'',1),(29,'application','bmsite','count',1,'',2),(30,'application','bmsite','count',1,'',3),(31,'application','bmsite','create',1,'',1),(32,'application','bmsite','create',0,'',2),(33,'application','bmsite','create',0,'',3),(34,'application','bmsite','createrelation',1,'',1),(35,'application','bmsite','createrelation',0,'',2),(36,'application','bmsite','createrelation',0,'',3),(37,'application','bmsite','destroy',1,'',1),(38,'application','bmsite','destroy',0,'',2),(39,'application','bmsite','destroy',0,'',3),(40,'application','bmsite','destroyrelation',1,'',1),(41,'application','bmsite','destroyrelation',0,'',2),(42,'application','bmsite','destroyrelation',0,'',3),(43,'application','bmsite','find',1,'',1),(44,'application','bmsite','find',1,'',2),(45,'application','bmsite','find',1,'',3),(46,'application','bmsite','findone',1,'',1),(47,'application','bmsite','findone',1,'',2),(48,'application','bmsite','findone',1,'',3),(49,'application','bmsite','update',1,'',1),(50,'application','bmsite','update',0,'',2),(51,'application','bmsite','update',0,'',3),(52,'application','bmsite','updaterelation',1,'',1),(53,'application','bmsite','updaterelation',0,'',2),(54,'application','bmsite','updaterelation',0,'',3),(55,'application','body','count',1,'',1),(56,'application','body','count',1,'',2),(57,'application','body','count',1,'',3),(58,'application','body','create',1,'',1),(59,'application','body','create',0,'',2),(60,'application','body','create',0,'',3),(61,'application','body','createrelation',1,'',1),(62,'application','body','createrelation',0,'',2),(63,'application','body','createrelation',0,'',3),(64,'application','body','destroy',1,'',1),(65,'application','body','destroy',0,'',2),(66,'application','body','destroy',0,'',3),(67,'application','body','destroyrelation',1,'',1),(68,'application','body','destroyrelation',0,'',2),(69,'application','body','destroyrelation',0,'',3),(70,'application','body','find',1,'',1),(71,'application','body','find',1,'',2),(72,'application','body','find',1,'',3),(73,'application','body','findone',1,'',1),(74,'application','body','findone',1,'',2),(75,'application','body','findone',1,'',3),(76,'application','body','update',1,'',1),(77,'application','body','update',0,'',2),(78,'application','body','update',0,'',3),(79,'application','body','updaterelation',1,'',1),(80,'application','body','updaterelation',0,'',2),(81,'application','body','updaterelation',0,'',3),(82,'application','bodyatmosphere','count',1,'',1),(83,'application','bodyatmosphere','count',1,'',2),(84,'application','bodyatmosphere','count',1,'',3),(85,'application','bodyatmosphere','create',1,'',1),(86,'application','bodyatmosphere','create',0,'',2),(87,'application','bodyatmosphere','create',0,'',3),(88,'application','bodyatmosphere','createrelation',1,'',1),(89,'application','bodyatmosphere','createrelation',0,'',2),(90,'application','bodyatmosphere','createrelation',0,'',3),(91,'application','bodyatmosphere','destroy',1,'',1),(92,'application','bodyatmosphere','destroy',0,'',2),(93,'application','bodyatmosphere','destroy',0,'',3),(94,'application','bodyatmosphere','destroyrelation',1,'',1),(95,'application','bodyatmosphere','destroyrelation',0,'',2),(96,'application','bodyatmosphere','destroyrelation',0,'',3),(97,'application','bodyatmosphere','find',1,'',1),(98,'application','bodyatmosphere','find',1,'',2),(99,'application','bodyatmosphere','find',1,'',3),(100,'application','bodyatmosphere','findone',1,'',1),(101,'application','bodyatmosphere','findone',1,'',2),(102,'application','bodyatmosphere','findone',1,'',3),(103,'application','bodyatmosphere','update',1,'',1),(104,'application','bodyatmosphere','update',0,'',2),(105,'application','bodyatmosphere','update',0,'',3),(106,'application','bodyatmosphere','updaterelation',1,'',1),(107,'application','bodyatmosphere','updaterelation',0,'',2),(108,'application','bodyatmosphere','updaterelation',0,'',3),(109,'application','bodymaterial','count',1,'',1),(110,'application','bodymaterial','count',1,'',2),(111,'application','bodymaterial','count',1,'',3),(112,'application','bodymaterial','create',1,'',1),(113,'application','bodymaterial','create',0,'',2),(114,'application','bodymaterial','create',0,'',3),(115,'application','bodymaterial','createrelation',1,'',1),(116,'application','bodymaterial','createrelation',0,'',2),(117,'application','bodymaterial','createrelation',0,'',3),(118,'application','bodymaterial','destroy',1,'',1),(119,'application','bodymaterial','destroy',0,'',2),(120,'application','bodymaterial','destroy',0,'',3),(121,'application','bodymaterial','destroyrelation',1,'',1),(122,'application','bodymaterial','destroyrelation',0,'',2),(123,'application','bodymaterial','destroyrelation',0,'',3),(124,'application','bodymaterial','find',1,'',1),(125,'application','bodymaterial','find',1,'',2),(126,'application','bodymaterial','find',1,'',3),(127,'application','bodymaterial','findone',1,'',1),(128,'application','bodymaterial','findone',1,'',2),(129,'application','bodymaterial','findone',1,'',3),(130,'application','bodymaterial','update',1,'',1),(131,'application','bodymaterial','update',0,'',2),(132,'application','bodymaterial','update',0,'',3),(133,'application','bodymaterial','updaterelation',1,'',1),(134,'application','bodymaterial','updaterelation',0,'',2),(135,'application','bodymaterial','updaterelation',0,'',3),(136,'application','bodysubtype','count',1,'',1),(137,'application','bodysubtype','count',1,'',2),(138,'application','bodysubtype','count',1,'',3),(139,'application','bodysubtype','create',1,'',1),(140,'application','bodysubtype','create',0,'',2),(141,'application','bodysubtype','create',0,'',3),(142,'application','bodysubtype','createrelation',1,'',1),(143,'application','bodysubtype','createrelation',0,'',2),(144,'application','bodysubtype','createrelation',0,'',3),(145,'application','bodysubtype','destroy',1,'',1),(146,'application','bodysubtype','destroy',0,'',2),(147,'application','bodysubtype','destroy',0,'',3),(148,'application','bodysubtype','destroyrelation',1,'',1),(149,'application','bodysubtype','destroyrelation',0,'',2),(150,'application','bodysubtype','destroyrelation',0,'',3),(151,'application','bodysubtype','find',1,'',1),(152,'application','bodysubtype','find',1,'',2),(153,'application','bodysubtype','find',1,'',3),(154,'application','bodysubtype','findone',1,'',1),(155,'application','bodysubtype','findone',1,'',2),(156,'application','bodysubtype','findone',1,'',3),(157,'application','bodysubtype','update',1,'',1),(158,'application','bodysubtype','update',0,'',2),(159,'application','bodysubtype','update',0,'',3),(160,'application','bodysubtype','updaterelation',1,'',1),(161,'application','bodysubtype','updaterelation',0,'',2),(162,'application','bodysubtype','updaterelation',0,'',3),(163,'application','bodytype','count',1,'',1),(164,'application','bodytype','count',1,'',2),(165,'application','bodytype','count',1,'',3),(166,'application','bodytype','create',1,'',1),(167,'application','bodytype','create',0,'',2),(168,'application','bodytype','create',0,'',3),(169,'application','bodytype','createrelation',1,'',1),(170,'application','bodytype','createrelation',0,'',2),(171,'application','bodytype','createrelation',0,'',3),(172,'application','bodytype','destroy',1,'',1),(173,'application','bodytype','destroy',0,'',2),(174,'application','bodytype','destroy',0,'',3),(175,'application','bodytype','destroyrelation',1,'',1),(176,'application','bodytype','destroyrelation',0,'',2),(177,'application','bodytype','destroyrelation',0,'',3),(178,'application','bodytype','find',1,'',1),(179,'application','bodytype','find',1,'',2),(180,'application','bodytype','find',1,'',3),(181,'application','bodytype','findone',1,'',1),(182,'application','bodytype','findone',1,'',2),(183,'application','bodytype','findone',1,'',3),(184,'application','bodytype','update',1,'',1),(185,'application','bodytype','update',0,'',2),(186,'application','bodytype','update',0,'',3),(187,'application','bodytype','updaterelation',1,'',1),(188,'application','bodytype','updaterelation',0,'',2),(189,'application','bodytype','updaterelation',0,'',3),(190,'application','btreport','count',1,'',1),(191,'application','btreport','count',1,'',2),(192,'application','btreport','count',1,'',3),(193,'application','btreport','create',1,'',1),(194,'application','btreport','create',1,'',2),(195,'application','btreport','create',1,'',3),(196,'application','btreport','createrelation',1,'',1),(197,'application','btreport','createrelation',0,'',2),(198,'application','btreport','createrelation',0,'',3),(199,'application','btreport','destroy',1,'',1),(200,'application','btreport','destroy',0,'',2),(201,'application','btreport','destroy',0,'',3),(202,'application','btreport','destroyrelation',1,'',1),(203,'application','btreport','destroyrelation',0,'',2),(204,'application','btreport','destroyrelation',0,'',3),(205,'application','btreport','find',1,'',1),(206,'application','btreport','find',1,'',2),(207,'application','btreport','find',1,'',3),(208,'application','btreport','findone',1,'',1),(209,'application','btreport','findone',1,'',2),(210,'application','btreport','findone',1,'',3),(211,'application','btreport','update',1,'',1),(212,'application','btreport','update',1,'',2),(213,'application','btreport','update',1,'',3),(214,'application','btreport','updaterelation',1,'',1),(215,'application','btreport','updaterelation',0,'',2),(216,'application','btreport','updaterelation',0,'',3),(217,'application','btsite','count',1,'',1),(218,'application','btsite','count',1,'',2),(219,'application','btsite','count',1,'',3),(220,'application','btsite','create',1,'',1),(221,'application','btsite','create',0,'',2),(222,'application','btsite','create',0,'',3),(223,'application','btsite','createrelation',1,'',1),(224,'application','btsite','createrelation',0,'',2),(225,'application','btsite','createrelation',0,'',3),(226,'application','btsite','destroy',1,'',1),(227,'application','btsite','destroy',0,'',2),(228,'application','btsite','destroy',0,'',3),(229,'application','btsite','destroyrelation',1,'',1),(230,'application','btsite','destroyrelation',0,'',2),(231,'application','btsite','destroyrelation',0,'',3),(232,'application','btsite','find',1,'',1),(233,'application','btsite','find',1,'',2),(234,'application','btsite','find',1,'',3),(235,'application','btsite','findone',1,'',1),(236,'application','btsite','findone',1,'',2),(237,'application','btsite','findone',1,'',3),(238,'application','btsite','update',1,'',1),(239,'application','btsite','update',0,'',2),(240,'application','btsite','update',0,'',3),(241,'application','btsite','updaterelation',1,'',1),(242,'application','btsite','updaterelation',0,'',2),(243,'application','btsite','updaterelation',0,'',3),(244,'application','cmdr','count',1,'',1),(245,'application','cmdr','count',1,'',2),(246,'application','cmdr','count',1,'',3),(247,'application','cmdr','create',1,'',1),(248,'application','cmdr','create',0,'',2),(249,'application','cmdr','create',0,'',3),(250,'application','cmdr','createrelation',1,'',1),(251,'application','cmdr','createrelation',0,'',2),(252,'application','cmdr','createrelation',0,'',3),(253,'application','cmdr','destroy',1,'',1),(254,'application','cmdr','destroy',0,'',2),(255,'application','cmdr','destroy',0,'',3),(256,'application','cmdr','destroyrelation',1,'',1),(257,'application','cmdr','destroyrelation',0,'',2),(258,'application','cmdr','destroyrelation',0,'',3),(259,'application','cmdr','find',1,'',1),(260,'application','cmdr','find',1,'',2),(261,'application','cmdr','find',1,'',3),(262,'application','cmdr','findone',1,'',1),(263,'application','cmdr','findone',1,'',2),(264,'application','cmdr','findone',1,'',3),(265,'application','cmdr','update',1,'',1),(266,'application','cmdr','update',0,'',2),(267,'application','cmdr','update',0,'',3),(268,'application','cmdr','updaterelation',1,'',1),(269,'application','cmdr','updaterelation',0,'',2),(270,'application','cmdr','updaterelation',0,'',3),(271,'application','fgreport','count',1,'',1),(272,'application','fgreport','count',1,'',2),(273,'application','fgreport','count',1,'',3),(274,'application','fgreport','create',1,'',1),(275,'application','fgreport','create',1,'',2),(276,'application','fgreport','create',1,'',3),(277,'application','fgreport','createrelation',1,'',1),(278,'application','fgreport','createrelation',0,'',2),(279,'application','fgreport','createrelation',0,'',3),(280,'application','fgreport','destroy',1,'',1),(281,'application','fgreport','destroy',0,'',2),(282,'application','fgreport','destroy',0,'',3),(283,'application','fgreport','destroyrelation',1,'',1),(284,'application','fgreport','destroyrelation',0,'',2),(285,'application','fgreport','destroyrelation',0,'',3),(286,'application','fgreport','find',1,'',1),(287,'application','fgreport','find',1,'',2),(288,'application','fgreport','find',1,'',3),(289,'application','fgreport','findone',1,'',1),(290,'application','fgreport','findone',1,'',2),(291,'application','fgreport','findone',1,'',3),(292,'application','fgreport','update',1,'',1),(293,'application','fgreport','update',1,'',2),(294,'application','fgreport','update',1,'',3),(295,'application','fgreport','updaterelation',1,'',1),(296,'application','fgreport','updaterelation',0,'',2),(297,'application','fgreport','updaterelation',0,'',3),(298,'application','fgsite','count',1,'',1),(299,'application','fgsite','count',1,'',2),(300,'application','fgsite','count',1,'',3),(301,'application','fgsite','create',1,'',1),(302,'application','fgsite','create',0,'',2),(303,'application','fgsite','create',0,'',3),(304,'application','fgsite','createrelation',1,'',1),(305,'application','fgsite','createrelation',0,'',2),(306,'application','fgsite','createrelation',0,'',3),(307,'application','fgsite','destroy',1,'',1),(308,'application','fgsite','destroy',0,'',2),(309,'application','fgsite','destroy',0,'',3),(310,'application','fgsite','destroyrelation',1,'',1),(311,'application','fgsite','destroyrelation',0,'',2),(312,'application','fgsite','destroyrelation',0,'',3),(313,'application','fgsite','find',1,'',1),(314,'application','fgsite','find',1,'',2),(315,'application','fgsite','find',1,'',3),(316,'application','fgsite','findone',1,'',1),(317,'application','fgsite','findone',1,'',2),(318,'application','fgsite','findone',1,'',3),(319,'application','fgsite','update',1,'',1),(320,'application','fgsite','update',0,'',2),(321,'application','fgsite','update',0,'',3),(322,'application','fgsite','updaterelation',1,'',1),(323,'application','fgsite','updaterelation',0,'',2),(324,'application','fgsite','updaterelation',0,'',3),(325,'application','fmreport','count',1,'',1),(326,'application','fmreport','count',1,'',2),(327,'application','fmreport','count',1,'',3),(328,'application','fmreport','create',1,'',1),(329,'application','fmreport','create',1,'',2),(330,'application','fmreport','create',1,'',3),(331,'application','fmreport','createrelation',1,'',1),(332,'application','fmreport','createrelation',0,'',2),(333,'application','fmreport','createrelation',0,'',3),(334,'application','fmreport','destroy',1,'',1),(335,'application','fmreport','destroy',0,'',2),(336,'application','fmreport','destroy',0,'',3),(337,'application','fmreport','destroyrelation',1,'',1),(338,'application','fmreport','destroyrelation',0,'',2),(339,'application','fmreport','destroyrelation',0,'',3),(340,'application','fmreport','find',1,'',1),(341,'application','fmreport','find',1,'',2),(342,'application','fmreport','find',1,'',3),(343,'application','fmreport','findone',1,'',1),(344,'application','fmreport','findone',1,'',2),(345,'application','fmreport','findone',1,'',3),(346,'application','fmreport','update',1,'',1),(347,'application','fmreport','update',1,'',2),(348,'application','fmreport','update',1,'',3),(349,'application','fmreport','updaterelation',1,'',1),(350,'application','fmreport','updaterelation',0,'',2),(351,'application','fmreport','updaterelation',0,'',3),(352,'application','fmsite','count',1,'',1),(353,'application','fmsite','count',1,'',2),(354,'application','fmsite','count',1,'',3),(355,'application','fmsite','create',1,'',1),(356,'application','fmsite','create',0,'',2),(357,'application','fmsite','create',0,'',3),(358,'application','fmsite','createrelation',1,'',1),(359,'application','fmsite','createrelation',0,'',2),(360,'application','fmsite','createrelation',0,'',3),(361,'application','fmsite','destroy',1,'',1),(362,'application','fmsite','destroy',0,'',2),(363,'application','fmsite','destroy',0,'',3),(364,'application','fmsite','destroyrelation',1,'',1),(365,'application','fmsite','destroyrelation',0,'',2),(366,'application','fmsite','destroyrelation',0,'',3),(367,'application','fmsite','find',1,'',1),(368,'application','fmsite','find',1,'',2),(369,'application','fmsite','find',1,'',3),(370,'application','fmsite','findone',1,'',1),(371,'application','fmsite','findone',1,'',2),(372,'application','fmsite','findone',1,'',3),(373,'application','fmsite','update',1,'',1),(374,'application','fmsite','update',0,'',2),(375,'application','fmsite','update',0,'',3),(376,'application','fmsite','updaterelation',1,'',1),(377,'application','fmsite','updaterelation',0,'',2),(378,'application','fmsite','updaterelation',0,'',3),(379,'application','fmtype','count',1,'',1),(380,'application','fmtype','count',1,'',2),(381,'application','fmtype','count',1,'',3),(382,'application','fmtype','create',1,'',1),(383,'application','fmtype','create',0,'',2),(384,'application','fmtype','create',0,'',3),(385,'application','fmtype','createrelation',1,'',1),(386,'application','fmtype','createrelation',0,'',2),(387,'application','fmtype','createrelation',0,'',3),(388,'application','fmtype','destroy',1,'',1),(389,'application','fmtype','destroy',0,'',2),(390,'application','fmtype','destroy',0,'',3),(391,'application','fmtype','destroyrelation',1,'',1),(392,'application','fmtype','destroyrelation',0,'',2),(393,'application','fmtype','destroyrelation',0,'',3),(394,'application','fmtype','find',1,'',1),(395,'application','fmtype','find',1,'',2),(396,'application','fmtype','find',1,'',3),(397,'application','fmtype','findone',1,'',1),(398,'application','fmtype','findone',1,'',2),(399,'application','fmtype','findone',1,'',3),(400,'application','fmtype','update',1,'',1),(401,'application','fmtype','update',0,'',2),(402,'application','fmtype','update',0,'',3),(403,'application','fmtype','updaterelation',1,'',1),(404,'application','fmtype','updaterelation',0,'',2),(405,'application','fmtype','updaterelation',0,'',3),(406,'application','genreport','count',1,'',1),(407,'application','genreport','count',1,'',2),(408,'application','genreport','count',1,'',3),(409,'application','genreport','create',1,'',1),(410,'application','genreport','create',1,'',2),(411,'application','genreport','create',1,'',3),(412,'application','genreport','createrelation',1,'',1),(413,'application','genreport','createrelation',0,'',2),(414,'application','genreport','createrelation',0,'',3),(415,'application','genreport','destroy',1,'',1),(416,'application','genreport','destroy',0,'',2),(417,'application','genreport','destroy',0,'',3),(418,'application','genreport','destroyrelation',1,'',1),(419,'application','genreport','destroyrelation',0,'',2),(420,'application','genreport','destroyrelation',0,'',3),(421,'application','genreport','find',1,'',1),(422,'application','genreport','find',1,'',2),(423,'application','genreport','find',1,'',3),(424,'application','genreport','findone',1,'',1),(425,'application','genreport','findone',1,'',2),(426,'application','genreport','findone',1,'',3),(427,'application','genreport','update',1,'',1),(428,'application','genreport','update',1,'',2),(429,'application','genreport','update',1,'',3),(430,'application','genreport','updaterelation',1,'',1),(431,'application','genreport','updaterelation',0,'',2),(432,'application','genreport','updaterelation',0,'',3),(433,'application','gensite','count',1,'',1),(434,'application','gensite','count',1,'',2),(435,'application','gensite','count',1,'',3),(436,'application','gensite','create',1,'',1),(437,'application','gensite','create',0,'',2),(438,'application','gensite','create',0,'',3),(439,'application','gensite','createrelation',1,'',1),(440,'application','gensite','createrelation',0,'',2),(441,'application','gensite','createrelation',0,'',3),(442,'application','gensite','destroy',1,'',1),(443,'application','gensite','destroy',0,'',2),(444,'application','gensite','destroy',0,'',3),(445,'application','gensite','destroyrelation',1,'',1),(446,'application','gensite','destroyrelation',0,'',2),(447,'application','gensite','destroyrelation',0,'',3),(448,'application','gensite','find',1,'',1),(449,'application','gensite','find',1,'',2),(450,'application','gensite','find',1,'',3),(451,'application','gensite','findone',1,'',1),(452,'application','gensite','findone',1,'',2),(453,'application','gensite','findone',1,'',3),(454,'application','gensite','update',1,'',1),(455,'application','gensite','update',0,'',2),(456,'application','gensite','update',0,'',3),(457,'application','gensite','updaterelation',1,'',1),(458,'application','gensite','updaterelation',0,'',2),(459,'application','gensite','updaterelation',0,'',3),(460,'application','gractivegroup','count',1,'',1),(461,'application','gractivegroup','count',1,'',2),(462,'application','gractivegroup','count',1,'',3),(463,'application','gractivegroup','create',1,'',1),(464,'application','gractivegroup','create',0,'',2),(465,'application','gractivegroup','create',0,'',3),(466,'application','gractivegroup','createrelation',1,'',1),(467,'application','gractivegroup','createrelation',0,'',2),(468,'application','gractivegroup','createrelation',0,'',3),(469,'application','gractivegroup','destroy',1,'',1),(470,'application','gractivegroup','destroy',0,'',2),(471,'application','gractivegroup','destroy',0,'',3),(472,'application','gractivegroup','destroyrelation',1,'',1),(473,'application','gractivegroup','destroyrelation',0,'',2),(474,'application','gractivegroup','destroyrelation',0,'',3),(475,'application','gractivegroup','find',1,'',1),(476,'application','gractivegroup','find',1,'',2),(477,'application','gractivegroup','find',1,'',3),(478,'application','gractivegroup','findone',1,'',1),(479,'application','gractivegroup','findone',1,'',2),(480,'application','gractivegroup','findone',1,'',3),(481,'application','gractivegroup','update',1,'',1),(482,'application','gractivegroup','update',0,'',2),(483,'application','gractivegroup','update',0,'',3),(484,'application','gractivegroup','updaterelation',1,'',1),(485,'application','gractivegroup','updaterelation',0,'',2),(486,'application','gractivegroup','updaterelation',0,'',3),(487,'application','gractiveobelisk','count',1,'',1),(488,'application','gractiveobelisk','count',1,'',2),(489,'application','gractiveobelisk','count',1,'',3),(490,'application','gractiveobelisk','create',1,'',1),(491,'application','gractiveobelisk','create',0,'',2),(492,'application','gractiveobelisk','create',0,'',3),(493,'application','gractiveobelisk','createrelation',1,'',1),(494,'application','gractiveobelisk','createrelation',0,'',2),(495,'application','gractiveobelisk','createrelation',0,'',3),(496,'application','gractiveobelisk','destroy',1,'',1),(497,'application','gractiveobelisk','destroy',0,'',2),(498,'application','gractiveobelisk','destroy',0,'',3),(499,'application','gractiveobelisk','destroyrelation',1,'',1),(500,'application','gractiveobelisk','destroyrelation',0,'',2),(501,'application','gractiveobelisk','destroyrelation',0,'',3),(502,'application','gractiveobelisk','find',1,'',1),(503,'application','gractiveobelisk','find',1,'',2),(504,'application','gractiveobelisk','find',1,'',3),(505,'application','gractiveobelisk','findone',1,'',1),(506,'application','gractiveobelisk','findone',1,'',2),(507,'application','gractiveobelisk','findone',1,'',3),(508,'application','gractiveobelisk','update',1,'',1),(509,'application','gractiveobelisk','update',0,'',2),(510,'application','gractiveobelisk','update',0,'',3),(511,'application','gractiveobelisk','updaterelation',1,'',1),(512,'application','gractiveobelisk','updaterelation',0,'',2),(513,'application','gractiveobelisk','updaterelation',0,'',3),(514,'application','grartifact','count',1,'',1),(515,'application','grartifact','count',1,'',2),(516,'application','grartifact','count',1,'',3),(517,'application','grartifact','create',1,'',1),(518,'application','grartifact','create',0,'',2),(519,'application','grartifact','create',0,'',3),(520,'application','grartifact','createrelation',1,'',1),(521,'application','grartifact','createrelation',0,'',2),(522,'application','grartifact','createrelation',0,'',3),(523,'application','grartifact','destroy',1,'',1),(524,'application','grartifact','destroy',0,'',2),(525,'application','grartifact','destroy',0,'',3),(526,'application','grartifact','destroyrelation',1,'',1),(527,'application','grartifact','destroyrelation',0,'',2),(528,'application','grartifact','destroyrelation',0,'',3),(529,'application','grartifact','find',1,'',1),(530,'application','grartifact','find',1,'',2),(531,'application','grartifact','find',1,'',3),(532,'application','grartifact','findone',1,'',1),(533,'application','grartifact','findone',1,'',2),(534,'application','grartifact','findone',1,'',3),(535,'application','grartifact','update',1,'',1),(536,'application','grartifact','update',0,'',2),(537,'application','grartifact','update',0,'',3),(538,'application','grartifact','updaterelation',1,'',1),(539,'application','grartifact','updaterelation',0,'',2),(540,'application','grartifact','updaterelation',0,'',3),(541,'application','grcodexcategories','count',1,'',1),(542,'application','grcodexcategories','count',1,'',2),(543,'application','grcodexcategories','count',1,'',3),(544,'application','grcodexcategories','create',1,'',1),(545,'application','grcodexcategories','create',0,'',2),(546,'application','grcodexcategories','create',0,'',3),(547,'application','grcodexcategories','createrelation',1,'',1),(548,'application','grcodexcategories','createrelation',0,'',2),(549,'application','grcodexcategories','createrelation',0,'',3),(550,'application','grcodexcategories','destroy',1,'',1),(551,'application','grcodexcategories','destroy',0,'',2),(552,'application','grcodexcategories','destroy',0,'',3),(553,'application','grcodexcategories','destroyrelation',1,'',1),(554,'application','grcodexcategories','destroyrelation',0,'',2),(555,'application','grcodexcategories','destroyrelation',0,'',3),(556,'application','grcodexcategories','find',1,'',1),(557,'application','grcodexcategories','find',1,'',2),(558,'application','grcodexcategories','find',1,'',3),(559,'application','grcodexcategories','findone',1,'',1),(560,'application','grcodexcategories','findone',1,'',2),(561,'application','grcodexcategories','findone',1,'',3),(562,'application','grcodexcategories','update',1,'',1),(563,'application','grcodexcategories','update',0,'',2),(564,'application','grcodexcategories','update',0,'',3),(565,'application','grcodexcategories','updaterelation',1,'',1),(566,'application','grcodexcategories','updaterelation',0,'',2),(567,'application','grcodexcategories','updaterelation',0,'',3),(568,'application','grcodexdata','count',1,'',1),(569,'application','grcodexdata','count',1,'',2),(570,'application','grcodexdata','count',1,'',3),(571,'application','grcodexdata','create',1,'',1),(572,'application','grcodexdata','create',0,'',2),(573,'application','grcodexdata','create',0,'',3),(574,'application','grcodexdata','createrelation',1,'',1),(575,'application','grcodexdata','createrelation',0,'',2),(576,'application','grcodexdata','createrelation',0,'',3),(577,'application','grcodexdata','destroy',1,'',1),(578,'application','grcodexdata','destroy',0,'',2),(579,'application','grcodexdata','destroy',0,'',3),(580,'application','grcodexdata','destroyrelation',1,'',1),(581,'application','grcodexdata','destroyrelation',0,'',2),(582,'application','grcodexdata','destroyrelation',0,'',3),(583,'application','grcodexdata','find',1,'',1),(584,'application','grcodexdata','find',1,'',2),(585,'application','grcodexdata','find',1,'',3),(586,'application','grcodexdata','findone',1,'',1),(587,'application','grcodexdata','findone',1,'',2),(588,'application','grcodexdata','findone',1,'',3),(589,'application','grcodexdata','update',1,'',1),(590,'application','grcodexdata','update',0,'',2),(591,'application','grcodexdata','update',0,'',3),(592,'application','grcodexdata','updaterelation',1,'',1),(593,'application','grcodexdata','updaterelation',0,'',2),(594,'application','grcodexdata','updaterelation',0,'',3),(595,'application','grobelisk','count',1,'',1),(596,'application','grobelisk','count',1,'',2),(597,'application','grobelisk','count',1,'',3),(598,'application','grobelisk','create',1,'',1),(599,'application','grobelisk','create',0,'',2),(600,'application','grobelisk','create',0,'',3),(601,'application','grobelisk','createrelation',1,'',1),(602,'application','grobelisk','createrelation',0,'',2),(603,'application','grobelisk','createrelation',0,'',3),(604,'application','grobelisk','destroy',1,'',1),(605,'application','grobelisk','destroy',0,'',2),(606,'application','grobelisk','destroy',0,'',3),(607,'application','grobelisk','destroyrelation',1,'',1),(608,'application','grobelisk','destroyrelation',0,'',2),(609,'application','grobelisk','destroyrelation',0,'',3),(610,'application','grobelisk','find',1,'',1),(611,'application','grobelisk','find',1,'',2),(612,'application','grobelisk','find',1,'',3),(613,'application','grobelisk','findone',1,'',1),(614,'application','grobelisk','findone',1,'',2),(615,'application','grobelisk','findone',1,'',3),(616,'application','grobelisk','update',1,'',1),(617,'application','grobelisk','update',0,'',2),(618,'application','grobelisk','update',0,'',3),(619,'application','grobelisk','updaterelation',1,'',1),(620,'application','grobelisk','updaterelation',0,'',2),(621,'application','grobelisk','updaterelation',0,'',3),(622,'application','grobeliskgroup','count',1,'',1),(623,'application','grobeliskgroup','count',1,'',2),(624,'application','grobeliskgroup','count',1,'',3),(625,'application','grobeliskgroup','create',1,'',1),(626,'application','grobeliskgroup','create',0,'',2),(627,'application','grobeliskgroup','create',0,'',3),(628,'application','grobeliskgroup','createrelation',1,'',1),(629,'application','grobeliskgroup','createrelation',0,'',2),(630,'application','grobeliskgroup','createrelation',0,'',3),(631,'application','grobeliskgroup','destroy',1,'',1),(632,'application','grobeliskgroup','destroy',0,'',2),(633,'application','grobeliskgroup','destroy',0,'',3),(634,'application','grobeliskgroup','destroyrelation',1,'',1),(635,'application','grobeliskgroup','destroyrelation',0,'',2),(636,'application','grobeliskgroup','destroyrelation',0,'',3),(637,'application','grobeliskgroup','find',1,'',1),(638,'application','grobeliskgroup','find',1,'',2),(639,'application','grobeliskgroup','find',1,'',3),(640,'application','grobeliskgroup','findone',1,'',1),(641,'application','grobeliskgroup','findone',1,'',2),(642,'application','grobeliskgroup','findone',1,'',3),(643,'application','grobeliskgroup','update',1,'',1),(644,'application','grobeliskgroup','update',0,'',2),(645,'application','grobeliskgroup','update',0,'',3),(646,'application','grobeliskgroup','updaterelation',1,'',1),(647,'application','grobeliskgroup','updaterelation',0,'',2),(648,'application','grobeliskgroup','updaterelation',0,'',3),(649,'application','grobeliskgroupreport','count',1,'',1),(650,'application','grobeliskgroupreport','count',1,'',2),(651,'application','grobeliskgroupreport','count',1,'',3),(652,'application','grobeliskgroupreport','create',1,'',1),(653,'application','grobeliskgroupreport','create',1,'',2),(654,'application','grobeliskgroupreport','create',1,'',3),(655,'application','grobeliskgroupreport','createrelation',1,'',1),(656,'application','grobeliskgroupreport','createrelation',0,'',2),(657,'application','grobeliskgroupreport','createrelation',0,'',3),(658,'application','grobeliskgroupreport','destroy',1,'',1),(659,'application','grobeliskgroupreport','destroy',0,'',2),(660,'application','grobeliskgroupreport','destroy',0,'',3),(661,'application','grobeliskgroupreport','destroyrelation',1,'',1),(662,'application','grobeliskgroupreport','destroyrelation',0,'',2),(663,'application','grobeliskgroupreport','destroyrelation',0,'',3),(664,'application','grobeliskgroupreport','find',1,'',1),(665,'application','grobeliskgroupreport','find',1,'',2),(666,'application','grobeliskgroupreport','find',1,'',3),(667,'application','grobeliskgroupreport','findone',1,'',1),(668,'application','grobeliskgroupreport','findone',1,'',2),(669,'application','grobeliskgroupreport','findone',1,'',3),(670,'application','grobeliskgroupreport','update',1,'',1),(671,'application','grobeliskgroupreport','update',1,'',2),(672,'application','grobeliskgroupreport','update',1,'',3),(673,'application','grobeliskgroupreport','updaterelation',1,'',1),(674,'application','grobeliskgroupreport','updaterelation',0,'',2),(675,'application','grobeliskgroupreport','updaterelation',0,'',3),(676,'application','grobeliskreport','count',1,'',1),(677,'application','grobeliskreport','count',1,'',2),(678,'application','grobeliskreport','count',1,'',3),(679,'application','grobeliskreport','create',1,'',1),(680,'application','grobeliskreport','create',1,'',2),(681,'application','grobeliskreport','create',1,'',3),(682,'application','grobeliskreport','createrelation',1,'',1),(683,'application','grobeliskreport','createrelation',0,'',2),(684,'application','grobeliskreport','createrelation',0,'',3),(685,'application','grobeliskreport','destroy',1,'',1),(686,'application','grobeliskreport','destroy',0,'',2),(687,'application','grobeliskreport','destroy',0,'',3),(688,'application','grobeliskreport','destroyrelation',1,'',1),(689,'application','grobeliskreport','destroyrelation',0,'',2),(690,'application','grobeliskreport','destroyrelation',0,'',3),(691,'application','grobeliskreport','find',1,'',1),(692,'application','grobeliskreport','find',1,'',2),(693,'application','grobeliskreport','find',1,'',3),(694,'application','grobeliskreport','findone',1,'',1),(695,'application','grobeliskreport','findone',1,'',2),(696,'application','grobeliskreport','findone',1,'',3),(697,'application','grobeliskreport','update',1,'',1),(698,'application','grobeliskreport','update',1,'',2),(699,'application','grobeliskreport','update',1,'',3),(700,'application','grobeliskreport','updaterelation',1,'',1),(701,'application','grobeliskreport','updaterelation',0,'',2),(702,'application','grobeliskreport','updaterelation',0,'',3),(703,'application','grreport','count',1,'',1),(704,'application','grreport','count',1,'',2),(705,'application','grreport','count',1,'',3),(706,'application','grreport','create',1,'',1),(707,'application','grreport','create',1,'',2),(708,'application','grreport','create',1,'',3),(709,'application','grreport','createrelation',1,'',1),(710,'application','grreport','createrelation',0,'',2),(711,'application','grreport','createrelation',0,'',3),(712,'application','grreport','destroy',1,'',1),(713,'application','grreport','destroy',0,'',2),(714,'application','grreport','destroy',0,'',3),(715,'application','grreport','destroyrelation',1,'',1),(716,'application','grreport','destroyrelation',0,'',2),(717,'application','grreport','destroyrelation',0,'',3),(718,'application','grreport','find',1,'',1),(719,'application','grreport','find',1,'',2),(720,'application','grreport','find',1,'',3),(721,'application','grreport','findone',1,'',1),(722,'application','grreport','findone',1,'',2),(723,'application','grreport','findone',1,'',3),(724,'application','grreport','update',1,'',1),(725,'application','grreport','update',1,'',2),(726,'application','grreport','update',1,'',3),(727,'application','grreport','updaterelation',1,'',1),(728,'application','grreport','updaterelation',0,'',2),(729,'application','grreport','updaterelation',0,'',3),(730,'application','grsite','count',1,'',1),(731,'application','grsite','count',1,'',2),(732,'application','grsite','count',1,'',3),(733,'application','grsite','create',1,'',1),(734,'application','grsite','create',0,'',2),(735,'application','grsite','create',0,'',3),(736,'application','grsite','createrelation',1,'',1),(737,'application','grsite','createrelation',0,'',2),(738,'application','grsite','createrelation',0,'',3),(739,'application','grsite','destroy',1,'',1),(740,'application','grsite','destroy',0,'',2),(741,'application','grsite','destroy',0,'',3),(742,'application','grsite','destroyrelation',1,'',1),(743,'application','grsite','destroyrelation',0,'',2),(744,'application','grsite','destroyrelation',0,'',3),(745,'application','grsite','find',1,'',1),(746,'application','grsite','find',1,'',2),(747,'application','grsite','find',1,'',3),(748,'application','grsite','findone',1,'',1),(749,'application','grsite','findone',1,'',2),(750,'application','grsite','findone',1,'',3),(751,'application','grsite','update',1,'',1),(752,'application','grsite','update',0,'',2),(753,'application','grsite','update',0,'',3),(754,'application','grsite','updaterelation',1,'',1),(755,'application','grsite','updaterelation',0,'',2),(756,'application','grsite','updaterelation',0,'',3),(757,'application','grtype','count',1,'',1),(758,'application','grtype','count',1,'',2),(759,'application','grtype','count',1,'',3),(760,'application','grtype','create',1,'',1),(761,'application','grtype','create',0,'',2),(762,'application','grtype','create',0,'',3),(763,'application','grtype','createrelation',1,'',1),(764,'application','grtype','createrelation',0,'',2),(765,'application','grtype','createrelation',0,'',3),(766,'application','grtype','destroy',1,'',1),(767,'application','grtype','destroy',0,'',2),(768,'application','grtype','destroy',0,'',3),(769,'application','grtype','destroyrelation',1,'',1),(770,'application','grtype','destroyrelation',0,'',2),(771,'application','grtype','destroyrelation',0,'',3),(772,'application','grtype','find',1,'',1),(773,'application','grtype','find',1,'',2),(774,'application','grtype','find',1,'',3),(775,'application','grtype','findone',1,'',1),(776,'application','grtype','findone',1,'',2),(777,'application','grtype','findone',1,'',3),(778,'application','grtype','update',1,'',1),(779,'application','grtype','update',0,'',2),(780,'application','grtype','update',0,'',3),(781,'application','grtype','updaterelation',1,'',1),(782,'application','grtype','updaterelation',0,'',2),(783,'application','grtype','updaterelation',0,'',3),(784,'application','gsactivegroup','count',1,'',1),(785,'application','gsactivegroup','count',1,'',2),(786,'application','gsactivegroup','count',1,'',3),(787,'application','gsactivegroup','create',1,'',1),(788,'application','gsactivegroup','create',0,'',2),(789,'application','gsactivegroup','create',0,'',3),(790,'application','gsactivegroup','createrelation',1,'',1),(791,'application','gsactivegroup','createrelation',0,'',2),(792,'application','gsactivegroup','createrelation',0,'',3),(793,'application','gsactivegroup','destroy',1,'',1),(794,'application','gsactivegroup','destroy',0,'',2),(795,'application','gsactivegroup','destroy',0,'',3),(796,'application','gsactivegroup','destroyrelation',1,'',1),(797,'application','gsactivegroup','destroyrelation',0,'',2),(798,'application','gsactivegroup','destroyrelation',0,'',3),(799,'application','gsactivegroup','find',1,'',1),(800,'application','gsactivegroup','find',1,'',2),(801,'application','gsactivegroup','find',1,'',3),(802,'application','gsactivegroup','findone',1,'',1),(803,'application','gsactivegroup','findone',1,'',2),(804,'application','gsactivegroup','findone',1,'',3),(805,'application','gsactivegroup','update',1,'',1),(806,'application','gsactivegroup','update',0,'',2),(807,'application','gsactivegroup','update',0,'',3),(808,'application','gsactivegroup','updaterelation',1,'',1),(809,'application','gsactivegroup','updaterelation',0,'',2),(810,'application','gsactivegroup','updaterelation',0,'',3),(811,'application','gsactiveobelisk','count',1,'',1),(812,'application','gsactiveobelisk','count',1,'',2),(813,'application','gsactiveobelisk','count',1,'',3),(814,'application','gsactiveobelisk','create',1,'',1),(815,'application','gsactiveobelisk','create',0,'',2),(816,'application','gsactiveobelisk','create',0,'',3),(817,'application','gsactiveobelisk','createrelation',1,'',1),(818,'application','gsactiveobelisk','createrelation',0,'',2),(819,'application','gsactiveobelisk','createrelation',0,'',3),(820,'application','gsactiveobelisk','destroy',1,'',1),(821,'application','gsactiveobelisk','destroy',0,'',2),(822,'application','gsactiveobelisk','destroy',0,'',3),(823,'application','gsactiveobelisk','destroyrelation',1,'',1),(824,'application','gsactiveobelisk','destroyrelation',0,'',2),(825,'application','gsactiveobelisk','destroyrelation',0,'',3),(826,'application','gsactiveobelisk','find',1,'',1),(827,'application','gsactiveobelisk','find',1,'',2),(828,'application','gsactiveobelisk','find',1,'',3),(829,'application','gsactiveobelisk','findone',1,'',1),(830,'application','gsactiveobelisk','findone',1,'',2),(831,'application','gsactiveobelisk','findone',1,'',3),(832,'application','gsactiveobelisk','update',1,'',1),(833,'application','gsactiveobelisk','update',0,'',2),(834,'application','gsactiveobelisk','update',0,'',3),(835,'application','gsactiveobelisk','updaterelation',1,'',1),(836,'application','gsactiveobelisk','updaterelation',0,'',2),(837,'application','gsactiveobelisk','updaterelation',0,'',3),(838,'application','gsartifact','count',1,'',1),(839,'application','gsartifact','count',1,'',2),(840,'application','gsartifact','count',1,'',3),(841,'application','gsartifact','create',1,'',1),(842,'application','gsartifact','create',0,'',2),(843,'application','gsartifact','create',0,'',3),(844,'application','gsartifact','createrelation',1,'',1),(845,'application','gsartifact','createrelation',0,'',2),(846,'application','gsartifact','createrelation',0,'',3),(847,'application','gsartifact','destroy',1,'',1),(848,'application','gsartifact','destroy',0,'',2),(849,'application','gsartifact','destroy',0,'',3),(850,'application','gsartifact','destroyrelation',1,'',1),(851,'application','gsartifact','destroyrelation',0,'',2),(852,'application','gsartifact','destroyrelation',0,'',3),(853,'application','gsartifact','find',1,'',1),(854,'application','gsartifact','find',1,'',2),(855,'application','gsartifact','find',1,'',3),(856,'application','gsartifact','findone',1,'',1),(857,'application','gsartifact','findone',1,'',2),(858,'application','gsartifact','findone',1,'',3),(859,'application','gsartifact','update',1,'',1),(860,'application','gsartifact','update',0,'',2),(861,'application','gsartifact','update',0,'',3),(862,'application','gsartifact','updaterelation',1,'',1),(863,'application','gsartifact','updaterelation',0,'',2),(864,'application','gsartifact','updaterelation',0,'',3),(865,'application','gscodexcategory','count',1,'',1),(866,'application','gscodexcategory','count',1,'',2),(867,'application','gscodexcategory','count',1,'',3),(868,'application','gscodexcategory','create',1,'',1),(869,'application','gscodexcategory','create',0,'',2),(870,'application','gscodexcategory','create',0,'',3),(871,'application','gscodexcategory','createrelation',1,'',1),(872,'application','gscodexcategory','createrelation',0,'',2),(873,'application','gscodexcategory','createrelation',0,'',3),(874,'application','gscodexcategory','destroy',1,'',1),(875,'application','gscodexcategory','destroy',0,'',2),(876,'application','gscodexcategory','destroy',0,'',3),(877,'application','gscodexcategory','destroyrelation',1,'',1),(878,'application','gscodexcategory','destroyrelation',0,'',2),(879,'application','gscodexcategory','destroyrelation',0,'',3),(880,'application','gscodexcategory','find',1,'',1),(881,'application','gscodexcategory','find',1,'',2),(882,'application','gscodexcategory','find',1,'',3),(883,'application','gscodexcategory','findone',1,'',1),(884,'application','gscodexcategory','findone',1,'',2),(885,'application','gscodexcategory','findone',1,'',3),(886,'application','gscodexcategory','update',1,'',1),(887,'application','gscodexcategory','update',0,'',2),(888,'application','gscodexcategory','update',0,'',3),(889,'application','gscodexcategory','updaterelation',1,'',1),(890,'application','gscodexcategory','updaterelation',0,'',2),(891,'application','gscodexcategory','updaterelation',0,'',3),(892,'application','gscodexdata','count',1,'',1),(893,'application','gscodexdata','count',1,'',2),(894,'application','gscodexdata','count',1,'',3),(895,'application','gscodexdata','create',1,'',1),(896,'application','gscodexdata','create',0,'',2),(897,'application','gscodexdata','create',0,'',3),(898,'application','gscodexdata','createrelation',1,'',1),(899,'application','gscodexdata','createrelation',0,'',2),(900,'application','gscodexdata','createrelation',0,'',3),(901,'application','gscodexdata','destroy',1,'',1),(902,'application','gscodexdata','destroy',0,'',2),(903,'application','gscodexdata','destroy',0,'',3),(904,'application','gscodexdata','destroyrelation',1,'',1),(905,'application','gscodexdata','destroyrelation',0,'',2),(906,'application','gscodexdata','destroyrelation',0,'',3),(907,'application','gscodexdata','find',1,'',1),(908,'application','gscodexdata','find',1,'',2),(909,'application','gscodexdata','find',1,'',3),(910,'application','gscodexdata','findone',1,'',1),(911,'application','gscodexdata','findone',1,'',2),(912,'application','gscodexdata','findone',1,'',3),(913,'application','gscodexdata','update',1,'',1),(914,'application','gscodexdata','update',0,'',2),(915,'application','gscodexdata','update',0,'',3),(916,'application','gscodexdata','updaterelation',1,'',1),(917,'application','gscodexdata','updaterelation',0,'',2),(918,'application','gscodexdata','updaterelation',0,'',3),(919,'application','gsobelisk','count',1,'',1),(920,'application','gsobelisk','count',1,'',2),(921,'application','gsobelisk','count',1,'',3),(922,'application','gsobelisk','create',1,'',1),(923,'application','gsobelisk','create',0,'',2),(924,'application','gsobelisk','create',0,'',3),(925,'application','gsobelisk','createrelation',1,'',1),(926,'application','gsobelisk','createrelation',0,'',2),(927,'application','gsobelisk','createrelation',0,'',3),(928,'application','gsobelisk','destroy',1,'',1),(929,'application','gsobelisk','destroy',0,'',2),(930,'application','gsobelisk','destroy',0,'',3),(931,'application','gsobelisk','destroyrelation',1,'',1),(932,'application','gsobelisk','destroyrelation',0,'',2),(933,'application','gsobelisk','destroyrelation',0,'',3),(934,'application','gsobelisk','find',1,'',1),(935,'application','gsobelisk','find',1,'',2),(936,'application','gsobelisk','find',1,'',3),(937,'application','gsobelisk','findone',1,'',1),(938,'application','gsobelisk','findone',1,'',2),(939,'application','gsobelisk','findone',1,'',3),(940,'application','gsobelisk','update',1,'',1),(941,'application','gsobelisk','update',0,'',2),(942,'application','gsobelisk','update',0,'',3),(943,'application','gsobelisk','updaterelation',1,'',1),(944,'application','gsobelisk','updaterelation',0,'',2),(945,'application','gsobelisk','updaterelation',0,'',3),(946,'application','gsobeliskgroup','count',1,'',1),(947,'application','gsobeliskgroup','count',1,'',2),(948,'application','gsobeliskgroup','count',1,'',3),(949,'application','gsobeliskgroup','create',1,'',1),(950,'application','gsobeliskgroup','create',0,'',2),(951,'application','gsobeliskgroup','create',0,'',3),(952,'application','gsobeliskgroup','createrelation',1,'',1),(953,'application','gsobeliskgroup','createrelation',0,'',2),(954,'application','gsobeliskgroup','createrelation',0,'',3),(955,'application','gsobeliskgroup','destroy',1,'',1),(956,'application','gsobeliskgroup','destroy',0,'',2),(957,'application','gsobeliskgroup','destroy',0,'',3),(958,'application','gsobeliskgroup','destroyrelation',1,'',1),(959,'application','gsobeliskgroup','destroyrelation',0,'',2),(960,'application','gsobeliskgroup','destroyrelation',0,'',3),(961,'application','gsobeliskgroup','find',1,'',1),(962,'application','gsobeliskgroup','find',1,'',2),(963,'application','gsobeliskgroup','find',1,'',3),(964,'application','gsobeliskgroup','findone',1,'',1),(965,'application','gsobeliskgroup','findone',1,'',2),(966,'application','gsobeliskgroup','findone',1,'',3),(967,'application','gsobeliskgroup','update',1,'',1),(968,'application','gsobeliskgroup','update',0,'',2),(969,'application','gsobeliskgroup','update',0,'',3),(970,'application','gsobeliskgroup','updaterelation',1,'',1),(971,'application','gsobeliskgroup','updaterelation',0,'',2),(972,'application','gsobeliskgroup','updaterelation',0,'',3),(973,'application','gsobeliskgroupreport','count',1,'',1),(974,'application','gsobeliskgroupreport','count',1,'',2),(975,'application','gsobeliskgroupreport','count',1,'',3),(976,'application','gsobeliskgroupreport','create',1,'',1),(977,'application','gsobeliskgroupreport','create',1,'',2),(978,'application','gsobeliskgroupreport','create',1,'',3),(979,'application','gsobeliskgroupreport','createrelation',1,'',1),(980,'application','gsobeliskgroupreport','createrelation',0,'',2),(981,'application','gsobeliskgroupreport','createrelation',0,'',3),(982,'application','gsobeliskgroupreport','destroy',1,'',1),(983,'application','gsobeliskgroupreport','destroy',0,'',2),(984,'application','gsobeliskgroupreport','destroy',0,'',3),(985,'application','gsobeliskgroupreport','destroyrelation',1,'',1),(986,'application','gsobeliskgroupreport','destroyrelation',0,'',2),(987,'application','gsobeliskgroupreport','destroyrelation',0,'',3),(988,'application','gsobeliskgroupreport','find',1,'',1),(989,'application','gsobeliskgroupreport','find',1,'',2),(990,'application','gsobeliskgroupreport','find',1,'',3),(991,'application','gsobeliskgroupreport','findone',1,'',1),(992,'application','gsobeliskgroupreport','findone',1,'',2),(993,'application','gsobeliskgroupreport','findone',1,'',3),(994,'application','gsobeliskgroupreport','update',1,'',1),(995,'application','gsobeliskgroupreport','update',1,'',2),(996,'application','gsobeliskgroupreport','update',1,'',3),(997,'application','gsobeliskgroupreport','updaterelation',1,'',1),(998,'application','gsobeliskgroupreport','updaterelation',0,'',2),(999,'application','gsobeliskgroupreport','updaterelation',0,'',3),(1000,'application','gsobeliskreport','count',1,'',1),(1001,'application','gsobeliskreport','count',1,'',2),(1002,'application','gsobeliskreport','count',1,'',3),(1003,'application','gsobeliskreport','create',1,'',1),(1004,'application','gsobeliskreport','create',1,'',2),(1005,'application','gsobeliskreport','create',1,'',3),(1006,'application','gsobeliskreport','createrelation',1,'',1),(1007,'application','gsobeliskreport','createrelation',0,'',2),(1008,'application','gsobeliskreport','createrelation',0,'',3),(1009,'application','gsobeliskreport','destroy',1,'',1),(1010,'application','gsobeliskreport','destroy',0,'',2),(1011,'application','gsobeliskreport','destroy',0,'',3),(1012,'application','gsobeliskreport','destroyrelation',1,'',1),(1013,'application','gsobeliskreport','destroyrelation',0,'',2),(1014,'application','gsobeliskreport','destroyrelation',0,'',3),(1015,'application','gsobeliskreport','find',1,'',1),(1016,'application','gsobeliskreport','find',1,'',2),(1017,'application','gsobeliskreport','find',1,'',3),(1018,'application','gsobeliskreport','findone',1,'',1),(1019,'application','gsobeliskreport','findone',1,'',2),(1020,'application','gsobeliskreport','findone',1,'',3),(1021,'application','gsobeliskreport','update',1,'',1),(1022,'application','gsobeliskreport','update',1,'',2),(1023,'application','gsobeliskreport','update',1,'',3),(1024,'application','gsobeliskreport','updaterelation',1,'',1),(1025,'application','gsobeliskreport','updaterelation',0,'',2),(1026,'application','gsobeliskreport','updaterelation',0,'',3),(1027,'application','gsreport','count',1,'',1),(1028,'application','gsreport','count',1,'',2),(1029,'application','gsreport','count',1,'',3),(1030,'application','gsreport','create',1,'',1),(1031,'application','gsreport','create',1,'',2),(1032,'application','gsreport','create',1,'',3),(1033,'application','gsreport','createrelation',1,'',1),(1034,'application','gsreport','createrelation',0,'',2),(1035,'application','gsreport','createrelation',0,'',3),(1036,'application','gsreport','destroy',1,'',1),(1037,'application','gsreport','destroy',0,'',2),(1038,'application','gsreport','destroy',0,'',3),(1039,'application','gsreport','destroyrelation',1,'',1),(1040,'application','gsreport','destroyrelation',0,'',2),(1041,'application','gsreport','destroyrelation',0,'',3),(1042,'application','gsreport','find',1,'',1),(1043,'application','gsreport','find',1,'',2),(1044,'application','gsreport','find',1,'',3),(1045,'application','gsreport','findone',1,'',1),(1046,'application','gsreport','findone',1,'',2),(1047,'application','gsreport','findone',1,'',3),(1048,'application','gsreport','update',1,'',1),(1049,'application','gsreport','update',1,'',2),(1050,'application','gsreport','update',1,'',3),(1051,'application','gsreport','updaterelation',1,'',1),(1052,'application','gsreport','updaterelation',0,'',2),(1053,'application','gsreport','updaterelation',0,'',3),(1054,'application','gssite','count',1,'',1),(1055,'application','gssite','count',1,'',2),(1056,'application','gssite','count',1,'',3),(1057,'application','gssite','create',1,'',1),(1058,'application','gssite','create',0,'',2),(1059,'application','gssite','create',0,'',3),(1060,'application','gssite','createrelation',1,'',1),(1061,'application','gssite','createrelation',0,'',2),(1062,'application','gssite','createrelation',0,'',3),(1063,'application','gssite','destroy',1,'',1),(1064,'application','gssite','destroy',0,'',2),(1065,'application','gssite','destroy',0,'',3),(1066,'application','gssite','destroyrelation',1,'',1),(1067,'application','gssite','destroyrelation',0,'',2),(1068,'application','gssite','destroyrelation',0,'',3),(1069,'application','gssite','find',1,'',1),(1070,'application','gssite','find',1,'',2),(1071,'application','gssite','find',1,'',3),(1072,'application','gssite','findone',1,'',1),(1073,'application','gssite','findone',1,'',2),(1074,'application','gssite','findone',1,'',3),(1075,'application','gssite','update',1,'',1),(1076,'application','gssite','update',0,'',2),(1077,'application','gssite','update',0,'',3),(1078,'application','gssite','updaterelation',1,'',1),(1079,'application','gssite','updaterelation',0,'',2),(1080,'application','gssite','updaterelation',0,'',3),(1081,'application','gstype','count',1,'',1),(1082,'application','gstype','count',1,'',2),(1083,'application','gstype','count',1,'',3),(1084,'application','gstype','create',1,'',1),(1085,'application','gstype','create',0,'',2),(1086,'application','gstype','create',0,'',3),(1087,'application','gstype','createrelation',1,'',1),(1088,'application','gstype','createrelation',0,'',2),(1089,'application','gstype','createrelation',0,'',3),(1090,'application','gstype','destroy',1,'',1),(1091,'application','gstype','destroy',0,'',2),(1092,'application','gstype','destroy',0,'',3),(1093,'application','gstype','destroyrelation',1,'',1),(1094,'application','gstype','destroyrelation',0,'',2),(1095,'application','gstype','destroyrelation',0,'',3),(1096,'application','gstype','find',1,'',1),(1097,'application','gstype','find',1,'',2),(1098,'application','gstype','find',1,'',3),(1099,'application','gstype','findone',1,'',1),(1100,'application','gstype','findone',1,'',2),(1101,'application','gstype','findone',1,'',3),(1102,'application','gstype','update',1,'',1),(1103,'application','gstype','update',0,'',2),(1104,'application','gstype','update',0,'',3),(1105,'application','gstype','updaterelation',1,'',1),(1106,'application','gstype','updaterelation',0,'',2),(1107,'application','gstype','updaterelation',0,'',3),(1108,'application','gyreport','count',1,'',1),(1109,'application','gyreport','count',1,'',2),(1110,'application','gyreport','count',1,'',3),(1111,'application','gyreport','create',1,'',1),(1112,'application','gyreport','create',1,'',2),(1113,'application','gyreport','create',1,'',3),(1114,'application','gyreport','createrelation',1,'',1),(1115,'application','gyreport','createrelation',0,'',2),(1116,'application','gyreport','createrelation',0,'',3),(1117,'application','gyreport','destroy',1,'',1),(1118,'application','gyreport','destroy',0,'',2),(1119,'application','gyreport','destroy',0,'',3),(1120,'application','gyreport','destroyrelation',1,'',1),(1121,'application','gyreport','destroyrelation',0,'',2),(1122,'application','gyreport','destroyrelation',0,'',3),(1123,'application','gyreport','find',1,'',1),(1124,'application','gyreport','find',1,'',2),(1125,'application','gyreport','find',1,'',3),(1126,'application','gyreport','findone',1,'',1),(1127,'application','gyreport','findone',1,'',2),(1128,'application','gyreport','findone',1,'',3),(1129,'application','gyreport','update',1,'',1),(1130,'application','gyreport','update',1,'',2),(1131,'application','gyreport','update',1,'',3),(1132,'application','gyreport','updaterelation',1,'',1),(1133,'application','gyreport','updaterelation',0,'',2),(1134,'application','gyreport','updaterelation',0,'',3),(1135,'application','gysite','count',1,'',1),(1136,'application','gysite','count',1,'',2),(1137,'application','gysite','count',1,'',3),(1138,'application','gysite','create',1,'',1),(1139,'application','gysite','create',0,'',2),(1140,'application','gysite','create',0,'',3),(1141,'application','gysite','createrelation',1,'',1),(1142,'application','gysite','createrelation',0,'',2),(1143,'application','gysite','createrelation',0,'',3),(1144,'application','gysite','destroy',1,'',1),(1145,'application','gysite','destroy',0,'',2),(1146,'application','gysite','destroy',0,'',3),(1147,'application','gysite','destroyrelation',1,'',1),(1148,'application','gysite','destroyrelation',0,'',2),(1149,'application','gysite','destroyrelation',0,'',3),(1150,'application','gysite','find',1,'',1),(1151,'application','gysite','find',1,'',2),(1152,'application','gysite','find',1,'',3),(1153,'application','gysite','findone',1,'',1),(1154,'application','gysite','findone',1,'',2),(1155,'application','gysite','findone',1,'',3),(1156,'application','gysite','update',1,'',1),(1157,'application','gysite','update',0,'',2),(1158,'application','gysite','update',0,'',3),(1159,'application','gysite','updaterelation',1,'',1),(1160,'application','gysite','updaterelation',0,'',2),(1161,'application','gysite','updaterelation',0,'',3),(1162,'application','gytype','count',1,'',1),(1163,'application','gytype','count',1,'',2),(1164,'application','gytype','count',1,'',3),(1165,'application','gytype','create',1,'',1),(1166,'application','gytype','create',0,'',2),(1167,'application','gytype','create',0,'',3),(1168,'application','gytype','createrelation',1,'',1),(1169,'application','gytype','createrelation',0,'',2),(1170,'application','gytype','createrelation',0,'',3),(1171,'application','gytype','destroy',1,'',1),(1172,'application','gytype','destroy',0,'',2),(1173,'application','gytype','destroy',0,'',3),(1174,'application','gytype','destroyrelation',1,'',1),(1175,'application','gytype','destroyrelation',0,'',2),(1176,'application','gytype','destroyrelation',0,'',3),(1177,'application','gytype','find',1,'',1),(1178,'application','gytype','find',1,'',2),(1179,'application','gytype','find',1,'',3),(1180,'application','gytype','findone',1,'',1),(1181,'application','gytype','findone',1,'',2),(1182,'application','gytype','findone',1,'',3),(1183,'application','gytype','update',1,'',1),(1184,'application','gytype','update',0,'',2),(1185,'application','gytype','update',0,'',3),(1186,'application','gytype','updaterelation',1,'',1),(1187,'application','gytype','updaterelation',0,'',2),(1188,'application','gytype','updaterelation',0,'',3),(1189,'application','journaldata','count',1,'',1),(1190,'application','journaldata','count',1,'',2),(1191,'application','journaldata','count',1,'',3),(1192,'application','journaldata','create',1,'',1),(1193,'application','journaldata','create',0,'',2),(1194,'application','journaldata','create',0,'',3),(1195,'application','journaldata','createrelation',1,'',1),(1196,'application','journaldata','createrelation',0,'',2),(1197,'application','journaldata','createrelation',0,'',3),(1198,'application','journaldata','destroy',1,'',1),(1199,'application','journaldata','destroy',0,'',2),(1200,'application','journaldata','destroy',0,'',3),(1201,'application','journaldata','destroyrelation',1,'',1),(1202,'application','journaldata','destroyrelation',0,'',2),(1203,'application','journaldata','destroyrelation',0,'',3),(1204,'application','journaldata','find',1,'',1),(1205,'application','journaldata','find',1,'',2),(1206,'application','journaldata','find',1,'',3),(1207,'application','journaldata','findone',1,'',1),(1208,'application','journaldata','findone',1,'',2),(1209,'application','journaldata','findone',1,'',3),(1210,'application','journaldata','update',1,'',1),(1211,'application','journaldata','update',0,'',2),(1212,'application','journaldata','update',0,'',3),(1213,'application','journaldata','updaterelation',1,'',1),(1214,'application','journaldata','updaterelation',0,'',2),(1215,'application','journaldata','updaterelation',0,'',3),(1216,'application','location','count',1,'',1),(1217,'application','location','count',1,'',2),(1218,'application','location','count',1,'',3),(1219,'application','location','create',1,'',1),(1220,'application','location','create',0,'',2),(1221,'application','location','create',0,'',3),(1222,'application','location','createrelation',1,'',1),(1223,'application','location','createrelation',0,'',2),(1224,'application','location','createrelation',0,'',3),(1225,'application','location','destroy',1,'',1),(1226,'application','location','destroy',0,'',2),(1227,'application','location','destroy',0,'',3),(1228,'application','location','destroyrelation',1,'',1),(1229,'application','location','destroyrelation',0,'',2),(1230,'application','location','destroyrelation',0,'',3),(1231,'application','location','find',1,'',1),(1232,'application','location','find',1,'',2),(1233,'application','location','find',1,'',3),(1234,'application','location','findone',1,'',1),(1235,'application','location','findone',1,'',2),(1236,'application','location','findone',1,'',3),(1237,'application','location','update',1,'',1),(1238,'application','location','update',0,'',2),(1239,'application','location','update',0,'',3),(1240,'application','location','updaterelation',1,'',1),(1241,'application','location','updaterelation',0,'',2),(1242,'application','location','updaterelation',0,'',3),(1243,'application','lsreport','count',1,'',1),(1244,'application','lsreport','count',1,'',2),(1245,'application','lsreport','count',1,'',3),(1246,'application','lsreport','create',1,'',1),(1247,'application','lsreport','create',1,'',2),(1248,'application','lsreport','create',1,'',3),(1249,'application','lsreport','createrelation',1,'',1),(1250,'application','lsreport','createrelation',0,'',2),(1251,'application','lsreport','createrelation',0,'',3),(1252,'application','lsreport','destroy',1,'',1),(1253,'application','lsreport','destroy',0,'',2),(1254,'application','lsreport','destroy',0,'',3),(1255,'application','lsreport','destroyrelation',1,'',1),(1256,'application','lsreport','destroyrelation',0,'',2),(1257,'application','lsreport','destroyrelation',0,'',3),(1258,'application','lsreport','find',1,'',1),(1259,'application','lsreport','find',1,'',2),(1260,'application','lsreport','find',1,'',3),(1261,'application','lsreport','findone',1,'',1),(1262,'application','lsreport','findone',1,'',2),(1263,'application','lsreport','findone',1,'',3),(1264,'application','lsreport','update',1,'',1),(1265,'application','lsreport','update',1,'',2),(1266,'application','lsreport','update',1,'',3),(1267,'application','lsreport','updaterelation',1,'',1),(1268,'application','lsreport','updaterelation',0,'',2),(1269,'application','lsreport','updaterelation',0,'',3),(1270,'application','lssite','count',1,'',1),(1271,'application','lssite','count',1,'',2),(1272,'application','lssite','count',1,'',3),(1273,'application','lssite','create',1,'',1),(1274,'application','lssite','create',0,'',2),(1275,'application','lssite','create',0,'',3),(1276,'application','lssite','createrelation',1,'',1),(1277,'application','lssite','createrelation',0,'',2),(1278,'application','lssite','createrelation',0,'',3),(1279,'application','lssite','destroy',1,'',1),(1280,'application','lssite','destroy',0,'',2),(1281,'application','lssite','destroy',0,'',3),(1282,'application','lssite','destroyrelation',1,'',1),(1283,'application','lssite','destroyrelation',0,'',2),(1284,'application','lssite','destroyrelation',0,'',3),(1285,'application','lssite','find',1,'',1),(1286,'application','lssite','find',1,'',2),(1287,'application','lssite','find',1,'',3),(1288,'application','lssite','findone',1,'',1),(1289,'application','lssite','findone',1,'',2),(1290,'application','lssite','findone',1,'',3),(1291,'application','lssite','update',1,'',1),(1292,'application','lssite','update',0,'',2),(1293,'application','lssite','update',0,'',3),(1294,'application','lssite','updaterelation',1,'',1),(1295,'application','lssite','updaterelation',0,'',2),(1296,'application','lssite','updaterelation',0,'',3),(1297,'application','msreport','count',1,'',1),(1298,'application','msreport','count',1,'',2),(1299,'application','msreport','count',1,'',3),(1300,'application','msreport','create',1,'',1),(1301,'application','msreport','create',1,'',2),(1302,'application','msreport','create',1,'',3),(1303,'application','msreport','createrelation',1,'',1),(1304,'application','msreport','createrelation',0,'',2),(1305,'application','msreport','createrelation',0,'',3),(1306,'application','msreport','destroy',1,'',1),(1307,'application','msreport','destroy',0,'',2),(1308,'application','msreport','destroy',0,'',3),(1309,'application','msreport','destroyrelation',1,'',1),(1310,'application','msreport','destroyrelation',0,'',2),(1311,'application','msreport','destroyrelation',0,'',3),(1312,'application','msreport','find',1,'',1),(1313,'application','msreport','find',1,'',2),(1314,'application','msreport','find',1,'',3),(1315,'application','msreport','findone',1,'',1),(1316,'application','msreport','findone',1,'',2),(1317,'application','msreport','findone',1,'',3),(1318,'application','msreport','update',1,'',1),(1319,'application','msreport','update',1,'',2),(1320,'application','msreport','update',1,'',3),(1321,'application','msreport','updaterelation',1,'',1),(1322,'application','msreport','updaterelation',0,'',2),(1323,'application','msreport','updaterelation',0,'',3),(1324,'application','mssite','count',1,'',1),(1325,'application','mssite','count',1,'',2),(1326,'application','mssite','count',1,'',3),(1327,'application','mssite','create',1,'',1),(1328,'application','mssite','create',0,'',2),(1329,'application','mssite','create',0,'',3),(1330,'application','mssite','createrelation',1,'',1),(1331,'application','mssite','createrelation',0,'',2),(1332,'application','mssite','createrelation',0,'',3),(1333,'application','mssite','destroy',1,'',1),(1334,'application','mssite','destroy',0,'',2),(1335,'application','mssite','destroy',0,'',3),(1336,'application','mssite','destroyrelation',1,'',1),(1337,'application','mssite','destroyrelation',0,'',2),(1338,'application','mssite','destroyrelation',0,'',3),(1339,'application','mssite','find',1,'',1),(1340,'application','mssite','find',1,'',2),(1341,'application','mssite','find',1,'',3),(1342,'application','mssite','findone',1,'',1),(1343,'application','mssite','findone',1,'',2),(1344,'application','mssite','findone',1,'',3),(1345,'application','mssite','update',1,'',1),(1346,'application','mssite','update',0,'',2),(1347,'application','mssite','update',0,'',3),(1348,'application','mssite','updaterelation',1,'',1),(1349,'application','mssite','updaterelation',0,'',2),(1350,'application','mssite','updaterelation',0,'',3),(1351,'application','mstype','count',1,'',1),(1352,'application','mstype','count',1,'',2),(1353,'application','mstype','count',1,'',3),(1354,'application','mstype','create',1,'',1),(1355,'application','mstype','create',0,'',2),(1356,'application','mstype','create',0,'',3),(1357,'application','mstype','createrelation',1,'',1),(1358,'application','mstype','createrelation',0,'',2),(1359,'application','mstype','createrelation',0,'',3),(1360,'application','mstype','destroy',1,'',1),(1361,'application','mstype','destroy',0,'',2),(1362,'application','mstype','destroy',0,'',3),(1363,'application','mstype','destroyrelation',1,'',1),(1364,'application','mstype','destroyrelation',0,'',2),(1365,'application','mstype','destroyrelation',0,'',3),(1366,'application','mstype','find',1,'',1),(1367,'application','mstype','find',1,'',2),(1368,'application','mstype','find',1,'',3),(1369,'application','mstype','findone',1,'',1),(1370,'application','mstype','findone',1,'',2),(1371,'application','mstype','findone',1,'',3),(1372,'application','mstype','update',1,'',1),(1373,'application','mstype','update',0,'',2),(1374,'application','mstype','update',0,'',3),(1375,'application','mstype','updaterelation',1,'',1),(1376,'application','mstype','updaterelation',0,'',2),(1377,'application','mstype','updaterelation',0,'',3),(1378,'application','ring','count',1,'',1),(1379,'application','ring','count',1,'',2),(1380,'application','ring','count',1,'',3),(1381,'application','ring','create',1,'',1),(1382,'application','ring','create',0,'',2),(1383,'application','ring','create',0,'',3),(1384,'application','ring','createrelation',1,'',1),(1385,'application','ring','createrelation',0,'',2),(1386,'application','ring','createrelation',0,'',3),(1387,'application','ring','destroy',1,'',1),(1388,'application','ring','destroy',0,'',2),(1389,'application','ring','destroy',0,'',3),(1390,'application','ring','destroyrelation',1,'',1),(1391,'application','ring','destroyrelation',0,'',2),(1392,'application','ring','destroyrelation',0,'',3),(1393,'application','ring','find',1,'',1),(1394,'application','ring','find',1,'',2),(1395,'application','ring','find',1,'',3),(1396,'application','ring','findone',1,'',1),(1397,'application','ring','findone',1,'',2),(1398,'application','ring','findone',1,'',3),(1399,'application','ring','update',1,'',1),(1400,'application','ring','update',0,'',2),(1401,'application','ring','update',0,'',3),(1402,'application','ring','updaterelation',1,'',1),(1403,'application','ring','updaterelation',0,'',2),(1404,'application','ring','updaterelation',0,'',3),(1405,'application','ringtype','count',1,'',1),(1406,'application','ringtype','count',1,'',2),(1407,'application','ringtype','count',1,'',3),(1408,'application','ringtype','create',1,'',1),(1409,'application','ringtype','create',0,'',2),(1410,'application','ringtype','create',0,'',3),(1411,'application','ringtype','createrelation',1,'',1),(1412,'application','ringtype','createrelation',0,'',2),(1413,'application','ringtype','createrelation',0,'',3),(1414,'application','ringtype','destroy',1,'',1),(1415,'application','ringtype','destroy',0,'',2),(1416,'application','ringtype','destroy',0,'',3),(1417,'application','ringtype','destroyrelation',1,'',1),(1418,'application','ringtype','destroyrelation',0,'',2),(1419,'application','ringtype','destroyrelation',0,'',3),(1420,'application','ringtype','find',1,'',1),(1421,'application','ringtype','find',1,'',2),(1422,'application','ringtype','find',1,'',3),(1423,'application','ringtype','findone',1,'',1),(1424,'application','ringtype','findone',1,'',2),(1425,'application','ringtype','findone',1,'',3),(1426,'application','ringtype','update',1,'',1),(1427,'application','ringtype','update',0,'',2),(1428,'application','ringtype','update',0,'',3),(1429,'application','ringtype','updaterelation',1,'',1),(1430,'application','ringtype','updaterelation',0,'',2),(1431,'application','ringtype','updaterelation',0,'',3),(1432,'application','system','count',1,'',1),(1433,'application','system','count',1,'',2),(1434,'application','system','count',1,'',3),(1435,'application','system','create',1,'',1),(1436,'application','system','create',0,'',2),(1437,'application','system','create',0,'',3),(1438,'application','system','createrelation',1,'',1),(1439,'application','system','createrelation',0,'',2),(1440,'application','system','createrelation',0,'',3),(1441,'application','system','destroy',1,'',1),(1442,'application','system','destroy',0,'',2),(1443,'application','system','destroy',0,'',3),(1444,'application','system','destroyrelation',1,'',1),(1445,'application','system','destroyrelation',0,'',2),(1446,'application','system','destroyrelation',0,'',3),(1447,'application','system','find',1,'',1),(1448,'application','system','find',1,'',2),(1449,'application','system','find',1,'',3),(1450,'application','system','findone',1,'',1),(1451,'application','system','findone',1,'',2),(1452,'application','system','findone',1,'',3),(1453,'application','system','update',1,'',1),(1454,'application','system','update',0,'',2),(1455,'application','system','update',0,'',3),(1456,'application','system','updaterelation',1,'',1),(1457,'application','system','updaterelation',0,'',2),(1458,'application','system','updaterelation',0,'',3),(1459,'application','tbreport','count',1,'',1),(1460,'application','tbreport','count',1,'',2),(1461,'application','tbreport','count',1,'',3),(1462,'application','tbreport','create',1,'',1),(1463,'application','tbreport','create',1,'',2),(1464,'application','tbreport','create',1,'',3),(1465,'application','tbreport','createrelation',1,'',1),(1466,'application','tbreport','createrelation',0,'',2),(1467,'application','tbreport','createrelation',0,'',3),(1468,'application','tbreport','destroy',1,'',1),(1469,'application','tbreport','destroy',0,'',2),(1470,'application','tbreport','destroy',0,'',3),(1471,'application','tbreport','destroyrelation',1,'',1),(1472,'application','tbreport','destroyrelation',0,'',2),(1473,'application','tbreport','destroyrelation',0,'',3),(1474,'application','tbreport','find',1,'',1),(1475,'application','tbreport','find',1,'',2),(1476,'application','tbreport','find',1,'',3),(1477,'application','tbreport','findone',1,'',1),(1478,'application','tbreport','findone',1,'',2),(1479,'application','tbreport','findone',1,'',3),(1480,'application','tbreport','update',1,'',1),(1481,'application','tbreport','update',1,'',2),(1482,'application','tbreport','update',1,'',3),(1483,'application','tbreport','updaterelation',1,'',1),(1484,'application','tbreport','updaterelation',0,'',2),(1485,'application','tbreport','updaterelation',0,'',3),(1486,'application','tbsite','count',1,'',1),(1487,'application','tbsite','count',1,'',2),(1488,'application','tbsite','count',1,'',3),(1489,'application','tbsite','create',1,'',1),(1490,'application','tbsite','create',0,'',2),(1491,'application','tbsite','create',0,'',3),(1492,'application','tbsite','createrelation',1,'',1),(1493,'application','tbsite','createrelation',0,'',2),(1494,'application','tbsite','createrelation',0,'',3),(1495,'application','tbsite','destroy',1,'',1),(1496,'application','tbsite','destroy',0,'',2),(1497,'application','tbsite','destroy',0,'',3),(1498,'application','tbsite','destroyrelation',1,'',1),(1499,'application','tbsite','destroyrelation',0,'',2),(1500,'application','tbsite','destroyrelation',0,'',3),(1501,'application','tbsite','find',1,'',1),(1502,'application','tbsite','find',1,'',2),(1503,'application','tbsite','find',1,'',3),(1504,'application','tbsite','findone',1,'',1),(1505,'application','tbsite','findone',1,'',2),(1506,'application','tbsite','findone',1,'',3),(1507,'application','tbsite','update',1,'',1),(1508,'application','tbsite','update',0,'',2),(1509,'application','tbsite','update',0,'',3),(1510,'application','tbsite','updaterelation',1,'',1),(1511,'application','tbsite','updaterelation',0,'',2),(1512,'application','tbsite','updaterelation',0,'',3),(1513,'application','tbtype','count',1,'',1),(1514,'application','tbtype','count',1,'',2),(1515,'application','tbtype','count',1,'',3),(1516,'application','tbtype','create',1,'',1),(1517,'application','tbtype','create',0,'',2),(1518,'application','tbtype','create',0,'',3),(1519,'application','tbtype','createrelation',1,'',1),(1520,'application','tbtype','createrelation',0,'',2),(1521,'application','tbtype','createrelation',0,'',3),(1522,'application','tbtype','destroy',1,'',1),(1523,'application','tbtype','destroy',0,'',2),(1524,'application','tbtype','destroy',0,'',3),(1525,'application','tbtype','destroyrelation',1,'',1),(1526,'application','tbtype','destroyrelation',0,'',2),(1527,'application','tbtype','destroyrelation',0,'',3),(1528,'application','tbtype','find',1,'',1),(1529,'application','tbtype','find',1,'',2),(1530,'application','tbtype','find',1,'',3),(1531,'application','tbtype','findone',1,'',1),(1532,'application','tbtype','findone',1,'',2),(1533,'application','tbtype','findone',1,'',3),(1534,'application','tbtype','update',1,'',1),(1535,'application','tbtype','update',0,'',2),(1536,'application','tbtype','update',0,'',3),(1537,'application','tbtype','updaterelation',1,'',1),(1538,'application','tbtype','updaterelation',0,'',2),(1539,'application','tbtype','updaterelation',0,'',3),(1540,'application','tsreport','count',1,'',1),(1541,'application','tsreport','count',1,'',2),(1542,'application','tsreport','count',1,'',3),(1543,'application','tsreport','create',1,'',1),(1544,'application','tsreport','create',1,'',2),(1545,'application','tsreport','create',1,'',3),(1546,'application','tsreport','createrelation',1,'',1),(1547,'application','tsreport','createrelation',0,'',2),(1548,'application','tsreport','createrelation',0,'',3),(1549,'application','tsreport','destroy',1,'',1),(1550,'application','tsreport','destroy',0,'',2),(1551,'application','tsreport','destroy',0,'',3),(1552,'application','tsreport','destroyrelation',1,'',1),(1553,'application','tsreport','destroyrelation',0,'',2),(1554,'application','tsreport','destroyrelation',0,'',3),(1555,'application','tsreport','find',1,'',1),(1556,'application','tsreport','find',1,'',2),(1557,'application','tsreport','find',1,'',3),(1558,'application','tsreport','findone',1,'',1),(1559,'application','tsreport','findone',1,'',2),(1560,'application','tsreport','findone',1,'',3),(1561,'application','tsreport','update',1,'',1),(1562,'application','tsreport','update',1,'',2),(1563,'application','tsreport','update',1,'',3),(1564,'application','tsreport','updaterelation',1,'',1),(1565,'application','tsreport','updaterelation',0,'',2),(1566,'application','tsreport','updaterelation',0,'',3),(1567,'application','tssite','count',1,'',1),(1568,'application','tssite','count',1,'',2),(1569,'application','tssite','count',1,'',3),(1570,'application','tssite','create',1,'',1),(1571,'application','tssite','create',0,'',2),(1572,'application','tssite','create',0,'',3),(1573,'application','tssite','createrelation',1,'',1),(1574,'application','tssite','createrelation',0,'',2),(1575,'application','tssite','createrelation',0,'',3),(1576,'application','tssite','destroy',1,'',1),(1577,'application','tssite','destroy',0,'',2),(1578,'application','tssite','destroy',0,'',3),(1579,'application','tssite','destroyrelation',1,'',1),(1580,'application','tssite','destroyrelation',0,'',2),(1581,'application','tssite','destroyrelation',0,'',3),(1582,'application','tssite','find',1,'',1),(1583,'application','tssite','find',1,'',2),(1584,'application','tssite','find',1,'',3),(1585,'application','tssite','findone',1,'',1),(1586,'application','tssite','findone',1,'',2),(1587,'application','tssite','findone',1,'',3),(1588,'application','tssite','update',1,'',1),(1589,'application','tssite','update',0,'',2),(1590,'application','tssite','update',0,'',3),(1591,'application','tssite','updaterelation',1,'',1),(1592,'application','tssite','updaterelation',0,'',2),(1593,'application','tssite','updaterelation',0,'',3),(1594,'application','tsstatus','count',1,'',1),(1595,'application','tsstatus','count',1,'',2),(1596,'application','tsstatus','count',1,'',3),(1597,'application','tsstatus','create',1,'',1),(1598,'application','tsstatus','create',0,'',2),(1599,'application','tsstatus','create',0,'',3),(1600,'application','tsstatus','createrelation',1,'',1),(1601,'application','tsstatus','createrelation',0,'',2),(1602,'application','tsstatus','createrelation',0,'',3),(1603,'application','tsstatus','destroy',1,'',1),(1604,'application','tsstatus','destroy',0,'',2),(1605,'application','tsstatus','destroy',0,'',3),(1606,'application','tsstatus','destroyrelation',1,'',1),(1607,'application','tsstatus','destroyrelation',0,'',2),(1608,'application','tsstatus','destroyrelation',0,'',3),(1609,'application','tsstatus','find',1,'',1),(1610,'application','tsstatus','find',1,'',2),(1611,'application','tsstatus','find',1,'',3),(1612,'application','tsstatus','findone',1,'',1),(1613,'application','tsstatus','findone',1,'',2),(1614,'application','tsstatus','findone',1,'',3),(1615,'application','tsstatus','update',1,'',1),(1616,'application','tsstatus','update',0,'',2),(1617,'application','tsstatus','update',0,'',3),(1618,'application','tsstatus','updaterelation',1,'',1),(1619,'application','tsstatus','updaterelation',0,'',2),(1620,'application','tsstatus','updaterelation',0,'',3),(1621,'application','twreport','count',1,'',1),(1622,'application','twreport','count',1,'',2),(1623,'application','twreport','count',1,'',3),(1624,'application','twreport','create',1,'',1),(1625,'application','twreport','create',1,'',2),(1626,'application','twreport','create',1,'',3),(1627,'application','twreport','createrelation',1,'',1),(1628,'application','twreport','createrelation',0,'',2),(1629,'application','twreport','createrelation',0,'',3),(1630,'application','twreport','destroy',1,'',1),(1631,'application','twreport','destroy',0,'',2),(1632,'application','twreport','destroy',0,'',3),(1633,'application','twreport','destroyrelation',1,'',1),(1634,'application','twreport','destroyrelation',0,'',2),(1635,'application','twreport','destroyrelation',0,'',3),(1636,'application','twreport','find',1,'',1),(1637,'application','twreport','find',1,'',2),(1638,'application','twreport','find',1,'',3),(1639,'application','twreport','findone',1,'',1),(1640,'application','twreport','findone',1,'',2),(1641,'application','twreport','findone',1,'',3),(1642,'application','twreport','update',1,'',1),(1643,'application','twreport','update',1,'',2),(1644,'application','twreport','update',1,'',3),(1645,'application','twreport','updaterelation',1,'',1),(1646,'application','twreport','updaterelation',0,'',2),(1647,'application','twreport','updaterelation',0,'',3),(1648,'application','twsite','count',1,'',1),(1649,'application','twsite','count',1,'',2),(1650,'application','twsite','count',1,'',3),(1651,'application','twsite','create',1,'',1),(1652,'application','twsite','create',0,'',2),(1653,'application','twsite','create',0,'',3),(1654,'application','twsite','createrelation',1,'',1),(1655,'application','twsite','createrelation',0,'',2),(1656,'application','twsite','createrelation',0,'',3),(1657,'application','twsite','destroy',1,'',1),(1658,'application','twsite','destroy',0,'',2),(1659,'application','twsite','destroy',0,'',3),(1660,'application','twsite','destroyrelation',1,'',1),(1661,'application','twsite','destroyrelation',0,'',2),(1662,'application','twsite','destroyrelation',0,'',3),(1663,'application','twsite','find',1,'',1),(1664,'application','twsite','find',1,'',2),(1665,'application','twsite','find',1,'',3),(1666,'application','twsite','findone',1,'',1),(1667,'application','twsite','findone',1,'',2),(1668,'application','twsite','findone',1,'',3),(1669,'application','twsite','update',1,'',1),(1670,'application','twsite','update',0,'',2),(1671,'application','twsite','update',0,'',3),(1672,'application','twsite','updaterelation',1,'',1),(1673,'application','twsite','updaterelation',0,'',2),(1674,'application','twsite','updaterelation',0,'',3),(1675,'application','usssite','count',1,'',1),(1676,'application','usssite','count',1,'',2),(1677,'application','usssite','count',1,'',3),(1678,'application','usssite','create',1,'',1),(1679,'application','usssite','create',0,'',2),(1680,'application','usssite','create',0,'',3),(1681,'application','usssite','createrelation',1,'',1),(1682,'application','usssite','createrelation',0,'',2),(1683,'application','usssite','createrelation',0,'',3),(1684,'application','usssite','destroy',1,'',1),(1685,'application','usssite','destroy',0,'',2),(1686,'application','usssite','destroy',0,'',3),(1687,'application','usssite','destroyrelation',1,'',1),(1688,'application','usssite','destroyrelation',0,'',2),(1689,'application','usssite','destroyrelation',0,'',3),(1690,'application','usssite','find',1,'',1),(1691,'application','usssite','find',1,'',2),(1692,'application','usssite','find',1,'',3),(1693,'application','usssite','findone',1,'',1),(1694,'application','usssite','findone',1,'',2),(1695,'application','usssite','findone',1,'',3),(1696,'application','usssite','update',1,'',1),(1697,'application','usssite','update',0,'',2),(1698,'application','usssite','update',0,'',3),(1699,'application','usssite','updaterelation',1,'',1),(1700,'application','usssite','updaterelation',0,'',2),(1701,'application','usssite','updaterelation',0,'',3),(1702,'application','usstype','count',1,'',1),(1703,'application','usstype','count',1,'',2),(1704,'application','usstype','count',1,'',3),(1705,'application','usstype','create',1,'',1),(1706,'application','usstype','create',0,'',2),(1707,'application','usstype','create',0,'',3),(1708,'application','usstype','createrelation',1,'',1),(1709,'application','usstype','createrelation',0,'',2),(1710,'application','usstype','createrelation',0,'',3),(1711,'application','usstype','destroy',1,'',1),(1712,'application','usstype','destroy',0,'',2),(1713,'application','usstype','destroy',0,'',3),(1714,'application','usstype','destroyrelation',1,'',1),(1715,'application','usstype','destroyrelation',0,'',2),(1716,'application','usstype','destroyrelation',0,'',3),(1717,'application','usstype','find',1,'',1),(1718,'application','usstype','find',1,'',2),(1719,'application','usstype','find',1,'',3),(1720,'application','usstype','findone',1,'',1),(1721,'application','usstype','findone',1,'',2),(1722,'application','usstype','findone',1,'',3),(1723,'application','usstype','update',1,'',1),(1724,'application','usstype','update',0,'',2),(1725,'application','usstype','update',0,'',3),(1726,'application','usstype','updaterelation',1,'',1),(1727,'application','usstype','updaterelation',0,'',2),(1728,'application','usstype','updaterelation',0,'',3),(1729,'content-manager','contentmanager','count',1,'',1),(1730,'content-manager','contentmanager','count',0,'',2),(1731,'content-manager','contentmanager','count',0,'',3),(1732,'content-manager','contentmanager','create',1,'',1),(1733,'content-manager','contentmanager','create',0,'',2),(1734,'content-manager','contentmanager','create',0,'',3),(1735,'content-manager','contentmanager','delete',1,'',1),(1736,'content-manager','contentmanager','delete',0,'',2),(1737,'content-manager','contentmanager','delete',0,'',3),(1738,'content-manager','contentmanager','deleteall',1,'',1),(1739,'content-manager','contentmanager','deleteall',0,'',2),(1740,'content-manager','contentmanager','deleteall',0,'',3),(1741,'content-manager','contentmanager','find',1,'',1),(1742,'content-manager','contentmanager','find',0,'',2),(1743,'content-manager','contentmanager','find',0,'',3),(1744,'content-manager','contentmanager','findone',1,'',1),(1745,'content-manager','contentmanager','findone',0,'',2),(1746,'content-manager','contentmanager','findone',0,'',3),(1747,'content-manager','contentmanager','layout',1,'',1),(1748,'content-manager','contentmanager','layout',0,'',2),(1749,'content-manager','contentmanager','layout',0,'',3),(1750,'content-manager','contentmanager','models',1,'',1),(1751,'content-manager','contentmanager','models',0,'',2),(1752,'content-manager','contentmanager','models',0,'',3),(1753,'content-manager','contentmanager','update',1,'',1),(1754,'content-manager','contentmanager','update',0,'',2),(1755,'content-manager','contentmanager','update',0,'',3),(1756,'content-type-builder','contenttypebuilder','autoreload',1,'',1),(1757,'content-type-builder','contenttypebuilder','autoreload',1,'',2),(1758,'content-type-builder','contenttypebuilder','autoreload',1,'',3),(1759,'content-type-builder','contenttypebuilder','checktableexists',1,'',1),(1760,'content-type-builder','contenttypebuilder','checktableexists',0,'',2),(1761,'content-type-builder','contenttypebuilder','checktableexists',0,'',3),(1762,'content-type-builder','contenttypebuilder','createmodel',1,'',1),(1763,'content-type-builder','contenttypebuilder','createmodel',0,'',2),(1764,'content-type-builder','contenttypebuilder','createmodel',0,'',3),(1765,'content-type-builder','contenttypebuilder','deletemodel',1,'',1),(1766,'content-type-builder','contenttypebuilder','deletemodel',0,'',2),(1767,'content-type-builder','contenttypebuilder','deletemodel',0,'',3),(1768,'content-type-builder','contenttypebuilder','getconnections',1,'',1),(1769,'content-type-builder','contenttypebuilder','getconnections',0,'',2),(1770,'content-type-builder','contenttypebuilder','getconnections',0,'',3),(1771,'content-type-builder','contenttypebuilder','getmodel',1,'',1),(1772,'content-type-builder','contenttypebuilder','getmodel',0,'',2),(1773,'content-type-builder','contenttypebuilder','getmodel',0,'',3),(1774,'content-type-builder','contenttypebuilder','getmodels',1,'',1),(1775,'content-type-builder','contenttypebuilder','getmodels',0,'',2),(1776,'content-type-builder','contenttypebuilder','getmodels',0,'',3),(1777,'content-type-builder','contenttypebuilder','updatemodel',1,'',1),(1778,'content-type-builder','contenttypebuilder','updatemodel',0,'',2),(1779,'content-type-builder','contenttypebuilder','updatemodel',0,'',3),(1780,'email','email','getenvironments',1,'',1),(1781,'email','email','getenvironments',0,'',2),(1782,'email','email','getenvironments',0,'',3),(1783,'email','email','getsettings',1,'',1),(1784,'email','email','getsettings',0,'',2),(1785,'email','email','getsettings',0,'',3),(1786,'email','email','send',1,'',1),(1787,'email','email','send',0,'',2),(1788,'email','email','send',0,'',3),(1789,'email','email','updatesettings',1,'',1),(1790,'email','email','updatesettings',0,'',2),(1791,'email','email','updatesettings',0,'',3),(1792,'settings-manager','settingsmanager','autoreload',1,'',1),(1793,'settings-manager','settingsmanager','autoreload',1,'',2),(1794,'settings-manager','settingsmanager','autoreload',1,'',3),(1795,'settings-manager','settingsmanager','createdatabase',1,'',1),(1796,'settings-manager','settingsmanager','createdatabase',0,'',2),(1797,'settings-manager','settingsmanager','createdatabase',0,'',3),(1798,'settings-manager','settingsmanager','createlanguage',1,'',1),(1799,'settings-manager','settingsmanager','createlanguage',0,'',2),(1800,'settings-manager','settingsmanager','createlanguage',0,'',3),(1801,'settings-manager','settingsmanager','database',1,'',1),(1802,'settings-manager','settingsmanager','database',0,'',2),(1803,'settings-manager','settingsmanager','database',0,'',3),(1804,'settings-manager','settingsmanager','databasemodel',1,'',1),(1805,'settings-manager','settingsmanager','databasemodel',0,'',2),(1806,'settings-manager','settingsmanager','databasemodel',0,'',3),(1807,'settings-manager','settingsmanager','databases',1,'',1),(1808,'settings-manager','settingsmanager','databases',0,'',2),(1809,'settings-manager','settingsmanager','databases',0,'',3),(1810,'settings-manager','settingsmanager','deletedatabase',1,'',1),(1811,'settings-manager','settingsmanager','deletedatabase',0,'',2),(1812,'settings-manager','settingsmanager','deletedatabase',0,'',3),(1813,'settings-manager','settingsmanager','deletelanguage',1,'',1),(1814,'settings-manager','settingsmanager','deletelanguage',0,'',2),(1815,'settings-manager','settingsmanager','deletelanguage',0,'',3),(1816,'settings-manager','settingsmanager','environments',1,'',1),(1817,'settings-manager','settingsmanager','environments',0,'',2),(1818,'settings-manager','settingsmanager','environments',0,'',3),(1819,'settings-manager','settingsmanager','get',1,'',1),(1820,'settings-manager','settingsmanager','get',0,'',2),(1821,'settings-manager','settingsmanager','get',0,'',3),(1822,'settings-manager','settingsmanager','languages',1,'',1),(1823,'settings-manager','settingsmanager','languages',0,'',2),(1824,'settings-manager','settingsmanager','languages',0,'',3),(1825,'settings-manager','settingsmanager','menu',1,'',1),(1826,'settings-manager','settingsmanager','menu',0,'',2),(1827,'settings-manager','settingsmanager','menu',0,'',3),(1828,'settings-manager','settingsmanager','update',1,'',1),(1829,'settings-manager','settingsmanager','update',0,'',2),(1830,'settings-manager','settingsmanager','update',0,'',3),(1831,'settings-manager','settingsmanager','updatedatabase',1,'',1),(1832,'settings-manager','settingsmanager','updatedatabase',0,'',2),(1833,'settings-manager','settingsmanager','updatedatabase',0,'',3),(1834,'upload','upload','count',1,'',1),(1835,'upload','upload','count',1,'',2),(1836,'upload','upload','count',1,'',3),(1837,'upload','upload','destroy',1,'',1),(1838,'upload','upload','destroy',0,'',2),(1839,'upload','upload','destroy',0,'',3),(1840,'upload','upload','find',1,'',1),(1841,'upload','upload','find',1,'',2),(1842,'upload','upload','find',1,'',3),(1843,'upload','upload','findone',1,'',1),(1844,'upload','upload','findone',1,'',2),(1845,'upload','upload','findone',1,'',3),(1846,'upload','upload','getenvironments',1,'',1),(1847,'upload','upload','getenvironments',0,'',2),(1848,'upload','upload','getenvironments',0,'',3),(1849,'upload','upload','getsettings',1,'',1),(1850,'upload','upload','getsettings',0,'',2),(1851,'upload','upload','getsettings',0,'',3),(1852,'upload','upload','search',1,'',1),(1853,'upload','upload','search',1,'',2),(1854,'upload','upload','search',1,'',3),(1855,'upload','upload','updatesettings',1,'',1),(1856,'upload','upload','updatesettings',0,'',2),(1857,'upload','upload','updatesettings',0,'',3),(1858,'upload','upload','upload',1,'',1),(1859,'upload','upload','upload',1,'',2),(1860,'upload','upload','upload',1,'',3),(1861,'users-permissions','auth','callback',1,'',1),(1862,'users-permissions','auth','callback',0,'',2),(1863,'users-permissions','auth','callback',1,'',3),(1864,'users-permissions','auth','changepassword',1,'',1),(1865,'users-permissions','auth','changepassword',0,'',2),(1866,'users-permissions','auth','changepassword',1,'',3),(1867,'users-permissions','auth','connect',1,'',1),(1868,'users-permissions','auth','connect',1,'',2),(1869,'users-permissions','auth','connect',1,'',3),(1870,'users-permissions','auth','forgotpassword',1,'',1),(1871,'users-permissions','auth','forgotpassword',0,'',2),(1872,'users-permissions','auth','forgotpassword',1,'',3),(1873,'users-permissions','auth','register',1,'',1),(1874,'users-permissions','auth','register',0,'',2),(1875,'users-permissions','auth','register',1,'',3),(1876,'users-permissions','user','create',1,'',1),(1877,'users-permissions','user','create',0,'',2),(1878,'users-permissions','user','create',0,'',3),(1879,'users-permissions','user','destroy',1,'',1),(1880,'users-permissions','user','destroy',0,'',2),(1881,'users-permissions','user','destroy',0,'',3),(1882,'users-permissions','user','destroyall',1,'',1),(1883,'users-permissions','user','destroyall',0,'',2),(1884,'users-permissions','user','destroyall',0,'',3),(1885,'users-permissions','user','find',1,'',1),(1886,'users-permissions','user','find',0,'',2),(1887,'users-permissions','user','find',0,'',3),(1888,'users-permissions','user','findone',1,'',1),(1889,'users-permissions','user','findone',0,'',2),(1890,'users-permissions','user','findone',0,'',3),(1891,'users-permissions','user','me',1,'',1),(1892,'users-permissions','user','me',1,'',2),(1893,'users-permissions','user','me',1,'',3),(1894,'users-permissions','user','update',1,'',1),(1895,'users-permissions','user','update',0,'',2),(1896,'users-permissions','user','update',0,'',3),(1897,'users-permissions','userspermissions','createrole',1,'',1),(1898,'users-permissions','userspermissions','createrole',0,'',2),(1899,'users-permissions','userspermissions','createrole',0,'',3),(1900,'users-permissions','userspermissions','deleteprovider',1,'',1),(1901,'users-permissions','userspermissions','deleteprovider',0,'',2),(1902,'users-permissions','userspermissions','deleteprovider',0,'',3),(1903,'users-permissions','userspermissions','deleterole',1,'',1),(1904,'users-permissions','userspermissions','deleterole',0,'',2),(1905,'users-permissions','userspermissions','deleterole',0,'',3),(1906,'users-permissions','userspermissions','getadvancedsettings',1,'',1),(1907,'users-permissions','userspermissions','getadvancedsettings',0,'',2),(1908,'users-permissions','userspermissions','getadvancedsettings',0,'',3),(1909,'users-permissions','userspermissions','getemailtemplate',1,'',1),(1910,'users-permissions','userspermissions','getemailtemplate',0,'',2),(1911,'users-permissions','userspermissions','getemailtemplate',0,'',3),(1912,'users-permissions','userspermissions','getpermissions',1,'',1),(1913,'users-permissions','userspermissions','getpermissions',0,'',2),(1914,'users-permissions','userspermissions','getpermissions',0,'',3),(1915,'users-permissions','userspermissions','getpolicies',1,'',1),(1916,'users-permissions','userspermissions','getpolicies',0,'',2),(1917,'users-permissions','userspermissions','getpolicies',0,'',3),(1918,'users-permissions','userspermissions','getproviders',1,'',1),(1919,'users-permissions','userspermissions','getproviders',0,'',2),(1920,'users-permissions','userspermissions','getproviders',0,'',3),(1921,'users-permissions','userspermissions','getrole',1,'',1),(1922,'users-permissions','userspermissions','getrole',0,'',2),(1923,'users-permissions','userspermissions','getrole',0,'',3),(1924,'users-permissions','userspermissions','getroles',1,'',1),(1925,'users-permissions','userspermissions','getroles',0,'',2),(1926,'users-permissions','userspermissions','getroles',0,'',3),(1927,'users-permissions','userspermissions','getroutes',1,'',1),(1928,'users-permissions','userspermissions','getroutes',0,'',2),(1929,'users-permissions','userspermissions','getroutes',0,'',3),(1930,'users-permissions','userspermissions','index',1,'',1),(1931,'users-permissions','userspermissions','index',0,'',2),(1932,'users-permissions','userspermissions','index',0,'',3),(1933,'users-permissions','userspermissions','init',1,'',1),(1934,'users-permissions','userspermissions','init',1,'',2),(1935,'users-permissions','userspermissions','init',1,'',3),(1936,'users-permissions','userspermissions','searchusers',1,'',1),(1937,'users-permissions','userspermissions','searchusers',0,'',2),(1938,'users-permissions','userspermissions','searchusers',0,'',3),(1939,'users-permissions','userspermissions','updateadvancedsettings',1,'',1),(1940,'users-permissions','userspermissions','updateadvancedsettings',0,'',2),(1941,'users-permissions','userspermissions','updateadvancedsettings',0,'',3),(1942,'users-permissions','userspermissions','updateemailtemplate',1,'',1),(1943,'users-permissions','userspermissions','updateemailtemplate',0,'',2),(1944,'users-permissions','userspermissions','updateemailtemplate',0,'',3),(1945,'users-permissions','userspermissions','updateproviders',1,'',1),(1946,'users-permissions','userspermissions','updateproviders',0,'',2),(1947,'users-permissions','userspermissions','updateproviders',0,'',3),(1948,'users-permissions','userspermissions','updaterole',1,'',1),(1949,'users-permissions','userspermissions','updaterole',0,'',2),(1950,'users-permissions','userspermissions','updaterole',0,'',3);
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
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_USERS_PERMISSIONS_ROLE` (`name`,`description`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_role`
--

LOCK TABLES `users-permissions_role` WRITE;
/*!40000 ALTER TABLE `users-permissions_role` DISABLE KEYS */;
INSERT INTO `users-permissions_role` VALUES (1,'Administrator','Canonn Administrator','root'),(2,'Authenticated','Canonn authorized user','authenticated'),(3,'Public','Public non-authenticated users','public');
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
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_USERS_PERMISSIONS_USER` (`username`,`provider`,`resetPasswordToken`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_user`
--

LOCK TABLES `users-permissions_user` WRITE;
/*!40000 ALTER TABLE `users-permissions_user` DISABLE KEYS */;
INSERT INTO `users-permissions_user` VALUES (1,'canonntest','rd@canonn.technology','local','$2a$10$fakzpglOD.hpX/PBEpWVU.U2eFL5/CbqLUJYZfvBENdHMoUGQgsKu',NULL,1);
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
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_USSTYPES` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usstypes`
--

LOCK TABLES `usstypes` WRITE;
/*!40000 ALTER TABLE `usstypes` DISABLE KEYS */;
INSERT INTO `usstypes` VALUES (1,'Anomaly'),(2,'Ceremonial Comms'),(3,'Combat Aftermath'),(4,'Convoy Dispersal Pattern'),(5,'Degraded Emissions'),(6,'Distress Call'),(7,'Encoded Emissions'),(8,'High Grade Emissions'),(9,'Mission Target'),(10,'Non-Human Signal Source'),(11,'Trading Beacon'),(12,'Weapons Fire');
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

-- Dump completed on 2018-06-27  2:45:14