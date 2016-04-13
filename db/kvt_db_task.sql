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
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ktsch` varchar(255) DEFAULT NULL,
  `ltxa1` varchar(255) DEFAULT NULL,
  `steus` varchar(255) DEFAULT NULL,
  `vornr` varchar(255) DEFAULT NULL,
  `order_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKoyr31m0x9iscrymx6ystllhkw` (`order_number`),
  CONSTRAINT `FKoyr31m0x9iscrymx6ystllhkw` FOREIGN KEY (`order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(2,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(3,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(4,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(5,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(6,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(7,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(8,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(9,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(10,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(11,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(12,'SP02','Inspectie beurt','SM01','0010',NULL),(13,'SP30','Belast beproeven extern','SM01','0010',NULL),(14,'','Onderhoud 4x Seakeeper M26000','SM01','0010',NULL),(15,'','Onderhoud 4x Seakeeper M26000','SM01','0010',NULL),(16,'','Conver Active Foutcode 5245','SM01','0010',NULL),(17,'','onbekende motorstoring','SM01','0010',NULL),(18,'','set start niet op','SM01','0010',NULL),(19,'','Oude startaccu vervangen 1 stuks','SM01','0020',NULL),(20,'','Scholtus verlies koelmiddel','SM01','0010',NULL),(21,'','Vervangen Startaccu','SM01','0010',NULL);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
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
