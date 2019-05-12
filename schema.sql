-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: nwn
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

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
-- Table structure for table `md_cr_category`
--

DROP TABLE IF EXISTS `md_cr_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_cr_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `original` int(11) DEFAULT NULL,
  `tier` int(11) DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `md_cr_feats`
--

DROP TABLE IF EXISTS `md_cr_feats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_cr_feats` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Recipe_ID` int(11) NOT NULL,
  `Feat` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `md_cr_feats_U_1` (`Recipe_ID`,`Feat`),
  CONSTRAINT `md_cr_feats_FK_1` FOREIGN KEY (`Recipe_ID`) REFERENCES `md_cr_recipes` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `md_cr_input`
--

DROP TABLE IF EXISTS `md_cr_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_cr_input` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Recipe_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Resref` varchar(16) NOT NULL,
  `Qty` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `md_cr_input_U_1` (`Recipe_ID`,`Resref`),
  CONSTRAINT `md_cr_input_FK_1` FOREIGN KEY (`Recipe_ID`) REFERENCES `md_cr_recipes` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3683 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `md_cr_output`
--

DROP TABLE IF EXISTS `md_cr_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_cr_output` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Recipe_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Resref` varchar(16) NOT NULL,
  `Qty` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `md_cr_output_U_1` (`Recipe_ID`,`Resref`),
  CONSTRAINT `md_cr_output_FK_1` FOREIGN KEY (`Recipe_ID`) REFERENCES `md_cr_recipes` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1209 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `md_cr_recipes`
--

DROP TABLE IF EXISTS `md_cr_recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_cr_recipes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Skill` tinyint(4) NOT NULL,
  `category` int(11) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Value` int(11) DEFAULT NULL,
  `SubRace` int(11) DEFAULT NULL,
  `DC` smallint(6) DEFAULT NULL,
  `Points` smallint(6) DEFAULT NULL,
  `Settings` int(11) DEFAULT NULL,
  `Class` int(11) DEFAULT NULL,
  `Class_Level` tinyint(4) DEFAULT NULL,
  `Placeable_Tag` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CatID` (`category`),
  CONSTRAINT `FK_CatID` FOREIGN KEY (`category`) REFERENCES `md_cr_category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1147 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `md_cr_skills`
--

DROP TABLE IF EXISTS `md_cr_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_cr_skills` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Recipe_ID` int(11) NOT NULL,
  `Skill` tinyint(4) NOT NULL,
  `Rank` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `md_cr_skills_U_1` (`Recipe_ID`,`Skill`),
  CONSTRAINT `md_cr_skills_FK_1` FOREIGN KEY (`Recipe_ID`) REFERENCES `md_cr_recipes` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
