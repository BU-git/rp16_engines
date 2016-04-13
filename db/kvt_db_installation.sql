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
-- Table structure for table `installation`
--

DROP TABLE IF EXISTS `installation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `installation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `postCode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `order_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtqjpioq0w9jtmuxx2ykryhywr` (`order_number`),
  CONSTRAINT `FKtqjpioq0w9jtmuxx2ykryhywr` FOREIGN KEY (`order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installation`
--

LOCK TABLES `installation` WRITE;
/*!40000 ALTER TABLE `installation` DISABLE KEYS */;
INSERT INTO `installation` VALUES (1,'Joop Geesinkweg 126','SportLed Trailer 26','1096 AT','Amsterdam',NULL),(2,'Mainhavenweg 6','Sonneborn Lombardini','1043 AL','Amsterdam',NULL),(3,'Mainhavenweg 6','Sonneborn Lombardini','1043 AL','Amsterdam',NULL),(4,'Mainhavenweg 6','Sonneborn Lombardini','1043 AL','Amsterdam',NULL),(5,'Schapendrift 170','OASEN SPS Hardinxveld-Giessendam','3371 JJ','Hardinxveld Giessendam',NULL),(6,'Mainhavenweg 6','Sonneborn','1043 AL','Amsterdam',NULL),(7,'Mainhavenweg 6','Sonneborn Lombardini','1043 AL','Amsterdam',NULL),(8,'Leersumsestraatweg','Viatel Doorn 1','3941 ML','Doorn',NULL),(9,'Leersumsestraatweg','Viatel Doorn 1','3941 ML','Doorn',NULL),(10,'Dartheideweg 1','Viatel Leersum','3956 NN','Leersum',NULL),(11,'Leersumsestraatweg','Viatel Doorn 2','3941 ML','Doorn',NULL),(12,'Sanderboutlaan','Petrochemical Pipeline Services','6181 DN','Elsloo',NULL),(13,'Sanderboutlaan','Petrochemical Pipeline Services','6181 DN','Elsloo',NULL),(14,'Quarantaineweg','Stemat','3089 KP','Rotterdam',NULL),(15,'Quarantaineweg','Stemat','3089 KP','Rotterdam',NULL),(16,'','','','',NULL),(17,'','','','',NULL),(18,'Albrandswaardsewijk 74','Delta HV4','3172 AA','Poortugaal',NULL),(19,'De Hooge Hoek','Scholtus Special Products','3927 GG','Renswoude',NULL),(20,'Buiten de Veste 1','Gemeentehuis Steenbergen','4651 TR','Steenbergen',NULL);
/*!40000 ALTER TABLE `installation` ENABLE KEYS */;
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
