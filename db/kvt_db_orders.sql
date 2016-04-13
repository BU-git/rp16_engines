CREATE DATABASE  IF NOT EXISTS `kvt_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `kvt_db`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: kvt_db
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `number` bigint(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `done` bit(1) NOT NULL,
  `importTimestamp` datetime DEFAULT NULL,
  `lastAndroidChangeTimestamp` datetime DEFAULT NULL,
  `lastServerChangeTimestamp` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `orderType` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `employee_email` varchar(255) DEFAULT NULL,
  `installation_id` bigint(20) DEFAULT NULL,
  `relation_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`number`),
  KEY `FK8ac4h3oqbb9icvwf539eayvie` (`employee_email`),
  KEY `FKmmkcywdjar1ds1m66p6rytsqe` (`installation_id`),
  KEY `FKka8nvwycerfmca8dv8aspam10` (`relation_id`),
  CONSTRAINT `FK8ac4h3oqbb9icvwf539eayvie` FOREIGN KEY (`employee_email`) REFERENCES `employee` (`email`),
  CONSTRAINT `FKka8nvwycerfmca8dv8aspam10` FOREIGN KEY (`relation_id`) REFERENCES `relation` (`id`),
  CONSTRAINT `FKmmkcywdjar1ds1m66p6rytsqe` FOREIGN KEY (`installation_id`) REFERENCES `installation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (4008692,'2015-03-13 00:00:00','\0',NULL,NULL,NULL,'graag gegevens aanvullen\n\nvoor code cijfersloten Lex van der Kade 065138 6097','SM04','getekend contract','rvrooy@kvt.nl',1,1),(4013250,'2016-04-05 00:00:00','\0',NULL,NULL,NULL,'','SM04','INK16000061-1','rvdmeer@kvt.nl',5,5),(4013294,'2016-04-06 00:00:00','\0',NULL,NULL,NULL,'Uitlaat flexibel reparen en aanbieden, bestellen bij ADL','SM04','4500622119','rvrooy@kvt.nl',6,6),(4013299,'2016-04-06 00:00:00','\0',NULL,NULL,'2016-04-13 18:04:21','','SM04','4500622119','rvrooy@kvt.nl',7,7),(4013730,'2016-04-05 00:00:00','\0',NULL,NULL,'2016-04-13 18:05:33','Dit setje draait 3000 toeren.\nSetje staat op de Leersumsestraatweg bij H ectometerpaal 23.1  bij de kruising met de Hoolweg.','SM04','260-414226','sbesselink@kvt.nl',9,9),(4013731,'2016-04-05 00:00:00','\0',NULL,NULL,'2016-04-13 18:06:34','3000 toeren aggregaat\nAdres is Rijksstraatweg bij hectometerpaal 24.6 op de kruising met de Dartheideweg','SM04','260-414226','sbesselink@kvt.nl',10,10),(4013735,'2016-04-05 00:00:00','\0',NULL,NULL,'2016-04-13 18:07:09','11-2-14 restwerk 2013 zie bijlage','SM04','260-414226','sbesselink@kvt.nl',11,11),(4014136,'2016-04-06 00:00:00','\0',NULL,NULL,'2016-04-13 18:07:53','','SM04','Fer Meuser','sbesselink@kvt.nl',12,12),(4014137,'2016-04-06 00:00:00','\0',NULL,NULL,'2016-04-13 18:08:38','','SM04','Fer Meuser','sbesselink@kvt.nl',13,13),(4014281,'2016-04-06 00:00:00','\0',NULL,NULL,'2016-04-13 18:09:26','','SM03','','rvdmeer@kvt.nl',15,15),(4014296,'2016-04-04 00:00:00','\0',NULL,NULL,'2016-04-13 18:10:02','','SM03','','',16,16),(4014297,'2016-03-29 00:00:00','\0',NULL,NULL,'2016-04-13 18:11:27','','SM03','Koen de Pauw','rvdmeer@kvt.nl',17,17),(4014491,'2016-04-04 00:00:00','\0',NULL,NULL,'2016-04-13 18:12:12','1-12-2011/74738JC: vervangen start accu\'s incl. equalizer.','SM03','','',18,18),(4014496,'2016-04-05 00:00:00','\0',NULL,NULL,'2016-04-13 18:12:46','','SM03','','rvrooy@kvt.nl',19,19),(4014498,'2016-04-04 00:00:00','\0',NULL,NULL,'2016-04-13 18:13:25','','SM03','','rvdmeer@kvt.nl',20,20);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-13 18:38:09
