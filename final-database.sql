-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: moviestoredb
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `cardID` int(10) unsigned NOT NULL,
  `memberID` int(10) unsigned DEFAULT NULL,
  `creditCardCCV` int(10) unsigned DEFAULT NULL,
  `creditCardNumber` text,
  `cardHolderFirstName` varchar(45) DEFAULT NULL,
  `cardHolderLastName` varchar(45) DEFAULT NULL,
  `expYear` int(10) unsigned DEFAULT NULL,
  `expMonth` int(10) unsigned DEFAULT NULL,
  `ccType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cardID`),
  KEY `FK_card_1` (`memberID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (4,10001,12345,'3994781776575320','Richard','Shelby',2009,11,'AmericanExpress\r'),(5,10002,12345,'1933667408756440','Jeff','Sessions',2011,10,'Discover\r'),(6,10003,12345,'9751105946061040','Ted','Stevens',2011,5,'Visa\r'),(7,10004,12345,'1202366155621340','Lisa','Murkowski',2010,5,'Discover\r'),(8,10005,12345,'8035362684046050','John','McCain',2012,9,'AmericanExpress\r'),(9,10006,12345,'1876408666555860','Jon','Kyl',2008,9,'Discover\r'),(10,10007,12345,'7979756355328080','Blanche','Lincoln',2009,7,'MasterCard\r'),(11,10008,12345,'6295809193605710','Mark','Pryor',2008,9,'MasterCard\r'),(12,10009,12345,'5991223319790250','Dianne','Feinstein',2009,4,'Visa\r'),(13,10010,12345,'4919623420034730','Barbara','Boxer',2012,7,'Visa\r'),(14,10011,12345,'2568476161496700','Wayne','Allard',2010,3,'Visa\r'),(15,10012,12345,'8648458933928500','Ken','Salazar',2015,2,'Discover\r'),(16,10013,12345,'9892984032195930','Chris','Dodd',2013,8,'Discover\r'),(17,10014,12345,'3590389378753280','Joe','Lieberman',2016,8,'AmericanExpress\r'),(18,10015,12345,'7389010056583180','Joe','Biden',2009,11,'MasterCard\r'),(19,10016,12345,'4238545958242720','Tom','Carper',2011,1,'Visa\r'),(20,10017,12345,'9542286651415390','Bill','Nelson',2009,9,'Discover\r'),(21,10018,12345,'7389010056583180','Mel','Martinez',2010,6,'MasterCard\r'),(22,10019,12345,'4087388550889250','Dick','Durbin',2009,6,'MasterCard\r'),(23,10020,12345,'5997601199766710','Barack','Obama',2013,1,'Visa\r');
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `memberID` int(11) NOT NULL,
  `movieID` int(11) NOT NULL,
  `watchTime` datetime NOT NULL,
  PRIMARY KEY (`memberID`,`movieID`,`watchTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (10044,3,'2017-01-09 09:43:58'),(10044,5,'2017-05-29 09:43:58'),(10044,10,'2017-12-09 21:35:09'),(10044,10,'2017-12-09 23:22:51'),(10044,10,'2017-12-09 23:25:54'),(10044,10,'2017-12-09 23:26:04'),(10044,10,'2017-12-09 23:26:07'),(10044,10,'2017-12-09 23:26:09'),(10044,10,'2017-12-09 23:26:11'),(10044,10,'2017-12-09 23:26:17'),(10044,10,'2017-12-09 23:26:21'),(10044,10,'2017-12-09 23:35:20'),(10044,10,'2017-12-09 23:35:31'),(10044,10,'2017-12-09 23:35:59'),(10044,10,'2017-12-09 23:38:58'),(10044,25,'2017-12-09 20:51:28'),(10044,25,'2017-12-09 20:51:54'),(10044,40,'2017-12-09 21:35:23'),(10044,40,'2017-12-09 23:13:20'),(10044,40,'2017-12-09 23:52:21'),(10044,40,'2017-12-09 23:55:54'),(10044,40,'2017-12-09 23:55:59'),(10044,40,'2017-12-09 23:58:37'),(10048,6,'2017-12-13 16:23:00'),(10048,21,'2017-12-13 02:49:08'),(10048,21,'2017-12-13 02:51:02'),(10048,47,'2017-12-13 12:35:11'),(10048,50,'2017-12-13 17:19:54');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level` (
  `levelName` varchar(15) NOT NULL DEFAULT '',
  `levelNoDvdPerMonth` int(10) DEFAULT NULL,
  `levelChargePerMonth` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`levelName`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES ('Bronze',5,'$1.99'),('Gold',15,'$9.99'),('Platinum',-1,'$15.99'),('Silver',10,'$5.99');
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `movieID` int(11) NOT NULL,
  `memberID` varchar(45) NOT NULL,
  PRIMARY KEY (`movieID`,`memberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (5,'10048'),(6,'10044'),(10,'10044'),(20,'10044'),(40,'10044');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `memberID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `levelName` varchar(15) DEFAULT 'Silver',
  `userName` varchar(45) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `billAddressLine1` varchar(45) DEFAULT NULL,
  `billAddressLine2` varchar(45) DEFAULT NULL,
  `billCity` varchar(45) DEFAULT NULL,
  `billState` varchar(45) DEFAULT NULL,
  `billZipCode` varchar(10) DEFAULT NULL,
  `shipAddressLine1` varchar(45) DEFAULT NULL,
  `shipAddressLine2` varchar(45) DEFAULT NULL,
  `shipCity` varchar(45) DEFAULT NULL,
  `shipState` varchar(45) DEFAULT NULL,
  `shipZipCode` varchar(10) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `emailAddress` varchar(45) DEFAULT NULL,
  `memberPassword` varchar(45) DEFAULT NULL,
  `memberSince` date DEFAULT NULL,
  `activeStatus` tinyint(1) unsigned DEFAULT NULL,
  `genrePreference` varchar(45) DEFAULT NULL,
  `creditCardCCV` int(10) unsigned NOT NULL,
  `creditCardNumber` text NOT NULL,
  `cardHolderFirstName` varchar(45) NOT NULL,
  `cardHolderLastName` varchar(45) NOT NULL,
  `expYear` int(10) unsigned NOT NULL,
  `expMonth` int(10) unsigned NOT NULL,
  `ccType` varchar(45) NOT NULL,
  PRIMARY KEY (`memberID`)
) ENGINE=InnoDB AUTO_INCREMENT=10051 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (10001,'silver','rshelby','Richard','Shelby','422 Princeton Ct.','','Birmingham','AL','56231','422 Princeton Ct.','','Birmingham','AL','56231','(555) 555-0001','rshelby@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2007-01-01',1,'comedy ',12345,'3994781776575320','Richard','Shelby',2009,11,'AmericanExpress \r'),(10002,'gold','jsessions','Jeff','Sessions','68 Hanover Dr.','Apt 2','Mobile','AL','56498','68 Hanover Dr.','Apt 2','Mobile','AL','56498','(555) 555-0002','jsessions@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2007-01-01',1,'horror ',12345,'1933667408756440','Jeff','Sessions',2011,10,'Discover \r'),(10003,'platinum','tstevens','Ted','Stevens','1001 S. Limerick Dr.','','Anchorage','AK','45232','1001 S. Limerick Dr.','','Anchorage','AK','45232','(555) 555-1112','tstevens@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2007-01-01',1,'thriller ',12345,'9751105946061040','Ted','Stevens',2011,5,'Visa \r'),(10004,'silver','lmurkowski','Lisa','Murkowski','78 Bay Rd.','','Anchorage','AK','45678','78 Bay Rd.','','Anchorage','AK','45678','(555) 558-4621','lmurkowski@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2007-01-01',1,'sci-fi ',12345,'1202366155621340','Lisa','Murkowski',2010,5,'Discover \r'),(10005,'gold','jmccain','John','McCain','3042 W. Sunset Blvd','','Phoenix','AZ','98576','3042 W. Sunset Blvd','','Phoenix','AZ','98576','(555) 982-3861','jmccain@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2008-01-01',1,'drama ',12345,'8035362684046050','John','McCain',2012,9,'AmericanExpress \r'),(10006,'platinum','jkyl','Jon','Kyl','893 E.Rocky Rd.','Suite 701','Phoenix','AZ','89454','893 E.Rocky Rd.','Suite 701','Phoenix','AZ','89454','(555) 465-7312','jkyl@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2006-01-01',1,'action ',12345,'1876408666555860','Jon','Kyl',2008,9,'Discover \r'),(10007,'silver','blincoln','Blanche','Lincoln','3753 N. Pulaski Rd','','Helena','AR','64512','3753 N. Pulaski Rd','','Helena','AR','64512','(555) 643-1248','blincoln@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2006-01-01',1,'comedy ',12345,'7979756355328080','Blanche','Lincoln',2009,7,'MasterCard \r'),(10008,'gold','mpryor','Mark','Pryor','9 Faith Hill','Apt 7','Boumont','AR','76454','9 Faith Hill','Apt 7','Boumont','AR','76454','(555) 643-1279','mpryor@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2008-01-01',1,'horror ',12345,'6295809193605710','Mark','Pryor',2008,9,'MasterCard \r'),(10009,'platinum','dfeinstein','Dianne','Feinstein','239 Seaside Rd.','','Pasadena','CA','40232','239 Seaside Rd.','','Pasadena','CA','40232','(555) 976-4542','dfeinstein@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2008-01-01',1,'thriller ',12345,'5991223319790250','Dianne','Feinstein',2009,4,'Visa \r'),(10010,'silver','bboxer','Barbara','Boxer','678 S. Wales Street','','San Francisco','CA','30575','678 S. Wales Street','','San Francisco','CA','30575','(555) 643-4789','bboxer@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2006-01-01',1,'sci-fi ',12345,'4919623420034730','Barbara','Boxer',2012,7,'Visa \r'),(10011,'gold','wallard','Wayne','Allard','3833 N. Pinecone Way','','Denver','CO','78663','3833 N. Pinecone Way','','Denver','CO','78663','(555) 982-3572','wallard@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2008-01-01',1,'drama ',12345,'2568476161496700','Wayne','Allard',2010,3,'Visa \r'),(10012,'platinum','ksalazar','Ken','Salazar','1232 E. 5th Street','','Boulder','CO','30454','1232 E. 5th Street','','Boulder','CO','30454','(892) 352-8758','ksalazar@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2008-01-01',1,'action ',12345,'8648458933928500','Ken','Salazar',2015,2,'Discover \r'),(10013,'silver','cdodd','Chris','Dodd','89','','New Haven','CT','34222','89','','New Haven','CT','34222','(304) 985-7129','cdodd@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2007-01-01',1,'comedy ',12345,'9892984032195930','Chris','Dodd',2013,8,'Discover \r'),(10014,'gold','jlieberman','Joe','Lieberman','468 Kane Court','','Bridgeport','CT','39845','468 Kane Court','','Bridgeport','CT','39845','(398) 457-1029','jlieberman@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2007-01-01',1,'horror ',12345,'3590389378753280','Joe','Lieberman',2016,8,'AmericanExpress \r'),(10015,'platinum','jbiden','Joe','Biden','9485 Diversey Ave.','','Wellington','DE','2435','9485 Diversey Ave.','','Wellington','DE','2435','(239) 482-9762','jbiden@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2007-01-01',1,'thriller ',12345,'7389010056583180','Joe','Biden',2009,11,'MasterCard \r'),(10016,'silver','tcaper','Tom','Carper','12 Peacock Circle','','Monterrey','DE','24872','12 Peacock Circle','','Monterrey','DE','24872','(239) 847-5120','tcarper@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2008-01-01',1,'sci-fi ',12345,'4238545958242720','Tom','Carper',2011,1,'Visa \r'),(10017,'gold','bnelson','Bill','Nelson','4820 Futon Rd.','','Miami','FL','20841','4820 Futon Rd.','','Miami','FL','20841','(304) 920-9678','bnelson@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2007-01-01',1,'drama ',12345,'9542286651415390','Bill','Nelson',2009,9,'Discover \r'),(10018,'platinum','mmartinez','Mel','Martinez','248 Beachside Drive','','Pensacola','FL','60948','248 Beachside Drive','','Pensacola','FL','60948','(789) 465-8927','mmartinez@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2008-01-01',1,'action ',12345,'7389010056583180','Mel','Martinez',2010,6,'MasterCard \r'),(10019,'silver','ddurbin','Dick','Durbin','300 E. Wacker Dr.','','Chicago','IL','60001','300 E. Wacker Dr.','','Chicago','IL','60001','(312) 394-8762','ddurbin@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2008-01-01',1,'comedy ',12345,'4087388550889250','Dick','Durbin',2009,6,'MasterCard \r'),(10020,'gold','bobama','Barack','Obama','32 S. State Street','','Chicago','IL','60001','32 S. State Street','','Chicago','IL','60001','(312) 389-4762','bobama@yahoo.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2008-01-01',1,'horror ',12345,'5997601199766710','Barack','Obama',2013,1,'Visa \r'),(10041,'Platinum','LASTTEST','LASTTEST','LASTTEST','LASTTEST','LASTTEST','LASTTEST','KY','345345','LASTTEST','LASTTEST','LASTTEST','KY','34543','34534','LASTTEST','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc',NULL,NULL,'Action',34534534,'4534534534','LASTTEST','LASTTEST',2017,11,'Visa'),(10042,'Platinum','finaltest','finaltest','finaltest','finaltest','finaltest','finaltest','LA','34534','finaltest','finaltest','finaltest','MD','finaltest','34534534534','finaltest','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc',NULL,NULL,'Action',34534534,'34534534543','finaltest','finaltest',2012,1,'Visa'),(10043,'Bronze','ert','dgfg','dfgdfg','dfgdfg','dfgdfg','dfgdfg','IL','45646','fsgsdg','dfgdfg','fdgsgf','IL','34534543','dfgdfg','erte@fsg.com','084a3501edef6845f2f1e4198ec3a2b81cf5c6bc','2017-11-30',1,'Drama',5456456,'34535','dfsg','sfgdf',1,2019,'Discover'),(10044,'Platinum','ddemoll','David','Demoll','sdfsdf','sdfsdf','sdfsdf','IL','546456','fsdgdfg','dfgdfg','dfgdfg','LA','546456','666-555-5555','daviddemoll@gmail.com','f49a1f86260898ec0b60638e9f6370853e332a71','2017-11-30',1,'Drama',456456,'54646','fgdfg','dfgdfg',2022,2,'Discover'),(10045,'Silver','david','dsfsdf','sdfsdf','dsfdsf',NULL,'dsfdsf','IL','43534','435345','43534','fddfs','IL','345345','666-666-6666','dsfsdf@dsf.com','f49a1f86260898ec0b60638e9f6370853e332a71','2017-12-01',1,'Drama',43545,'34534','sdfsdf','sdfsdf',2018,11,'Discover'),(10046,'Silver','chuck','Chuck','Demoll','dsfsdf','dsfsdffdgdfg','gfhfsgds','LA','42542535','dsfsdf','dsfsdffdgdfg','gfhfsgds','LA','42542535','555-666-5555','test@yahoo.com','9d4e1e23bd5b727046a9e3b4b7db57bd8d6ee684','2017-12-05',1,'Action',5165,'61561651651','dsfsd','asfdhfdg',4455,12,'Discover'),(10047,'Silver','fdgdg','dfgdfg','dfgdfg','fdgdfg',NULL,'dfgdfg','IL','546456','fdgdfg',NULL,'dfgdfg','IL','546456','555-555-5555','dfgdf@fsgg.com','22ea1c649c82946aa6e479e1ffd321e4a318b1b0','2017-12-05',1,'Drama',456,'544546','dfgdfg','dfgdfg',2008,2,'Discover'),(10048,'Platinum','admin','NewName','last','3211 Oak ave','','Brookfield','IL','60513','3211 Oak ave','','Brookfield','IL','60513','708-205-2321','admin@admin.com','5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8','2017-12-11',1,'Action',123,'123123123123','test','test',2026,9,'Discover'),(10049,'Silver','newuser','test','test','3211 Oak Ave',NULL,'Brookfield','IL','60145','3211 Oak Ave',NULL,'Brookfield','IL','60145','708-205-3211','email@example.com','a88b7dcd1a9e3e17770bbaa6d7515b31a2d7e85d','2017-12-13',1,'Action',123,'1234567812345678','Adam','Garr',0,0,'Discover'),(10050,'Platinum','newuserr','pass','word','3211 Oak Ave',NULL,'Brookfield','IL','60513','3211 Oak Ave',NULL,'Brookfield','IL','60513','708-205-3211','new@user.com','5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8','2017-12-13',1,'Horror',123,'1234567812345678','Adam','Garr',0,0,'MasterCard');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `movieID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `movieGenre` varchar(45) DEFAULT NULL,
  `movieTitle` varchar(45) DEFAULT NULL,
  `movieDescription` text,
  `movieYearReleased` varchar(10) DEFAULT NULL,
  `movieImage` varchar(255) DEFAULT NULL,
  `movieTrailer` varchar(255) DEFAULT NULL,
  `movieReleaseDate` date DEFAULT NULL,
  `movieMPAARating` varchar(10) DEFAULT NULL,
  `director` varchar(45) NOT NULL,
  `actor1` varchar(45) NOT NULL,
  `actor2` varchar(45) NOT NULL,
  `imdbKey` varchar(45) DEFAULT NULL,
  `viewCount` int(11) DEFAULT '0',
  `likeCount` int(11) DEFAULT '0',
  PRIMARY KEY (`movieID`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Drama','11:14','Tells the seemingly random yet vitally connected story of a set of incidents that all converge one evening at 11:14pm. The story follows the chain of events of five different characters and five different storylines that all converge to tell the story of murder and deceit.','2003','https://storage.googleapis.com/java419/11_14.jpg','XS8gh5qMlFw','2004-08-20','R','Greg Marcks','Henry Thomas','Blake Heron\r','tt0331811',0,0),(2,'Drama','21 Grams','A freak accident brings together a critically ill mathematician (Penn) a grieving mother (Watts) and a born-again ex-con (Del Toro).','2003','https://storage.googleapis.com/java419/21_Grams.jpg','L2rK8w2ZpGw','2003-12-26','R','Alejandro González Iñárritu','Sean Penn','Naomi Watts\r','tt0315733',0,0),(3,'Drama','25th Hour','Cornered by the DEA convicted New York drug dealer Montgomery Brogan (Norton) reevaluates his life in the 24 remaining hours before facing a seven-year jail term.','2002','https://storage.googleapis.com/java419/25th_Hour.jpg','2qZVGJd6-rI','2003-01-10','R','Spike Lee','Edward Norton','Philip Seymour Hoffman\r','tt0307901',0,0),(4,'Drama','A Beautiful Mind','After a brilliant but asocial mathematician accepts secret work in cryptography his life takes a turn to the nightmarish.','2001','https://storage.googleapis.com/java419/A_Beautiful_Mind.jpg','YWwAOutgWBQ','2002-01-04','PG-13','Ron Howard','Russell Crowe','Ed Harris\r','tt0268978',0,0),(5,'Drama','A Bronx Tale','A father becomes worried when a local gangster befriends his son in the Bronx in the 1960s.','1993','https://storage.googleapis.com/java419/Bronx_Tale.jpg','1bkIqZfviXU','1993-09-29','R','Robert Deniro','Chazz Palminteri','Lillo Brancato\r','tt0106489',1,0),(6,'Drama','A Few Good Men','Neo military lawyer Kaffee defends Marines accused of murder; they contend they were acting under orders.','1992','https://storage.googleapis.com/java419/Few_Good_Men.jpg','ePo91pMcu94','1992-12-11','R','Rob Reiner','Jack Nicholson','Tom Cruise\r','tt0104257',1,0),(7,'Sci-Fi','Alien','A mining ship investigating a suspected SOS lands on a distant planet. The crew discovers some strange creatures and investigates.','1979','https://storage.googleapis.com/java419/Alien.jpg','LjLamj-b0I8','1979-05-25','R','Ridley Scott','Tom Skerritt','Sigourney Weaver\r','tt0078748',0,0),(8,'Sci-Fi','Alien³','Ripley continues to be stalked by a savage alien after her escape pod crashes on a prison planet.','1992','https://storage.googleapis.com/java419/Alien_3.jpg','Ipv1y-Phi7A','1992-05-22','R','David Fincher','Sigourney Weaver','Charles Dutton\r','tt0103644',0,0),(9,'Sci-Fi','Aliens','The planet from Alien (1979) has been colonized but contact is lost. This time the rescue team has impressive firepower enough?','1986','https://storage.googleapis.com/java419/Aliens.jpg','XKSQmYUaIyE','1986-07-18','R','James Cameron','Sigourney Weaver','Carrie Henn\r','tt0090605',0,0),(10,'Drama','Always Outnumbered','An ex-con moves to L.A. to find work and creates a disturbance by fighting for a position.','1998','https://storage.googleapis.com/java419/Always_Outnumbered.jpg','bMgLHo1phOw','1998-03-21','R','Michael Apted','Laurence Fishburne','Daniel Williams\r','tt0146425',11,0),(11,'Drama','Amadeus','The incredible story of Wolfgang Amadeus Mozart told in flashback mode by Antonio Salieri - now confined to an insane asylum.','1984','https://storage.googleapis.com/java419/Amadeus.jpg','r7kWQj9FCGY','1984-09-19','R','Milos Forman','F. Murray Abraham','Tom Hulce\r','tt0086879',0,0),(12,'Drama','American Beauty','Lester Burnham a depressed suburban father in a mid-life crisis decides to turn his hectic life around after developing an infatuation for his daughter\'s attractive friend.','1999','https://storage.googleapis.com/java419/American_Beauty.jpg','3ycmmJ6rxA8','1999-10-01','R','Sam Mendes','Kevin Spacey','Annette Bening\r','tt0169547',0,0),(13,'Drama','American History X','A former neo-nazi skinhead (Norton) tries to prevent his younger brother (Furlong) from going down the same wrong path that he did.','1998','https://storage.googleapis.com/java419/American_History_X.jpg','XfQYHqsiN5g','1998-10-30','R','Tony Kaye','Edward Norton','Edward Furlong\r','tt0120586',0,0),(14,'Drama','Amistad','AMISTAD is about a 1839 mutiny aboard a slave ship that is traveling towards the Northeast Coast of America. Much of the story involves a court-room 1 about the free-man who led the revolt.','1997','https://storage.googleapis.com/java419/Amistad.jpg','BJFDOvGMD0U','1997-12-10','R','Steven Spielberg','Morgna Freeman','Nigel Hawthorne\r','tt0118607',0,0),(15,'Drama','Amores perros','A horrific car accident connects three stories each involving characters dealing with loss regret and life\'s harsh realities all in the name of love.','2000','https://storage.googleapis.com/java419/Amores_perros.jpg','XToRtfQbeHg','2000-06-16','R','Alejandro González Iñárritu','Emilio Echevarría','Gael García Bernal\r','tt0245712',0,0),(16,'Comedy','Anger Management','Sandler plays a businessman who is wrongly sentenced to an anger-management program where he meets an aggressive instructor.','2003','https://storage.googleapis.com/java419/Anger_Manage.jpg','1Gl2kVUsy2M','2003-04-11','PG-13','Peter Segal','Jack Nicholson','Adam Sandler\r','tt0305224',1,0),(17,'Drama','Any Given Sunday','Any Given Sunday is a behind the scenes look at the life and death struggles of modern day gladiators and those who lead them.','1999','https://storage.googleapis.com/java419/Any_Given_Sunday.jpg','RN7sKvaHDlA','1999-12-22','R','Oliver Stone','Al Pacino','Cameron Diaz\r','tt0146838',0,0),(18,'Comedy','Arizona Dream','An Innuit hunter races his sled home with a fresh-caught halibut. This fish pervades the entire film...','1993','https://storage.googleapis.com/java419/Arizona_Dream.jpg','5xgHBIHUqfc','1994-09-09','R','Emir Kusturica','Johnny Depp','Jerry Lewis\r','tt0106307',0,0),(19,'Drama','Arlington Road','A college professor begins to suspect that his neighbour is a terrorist.','1999','https://storage.googleapis.com/java419/Arlington_Road.jpg','nk2CPzIgBRo','1999-07-09','R','Mark Pellington','Jeff Bridges','Tim Robbins\r','tt0137363',0,0),(20,'Comedy','As Good as It Gets','A single mother/waitress a misanthropic author and a gay artist form an unlikely friendship','1997','https://storage.googleapis.com/java419/As_Good_As_It_Gets.jpg','BXHxg6Ug9GM','1997-12-25','PG-13','James Brooks','Jack Nicholson','Helen Hunt\r','tt0119822',2,0),(21,'Action','Assassins','Robert Rath (Sylvester Stallone) is a seasoned hitman who just wants out of the business with no back talk...','1995','https://storage.googleapis.com/java419/Assassins.jpg','OOTTvrb4JZI','1995-10-06','R','Richard Donner','Sylverster Stallone','Antonio Banderas\r','tt0112401',2,0),(22,'Drama','At First Sight','A blind man has an operation to regain his sight at the urging of his girlfriend and must deal with the changes to his life.','1999','https://storage.googleapis.com/java419/At_First_Sight.jpg','os50D-aOZQo','1999-01-15','R','Irwin Winkler','Val Kilmer','Mira Sorvino\r','tt0132512',0,0),(23,'Drama','Autumn in New York','Romantic 1 about an aging playboy who falls for a sweet but terminally ill young woman.','2000','https://storage.googleapis.com/java419/Autumn_In_NewYork.jpg','zACckn8ie-8','2000-08-11','PG-13','Joan Chen','Richard Gere','Winona Ryder\r','tt0174480',0,0),(24,'Drama','Awakenings','The victims of an encephalitis epidemic many years ago have been catatonic ever since but now a new drug offers the prospect of reviving them.','1990','https://storage.googleapis.com/java419/Awakenings.jpg','JAz-prw_W2A','1990-12-20','PG-13','Penny Marshall','Robert De Niro','Julie Kavner\r','tt0099077',0,0),(25,'Drama','Babel','Tragedy strikes a married couple on vacation in the Moroccan desert touching off an interlocking story involving four different families.','2006','https://storage.googleapis.com/java419/Babel.jpg','gzrHrTVaqJs','2006-11-10','R','Alejandro González Iñárritu','Brad Pitt','Cate Blanchett\r','tt0449467',0,0),(26,'Drama','Bang Bang You\'re Dead','For the most part it\'s a tale of a kid Trevor who gets picked on a lot a school. Not as much as he used to...','2002','https://storage.googleapis.com/java419/Bang_Bang_You_Dead.jpg','2WTij_Dzq98','2002-10-13','R','Guy Ferland','Ben Foster','Thomas Cavanagh\r','tt0288439',0,0),(27,'Drama','Basic','A DEA agent investigates the disappearance of a legendary Army ranger drill sergeant and several of his cadets during a training exercise gone severely awry.','2003','https://storage.googleapis.com/java419/Basic.jpg','kE7Ue5hjJc0','2003-03-28','R','John McTiernan','John Travolta','Samuel L. Jackson\r','tt0264395',0,0),(28,'Drama','Basic Instinct','A police detective is in charge of the investigation of a brutal murder in which a beautiful and seductive woman could be involved.','1992','https://storage.googleapis.com/java419/Basic_Instinct.jpg','JvoWfLOa55k','1992-03-20','R','Paul Verhoeven','Michael Douglas','Sharon Stone\r','tt0103772',0,0),(29,'Drama','Before Sunset','It\'s nine years after Jesse and Celine first met; now they encounter one another on the French leg of Jesse\'s book tour.','2004','https://storage.googleapis.com/java419/Before_Sunset.jpg','oI3UuneLcyU','2004-06-17','R','Richard Linklater','Ethan Hawke','Julie Delpy\r','tt0381681',0,0),(30,'Comedy','Being John Malkovich','A puppeteer discovers a portal that leads literally into the head of the movie star John Malkovich.','1999','https://storage.googleapis.com/java419/Being_John.jpg','2UuRFr0GnHM','1999-11-24','R','Spike Jonze','Cameron Diaz','John Malkovich\r','tt0120601',0,0),(31,'Drama','Best Laid Plans','Ever feel like the world is conspiring against you... You don\'t have to tell me where you\'ve been... Everyone sucks but us... keeping a relationship alive can be murder.','1999','https://storage.googleapis.com/java419/Best_Laid_Plans.jpg','8H6yHBc3nvI','1999-05-14','R','Mike Barker','Alessandro Nivola','Reese Witherspoon\r','tt0133412',0,0),(32,'Sci-Fi','Bicentennial Man','An android endeavors to become human as he gradually acquires emotions.','1999','https://storage.googleapis.com/java419/Bicent_Man.jpg','nZ7HxlhVDyM','1999-12-17','PG','Chris Columbus','Robin Williams ','Embeth Davidtz\r','tt0182789',0,0),(33,'Drama','Big Fish','A story about a son trying to learn more about his dying father by reliving stories and myths his father told him about himself.','2003','https://storage.googleapis.com/java419/Big_Fish.jpg','M3YVTgTl-F0','2004-01-09','PG-13','Tim Burton','Ewan McGregor','Albert Finney\r','tt0319061',0,0),(34,'Drama','Birdy','Two friends arrive back from Vietnam scarred in different ways. One has physical injuries the other...','1984','https://storage.googleapis.com/java419/Birdy.jpg','hfGwJGrLz2w','1984-12-21','R','Alan Parker','Matthew Modine','Nicholas Cage\r','tt0086969',0,0),(35,'Comedy','Birthday Girl','A thirtysomething bank clerk from St Albans has his small-town life exploded by the arrival of his Russian mail-order bride.','2001','https://storage.googleapis.com/java419/Birthday_Girl.jpg','QZsi-SQmljI','2002-02-01','R','Jez Butterworth','Nicole Kidman','Ben Chaplin\r','tt0188453',0,0),(36,'Drama','Blow','The story of George Jung the man who established the American cocaine market in the 1970\'s.','2001','https://storage.googleapis.com/java419/Blow.jpg','scWkP1GdnuU','2001-04-06','R','Ted Demme','Johnny Depp','Penélope Cruz\r','tt0221027',0,0),(37,'Horror','Book of Shadows: Blair Witch 2','College students at a Boston college become fascinated by the events of the three missing filmmakers in Maryland so they decide to go into the same woods and find out what really happened.','2000','https://storage.googleapis.com/java419/Blair_Witch_2.jpg','8WtrIgbvsWU','2000-10-27','R','Joe Berlinger','Kim Director','Kurt Loder\r','tt0229260',0,0),(38,'Drama','Boss of Bosses','The story of the rise and fall of the powerful New York City organized crime boss Paul Castellano.','2001','https://storage.googleapis.com/java419/Boss_Of_Bosses.jpg','shSjnxcY1I8','2005-07-19','R','Dwight Little','Angela Alvarado ','Chazz Palminteri\r','tt0205782',0,0),(39,'Drama','Bounce','A man switches plane tickets with another man who dies in that plane in a crash. The man falls in love with the deceased one\'s wife.','2000','https://storage.googleapis.com/java419/Bounce.jpg','ieJSJXWLK_c','2000-11-15','PG-13','Don Roos','Ben Affleck','Gweneth Paltrow\r','tt0186894',0,0),(40,'Drama','Bringing Out the Dead','Frank Pierce is a paramedic working Gotham\'s Hell\'s Kitchen. He\'s become burned out and haunted by visions of the people he\'s tried to save.','1999','https://storage.googleapis.com/java419/Bringing_Out_Dead.jpg','sfUwvmRmMtw','1999-10-22','R','Martin Scorsese','Nicholas Cage','Patricia Arquette\r','tt0163988',6,0),(41,'Comedy','Buffalo \'66','Billy is released after five years in prison. In the next moment he kidnaps teenage student Layla and visits his parents with her...','1998','https://storage.googleapis.com/java419/Buffalo.jpg','pY0H49c4q_Q','1998-06-26','R','Vincent Gallo','Christina Ricci','Mickey Rourke\r','tt0118789',0,0),(42,'Drama','Carandiru','Film based on real life experiences of doctor Drauzio Varella inside dreadful State penitentiary Carandiru...','2003','https://storage.googleapis.com/java419/Carandiru.jpg','0fKI6uwZbxM','2003-04-11','R','Hector Babenco','Luis Carlos Vasconelos','Milton Gonçalves\r','tt0293007',0,0),(43,'Drama','Carlito\'s Way','A Puerto-Rican ex-con just released from prison pledges to stay away from drugs and violence despite the pressure around him and lead on to a better life outside of NYC.','1993','https://storage.googleapis.com/java419/Carlito.jpg','FbXrkKmCTok','1993-11-10','R','Brian DePalma','Sean Penn','Al Pacino\r','tt0106519',0,0),(44,'Drama','Carne trémula','After leaving jail Víctor is still in love with Elena but she\'s married to the former cop -now basketball player- who became paralysed by a shot from Víctor\'s gun...','1997','https://storage.googleapis.com/java419/Live_Flesh.jpg','m0BAPZJJbP0','1998-01-16','R','Pedro Almodóvar','Penélope Cruz','Javier Bardem\r','tt0438912',0,0),(45,'Drama','Casino','Greed deception money power and murder occur between two mobster best friends and a trophy wife over a gambling empire.','1995','https://storage.googleapis.com/java419/Casino.jpg','EJXDMwGWhoA','1995-11-22','R','Martin Scorsese','Robert De Niro','Joe Pesci\r','tt0112641',0,0),(46,'Drama','Cast Away','A FedEx executive must transform himself physically and emotionally to survive a crash landing on a deserted island.','2000','https://storage.googleapis.com/java419/Castaway.jpg','2TWYDogv4WQ','2000-12-22','PG-13','Robert Zemeckis','Tom Hanks','Lari White\r','tt0162222',0,0),(47,'Drama','Catch Me If You Can','A true story about Frank Abagnale Jr. who before his 19th birthday successfully conned millions of dollars worth of checks as a Pan Am pilot doctor and legal prosecutor.','2002','https://storage.googleapis.com/java419/Catch_Me_If_You_Can.jpg','71rDQ7z4eFg','2002-12-25','PG-13','Steven Spielberg','Tom Hanks','Leonarod DiCaprio\r','tt0264464',1,0),(48,'Drama','Changing Lanes','The story of what happens one day in New York when a young lawyer and a businessman share a small automobile accident on F.D.R. Drive and their mutual road rage escalates into a feud...','2002','https://storage.googleapis.com/java419/Changing_Lanes.jpg','UvIwotyCFuo','2002-04-12','R','Roger Michell','Samuel L. Jackson','Ben Affleck\r','tt0264472',0,0),(49,'Drama','Cidade de Deus','Two boys growing up in a violent neighborhood of Rio de Janeiro take different paths: one becomes a photographer the other a drug dealer.','2002','https://storage.googleapis.com/java419/City_Of_God.jpg','pUt-yPxOZqk','2002-08-30','R','Fernando Meirelles','Alexandre Rodrigues','Leandro Firmino\r','tt0317248',0,0),(50,'Drama','City by the Sea','Vincent Lamarca whose father was executed for a 1950s kidnapping of a child grew up to become a police officer only to see his own son become a murderer.','2002','https://storage.googleapis.com/java419/City_By_The_Sea.jpg','W5SKcTTd350','2002-09-06','R','Michael Caton-Jones','Robert De Niro','Frances McDormand\r','tt0269095',1,0),(51,'Action','The Avengers','Nick Fury of S.H.I.E.L.D. brings together a team of super humans to form The Avengers to help save the Earth from Loki and his army.','2012','https://storage.googleapis.com/java419/The_Avengers.jpg','eOrNdBpGMv8','2012-09-25','PG-13','Joss Whedon','Robert Downey Jr.','Chris Evans','tt0848228',0,0),(52,'Action','Terminator 2: Judgment Day','The cyborg who once tried to kill Sarah Connor is dead, and another T-101 must now protect her teenage son, John Connor, from an even more powerful and advanced Terminator, the T-1000.','1991','https://storage.googleapis.com/java419/Terminator_2.jpg','oL1RE8JXaIw','1997-10-22','R','James Cameron','Arnold Schwarzenegger','Linda Hamilton','tt0103064',4,0),(53,'Sci-Fi','Prometheus','A team of explorers discover a clue to the origins of mankind on Earth, leading them on a journey to the darkest corners of the universe. There, they must fight a terrifying battle to save the future of the human race. ','2012','https://storage.googleapis.com/java419/Prometheus.jpg','sftuxbvGwiU','2012-10-09','R','Ridley Scott','Noomi Rapace','Logan-Marshall-Green','tt1446714',0,0);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movieperson`
--

DROP TABLE IF EXISTS `movieperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movieperson` (
  `movieID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `personID` varchar(45) NOT NULL DEFAULT '',
  `actor` tinyint(1) DEFAULT NULL,
  `producer` tinyint(1) DEFAULT NULL,
  `director` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`movieID`,`personID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movieperson`
--

LOCK TABLES `movieperson` WRITE;
/*!40000 ALTER TABLE `movieperson` DISABLE KEYS */;
INSERT INTO `movieperson` VALUES (1,'1',0,0,1),(1,'485',1,0,0),(1,'486',1,0,0),(1,'487',1,0,0),(1,'488',1,0,0),(1,'489',1,0,0),(1,'490',1,0,0),(1,'491',1,0,0),(1,'492',1,0,0),(1,'493',1,0,0),(1,'494',1,0,0),(2,'2',0,0,1),(2,'495',1,0,0),(2,'496',1,0,0),(2,'497',1,0,0),(2,'498',1,0,0),(2,'499',1,0,0),(2,'500',1,0,0),(3,'3',0,0,1),(3,'501',1,0,0),(3,'502',1,0,0),(3,'503',1,0,0),(3,'504',1,0,0),(3,'505',1,0,0),(3,'506',1,0,0),(4,'4',0,0,1),(4,'507',1,0,0),(4,'508',1,0,0),(4,'509',1,0,0),(4,'510',1,0,0),(4,'511',1,0,0),(4,'512',1,0,0),(5,'5',0,0,1),(5,'513',1,0,0),(5,'514',1,0,0),(5,'515',1,0,0),(6,'483',1,0,0),(6,'517',1,0,0),(6,'519',1,0,0),(6,'520',1,0,0),(6,'521',1,0,0),(6,'6',0,0,1),(7,'522',1,0,0),(7,'523',1,0,0),(7,'524',1,0,0),(7,'525',1,0,0),(7,'526',1,0,0),(7,'527',1,0,0),(7,'7',0,0,1),(8,'523',1,0,0),(8,'531',1,0,0),(8,'532',1,0,0),(8,'533',1,0,0),(8,'534',1,0,0),(8,'535',1,0,0),(8,'8',0,0,1),(9,'523',1,0,0),(9,'536',1,0,0),(9,'537',1,0,0),(9,'538',1,0,0),(9,'539',1,0,0),(9,'9',0,0,1),(10,'10',0,0,1),(10,'542',1,0,0),(10,'543',1,0,0),(10,'544',1,0,0),(10,'545',1,0,0),(10,'546',1,0,0),(11,'11',0,0,1),(11,'547',1,0,0),(11,'548',1,0,0),(11,'549',1,0,0),(11,'550',1,0,0),(11,'551',1,0,0),(11,'552',1,0,0),(12,'12',0,0,1),(12,'553',1,0,0),(12,'554',1,0,0),(12,'555',1,0,0),(12,'556',1,0,0),(12,'557',1,0,0),(12,'558',1,0,0),(13,'13',0,0,1),(13,'501',1,0,0),(13,'559',1,0,0),(13,'560',1,0,0),(13,'561',1,0,0),(13,'562',1,0,0),(13,'563',1,0,0),(13,'564',1,0,0),(14,'14',0,0,1),(14,'565',1,0,0),(14,'566',1,0,0),(14,'567',1,0,0),(15,'2',0,0,1),(15,'568',1,0,0),(15,'569',1,0,0),(15,'570',1,0,0),(15,'571',1,0,0),(16,'15',0,0,1),(16,'483',1,0,0),(16,'572',1,0,0),(16,'573',1,0,0),(16,'574',1,0,0),(17,'16',0,0,1),(17,'575',1,0,0),(17,'576',1,0,0),(17,'577',1,0,0),(17,'578',1,0,0),(17,'579',1,0,0),(17,'580',1,0,0),(18,'17',0,0,1),(18,'581',1,0,0),(18,'582',1,0,0),(18,'583',1,0,0),(19,'18',0,0,1),(19,'584',1,0,0),(19,'585',1,0,0),(19,'586',1,0,0),(19,'587',1,0,0),(20,'19',0,0,1),(20,'483',1,0,0),(20,'588',1,0,0),(20,'589',1,0,0),(20,'590',1,0,0),(21,'20',0,0,1),(21,'592',1,0,0),(21,'593',1,0,0),(21,'594',1,0,0),(22,'21',0,0,1),(22,'595',1,0,0),(22,'596',1,0,0),(22,'597',1,0,0),(23,'22',0,0,1),(23,'598',1,0,0),(23,'599',1,0,0),(23,'600',1,0,0),(24,'23',0,0,1),(24,'5',1,0,1),(24,'601',1,0,0),(24,'602',1,0,0),(25,'2',0,0,1),(25,'603',1,0,0),(25,'604',1,0,0),(26,'24',0,0,1),(26,'493',1,0,0),(26,'605',1,0,0),(27,'25',0,0,1),(27,'610',1,0,0),(27,'611',1,0,0),(28,'26',0,0,1),(29,'27',0,0,1),(29,'612',1,0,0),(29,'613',1,0,0),(30,'28',0,0,1),(30,'576',1,0,0),(30,'614',1,0,0),(30,'615',1,0,0),(31,'29',0,0,1),(31,'616',1,0,0),(31,'617',1,0,0),(32,'30',0,0,1),(32,'602',1,0,0),(32,'622',1,0,0),(32,'623',1,0,0),(33,'31',0,0,1),(33,'624',1,0,0),(33,'625',1,0,0),(33,'626',1,0,0),(33,'627',1,0,0),(34,'32',0,0,1),(34,'628',1,0,0),(34,'629',1,0,0),(35,'33',0,0,1),(35,'630',1,0,0),(35,'631',1,0,0),(36,'34',0,0,1),(36,'581',1,0,0),(36,'632',1,0,0),(36,'633',1,0,0),(37,'35',0,0,1),(37,'634',1,0,0),(37,'635',1,0,0),(38,'36',0,0,1),(38,'637',1,0,0),(39,'37',0,0,1),(39,'638',1,0,0),(39,'639',1,0,0),(40,'38',0,0,1),(40,'629',1,0,0),(40,'640',1,0,0),(40,'641',1,0,0),(41,'39',0,0,1),(41,'642',1,0,0),(41,'643',1,0,0),(42,'40',0,0,1),(42,'644',1,0,0),(42,'645',1,0,0),(43,'41',0,0,1),(43,'495',1,0,0),(43,'575',1,0,0),(43,'646',1,0,0),(44,'42',0,0,1),(44,'632',1,0,0),(44,'647',1,0,0),(44,'648',1,0,0),(45,'38',0,0,1),(45,'5',1,0,1),(45,'516',1,0,0),(45,'578',1,0,0),(45,'611',1,0,0),(46,'43',0,0,1),(46,'649',1,0,0),(46,'650',1,0,0),(47,'14',0,0,1),(47,'649',1,0,0),(47,'651',1,0,0),(47,'652',1,0,0),(47,'653',1,0,0),(48,'44',0,0,1),(48,'609',1,0,0),(48,'638',1,0,0),(49,'45',0,0,1),(49,'654',1,0,0),(49,'655',1,0,0),(50,'46',0,0,1),(50,'5',1,0,1),(50,'656',1,0,0);
/*!40000 ALTER TABLE `movieperson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `personID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `personFirstName` varchar(45) DEFAULT NULL,
  `personLastName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=657 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Greg','Marcks'),(2,'Alejandro','González Iñárritu'),(3,'Spike','Lee'),(4,'Ron','Howard'),(5,'Robert','De Niro'),(6,'Rob','Reiner'),(7,'Ridley','Scott'),(8,'David','Fincher'),(9,'James','Cameron'),(10,'Michael','Apted'),(11,'Milos','Forman'),(12,'Sam','Mendes'),(13,'Tony','Kaye'),(14,'Steven','Spielberg'),(15,'Peter','Segal'),(16,'Oliver','Stone'),(17,'Emir','Kusturica'),(18,'Mark','Pellington'),(19,'James','Brooks'),(20,'Richard','Donner'),(21,'Irwin','Winkler'),(22,'Joan','Chen'),(23,'Penny','Marshall'),(24,'Guy','Ferland'),(25,'John','McTiernan'),(26,'Paul','Verhoeven'),(27,'Richard','Linklater'),(28,'Spike','Jonze'),(29,'Mike','Barker'),(30,'Chris','Columbus'),(31,'Tim','Burton'),(32,'Alan','Parker'),(33,'Jez','Butterworth'),(34,'Ted','Demme'),(35,'Joe','Berlinger'),(36,'Dwight','Little'),(37,'Don','Roos'),(38,'Martin','Scorsese'),(39,'Vincent','Gallo'),(40,'Hector','Babenco'),(41,'Brian','De Palma'),(42,'Pedro','Almodóvar'),(43,'Robert','Zemeckis'),(44,'Roger','Michell'),(45,'Fernando','Meirelles'),(46,'Michael','Caton-Jones'),(480,'Fred','Flintstone'),(481,'Barney','Rubble'),(482,'John','Smith'),(483,'Jack','Nicholson'),(484,'Clint','Eastwood'),(485,'Henry','Thomas'),(486,'Blake','Heron'),(487,'Barbara','Hershey'),(488,'Clark','Gregg'),(489,'Hilary','Swank'),(490,'Shawn','Hatosy'),(491,'Stark','Sands'),(492,'Colin','Hanks'),(493,'Ben','Foster'),(494,'Patrick','Swayze'),(495,'Sean','Penn'),(496,'Naomi','Watts'),(497,'Danny','Huston'),(498,'Carly','Nahon'),(499,'Claire','Pakis'),(500,'Benicio','Del Toro'),(501,'Edward','Norton'),(502,'Philip','Seymour Hoffman'),(503,'Barry','Pepper'),(504,'Rosario','Dawson'),(505,'Anna','Paquin'),(506,'Brian','Cox'),(507,'Russell','Crowe'),(508,'Ed','Harris'),(509,'Jennifer','Connelly'),(510,'Christopher','Plummer'),(511,'Paul','Bettany'),(512,'Judd','Hirsch'),(513,'Chazz','Palminteri'),(514,'Lillo','Brancato'),(515,'Francis','Capra'),(516,'Joe','Pesci'),(517,'Tom','Cruise'),(519,'Demi','Moore'),(520,'Kevin','Bacon'),(521,'Kiefer','Sutherland'),(522,'Tom','Skerritt'),(523,'Sigourney','Weaver'),(524,'Veronica','Cartwright'),(525,'Harry','Dean Stanton'),(526,'John','Hurt'),(527,'Ian','Holm'),(531,'Charles','Dutton'),(532,'Charles','Dance'),(533,'Paul','McGann'),(534,'Brian','Glover'),(535,'Ralph','Brown'),(536,'Carrie','Henn'),(537,'Michael','Biehn'),(538,'Lance','Henriksen'),(539,'Paul','Reiser'),(542,'Laurence','Fishburne'),(543,'Daniel','Williams'),(544,'Bill','Cobbs'),(545,'Natalie','Cole'),(546,'Laurie','Metcalf'),(547,'F. Murray','Abraham'),(548,'Tom','Hulce'),(549,'Elizabeth','Berridge'),(550,'Roy','Dotrice'),(551,'Simon','Callow'),(552,'Christine','Ebersole'),(553,'Kevin','Spacey'),(554,'Annette','Bening'),(555,'Thora','Birch'),(556,'Wes','Bentley'),(557,'Mena','Suvari'),(558,'Scott','Bakula'),(559,'Edward','Furlong'),(560,'Beverly','D\'Angelo'),(561,'Avery','Brooks'),(562,'Jennifer','Lien'),(563,'Stacy','Keach'),(564,'Elliott','Gould'),(565,'Morgan','Freeman'),(566,'Nigel','Hawthorne'),(567,'Anthony','Hopkins'),(568,'Emilio','Echevarría'),(569,'Gael','García Bernal'),(570,'Goya','Toledo'),(571,'Álvaro','Guerrero'),(572,'Adam','Sandler'),(573,'Marisa','Tomei'),(574,'Luis','Guzmán'),(575,'Al','Pacino'),(576,'Cameron','Diaz'),(577,'Dennis','Quaid'),(578,'James','Woods'),(579,'Jamie','Foxx'),(580,'LL','Cool J'),(581,'Johnny','Depp'),(582,'Jerry','Lewis'),(583,'Faye','Dunaway'),(584,'Jeff','Bridges'),(585,'Tim','Robbins'),(586,'Joan','Cusack'),(587,'Hope','Davis'),(588,'Helen','Hunt'),(589,'Greg','Kinnear'),(590,'Cuba','Gooding Jr.'),(592,'Sylvester','Stallone'),(593,'Antonio','Banderas'),(594,'Julianne','Moore'),(595,'Val','Kilmer'),(596,'Mira','Sorvino'),(597,'Kelly','McGillis'),(598,'Richard','Gere'),(599,'Winona','Ryder'),(600,'Anthony','LaPaglia'),(601,'Julie','Kavner'),(602,'Robin','Williams'),(603,'Brad','Pitt'),(604,'Cate','Blanchett'),(605,'Thomas','Cavanagh'),(607,'John','Travolta'),(608,'Connie','Nielsen'),(609,'Samuel L.','Jackson'),(610,'Michael','Douglas'),(611,'Sharon','Stone'),(612,'Ethan','Hawke'),(613,'Julie','Delpy'),(614,'John','Malkovich'),(615,'John','Cusack'),(616,'Alessandro','Nivola'),(617,'Reese','Witherspoon'),(622,'Embeth','Davidtz'),(623,'Sam','Neill'),(624,'Ewan','McGregor'),(625,'Albert','Finney'),(626,'Billy','Crudup'),(627,'Jessica','Lange'),(628,'Matthew','Modine'),(629,'Nicolas','Cage'),(630,'Nicole','Kidman'),(631,'Ben','Chaplin'),(632,'Penélope','Cruz'),(633,'Paul','Reubens'),(634,'Kim','Director'),(635,'Kurt','Loder'),(637,'Angela','Alvarado'),(638,'Ben','Affleck'),(639,'Gwyneth','Paltrow'),(640,'Patricia','Arquette'),(641,'John','Goodman'),(642,'Christina','Ricci'),(643,'Mickey','Rourke'),(644,'Luiz Carlos','Vasconcelos'),(645,'Milton','Gonçalves'),(646,'John','Leguizamo'),(647,'Javier','Bardem'),(648,'Francesca','Neri'),(649,'Tom','Hanks'),(650,'Lari','White'),(651,'Leonardo','DiCaprio'),(652,'Christopher','Walken'),(653,'Martin','Sheen'),(654,'Alexandre','Rodrigues'),(655,'Leandro','Firmino'),(656,'Frances','McDormand');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `memberID` int(10) unsigned NOT NULL,
  `movieID` int(10) unsigned NOT NULL DEFAULT '0',
  `queueSequence` int(10) unsigned DEFAULT NULL,
  `movieTitle` varchar(45) NOT NULL,
  PRIMARY KEY (`memberID`,`movieID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
INSERT INTO `queue` VALUES (10001,8,4,'Alien³'),(10002,22,1,'At First Sight'),(10002,27,4,'Basic'),(10002,31,5,'Best Laid Plans'),(10002,33,6,'Big Fish'),(10003,5,1,'A Bronx Tale'),(10003,6,2,'A Few Good Men'),(10003,7,3,'Alien'),(10003,8,4,'Alien³'),(10003,15,5,'Amores Perros'),(10003,16,6,'Anger Management'),(10003,17,7,'Any Given Sunday'),(10003,18,8,'Arizona Dream'),(10003,19,9,'Arlington Road'),(10004,6,6,'A Few Good Men'),(10004,7,7,'Alien'),(10004,8,8,'Alien³'),(10004,9,9,'Aliens'),(10004,11,2,'Amadeus'),(10004,12,3,'American Beauty'),(10004,13,4,'American History X'),(10004,14,5,'Amistad'),(10004,20,1,'As Good As It Gets'),(10005,10,1,'Always Outnumbered'),(10005,46,2,'Cast Away'),(10005,47,3,'Catch Me If You Can'),(10005,48,4,'Changing Lanes'),(10005,49,5,'Cidade de Deus'),(10005,50,6,'City By The Sea'),(10006,2,6,'25th Hour'),(10006,31,1,'Best Laid Plans'),(10006,32,2,'Bicentennial Man'),(10006,33,3,'Big Fish'),(10006,34,4,'Birdy'),(10006,35,5,'Birthday Girl'),(10007,3,1,'25th Hour'),(10007,4,2,'A Beautiful Mind'),(10007,41,3,'Buffalo \'66'),(10008,42,1,'Carandiru'),(10008,43,2,'Carltio\'s Way'),(10009,7,9,'Alien'),(10009,21,4,'Assassins'),(10009,22,5,'At First Sight'),(10009,23,6,'Autumn in New York'),(10009,24,7,'Awakenings'),(10009,25,8,'Babel'),(10009,44,1,'Carne Trémula'),(10009,45,2,'Casino'),(10009,46,3,'Cast Away'),(10010,8,1,'Alien³'),(10010,9,2,'Aliens'),(10010,10,3,'Always Outnumbered'),(10010,13,4,'American History X'),(10010,14,5,'Amistad'),(10010,15,6,'Amores Perros'),(10010,16,7,'Anger Management'),(10011,7,6,'Alien'),(10011,26,1,'Bang Bang You\'re Dead'),(10011,27,2,'Basic'),(10011,28,3,'Basic Instinct'),(10011,29,4,'Before Sunset'),(10011,30,5,'Being John Malkovich'),(10012,8,1,'Alien³'),(10012,9,2,'Aliens'),(10012,10,3,'Always Outnumbered'),(10012,13,4,'American History X'),(10012,14,5,'Amistad'),(10012,15,6,'Amores Perros'),(10012,16,7,'Anger Management'),(10012,26,8,'Bang Bang You\'re Dead'),(10012,27,9,'Basic'),(10013,2,10,'25th Hour'),(10013,3,11,'25th Hour'),(10013,4,12,'A Beautiful Mind'),(10013,6,5,'A Few Good Men'),(10013,7,6,'Alien'),(10013,8,7,'Alien³'),(10013,9,8,'Aliens'),(10013,11,9,'Amadeus'),(10013,14,4,'Amistad'),(10013,25,13,'Babel'),(10013,28,1,'Basic Instinct'),(10013,29,2,'Before Sunset'),(10013,30,3,'Being John Malkovich'),(10014,7,4,'Alien'),(10014,8,5,'Alien³'),(10014,9,6,'Aliens'),(10014,15,1,'Amores Perros'),(10014,16,2,'Anger Management'),(10014,44,3,'Carne Trémula'),(10015,10,1,'Always Outnumbered'),(10015,12,7,'American Beauty'),(10015,19,8,'Arlington Road'),(10015,26,9,'Bang Bang You\'re Dead'),(10015,41,2,'Buffalo \'66'),(10015,42,3,'Carandiru'),(10015,43,4,'Carltio\'s Way'),(10015,44,5,'Carne Trémula'),(10015,45,6,'Casino'),(10016,27,1,'Basic'),(10016,28,2,'Basic Instinct'),(10017,29,3,'Before Sunset'),(10018,30,4,'Being John Malkovich'),(10018,41,5,'Buffalo \'66'),(10018,42,6,'Carandiru'),(10018,43,7,'Carltio\'s Way'),(10019,5,9,'A Bronx Tale'),(10019,11,8,'Amadeus'),(10019,31,3,'Best Laid Plans'),(10019,32,4,'Bicentennial Man'),(10019,33,5,'Big Fish'),(10019,34,6,'Birdy'),(10019,35,7,'Birthday Girl'),(10019,44,1,'Carne Trémula'),(10019,45,2,'Casino'),(10020,9,2,'Aliens'),(10044,6,1,'A Few Good Men'),(10044,50,2,'City by the Sea'),(10048,50,0,'City by the Sea');
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-13 17:34:50
