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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
INSERT INTO `component` VALUES (1,'SET',10003702,'Himoinsa','10003702','HWF-200 T5'),(2,'DMTR',10003700,'Iveco','','NEF67 TE 2A'),(3,'GEN',10003701,'Divers','',''),(4,'SET',10003280,'Cummins','10003280',''),(5,'GEN',10003281,'Stamford','C249299/01','HC1 434 C2'),(6,'DMTR',10003282,'Cummins','21733276','QSL9-G5'),(7,'SET',10003122,'Perkins','10003122',''),(8,'GEN',10003123,'Divers','',''),(9,'DMTR',10003124,'Perkins','HP51099U978242','404C'),(10,'SET',10003365,'Lombardini','DGM1200/5372OM',''),(11,'DMTR',10003363,'Lombardini','4330474K391483','LDW 1503'),(12,'GEN',10003364,'Divers','',''),(13,'SET',10003546,'Lister','10003546',''),(14,'DMTR',10003544,'Lister','4903770','LPW4A009'),(15,'GEN',10003545,'Stamford','0112010/01','BCAI 162J1'),(16,'SET',10003549,'Lister','10003549',''),(17,'DMTR',10003547,'Lister','4901089','LPW4A009'),(18,'GEN',10003548,'Stamford','99085035','BCAI 162J1'),(19,'SET',10003948,'Atlas Copco','10003948','qsa 38'),(20,'DMTR',10003946,'Yanmar','9355','4TNE94-acg'),(21,'GEN',10003947,'Mecc Alte Spa','839050','eco32-1s/4'),(22,'',10010315,'FG Wilson','FGWPEP22PBMU10348','P45'),(23,'',10009655,'','',''),(24,'',10010348,'Perkins','DKU453975A','1103A-33TG1'),(25,'',10010349,'Leroy Somer','328176/001','LL1514L'),(26,'',10010315,'FG Wilson','FGWPEP22PBMU10348','P45'),(27,'',10009655,'','',''),(28,'',10010348,'Perkins','DKU453975A','1103A-33TG1'),(29,'',10010349,'Leroy Somer','328176/001','LL1514L'),(30,'',10005738,'Seakeeper','M26000S53','M26000'),(31,'',10009890,'','JU83096L000672A',''),(32,'DMTR',10011304,'Perkins','CZHRCG05_D0R_QG5CA','854F-E34TAWF'),(33,'',0,'','',''),(34,'SET',10003160,'F.G. Wilson','10003160',''),(35,'DMTR',10003158,'Perkins','HGB061161U2205M','2806CE 16TAG2'),(36,'GEN',10003159,'Leroy Somer','185535/25','LL6014H'),(37,'',10011320,'FG Wilson','FGWRPES2CPDS05650','P400'),(38,'',10011321,'Perkins','FGD061430U6437N','2306C-E14TAG3'),(39,'',10011337,'Leroy Somer','',''),(40,'SET',10002920,'SDMO','10002920',''),(41,'DMTR',10002919,'John Deere','CD3029B023800','3029TF120'),(42,'GEN',10002921,'Mecc Alte Spa','1211203','ECO 32-3S/4'),(43,'SET',10000433,'Perkins','10000433',''),(44,'GEN',10000431,'Stamford','C099352/03','HCK 544 F'),(45,'DMTR',10000432,'Perkins','SGC120229U2595D','3012 TAG 2A');
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `order_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfg7fq3r5t9vwa9ld9y5hooh57` (`order_number`),
  CONSTRAINT `FKfg7fq3r5t9vwa9ld9y5hooh57` FOREIGN KEY (`order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'rvrooy@kvt.nl','Rooij R. van',10000046,NULL),(2,'rvdmeer@kvt.nl','Meer van der R.A.',10000030,NULL),(3,'rvrooy@kvt.nl','Rooij R. van',10000046,NULL),(4,'rvrooy@kvt.nl','Rooij R. van',10000046,NULL),(5,'sbesselink@kvt.nl','Besselink S.T.M.',10000036,NULL),(6,'sbesselink@kvt.nl','Besselink S.T.M.',10000036,NULL),(7,'sbesselink@kvt.nl','Besselink S.T.M.',10000036,NULL),(8,'sbesselink@kvt.nl','Besselink S.T.M.',10000036,NULL),(9,'sbesselink@kvt.nl','Besselink S.T.M.',10000036,NULL),(10,'rvdmeer@kvt.nl','Meer van der R.A.',10000030,NULL),(11,'','Service algemeen',10000061,NULL),(12,'rvdmeer@kvt.nl','Meer van der R.A.',10000030,NULL),(13,'','Service algemeen',10000061,NULL),(14,'rvrooy@kvt.nl','Rooij R. van',10000046,NULL),(15,'rvdmeer@kvt.nl','Meer van der R.A.',10000030,NULL),(16,'mmoret@kvt.nl','Moret M.C.',10000071,NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'Extra debiteur info','D','1','PR','28869'),(2,'extra contractinfo','C','1','PR','40001353'),(3,'extra artikel info generator','A','1','PO','GENERATOR'),(4,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET'),(5,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR'),(6,'extra equipment info','E','1','PO','10003702'),(7,'extra artikel info generator','A','1','PO','GENERATOR'),(8,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET'),(9,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR'),(10,'extra artikel info generator','A','1','PO','GENERATOR'),(11,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET'),(12,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR'),(13,'extra artikel info generator','A','1','PO','GENERATOR'),(14,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET'),(15,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR'),(16,'extra artikel info generator','A','1','PO','GENERATOR'),(17,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET'),(18,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR'),(19,'extra artikel info generator','A','1','PO','GENERATOR'),(20,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET'),(21,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR'),(22,'extra artikel info generator','A','1','PO','GENERATOR'),(23,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET'),(24,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR'),(25,'extra artikel info generator','A','1','PO','GENERATOR'),(26,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR'),(27,'extra artikel info generator','A','1','PO','GENERATOR'),(28,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR'),(29,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR'),(30,'extra artikel info generator','A','1','PO','GENERATOR'),(31,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET'),(32,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR'),(33,'extra artikel info generator','A','1','PO','GENERATOR'),(34,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET'),(35,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR'),(36,'extra artikel info generator','A','1','PO','GENERATOR'),(37,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET'),(38,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR'),(39,'extra artikel info generator','A','1','PO','GENERATOR'),(40,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET'),(41,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR');
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
  KEY `FKnub2i1khhebumrdbobkd41vpe` (`order_number`),
  CONSTRAINT `FKnub2i1khhebumrdbobkd41vpe` FOREIGN KEY (`order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installation`
--

LOCK TABLES `installation` WRITE;
/*!40000 ALTER TABLE `installation` DISABLE KEYS */;
INSERT INTO `installation` VALUES (1,'Joop Geesinkweg 126','SportLed Trailer 26','1096 AT','Amsterdam',NULL),(2,'Schapendrift 170','OASEN SPS Hardinxveld-Giessendam','3371 JJ','Hardinxveld Giessendam',NULL),(3,'Mainhavenweg 6','Sonneborn','1043 AL','Amsterdam',NULL),(4,'Mainhavenweg 6','Sonneborn Lombardini','1043 AL','Amsterdam',NULL),(5,'Leersumsestraatweg','Viatel Doorn 1','3941 ML','Doorn',NULL),(6,'Dartheideweg 1','Viatel Leersum','3956 NN','Leersum',NULL),(7,'Leersumsestraatweg','Viatel Doorn 2','3941 ML','Doorn',NULL),(8,'Sanderboutlaan','Petrochemical Pipeline Services','6181 DN','Elsloo',NULL),(9,'Sanderboutlaan','Petrochemical Pipeline Services','6181 DN','Elsloo',NULL),(10,'Quarantaineweg','Stemat','3089 KP','Rotterdam',NULL),(11,'','','','',NULL),(12,'','','','',NULL),(13,'Albrandswaardsewijk 74','Delta HV4','3172 AA','Poortugaal',NULL),(14,'De Hooge Hoek','Scholtus Special Products','3927 GG','Renswoude',NULL),(15,'Buiten de Veste 1','Gemeentehuis Steenbergen','4651 TR','Steenbergen',NULL),(16,'Van der Madeweg 12','Colt Telecom MAD-Node','1099 BT','Duivendrecht',NULL);
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
  `importDate` datetime DEFAULT NULL,
  `lastAndroidChangeDate` datetime DEFAULT NULL,
  `lastServerChangeDate` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `orderType` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `installation_id` bigint(20) DEFAULT NULL,
  `relation_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`number`),
  KEY `FKog5v9ga2g2ukytypn4ocip6b4` (`employee_id`),
  KEY `FKor1em9yyuo3tql666iikfyxeg` (`installation_id`),
  KEY `FKdeccp01mccu6dso0bc85ehciy` (`relation_id`),
  CONSTRAINT `FKdeccp01mccu6dso0bc85ehciy` FOREIGN KEY (`relation_id`) REFERENCES `relation` (`id`),
  CONSTRAINT `FKog5v9ga2g2ukytypn4ocip6b4` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `FKor1em9yyuo3tql666iikfyxeg` FOREIGN KEY (`installation_id`) REFERENCES `installation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (4008692,'2015-03-13 00:00:00','\0','2016-04-18 20:44:45',NULL,'2016-04-18 20:44:45','graag gegevens aanvullen\n\nvoor code cijfersloten Lex van der Kade 065138 6097','SM04','getekend contract',1,1,1),(4013250,'2016-04-05 00:00:00','\0','2016-04-18 20:44:46',NULL,'2016-04-18 20:44:46','','SM04','INK16000061-1',2,2,2),(4013294,'2016-04-06 00:00:00','\0','2016-04-18 20:44:47',NULL,'2016-04-18 20:44:47','Uitlaat flexibel reparen en aanbieden, bestellen bij ADL','SM04','4500622119',3,3,3),(4013299,'2016-04-06 00:00:00','\0','2016-04-18 20:44:47',NULL,'2016-04-18 20:44:47','','SM04','4500622119',4,4,4),(4013730,'2016-04-05 00:00:00','\0','2016-04-18 20:44:47',NULL,'2016-04-18 20:44:47','Dit setje draait 3000 toeren.\nSetje staat op de Leersumsestraatweg bij H ectometerpaal 23.1  bij de kruising met de Hoolweg.','SM04','260-414226',5,5,5),(4013731,'2016-04-05 00:00:00','\0','2016-04-18 20:44:47',NULL,'2016-04-18 20:44:47','3000 toeren aggregaat\nAdres is Rijksstraatweg bij hectometerpaal 24.6 op de kruising met de Dartheideweg','SM04','260-414226',6,6,6),(4013735,'2016-04-05 00:00:00','\0','2016-04-18 20:44:47',NULL,'2016-04-18 20:44:47','11-2-14 restwerk 2013 zie bijlage','SM04','260-414226',7,7,7),(4014136,'2016-04-06 00:00:00','\0','2016-04-18 20:44:47',NULL,'2016-04-18 20:44:47','','SM04','Fer Meuser',8,8,8),(4014137,'2016-04-06 00:00:00','\0','2016-04-18 20:44:48',NULL,'2016-04-18 20:44:48','','SM04','Fer Meuser',9,9,9),(4014281,'2016-04-06 00:00:00','\0','2016-04-18 20:44:48',NULL,'2016-04-18 20:44:48','','SM03','',10,10,10),(4014296,'2016-04-04 00:00:00','\0','2016-04-18 20:44:48',NULL,'2016-04-18 20:44:48','','SM03','',11,11,11),(4014297,'2016-03-29 00:00:00','\0','2016-04-18 20:44:48',NULL,'2016-04-18 20:44:48','','SM03','Koen de Pauw',12,12,12),(4014491,'2016-04-04 00:00:00','\0','2016-04-18 20:44:48',NULL,'2016-04-18 20:44:48','1-12-2011/74738JC: vervangen start accu\'s incl. equalizer.','SM03','',13,13,13),(4014496,'2016-04-05 00:00:00','\0','2016-04-18 20:44:48',NULL,'2016-04-18 20:44:48','','SM03','',14,14,14),(4014498,'2016-04-04 00:00:00','\0','2016-04-18 20:44:48',NULL,'2016-04-18 20:44:48','','SM03','',15,15,15),(4014527,'2016-04-05 00:00:00','\0','2016-04-18 20:44:48',NULL,'2016-04-18 20:44:48','Let op! contract formeel door Colt beeindigd wegens herstructurering per 31 mei 2002. Er volgt een nieuwe aanvraagLet op !!! Accus verv ivm leef ijd.$st. + 2 st. besturingsaccu\'s.  fan is ok.Oliedrukzender vervangen d 11-11-99, brandstoftankinhoudsmeter','SM03','',16,16,16);
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
  `oc` int(11) NOT NULL,
  PRIMARY KEY (`Order_number`,`oc`),
  UNIQUE KEY `UK_1tqwg5n9hvxfd644rmw9wgri0` (`components_id`),
  CONSTRAINT `FK4gktjsrwo2a8fjtedjsiqwwxc` FOREIGN KEY (`components_id`) REFERENCES `component` (`id`),
  CONSTRAINT `FKi4d6e01iovc3oub69nckdq2ad` FOREIGN KEY (`Order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_components`
--

LOCK TABLES `orders_components` WRITE;
/*!40000 ALTER TABLE `orders_components` DISABLE KEYS */;
INSERT INTO `orders_components` VALUES (4008692,1,1),(4008692,2,2),(4008692,3,3),(4013250,4,1),(4013250,5,2),(4013250,6,3),(4013294,7,1),(4013294,8,2),(4013294,9,3),(4013299,10,1),(4013299,11,2),(4013299,12,3),(4013730,13,1),(4013730,14,2),(4013730,15,3),(4013731,16,1),(4013731,17,2),(4013731,18,3),(4013735,19,1),(4013735,20,2),(4013735,21,3),(4014136,22,1),(4014136,23,2),(4014136,24,3),(4014136,25,4),(4014137,26,1),(4014137,27,2),(4014137,28,3),(4014137,29,4),(4014281,30,1),(4014296,31,1),(4014296,32,2),(4014297,33,1),(4014491,34,1),(4014491,35,2),(4014491,36,3),(4014496,37,1),(4014496,38,2),(4014496,39,3),(4014498,40,1),(4014498,41,2),(4014498,42,3),(4014527,43,1),(4014527,44,2),(4014527,45,3);
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
  `oi` int(11) NOT NULL,
  PRIMARY KEY (`Order_number`,`oi`),
  UNIQUE KEY `UK_bixjm3t3srk0b6av4lrfrtjn5` (`extraInfo_id`),
  CONSTRAINT `FK1c43oq29r7lb232g26i9v8lx0` FOREIGN KEY (`extraInfo_id`) REFERENCES `info` (`id`),
  CONSTRAINT `FKjj7rlv0vrmn4pqnigpg6k9rh3` FOREIGN KEY (`Order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_info`
--

LOCK TABLES `orders_info` WRITE;
/*!40000 ALTER TABLE `orders_info` DISABLE KEYS */;
INSERT INTO `orders_info` VALUES (4008692,1,1),(4008692,2,2),(4008692,3,3),(4008692,4,4),(4008692,5,5),(4008692,6,6),(4013250,7,1),(4013250,8,2),(4013250,9,3),(4013294,10,1),(4013294,11,2),(4013294,12,3),(4013299,13,1),(4013299,14,2),(4013299,15,3),(4013730,16,1),(4013730,17,2),(4013730,18,3),(4013731,19,1),(4013731,20,2),(4013731,21,3),(4013735,22,1),(4013735,23,2),(4013735,24,3),(4014136,25,1),(4014136,26,2),(4014137,27,1),(4014137,28,2),(4014296,29,1),(4014491,30,1),(4014491,31,2),(4014491,32,3),(4014496,33,1),(4014496,34,2),(4014496,35,3),(4014498,36,1),(4014498,37,2),(4014498,38,3),(4014527,39,1),(4014527,40,2),(4014527,41,3);
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
  `op` int(11) NOT NULL,
  PRIMARY KEY (`Order_number`,`op`),
  UNIQUE KEY `UK_tbw6iu6s1yxupiw9mikhhy0vo` (`parts_id`),
  CONSTRAINT `FK39xfemob380jf9ruu0bur0w9r` FOREIGN KEY (`Order_number`) REFERENCES `orders` (`number`),
  CONSTRAINT `FK84lpkqeqlqysscxtojxve9qqw` FOREIGN KEY (`parts_id`) REFERENCES `part` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_parts`
