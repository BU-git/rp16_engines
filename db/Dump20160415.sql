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
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `component` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `eqart` varchar(255) DEFAULT NULL,
  `equnr` int(11) NOT NULL,
  `herst` varchar(255) DEFAULT NULL,
  `sernr` varchar(255) DEFAULT NULL,
  `typbz` varchar(255) DEFAULT NULL,
  `order_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcqg4rthehfrxd84wgjjtnqek6` (`order_number`),
  CONSTRAINT `FKcqg4rthehfrxd84wgjjtnqek6` FOREIGN KEY (`order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
INSERT INTO `component` VALUES (1,'SET',10003702,'Himoinsa','10003702','HWF-200 T5',NULL),(2,'DMTR',10003700,'Iveco','','NEF67 TE 2A',NULL),(3,'GEN',10003701,'Divers','','',NULL),(4,'SET',10003365,'Lombardini','DGM1200/5372OM','',NULL),(5,'DMTR',10003363,'Lombardini','4330474K391483','LDW 1503',NULL),(6,'GEN',10003364,'Divers','','',NULL),(7,'SET',10003365,'Lombardini','DGM1200/5372OM','',NULL),(8,'DMTR',10003363,'Lombardini','4330474K391483','LDW 1503',NULL),(9,'GEN',10003364,'Divers','','',NULL),(10,'SET',10003365,'Lombardini','DGM1200/5372OM','',NULL),(11,'DMTR',10003363,'Lombardini','4330474K391483','LDW 1503',NULL),(12,'GEN',10003364,'Divers','','',NULL),(13,'SET',10003280,'Cummins','10003280','',NULL),(14,'GEN',10003281,'Stamford','C249299/01','HC1 434 C2',NULL),(15,'DMTR',10003282,'Cummins','21733276','QSL9-G5',NULL),(16,'SET',10003122,'Perkins','10003122','',NULL),(17,'GEN',10003123,'Divers','','',NULL),(18,'DMTR',10003124,'Perkins','HP51099U978242','404C',NULL),(19,'SET',10003365,'Lombardini','DGM1200/5372OM','',NULL),(20,'DMTR',10003363,'Lombardini','4330474K391483','LDW 1503',NULL),(21,'GEN',10003364,'Divers','','',NULL),(22,'SET',10003546,'Lister','10003546','',NULL),(23,'DMTR',10003544,'Lister','4903770','LPW4A009',NULL),(24,'GEN',10003545,'Stamford','0112010/01','BCAI 162J1',NULL),(25,'SET',10003546,'Lister','10003546','',NULL),(26,'DMTR',10003544,'Lister','4903770','LPW4A009',NULL),(27,'GEN',10003545,'Stamford','0112010/01','BCAI 162J1',NULL),(28,'SET',10003549,'Lister','10003549','',NULL),(29,'DMTR',10003547,'Lister','4901089','LPW4A009',NULL),(30,'GEN',10003548,'Stamford','99085035','BCAI 162J1',NULL),(31,'SET',10003948,'Atlas Copco','10003948','qsa 38',NULL),(32,'DMTR',10003946,'Yanmar','9355','4TNE94-acg',NULL),(33,'GEN',10003947,'Mecc Alte Spa','839050','eco32-1s/4',NULL),(34,'',10010315,'FG Wilson','FGWPEP22PBMU10348','P45',NULL),(35,'',10009655,'','','',NULL),(36,'',10010348,'Perkins','DKU453975A','1103A-33TG1',NULL),(37,'',10010349,'Leroy Somer','328176/001','LL1514L',NULL),(38,'',10010315,'FG Wilson','FGWPEP22PBMU10348','P45',NULL),(39,'',10009655,'','','',NULL),(40,'',10010348,'Perkins','DKU453975A','1103A-33TG1',NULL),(41,'',10010349,'Leroy Somer','328176/001','LL1514L',NULL),(42,'',10005738,'Seakeeper','M26000S53','M26000',NULL),(43,'',10005738,'Seakeeper','M26000S53','M26000',NULL),(44,'',10009890,'','JU83096L000672A','',NULL),(45,'DMTR',10011304,'Perkins','CZHRCG05_D0R_QG5CA','854F-E34TAWF',NULL),(46,'',0,'','','',NULL),(47,'SET',10003160,'F.G. Wilson','10003160','',NULL),(48,'DMTR',10003158,'Perkins','HGB061161U2205M','2806CE 16TAG2',NULL),(49,'GEN',10003159,'Leroy Somer','185535/25','LL6014H',NULL),(50,'',10011320,'FG Wilson','FGWRPES2CPDS05650','P400',NULL),(51,'',10011321,'Perkins','FGD061430U6437N','2306C-E14TAG3',NULL),(52,'',10011337,'Leroy Somer','','',NULL),(53,'SET',10002920,'SDMO','10002920','',NULL),(54,'DMTR',10002919,'John Deere','CD3029B023800','3029TF120',NULL),(55,'GEN',10002921,'Mecc Alte Spa','1211203','ECO 32-3S/4',NULL),(56,'SET',10003702,'Himoinsa','10003702','HWF-200 T5',NULL),(57,'DMTR',10003700,'Iveco','','NEF67 TE 2A',NULL),(58,'GEN',10003701,'Divers','','',NULL),(59,'SET',10003702,'Himoinsa','10003702','HWF-200 T5',NULL),(60,'DMTR',10003700,'Iveco','','NEF67 TE 2A',NULL),(61,'GEN',10003701,'Divers','','',NULL);
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `order_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`email`),
  KEY `FK82cog55ti5xd8e8ws288r1mdo` (`order_number`),
  CONSTRAINT `FK82cog55ti5xd8e8ws288r1mdo` FOREIGN KEY (`order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('','Service algemeen',10000061,NULL),('rvdmeer@kvt.nl','Meer van der R.A.',10000030,NULL),('rvrooy@kvt.nl','Rooij R. van',10000046,NULL),('sbesselink@kvt.nl','Besselink S.T.M.',10000036,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
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
  `order_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK810yvkdmayc4sty75cvftbmlo` (`order_number`),
  CONSTRAINT `FK810yvkdmayc4sty75cvftbmlo` FOREIGN KEY (`order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'Extra debiteur info','D','1','PR','28869',NULL),(2,'extra contractinfo','C','1','PR','40001353',NULL),(3,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(4,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(5,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(6,'extra equipment info','E','1','PO','10003702',NULL),(7,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(8,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(9,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(10,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(11,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(12,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(13,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(14,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(15,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(16,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(17,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(18,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(19,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(20,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(21,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(22,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(23,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(24,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(25,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(26,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(27,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(28,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(29,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(30,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(31,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(32,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(33,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(34,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(35,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(36,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(37,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(38,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(39,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(40,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(41,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(42,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(43,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(44,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(45,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(46,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(47,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(48,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(49,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(50,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(51,'Extra debiteur info','D','1','PR','28869',NULL),(52,'extra contractinfo','C','1','PR','40001353',NULL),(53,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(54,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(55,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(56,'extra equipment info','E','1','PO','10003702',NULL),(57,'Extra debiteur info','D','1','PR','28869',NULL),(58,'extra contractinfo','C','1','PR','40001353',NULL),(59,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(60,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(61,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(62,'extra equipment info','E','1','PO','10003702',NULL);
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installation`
--

LOCK TABLES `installation` WRITE;
/*!40000 ALTER TABLE `installation` DISABLE KEYS */;
INSERT INTO `installation` VALUES (1,'Joop Geesinkweg 126','SportLed Trailer 26','1096 AT','Amsterdam',NULL),(2,'Mainhavenweg 6','Sonneborn Lombardini','1043 AL','Amsterdam',NULL),(3,'Mainhavenweg 6','Sonneborn Lombardini','1043 AL','Amsterdam',NULL),(4,'Mainhavenweg 6','Sonneborn Lombardini','1043 AL','Amsterdam',NULL),(5,'Schapendrift 170','OASEN SPS Hardinxveld-Giessendam','3371 JJ','Hardinxveld Giessendam',NULL),(6,'Mainhavenweg 6','Sonneborn','1043 AL','Amsterdam',NULL),(7,'Mainhavenweg 6','Sonneborn Lombardini','1043 AL','Amsterdam',NULL),(8,'Leersumsestraatweg','Viatel Doorn 1','3941 ML','Doorn',NULL),(9,'Leersumsestraatweg','Viatel Doorn 1','3941 ML','Doorn',NULL),(10,'Dartheideweg 1','Viatel Leersum','3956 NN','Leersum',NULL),(11,'Leersumsestraatweg','Viatel Doorn 2','3941 ML','Doorn',NULL),(12,'Sanderboutlaan','Petrochemical Pipeline Services','6181 DN','Elsloo',NULL),(13,'Sanderboutlaan','Petrochemical Pipeline Services','6181 DN','Elsloo',NULL),(14,'Quarantaineweg','Stemat','3089 KP','Rotterdam',NULL),(15,'Quarantaineweg','Stemat','3089 KP','Rotterdam',NULL),(16,'','','','',NULL),(17,'','','','',NULL),(18,'Albrandswaardsewijk 74','Delta HV4','3172 AA','Poortugaal',NULL),(19,'De Hooge Hoek','Scholtus Special Products','3927 GG','Renswoude',NULL),(20,'Buiten de Veste 1','Gemeentehuis Steenbergen','4651 TR','Steenbergen',NULL),(21,'Joop Geesinkweg 126','SportLed Trailer 26','1096 AT','Amsterdam',NULL),(22,'Joop Geesinkweg 126','SportLed Trailer 26','1096 AT','Amsterdam',NULL);
/*!40000 ALTER TABLE `installation` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `orders` VALUES (4008692,'2015-03-13 00:00:00','\0',NULL,NULL,'2016-04-13 21:58:50','graag gegevens aanvullen\n\nvoor code cijfersloten Lex van der Kade 065138 6097','SM04','getekend contract','rvrooy@kvt.nl',22,22),(4013250,'2016-04-05 00:00:00','\0',NULL,NULL,NULL,'','SM04','INK16000061-1','rvdmeer@kvt.nl',5,5),(4013294,'2016-04-06 00:00:00','\0',NULL,NULL,NULL,'Uitlaat flexibel reparen en aanbieden, bestellen bij ADL','SM04','4500622119','rvrooy@kvt.nl',6,6),(4013299,'2016-04-06 00:00:00','\0',NULL,NULL,'2016-04-13 18:04:21','','SM04','4500622119','rvrooy@kvt.nl',7,7),(4013730,'2016-04-05 00:00:00','\0',NULL,NULL,'2016-04-13 18:05:33','Dit setje draait 3000 toeren.\nSetje staat op de Leersumsestraatweg bij H ectometerpaal 23.1  bij de kruising met de Hoolweg.','SM04','260-414226','sbesselink@kvt.nl',9,9),(4013731,'2016-04-05 00:00:00','\0',NULL,NULL,'2016-04-13 18:06:34','3000 toeren aggregaat\nAdres is Rijksstraatweg bij hectometerpaal 24.6 op de kruising met de Dartheideweg','SM04','260-414226','sbesselink@kvt.nl',10,10),(4013735,'2016-04-05 00:00:00','\0',NULL,NULL,'2016-04-13 18:07:09','11-2-14 restwerk 2013 zie bijlage','SM04','260-414226','sbesselink@kvt.nl',11,11),(4014136,'2016-04-06 00:00:00','\0',NULL,NULL,'2016-04-13 18:07:53','','SM04','Fer Meuser','sbesselink@kvt.nl',12,12),(4014137,'2016-04-06 00:00:00','\0',NULL,NULL,'2016-04-13 18:08:38','','SM04','Fer Meuser','sbesselink@kvt.nl',13,13),(4014281,'2016-04-06 00:00:00','\0',NULL,NULL,'2016-04-13 18:09:26','','SM03','','rvdmeer@kvt.nl',15,15),(4014296,'2016-04-04 00:00:00','\0',NULL,NULL,'2016-04-13 18:10:02','','SM03','','',16,16),(4014297,'2016-03-29 00:00:00','\0',NULL,NULL,'2016-04-13 18:11:27','','SM03','Koen de Pauw','rvdmeer@kvt.nl',17,17),(4014491,'2016-04-04 00:00:00','\0',NULL,NULL,'2016-04-13 18:12:12','1-12-2011/74738JC: vervangen start accu\'s incl. equalizer.','SM03','','',18,18),(4014496,'2016-04-05 00:00:00','\0',NULL,NULL,'2016-04-13 18:12:46','','SM03','','rvrooy@kvt.nl',19,19),(4014498,'2016-04-04 00:00:00','\0',NULL,NULL,'2016-04-13 18:13:25','','SM03','','rvdmeer@kvt.nl',20,20);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_component`
--

DROP TABLE IF EXISTS `orders_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_component` (
  `Order_number` bigint(20) NOT NULL,
  `components_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_1steqr6a87dn6i1nto3qug0tr` (`components_id`),
  KEY `FKi1mtvagd2y3xso7unw7x8n15x` (`Order_number`),
  CONSTRAINT `FKi1mtvagd2y3xso7unw7x8n15x` FOREIGN KEY (`Order_number`) REFERENCES `orders` (`number`),
  CONSTRAINT `FKqmgmgmn1jlcugavl0miktnswr` FOREIGN KEY (`components_id`) REFERENCES `component` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_component`
--

LOCK TABLES `orders_component` WRITE;
/*!40000 ALTER TABLE `orders_component` DISABLE KEYS */;
INSERT INTO `orders_component` VALUES (4008692,1),(4008692,2),(4008692,3);
/*!40000 ALTER TABLE `orders_component` ENABLE KEYS */;
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
  UNIQUE KEY `UK_ahqagkr62ek304io2bijc1k9k` (`extraInfo_id`),
  KEY `FKaleric5yg7oduga35ugsx46he` (`Order_number`),
  CONSTRAINT `FK7sj2vbnyyxcuc3c2urbrs5sdx` FOREIGN KEY (`extraInfo_id`) REFERENCES `info` (`id`),
  CONSTRAINT `FKaleric5yg7oduga35ugsx46he` FOREIGN KEY (`Order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_info`
--

LOCK TABLES `orders_info` WRITE;
/*!40000 ALTER TABLE `orders_info` DISABLE KEYS */;
INSERT INTO `orders_info` VALUES (4008692,1),(4008692,2),(4008692,3),(4008692,4),(4008692,5),(4008692,6);
/*!40000 ALTER TABLE `orders_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_part`
--

DROP TABLE IF EXISTS `orders_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_part` (
  `Order_number` bigint(20) NOT NULL,
  `parts_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_93bgu4ddlrdvn9yqjnv5wipn4` (`parts_id`),
  KEY `FKd9vnd91un2spguf2qf1nlmctq` (`Order_number`),
  CONSTRAINT `FKcd2l1vfg4hacr28hcfx8uek0g` FOREIGN KEY (`parts_id`) REFERENCES `part` (`id`),
  CONSTRAINT `FKd9vnd91un2spguf2qf1nlmctq` FOREIGN KEY (`Order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_part`
--

LOCK TABLES `orders_part` WRITE;
/*!40000 ALTER TABLE `orders_part` DISABLE KEYS */;
INSERT INTO `orders_part` VALUES (4008692,1),(4008692,2),(4008692,3),(4008692,4);
/*!40000 ALTER TABLE `orders_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_task`
--

DROP TABLE IF EXISTS `orders_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_task` (
  `Order_number` bigint(20) NOT NULL,
  `tasks_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_avb0hcjjidk7llhtikdbp45rf` (`tasks_id`),
  KEY `FKik1nbdwf2qfywmp70pbgixxj0` (`Order_number`),
  CONSTRAINT `FK7btmgkxbn0yl19249qipstxh5` FOREIGN KEY (`tasks_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FKik1nbdwf2qfywmp70pbgixxj0` FOREIGN KEY (`Order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_task`
--

LOCK TABLES `orders_task` WRITE;
/*!40000 ALTER TABLE `orders_task` DISABLE KEYS */;
INSERT INTO `orders_task` VALUES (4008692,1);
/*!40000 ALTER TABLE `orders_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part`
--

DROP TABLE IF EXISTS `part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bdmng` varchar(255) DEFAULT NULL,
  `matnr` varchar(255) DEFAULT NULL,
  `mattx` varchar(255) DEFAULT NULL,
  `order_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKth8rmh061rh5i8786v0vw3fbu` (`order_number`),
  CONSTRAINT `FKth8rmh061rh5i8786v0vw3fbu` FOREIGN KEY (`order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES (1,'1','AO-1C8500','MOBIL DELVAC  MX 15W40 20 LITER CAN',NULL),(2,'1','AO-12AFS19821','WATERSEPARATOR',NULL),(3,'1','AO-12ALF16015','OLIEFILTER',NULL),(4,'1','AO-12AFF5485','BRANDSTOFFILTER',NULL),(5,'1','LO-2175260','OILFILTER',NULL),(6,'1','LO-2175264','FUELFILTER',NULL),(7,'1','LO-2175260','OILFILTER',NULL),(8,'1','LO-2175264','FUELFILTER',NULL),(9,'1','LO-2175260','OILFILTER',NULL),(10,'1','LO-2175264','FUELFILTER',NULL),(11,'1','AO-12AWF2054A','WATERFILTER',NULL),(12,'1','AO-12AFF5580','BRANDSTOFFILTER',NULL),(13,'1','AO-12AFS19732','WATERSEPARATOR',NULL),(14,'1','AO-12ALF9009','OLIEFILTER',NULL),(15,'1','WI-10000-51232','FUEL FILTER',NULL),(16,'1','WI-915-155','OIL FILTER',NULL),(17,'1','LO-2175260','OILFILTER',NULL),(18,'1','LO-2175264','FUELFILTER',NULL),(19,'2','','Filter P550942',NULL),(20,'2','','Filter P550690',NULL),(21,'1','KO-GM47465','OIL FILTER',NULL),(22,'1','KO-GM32359','FUELFILTER',NULL),(23,'64','SK-10987-1SP','FLANGE BUSHING',NULL),(24,'64','SK-10988-1SP','BUSH',NULL),(25,'16','SK-40402','CLIP',NULL),(26,'16','SK-40243-1SP','CAP',NULL),(27,'16','SK-60372','RING',NULL),(28,'32','SK-40382','CLIP',NULL),(29,'32','SK-60306','RING',NULL),(30,'4','SK-40368-1SP','HEAT EXCHANGER SK35',NULL),(31,'32','SK-60307','RING',NULL),(32,'16','SK-40143','ZINK ANODE',NULL),(33,'8','AO-1C6600','KOELVLOEISTOF A 5 LTR.',NULL),(34,'16','SK-11001-1SP','BRAKE CRANK PIN SK35',NULL),(35,'4','SK-40317-1SP','HEAT EXCHANGER M26',NULL),(36,'16','SK-40143SP','ZINK ANODE',NULL),(37,'4','SK-10687SP','M21, M21A, M26 Brake Pin and Rod End',NULL),(38,'4','SK-10685SP','M26/SK26 BRAKE BUSHING REPL KIT',NULL),(39,'64','SK-10987-1SP','FLANGE BUSHING',NULL),(40,'64','SK-10988-1SP','BUSH',NULL),(41,'16','SK-40402','CLIP',NULL),(42,'16','SK-40243-1SP','CAP',NULL),(43,'16','SK-60372','RING',NULL),(44,'32','SK-40382','CLIP',NULL),(45,'32','SK-60306','RING',NULL),(46,'4','SK-40368-1SP','HEAT EXCHANGER SK35',NULL),(47,'32','SK-60307','RING',NULL),(48,'16','SK-40143','ZINK ANODE',NULL),(49,'8','AO-1C6600','KOELVLOEISTOF A 5 LTR.',NULL),(50,'16','SK-11001-1SP','BRAKE CRANK PIN SK35',NULL),(51,'4','SK-40317-1SP','HEAT EXCHANGER M26',NULL),(52,'16','SK-40143SP','ZINK ANODE',NULL),(53,'4','SK-10687SP','M21, M21A, M26 Brake Pin and Rod End',NULL),(54,'4','SK-10685SP','M26/SK26 BRAKE BUSHING REPL KIT',NULL),(55,'1','AO-11A1050S','STARTACCU 50AH',NULL),(56,'1','AO-1C8500','MOBIL DELVAC  MX 15W40 20 LITER CAN',NULL),(57,'1','AO-12AFS19821','WATERSEPARATOR',NULL),(58,'1','AO-12ALF16015','OLIEFILTER',NULL),(59,'1','AO-12AFF5485','BRANDSTOFFILTER',NULL),(60,'1','AO-1C8500','MOBIL DELVAC  MX 15W40 20 LITER CAN',NULL),(61,'1','AO-12AFS19821','WATERSEPARATOR',NULL),(62,'1','AO-12ALF16015','OLIEFILTER',NULL),(63,'1','AO-12AFF5485','BRANDSTOFFILTER',NULL);
/*!40000 ALTER TABLE `part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation`
--

DROP TABLE IF EXISTS `relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contactPerson` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `order_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKojngnmliib1t96ub6prmfgngv` (`order_number`),
  CONSTRAINT `FKojngnmliib1t96ub6prmfgngv` FOREIGN KEY (`order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation`
--

LOCK TABLES `relation` WRITE;
/*!40000 ALTER TABLE `relation` DISABLE KEYS */;
INSERT INTO `relation` VALUES (1,NULL,'SPORTLED NEDERLAND B.V.',28869,NULL,'AMSTERDAM',NULL),(2,NULL,'SONNEBORN REFINED PRODUCTS BV',12182,NULL,'AMSTERDAM',NULL),(3,NULL,'SONNEBORN REFINED PRODUCTS BV',12182,NULL,'AMSTERDAM',NULL),(4,NULL,'SONNEBORN REFINED PRODUCTS BV',12182,NULL,'AMSTERDAM',NULL),(5,NULL,'OASEN DRINKWATER N.V.',24157,NULL,'GOUDA',NULL),(6,NULL,'SONNEBORN REFINED PRODUCTS BV',12182,NULL,'AMSTERDAM',NULL),(7,NULL,'SONNEBORN REFINED PRODUCTS BV',12182,NULL,'AMSTERDAM',NULL),(8,NULL,'VOLKER WESSELS TELECOM',31372,NULL,'AMERSFOORT',NULL),(9,NULL,'VOLKER WESSELS TELECOM',31372,NULL,'AMERSFOORT',NULL),(10,NULL,'VOLKER WESSELS TELECOM',31372,NULL,'AMERSFOORT',NULL),(11,NULL,'VOLKER WESSELS TELECOM',31372,NULL,'AMERSFOORT',NULL),(12,NULL,'PETROCHEMICAL PIPELINE SERVICES BV',1088,NULL,'ELSLOO',NULL),(13,NULL,'PETROCHEMICAL PIPELINE SERVICES BV',1088,NULL,'ELSLOO',NULL),(14,NULL,'LARS YACHT CHARTER B.V.',21362,NULL,'WIERDEN',NULL),(15,NULL,'LARS YACHT CHARTER B.V.',21362,NULL,'WIERDEN',NULL),(16,NULL,'CONVER B.V.',11612,NULL,'GIESSEN',NULL),(17,NULL,'ATLAS COPCO NEDERLAND B.V.',10177,NULL,'ZWIJNDRECHT',NULL),(18,NULL,'WL TECHNISCH ONDERHOUD B.V.',32294,NULL,'ROTTERDAM',NULL),(19,NULL,'SCHOLTUS SPECIAL PRODUCTS',1364,NULL,'RENSWOUDE',NULL),(20,NULL,'ALEWIJNSE DELFT B.V.',10427,NULL,'DELFT',NULL),(21,NULL,'SPORTLED NEDERLAND B.V.',28869,NULL,'AMSTERDAM',NULL),(22,NULL,'SPORTLED NEDERLAND B.V.',28869,NULL,'AMSTERDAM',NULL);
/*!40000 ALTER TABLE `relation` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(2,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(3,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(4,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(5,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(6,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(7,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(8,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(9,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(10,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(11,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(12,'SP02','Inspectie beurt','SM01','0010',NULL),(13,'SP30','Belast beproeven extern','SM01','0010',NULL),(14,'','Onderhoud 4x Seakeeper M26000','SM01','0010',NULL),(15,'','Onderhoud 4x Seakeeper M26000','SM01','0010',NULL),(16,'','Conver Active Foutcode 5245','SM01','0010',NULL),(17,'','onbekende motorstoring','SM01','0010',NULL),(18,'','set start niet op','SM01','0010',NULL),(19,'','Oude startaccu vervangen 1 stuks','SM01','0020',NULL),(20,'','Scholtus verlies koelmiddel','SM01','0010',NULL),(21,'','Vervangen Startaccu','SM01','0010',NULL),(22,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(23,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
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
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin'),(2,'rvrooy@kvt.nl','rvrooy@kvt.nl','rvrooy@kvt.nl'),(3,'rvdmeer@kvt.nl','rvdmeer@kvt.nl','rvdmeer@kvt.nl'),(4,'sbesselink@kvt.nl','sbesselink@kvt.nl','sbesselink@kvt.nl');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'kvt_db'
--

--
-- Dumping routines for database 'kvt_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-15 12:54:21
