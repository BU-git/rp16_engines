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
  KEY `FK20f6oo8uocae2hwjpspm179x9` (`order_number`),
  CONSTRAINT `FK20f6oo8uocae2hwjpspm179x9` FOREIGN KEY (`order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
INSERT INTO `component` VALUES (1,'SET',10003702,'Himoinsa','10003702','HWF-200 T5',NULL),(2,'DMTR',10003700,'Iveco','','NEF67 TE 2A',NULL),(3,'GEN',10003701,'Divers','','',NULL),(4,'SET',10003280,'Cummins','10003280','',NULL),(5,'GEN',10003281,'Stamford','C249299/01','HC1 434 C2',NULL),(6,'DMTR',10003282,'Cummins','21733276','QSL9-G5',NULL),(7,'SET',10003122,'Perkins','10003122','',NULL),(8,'GEN',10003123,'Divers','','',NULL),(9,'DMTR',10003124,'Perkins','HP51099U978242','404C',NULL),(10,'SET',10003365,'Lombardini','DGM1200/5372OM','',NULL),(11,'DMTR',10003363,'Lombardini','4330474K391483','LDW 1503',NULL),(12,'GEN',10003364,'Divers','','',NULL),(13,'SET',10003546,'Lister','10003546','',NULL),(14,'DMTR',10003544,'Lister','4903770','LPW4A009',NULL),(15,'GEN',10003545,'Stamford','0112010/01','BCAI 162J1',NULL),(16,'SET',10003549,'Lister','10003549','',NULL),(17,'DMTR',10003547,'Lister','4901089','LPW4A009',NULL),(18,'GEN',10003548,'Stamford','99085035','BCAI 162J1',NULL),(19,'SET',10003948,'Atlas Copco','10003948','qsa 38',NULL),(20,'DMTR',10003946,'Yanmar','9355','4TNE94-acg',NULL),(21,'GEN',10003947,'Mecc Alte Spa','839050','eco32-1s/4',NULL),(22,'',10010315,'FG Wilson','FGWPEP22PBMU10348','P45',NULL),(23,'',10009655,'','','',NULL),(24,'',10010348,'Perkins','DKU453975A','1103A-33TG1',NULL),(25,'',10010349,'Leroy Somer','328176/001','LL1514L',NULL),(26,'',10010315,'FG Wilson','FGWPEP22PBMU10348','P45',NULL),(27,'',10009655,'','','',NULL),(28,'',10010348,'Perkins','DKU453975A','1103A-33TG1',NULL),(29,'',10010349,'Leroy Somer','328176/001','LL1514L',NULL),(30,'',10005738,'Seakeeper','M26000S53','M26000',NULL),(31,'',10009890,'','JU83096L000672A','',NULL),(32,'DMTR',10011304,'Perkins','CZHRCG05_D0R_QG5CA','854F-E34TAWF',NULL),(33,'',0,'','','',NULL),(34,'SET',10003160,'F.G. Wilson','10003160','',NULL),(35,'DMTR',10003158,'Perkins','HGB061161U2205M','2806CE 16TAG2',NULL),(36,'GEN',10003159,'Leroy Somer','185535/25','LL6014H',NULL),(37,'',10011320,'FG Wilson','FGWRPES2CPDS05650','P400',NULL),(38,'',10011321,'Perkins','FGD061430U6437N','2306C-E14TAG3',NULL),(39,'',10011337,'Leroy Somer','','',NULL),(40,'SET',10002920,'SDMO','10002920','',NULL),(41,'DMTR',10002919,'John Deere','CD3029B023800','3029TF120',NULL),(42,'GEN',10002921,'Mecc Alte Spa','1211203','ECO 32-3S/4',NULL),(43,'SET',10000433,'Perkins','10000433','',NULL),(44,'GEN',10000431,'Stamford','C099352/03','HCK 544 F',NULL),(45,'DMTR',10000432,'Perkins','SGC120229U2595D','3012 TAG 2A',NULL);
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
  KEY `FKretxmxjqrqmvn6norv6n5nqll` (`order_number`),
  CONSTRAINT `FKretxmxjqrqmvn6norv6n5nqll` FOREIGN KEY (`order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('','Service algemeen',10000061,NULL),('mmoret@kvt.nl','Moret M.C.',10000071,NULL),('rvdmeer@kvt.nl','Meer van der R.A.',10000030,NULL),('rvrooy@kvt.nl','Rooij R. van',10000046,NULL),('sbesselink@kvt.nl','Besselink S.T.M.',10000036,NULL);
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
  KEY `FKqhw6ymdjmhatr4gnfaeqjnx75` (`order_number`),
  CONSTRAINT `FKqhw6ymdjmhatr4gnfaeqjnx75` FOREIGN KEY (`order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'Extra debiteur info','D','1','PR','28869',NULL),(2,'extra contractinfo','C','1','PR','40001353',NULL),(3,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(4,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(5,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(6,'extra equipment info','E','1','PO','10003702',NULL),(7,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(8,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(9,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(10,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(11,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(12,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(13,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(14,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(15,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(16,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(17,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(18,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(19,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(20,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(21,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(22,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(23,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(24,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(25,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(26,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(27,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(28,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(29,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(30,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(31,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(32,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(33,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(34,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(35,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(36,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(37,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(38,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL),(39,'extra artikel info generator','A','1','PO','GENERATOR',NULL),(40,'extra artikel info GENERATORSET','A','1','PR','GENERATORSET',NULL),(41,'extra infor DIESELMOTOR','A','1','PR','DIESELMOTOR',NULL);
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
  KEY `FKdfou0ca3vdtkqgk91461qydui` (`order_number`),
  CONSTRAINT `FKdfou0ca3vdtkqgk91461qydui` FOREIGN KEY (`order_number`) REFERENCES `orders` (`number`)
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
  `employee_email` varchar(255) DEFAULT NULL,
  `installation_id` bigint(20) DEFAULT NULL,
  `relation_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`number`),
  KEY `FKdoemys5p56evlctvjicr8o5hw` (`employee_email`),
  KEY `FK3yo8dq3hcx04951cyev63db9v` (`installation_id`),
  KEY `FK6qvh5q9e8nixx20xl65cpbq6i` (`relation_id`),
  CONSTRAINT `FK3yo8dq3hcx04951cyev63db9v` FOREIGN KEY (`installation_id`) REFERENCES `installation` (`id`),
  CONSTRAINT `FK6qvh5q9e8nixx20xl65cpbq6i` FOREIGN KEY (`relation_id`) REFERENCES `relation` (`id`),
  CONSTRAINT `FKdoemys5p56evlctvjicr8o5hw` FOREIGN KEY (`employee_email`) REFERENCES `employee` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (4008692,'2015-03-13 00:00:00','\0','2016-04-15 22:12:05',NULL,'2016-04-15 22:12:05','graag gegevens aanvullen\n\nvoor code cijfersloten Lex van der Kade 065138 6097','SM04','getekend contract','rvrooy@kvt.nl',1,1),(4013250,'2016-04-05 00:00:00','\0','2016-04-15 22:12:05',NULL,'2016-04-15 22:12:05','','SM04','INK16000061-1','rvdmeer@kvt.nl',2,2),(4013294,'2016-04-06 00:00:00','\0','2016-04-15 22:12:05',NULL,'2016-04-15 22:12:05','Uitlaat flexibel reparen en aanbieden, bestellen bij ADL','SM04','4500622119','rvrooy@kvt.nl',3,3),(4013299,'2016-04-06 00:00:00','\0','2016-04-15 22:12:05',NULL,'2016-04-15 22:12:05','','SM04','4500622119','rvrooy@kvt.nl',4,4),(4013730,'2016-04-05 00:00:00','\0','2016-04-15 22:12:06',NULL,'2016-04-15 22:12:06','Dit setje draait 3000 toeren.\nSetje staat op de Leersumsestraatweg bij H ectometerpaal 23.1  bij de kruising met de Hoolweg.','SM04','260-414226','sbesselink@kvt.nl',5,5),(4013731,'2016-04-05 00:00:00','\0','2016-04-15 22:12:06',NULL,'2016-04-15 22:12:06','3000 toeren aggregaat\nAdres is Rijksstraatweg bij hectometerpaal 24.6 op de kruising met de Dartheideweg','SM04','260-414226','sbesselink@kvt.nl',6,6),(4013735,'2016-04-05 00:00:00','\0','2016-04-15 22:12:06',NULL,'2016-04-15 22:12:06','11-2-14 restwerk 2013 zie bijlage','SM04','260-414226','sbesselink@kvt.nl',7,7),(4014136,'2016-04-06 00:00:00','\0','2016-04-15 22:12:06',NULL,'2016-04-15 22:12:06','','SM04','Fer Meuser','sbesselink@kvt.nl',8,8),(4014137,'2016-04-06 00:00:00','\0','2016-04-15 22:12:06',NULL,'2016-04-15 22:12:06','','SM04','Fer Meuser','sbesselink@kvt.nl',9,9),(4014281,'2016-04-06 00:00:00','\0','2016-04-15 22:12:06',NULL,'2016-04-15 22:12:06','','SM03','','rvdmeer@kvt.nl',10,10),(4014296,'2016-04-04 00:00:00','\0','2016-04-15 22:12:06',NULL,'2016-04-15 22:12:06','','SM03','','',11,11),(4014297,'2016-03-29 00:00:00','\0','2016-04-15 22:12:06',NULL,'2016-04-15 22:12:06','','SM03','Koen de Pauw','rvdmeer@kvt.nl',12,12),(4014491,'2016-04-04 00:00:00','\0','2016-04-15 22:12:06',NULL,'2016-04-15 22:12:06','1-12-2011/74738JC: vervangen start accu\'s incl. equalizer.','SM03','','',13,13),(4014496,'2016-04-05 00:00:00','\0','2016-04-15 22:12:07',NULL,'2016-04-15 22:12:07','','SM03','','rvrooy@kvt.nl',14,14),(4014498,'2016-04-04 00:00:00','\0','2016-04-15 22:12:07',NULL,'2016-04-15 22:12:07','','SM03','','rvdmeer@kvt.nl',15,15),(4014527,'2016-04-05 00:00:00','\0','2016-04-15 22:12:07',NULL,'2016-04-15 22:12:07','Let op! contract formeel door Colt beeindigd wegens herstructurering per 31 mei 2002. Er volgt een nieuwe aanvraagLet op !!! Accus verv ivm leef ijd.$st. + 2 st. besturingsaccu\'s.  fan is ok.Oliedrukzender vervangen d 11-11-99, brandstoftankinhoudsmeter','SM03','','mmoret@kvt.nl',16,16);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
  KEY `FKha8itbnof6hx3gdo0vs44srce` (`order_number`),
  CONSTRAINT `FKha8itbnof6hx3gdo0vs44srce` FOREIGN KEY (`order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES (1,'1','AO-1C8500','MOBIL DELVAC  MX 15W40 20 LITER CAN',NULL),(2,'1','AO-12AFS19821','WATERSEPARATOR',NULL),(3,'1','AO-12ALF16015','OLIEFILTER',NULL),(4,'1','AO-12AFF5485','BRANDSTOFFILTER',NULL),(5,'1','AO-12AWF2054A','WATERFILTER',NULL),(6,'1','AO-12AFF5580','BRANDSTOFFILTER',NULL),(7,'1','AO-12AFS19732','WATERSEPARATOR',NULL),(8,'1','AO-12ALF9009','OLIEFILTER',NULL),(9,'1','WI-10000-51232','FUEL FILTER',NULL),(10,'1','WI-915-155','OIL FILTER',NULL),(11,'1','LO-2175260','OILFILTER',NULL),(12,'1','LO-2175264','FUELFILTER',NULL),(13,'2','','Filter P550942',NULL),(14,'2','','Filter P550690',NULL),(15,'1','KO-GM47465','OIL FILTER',NULL),(16,'1','KO-GM32359','FUELFILTER',NULL),(17,'64','SK-10987-1SP','FLANGE BUSHING',NULL),(18,'64','SK-10988-1SP','BUSH',NULL),(19,'16','SK-40402','CLIP',NULL),(20,'16','SK-40243-1SP','CAP',NULL),(21,'16','SK-60372','RING',NULL),(22,'32','SK-40382','CLIP',NULL),(23,'32','SK-60306','RING',NULL),(24,'4','SK-40368-1SP','HEAT EXCHANGER SK35',NULL),(25,'32','SK-60307','RING',NULL),(26,'16','SK-40143','ZINK ANODE',NULL),(27,'8','AO-1C6600','KOELVLOEISTOF A 5 LTR.',NULL),(28,'16','SK-11001-1SP','BRAKE CRANK PIN SK35',NULL),(29,'4','SK-40317-1SP','HEAT EXCHANGER M26',NULL),(30,'16','SK-40143SP','ZINK ANODE',NULL),(31,'4','SK-10687SP','M21, M21A, M26 Brake Pin and Rod End',NULL),(32,'4','SK-10685SP','M26/SK26 BRAKE BUSHING REPL KIT',NULL),(33,'1','AO-11A1050S','STARTACCU 50AH',NULL);
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
  KEY `FKpikk1tkd4guuj9s2ni8ibxyvr` (`order_number`),
  CONSTRAINT `FKpikk1tkd4guuj9s2ni8ibxyvr` FOREIGN KEY (`order_number`) REFERENCES `orders` (`number`)
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
  `order_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc52lpsikf6axh1j8h8h0wl24a` (`order_number`),
  CONSTRAINT `FKc52lpsikf6axh1j8h8h0wl24a` FOREIGN KEY (`order_number`) REFERENCES `orders` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(2,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(3,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(4,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(5,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(6,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(7,'SP01','Serviceonderhoud noodstroominstallatie','SM01','0010',NULL),(8,'SP02','Inspectie beurt','SM01','0010',NULL),(9,'SP30','Belast beproeven extern','SM01','0010',NULL),(10,'','Onderhoud 4x Seakeeper M26000','SM01','0010',NULL),(11,'','Conver Active Foutcode 5245','SM01','0010',NULL),(12,'','onbekende motorstoring','SM01','0010',NULL),(13,'','set start niet op','SM01','0010',NULL),(14,'','Oude startaccu vervangen 1 stuks','SM01','0020',NULL),(15,'','Scholtus verlies koelmiddel','SM01','0010',NULL),(16,'','Vervangen Startaccu','SM01','0010',NULL),(17,'','Startstoring NSA','SM01','0010',NULL);
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

-- Dump completed on 2016-04-15 22:14:57
