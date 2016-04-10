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
  `ORDER_NUMBER` int(11) NOT NULL,
  `ORDER_ADDRESS` varchar(255) DEFAULT NULL,
  `ORDER_DONE` bit(1) DEFAULT NULL,
  `SERVICE_DATE` date DEFAULT NULL,
  `ORDER_TASK` varchar(255) DEFAULT NULL,
  `ORDER_INSTALLATION` varchar(255) DEFAULT NULL,
  `BOOK_PDF` longblob,
  PRIMARY KEY (`ORDER_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Rotterdam','','2016-02-20','Motor',NULL,NULL),(2,'Rotterdam','','2016-02-20','Motor',NULL,NULL),(6,'dfsfsdfdsf','\0','2016-04-06','dsfdf','dfsdf',''),(7,'dfsfsdfdsf','\0','2016-04-06','dsfdf','dfsdf',''),(8,'dfsfsdfdsf','\0','2016-04-06','dsfdf','dfsdf',''),(32,'dfsfsdfdsf','\0','2016-04-06','dsfdf','dfsdf',''),(111,'dfsfsdfdsf','\0','2016-04-06','dsfdf','dfsdf',''),(333,'dfsfsdfdsf','\0','2016-04-06','dsfdf','dfsdf',''),(343,'Rotterdam','','2016-02-20','Motor',NULL,NULL),(444,'dfsfsdfdsf','\0','2016-04-06','dsfdf','dfsdf',''),(2222,'dfsfsdfdsf','\0','2016-04-06','dsfdf','dfsdf',''),(3333,'dfsfsdfdsf','\0','2016-04-06','dsfdf','dfsdf',''),(5555,'dfsfsdfdsf','\0','2016-04-06','dsfdf','dfsdf',''),(12112,'dfsfsdfdsf','\0','2016-04-06','dsfdf','dfsdf',''),(34234,'dfsfsdfdsf','\0','2016-04-06','dsfdf','dfsdf',''),(54545,'dfsfsdfdsf','\0','2016-04-06','dsfdf','dfsdf',''),(67676,'dfsfsdfdsf','\0','2016-04-06','dsfdf','dfsdf',''),(67878,'dfsfsdfdsf','\0','2016-04-06','dsfdf','dfsdf',''),(343434,'dfsfsdfdsf','\0','2016-04-06','dsfdf','dfsdf',''),(534534,'Rotterdam','','2016-02-20','Motor',NULL,NULL),(2323232,'Dordrecht','\0','2001-02-20','Generator',NULL,NULL),(23423423,'sefdfsf','','2016-04-06','sadsd','sadsad',NULL),(23424234,'sdfsfds','','2016-04-04','dfdfd','sdfdf',''),(33443434,'Rotterdam','','2016-02-20','Motor',NULL,NULL),(135887887,'Dordrecht','\0','2001-02-20','Generator',NULL,NULL),(324234234,'dfsfsdfdsf','\0','2016-04-06','dsfdf','dfsdf','');
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

-- Dump completed on 2016-04-10 19:03:00
