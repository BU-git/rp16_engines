-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: kvt_db
-- ------------------------------------------------------
-- Server version	5.7.8-rc-log

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
-- Table structure for table `components`
--

DROP TABLE IF EXISTS `components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `eqart` varchar(255) DEFAULT NULL,
  `equnr` int(11) NOT NULL,
  `herst` varchar(255) DEFAULT NULL,
  `sernr` varchar(255) DEFAULT NULL,
  `typbz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components`
--

LOCK TABLES `components` WRITE;
/*!40000 ALTER TABLE `components` DISABLE KEYS */;
/*!40000 ALTER TABLE `components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,'text field'),(2,'check box'),(3,'text area'),(4,'label');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installations`
--

DROP TABLE IF EXISTS `installations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `installations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `postCode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installations`
--

LOCK TABLES `installations` WRITE;
/*!40000 ALTER TABLE `installations` DISABLE KEYS */;
/*!40000 ALTER TABLE `installations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `number` bigint(20) NOT NULL,
  `customTemplateID` bigint(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `importDate` datetime DEFAULT NULL,
  `lastAndroidChangeDate` datetime DEFAULT NULL,
  `lastServerChangeDate` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `orderStatus` int(11) NOT NULL,
  `orderType` varchar(255) DEFAULT NULL,
  `pdfLink` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `installation_id` bigint(20) DEFAULT NULL,
  `relation_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`number`),
  KEY `FKfhl8bv0xn3sj33q2f3scf1bq6` (`employee_id`),
  KEY `FKf3vfm0ou4yxr5f75bbw5ktu3e` (`installation_id`),
  KEY `FK6mt7pdh5td42jbsnijo6sljif` (`relation_id`),
  CONSTRAINT `FK6mt7pdh5td42jbsnijo6sljif` FOREIGN KEY (`relation_id`) REFERENCES `relations` (`id`),
  CONSTRAINT `FKf3vfm0ou4yxr5f75bbw5ktu3e` FOREIGN KEY (`installation_id`) REFERENCES `installations` (`id`),
  CONSTRAINT `FKfhl8bv0xn3sj33q2f3scf1bq6` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_components`
--

DROP TABLE IF EXISTS `orders_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_components` (
  `Order_number` bigint(20) NOT NULL,
  `components_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_1tqwg5n9hvxfd644rmw9wgri0` (`components_id`),
  KEY `FKi4d6e01iovc3oub69nckdq2ad` (`Order_number`),
  CONSTRAINT `FKaggdgvvnl94r3u3r1hg0c9dr9` FOREIGN KEY (`components_id`) REFERENCES `components` (`id`),
  CONSTRAINT `FKi4d6e01iovc3oub69nckdq2ad` FOREIGN KEY (`Order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_components`
--

LOCK TABLES `orders_components` WRITE;
/*!40000 ALTER TABLE `orders_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_info`
--

DROP TABLE IF EXISTS `orders_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_info` (
  `Order_number` bigint(20) NOT NULL,
  `extraInfo_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_bixjm3t3srk0b6av4lrfrtjn5` (`extraInfo_id`),
  KEY `FKjj7rlv0vrmn4pqnigpg6k9rh3` (`Order_number`),
  CONSTRAINT `FK1c43oq29r7lb232g26i9v8lx0` FOREIGN KEY (`extraInfo_id`) REFERENCES `info` (`id`),
  CONSTRAINT `FKjj7rlv0vrmn4pqnigpg6k9rh3` FOREIGN KEY (`Order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_info`
--

LOCK TABLES `orders_info` WRITE;
/*!40000 ALTER TABLE `orders_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_parts`
--

DROP TABLE IF EXISTS `orders_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_parts` (
  `Order_number` bigint(20) NOT NULL,
  `parts_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_tbw6iu6s1yxupiw9mikhhy0vo` (`parts_id`),
  KEY `FK39xfemob380jf9ruu0bur0w9r` (`Order_number`),
  CONSTRAINT `FK39xfemob380jf9ruu0bur0w9r` FOREIGN KEY (`Order_number`) REFERENCES `orders` (`number`),
  CONSTRAINT `FKthtd79gjjehf9xlcm0qx1apr9` FOREIGN KEY (`parts_id`) REFERENCES `parts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_parts`
--

LOCK TABLES `orders_parts` WRITE;
/*!40000 ALTER TABLE `orders_parts` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_tasks`
--

DROP TABLE IF EXISTS `orders_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_tasks` (
  `Order_number` bigint(20) NOT NULL,
  `tasks_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_7a9m9x3d4608cf5wi9ixy1xma` (`tasks_id`),
  KEY `FKchctvgis4ubk94906og9xukux` (`Order_number`),
  CONSTRAINT `FK615d2maj3q5ny0vmgjlj3745w` FOREIGN KEY (`tasks_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `FKchctvgis4ubk94906og9xukux` FOREIGN KEY (`Order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_tasks`
--

LOCK TABLES `orders_tasks` WRITE;
/*!40000 ALTER TABLE `orders_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bdmng` varchar(255) DEFAULT NULL,
  `matnr` varchar(255) DEFAULT NULL,
  `mattx` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

LOCK TABLES `parts` WRITE;
/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
/*!40000 ALTER TABLE `parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contactPerson` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ktsch` varchar(255) DEFAULT NULL,
  `ltxa1` varchar(255) DEFAULT NULL,
  `steus` varchar(255) DEFAULT NULL,
  `vornr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatefields`
--

DROP TABLE IF EXISTS `templatefields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatefields` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createDt` date NOT NULL,
  `description` varchar(1024) NOT NULL,
  `updateDt` date DEFAULT NULL,
  `value` varchar(1024) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `templateEntity_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8s9kbbg0btub0hocrbb2vsr9i` (`field_id`),
  KEY `FKi3i54ygdsttdgqhfaisjw5atk` (`templateEntity_id`),
  CONSTRAINT `FK8s9kbbg0btub0hocrbb2vsr9i` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`),
  CONSTRAINT `FKi3i54ygdsttdgqhfaisjw5atk` FOREIGN KEY (`templateEntity_id`) REFERENCES `templates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatefields`
--

LOCK TABLES `templatefields` WRITE;
/*!40000 ALTER TABLE `templatefields` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatefields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assigned` bit(1) NOT NULL,
  `templateName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `passwordHash` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@kvt.nl','Bob van Holland',111223,'0ff7a384cd97cec0f2f9c7affcabd45b263b9c10b5c18a1f98811bd4371b6f7c',0,'rzsibU4J0umgNVXojujF26NTNilk5Wek'),(4,'rvrooy@kvt.nl','Rooij R. van',111223,'d13e4d49537a910a5b9f0a19be74ece86cd89ca0a2e2c492290ea203abe744df',1,'Gwbhsjki2BpE1AhGaCTqDnp286t9oUzJ'),(5,'sbesselink@kvt.nl','Besselink S.T.M.',111223,'6b1efebde99cb977e45a9939ae7ccf769773562f645401dadc0d8e758aaa15b3',1,'nhcQe6UBpzC7kxIA6HAAydLxrqnu0VKa'),(6,'rvdmeer@kvt.nl','Meer van der R.A.',111223,'ef1d8ec8ea1af3556a9b2d3d57bbc463ea2cd0b7f5bb3121f3291e1ca37cb98c',1,'jW5JoBZLSF79x7cAQERrEuLnBY0PmBUL');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-15 21:08:59
