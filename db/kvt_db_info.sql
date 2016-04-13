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
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `kindOfLine` varchar(255) DEFAULT NULL,
  `line` varchar(255) DEFAULT NULL,
  `prePost` varchar(255) DEFAULT NULL,
  `sleutel` varchar(255) DEFAULT NULL,
  `order_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK810yvkdmayc4sty75cvftbmlo` (`order_number`),
  CONSTRAINT `FK810yvkdmayc4sty75cvftbmlo` FOREIGN KEY (`order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'Extra debiteur info','D','1','PR','28869',NULL),(2,'extra contractinfo','C','1','PR','40001353',NULL),(3,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(4,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(5,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(6,'extra equipment info','E','1','PO','10003702',NULL),(7,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(8,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(9,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(10,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(11,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(12,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(13,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(14,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(15,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(16,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(17,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(18,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(19,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(20,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(21,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(22,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(23,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(24,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(25,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(26,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(27,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(28,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(29,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(30,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(31,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(32,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(33,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(34,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(35,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(36,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(37,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(38,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(39,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(40,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(41,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(42,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(43,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(44,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(45,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(46,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(47,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(48,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(49,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(50,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL);
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-13 18:38:08