--

LOCK TABLES `orders_parts` WRITE;
/*!40000 ALTER TABLE `orders_parts` DISABLE KEYS */;
INSERT INTO `orders_parts` VALUES (4008692,1,1),(4008692,2,2),(4008692,3,3),(4008692,4,4),(4013250,5,1),(4013250,6,2),(4013250,7,3),(4013250,8,4),(4013294,9,1),(4013294,10,2),(4013299,11,1),(4013299,12,2),(4013731,13,1),(4013731,14,2),(4013735,15,1),(4013735,16,2),(4014281,17,1),(4014281,18,2),(4014281,19,3),(4014281,20,4),(4014281,21,5),(4014281,22,6),(4014281,23,7),(4014281,24,8),(4014281,25,9),(4014281,26,10),(4014281,27,11),(4014281,28,12),(4014281,29,13),(4014281,30,14),(4014281,31,15),(4014281,32,16),(4014498,33,1);
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
  `ot` int(11) NOT NULL,
  PRIMARY KEY (`Order_number`,`ot`),
  UNIQUE KEY `UK_7a9m9x3d4608cf5wi9ixy1xma` (`tasks_id`),
  CONSTRAINT `FK4f7rrgqsc0n66igpli3tqi4by` FOREIGN KEY (`tasks_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FKchctvgis4ubk94906og9xukux` FOREIGN KEY (`Order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_tasks`
--

LOCK TABLES `orders_tasks` WRITE;
/*!40000 ALTER TABLE `orders_tasks` DISABLE KEYS */;
INSERT INTO `orders_tasks` VALUES (4008692,1,1),(4013250,2,1),(4013294,3,1),(4013299,4,1),(4013730,5,1),(4013731,6,1),(4013735,7,1),(4014136,8,1),(4014137,9,1),(4014281,10,1),(4014296,11,1),(4014297,12,1),(4014491,13,1),(4014491,14,2),(4014496,15,1),(4014498,16,1),(4014527,17,1);
/*!40000 ALTER TABLE `orders_tasks` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES (1,'1','AO-1C8500','MOBIL DELVAC  MX 15W40 20 LITER CAN'),(2,'1','AO-12AFS19821','WATERSEPARATOR'),(3,'1','AO-12ALF16015','OLIEFILTER'),(4,'1','AO-12AFF5485','BRANDSTOFFILTER'),(5,'1','AO-12AWF2054A','WATERFILTER'),(6,'1','AO-12AFF5580','BRANDSTOFFILTER'),(7,'1','AO-12AFS19732','WATERSEPARATOR'),(8,'1','AO-12ALF9009','OLIEFILTER'),(9,'1','WI-10000-51232','FUEL FILTER'),(10,'1','WI-915-155','OIL FILTER'),(11,'1','LO-2175260','OILFILTER'),(12,'1','LO-2175264','FUELFILTER'),(13,'2','','Filter P550942'),(14,'2','','Filter P550690'),(15,'1','KO-GM47465','OIL FILTER'),(16,'1','KO-GM32359','FUELFILTER'),(17,'64','SK-10987-1SP','FLANGE BUSHING'),(18,'64','SK-10988-1SP','BUSH'),(19,'16','SK-40402','CLIP'),(20,'16','SK-40243-1SP','CAP'),(21,'16','SK-60372','RING'),(22,'32','SK-40382','CLIP'),(23,'32','SK-60306','RING'),(24,'4','SK-40368-1SP','HEAT EXCHANGER SK35'),(25,'32','SK-60307','RING'),(26,'16','SK-40143','ZINK ANODE'),(27,'8','AO-1C6600','KOELVLOEISTOF A 5 LTR.'),(28,'16','SK-11001-1SP','BRAKE CRANK PIN SK35'),(29,'4','SK-40317-1SP','HEAT EXCHANGER M26'),(30,'16','SK-40143SP','ZINK ANODE'),(31,'4','SK-10687SP','M21, M21A, M26 Brake Pin and Rod End'),(32,'4','SK-10685SP','M26/SK26 BRAKE BUSHING REPL KIT'),(33,'1','AO-11A1050S','STARTACCU 50AH');
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
  KEY `FKismm5l2b20o4yrmfks4903pbt` (`order_number`),
  CONSTRAINT `FKismm5l2b20o4yrmfks4903pbt` FOREIGN KEY (`order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation`
--

LOCK TABLES `relation` WRITE;
/*!40000 ALTER TABLE `relation` DISABLE KEYS */;
INSERT INTO `relation` VALUES (1,NULL,'SPORTLED NEDERLAND B.V.',28869,NULL,'AMSTERDAM',NULL),(2,NULL,'OASEN DRINKWATER N.V.',24157,NULL,'GOUDA',NULL),(3,NULL,'SONNEBORN REFINED PRODUCTS BV',12182,NULL,'AMSTERDAM',NULL),(4,NULL,'SONNEBORN REFINED PRODUCTS BV',12182,NULL,'AMSTERDAM',NULL),(5,NULL,'VOLKER WESSELS TELECOM',31372,NULL,'AMERSFOORT',NULL),(6,NULL,'VOLKER WESSELS TELECOM',31372,NULL,'AMERSFOORT',NULL),(7,NULL,'VOLKER WESSELS TELECOM',31372,NULL,'AMERSFOORT',NULL),(8,NULL,'PETROCHEMICAL PIPELINE SERVICES BV',1088,NULL,'ELSLOO',NULL),(9,NULL,'PETROCHEMICAL PIPELINE SERVICES BV',1088,NULL,'ELSLOO',NULL),(10,NULL,'LARS YACHT CHARTER B.V.',21362,NULL,'WIERDEN',NULL),(11,NULL,'CONVER B.V.',11612,NULL,'GIESSEN',NULL),(12,NULL,'ATLAS COPCO NEDERLAND B.V.',10177,NULL,'ZWIJNDRECHT',NULL),(13,NULL,'WL TECHNISCH ONDERHOUD B.V.',32294,NULL,'ROTTERDAM',NULL),(14,NULL,'SCHOLTUS SPECIAL PRODUCTS',1364,NULL,'RENSWOUDE',NULL),(15,NULL,'ALEWIJNSE DELFT B.V.',10427,NULL,'DELFT',NULL),(16,NULL,'STRABAG B.V.',28846,NULL,'VLAARDINGEN',NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010'),(2,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010'),(3,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010'),(4,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010'),(5,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010'),(6,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010'),(7,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010'),(8,'SP02','Inspectie beurt','SM01','0010'),(9,'SP30','Belast beproeven extern','SM01','0010'),(10,'','Onderhoud 4x Seakeeper M26000','SM01','0010'),(11,'','Conver Active Foutcode 5245','SM01','0010'),(12,'','onbekende motorstoring','SM01','0010'),(13,'','set start niet op','SM01','0010'),(14,'','Oude startaccu vervangen 1 stuks','SM01','0020'),(15,'','Scholtus verlies koelmiddel','SM01','0010'),(16,'','Vervangen Startaccu','SM01','0010'),(17,'','Startstoring NSA','SM01','0010');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','admin'),(2,'rvrooy@kvt.nl','rvrooy@kvt.nl','rvrooy@kvt.nl'),(3,'sbesselink@kvt.nl','sbesselink@kvt.nl','sbesselink@kvt.nl'),(4,'rvdmeer@kvt.nl','rvdmeer@kvt.nl','rvdmeer@kvt.nl');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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

-- Dump completed on 2016-04-18 20:48:50
