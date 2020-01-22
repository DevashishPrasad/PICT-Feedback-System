-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: feedback_main
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `name` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('admin','admin'),('Manish','Visave'),('Girish','12345'),('Deva','12345'),('admin','admin'),('Manish','Visave'),('Girish','12345'),('Deva','12345'),('admin','admin'),('Manish','Visave'),('Girish','12345'),('Deva','12345'),('admin','admin'),('Manish','Visave'),('Girish','12345'),('Deva','12345'),('admin','admin'),('Manish','Visave'),('Girish','12345'),('Deva','12345'),('admin','admin'),('Manish','Visave'),('Girish','12345'),('Deva','12345'),('admin','admin'),('Manish','Visave'),('Girish','12345'),('Deva','12345'),('admin','admin'),('Manish','Visave'),('Girish','12345'),('Deva','12345');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `year` char(2) NOT NULL,
  `division` int(11) NOT NULL,
  `dept` varchar(20) DEFAULT NULL,
  `ran1` int(11) DEFAULT NULL,
  `ran2` int(11) DEFAULT NULL,
  PRIMARY KEY (`year`,`division`),
  KEY `fk3` (`dept`),
  CONSTRAINT `fk3` FOREIGN KEY (`dept`) REFERENCES `dept` (`dept_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES ('SE',15,'EnTC',21101,21160),('SE',18,'EnTC',555500,555540),('TE',9,'IT',33101,33174),('TE',10,'IT',33201,33270),('TE',11,'IT',33301,33374);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `c_stud` AFTER INSERT ON `class` FOR EACH ROW begin declare r1 int; declare r2 int; set r1 = new.ran1; set r2 = new.ran2; while r1<= r2 do insert into student(rollno,year,division) values(r1,new.year,new.division); set r1 = r1 + 1; end while; end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Deva`@`localhost`*/ /*!50003 TRIGGER `class_BEFORE_DELETE` BEFORE DELETE ON `class` FOR EACH ROW BEGIN
	delete from student where year=old.year and division=old.division;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept` (
  `dept_name` varchar(20) NOT NULL,
  PRIMARY KEY (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES ('CS'),('EnTC'),('IT');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain` (
  `domain_name` varchar(20) NOT NULL,
  PRIMARY KEY (`domain_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain`
--

LOCK TABLES `domain` WRITE;
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
INSERT INTO `domain` VALUES ('CTL'),('LTL'),('SPORTS');
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `cat_id` int(11) DEFAULT NULL,
  `qid` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  KEY `fk1` (`cat_id`),
  CONSTRAINT `fk1` FOREIGN KEY (`cat_id`) REFERENCES `teacher_class_subject` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (8,1,0),(15,1,0),(9,1,0),(12,1,0),(8,1,0),(15,1,0),(19,1,0),(8,2,0),(15,2,0),(9,2,0),(12,2,0),(8,2,0),(15,2,0),(19,2,0),(11,3,0),(10,3,0),(13,3,0),(16,3,0),(18,3,0),(11,4,0),(10,4,0),(13,4,0),(16,4,0),(18,4,0);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `question` varchar(120) DEFAULT NULL,
  `option1` varchar(50) DEFAULT NULL,
  `option2` varchar(50) DEFAULT NULL,
  `option3` varchar(50) DEFAULT NULL,
  `option4` varchar(50) DEFAULT NULL,
  `qid` int(11) NOT NULL,
  `option5` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES ('Can you hear the teacher','Good','Fair','Bad','Worst',1,NULL),('Can you understand teacher','Good','Fair','Bad','Worst',2,NULL),('Can you understand teacher','Good','Fair','Bad','Worst',3,NULL),('Can you perform well','Good','Fair','Bad','Worst',4,NULL);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `rollno` int(11) NOT NULL,
  `year` char(2) DEFAULT NULL,
  `division` int(11) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rollno`),
  KEY `year` (`year`,`division`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`year`, `division`) REFERENCES `class` (`year`, `division`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (21101,'SE',15,'[C@61f97016'),(21102,'SE',15,'[C@c98a5b4'),(21103,'SE',15,'[C@ee00637'),(21104,'SE',15,'[C@26905eb6'),(21105,'SE',15,'[C@cc3e3b2'),(21106,'SE',15,'[C@453f529b'),(21107,'SE',15,'[C@4b6035b5'),(21108,'SE',15,'[C@6fa1a781'),(21109,'SE',15,'[C@7c6c07b4'),(21110,'SE',15,'[C@43782928'),(21111,'SE',15,'[C@97f616f'),(21112,'SE',15,'[C@6b80526e'),(21113,'SE',15,'[C@77cda90d'),(21114,'SE',15,'[C@75feffb5'),(21115,'SE',15,'[C@7789c7c'),(21116,'SE',15,'[C@6e02bddf'),(21117,'SE',15,'[C@749de4d3'),(21118,'SE',15,'[C@761caea2'),(21119,'SE',15,'[C@35c44761'),(21120,'SE',15,'[C@4ed3e843'),(21121,'SE',15,'[C@55733636'),(21122,'SE',15,'[C@4689fb84'),(21123,'SE',15,'[C@5161437b'),(21124,'SE',15,'[C@a128e4'),(21125,'SE',15,'[C@4c2f6c40'),(21126,'SE',15,'[C@4573eb9a'),(21127,'SE',15,'[C@1e5202d4'),(21128,'SE',15,'[C@17bdeff2'),(21129,'SE',15,'[C@20c7cc29'),(21130,'SE',15,'[C@7a32dc90'),(21131,'SE',15,'[C@74f825a0'),(21132,'SE',15,'[C@cc296b2'),(21133,'SE',15,'[C@127aa587'),(21134,'SE',15,'[C@7ec03d04'),(21135,'SE',15,'[C@4ba0d259'),(21136,'SE',15,'[C@534faa99'),(21137,'SE',15,'[C@145e7bea'),(21138,'SE',15,'[C@6b895c78'),(21139,'SE',15,'[C@26f6794a'),(21140,'SE',15,'[C@843046f'),(21141,'SE',15,'[C@6fa5bfa6'),(21142,'SE',15,'[C@4eee54b6'),(21143,'SE',15,'[C@5b475808'),(21144,'SE',15,'[C@4bb74f73'),(21145,'SE',15,'[C@92d812c'),(21146,'SE',15,'[C@35da2f5b'),(21147,'SE',15,'[C@543ca6f0'),(21148,'SE',15,'[C@2581a7d3'),(21149,'SE',15,'[C@40c076ae'),(21150,'SE',15,'[C@2404391a'),(21151,'SE',15,'[C@153e004c'),(21152,'SE',15,'[C@3d299207'),(21153,'SE',15,'[C@7e9fe60a'),(21154,'SE',15,'[C@7bd6dc2a'),(21155,'SE',15,'[C@1e8f8f7c'),(21156,'SE',15,'[C@6f479f00'),(21157,'SE',15,'[C@6ee98b54'),(21158,'SE',15,'[C@23133d2f'),(21159,'SE',15,'[C@4185b25e'),(21160,'SE',15,'[C@12698af1'),(33101,'TE',9,'[C@3a27f2'),(33102,'TE',9,'[C@22acba02'),(33103,'TE',9,'[C@6f7e8bba'),(33104,'TE',9,'[C@66c1baa7'),(33105,'TE',9,'[C@3795043a'),(33106,'TE',9,'[C@702ed460'),(33107,'TE',9,'[C@6b16b284'),(33108,'TE',9,'[C@6939c3'),(33109,'TE',9,'[C@1f424920'),(33110,'TE',9,'[C@1949137c'),(33111,'TE',9,'[C@47951043'),(33112,'TE',9,'[C@efb8e53'),(33113,'TE',9,'[C@3fdcde5'),(33114,'TE',9,'[C@52feec15'),(33115,'TE',9,'[C@3d86e901'),(33116,'TE',9,'[C@6fdd61f4'),(33117,'TE',9,'[C@2a21b0f'),(33118,'TE',9,'[C@2719d10a'),(33119,'TE',9,'[C@2d5dea09'),(33120,'TE',9,'[C@290bfc97'),(33121,'TE',9,'[C@3be3f0da'),(33122,'TE',9,'[C@521be72d'),(33123,'TE',9,'[C@10d442c5'),(33124,'TE',9,'[C@66cdfb0c'),(33125,'TE',9,'[C@428cb22f'),(33126,'TE',9,'[C@4f2317dc'),(33127,'TE',9,'[C@7dd3a697'),(33128,'TE',9,'[C@74cf37ba'),(33129,'TE',9,'[C@53f5fec6'),(33130,'TE',9,'[C@4bf8e93'),(33131,'TE',9,'[C@6438778d'),(33132,'TE',9,'[C@69c7ee57'),(33133,'TE',9,'[C@15b83e67'),(33134,'TE',9,'[C@6d8bf155'),(33135,'TE',9,'[C@4aa86776'),(33136,'TE',9,'[C@1ccb9d22'),(33137,'TE',9,'[C@48d4d3da'),(33138,'TE',9,'[C@7ae782cc'),(33139,'TE',9,'[C@73fdc931'),(33140,'TE',9,'[C@339f78e1'),(33141,'TE',9,'[C@5d3b274b'),(33142,'TE',9,'[C@1b8c3fc2'),(33143,'TE',9,'[C@625c9c3'),(33144,'TE',9,'[C@4e35e196'),(33145,'TE',9,'[C@4ab09664'),(33146,'TE',9,'[C@30b8d2df'),(33147,'TE',9,'[C@18fb7eda'),(33148,'TE',9,'[C@79230502'),(33149,'TE',9,'[C@376ebff4'),(33150,'TE',9,'[C@4136bdec'),(33151,'TE',9,'[C@27816be'),(33152,'TE',9,'[C@631208e6'),(33153,'TE',9,'[C@21c18a6f'),(33154,'TE',9,'[C@55ec8a66'),(33155,'TE',9,'[C@17e3bb83'),(33156,'TE',9,'[C@6445d4a1'),(33157,'TE',9,'[C@49faa8b4'),(33158,'TE',9,'[C@78f4b457'),(33159,'TE',9,'[C@72c12769'),(33160,'TE',9,'[C@38eb154c'),(33161,'TE',9,'[C@2448b5ed'),(33162,'TE',9,'[C@79c3fb3f'),(33163,'TE',9,'[C@2426101'),(33164,'TE',9,'[C@62e35570'),(33165,'TE',9,'[C@3e5731c'),(33166,'TE',9,'[C@65996a5c'),(33167,'TE',9,'[C@74c24587'),(33168,'TE',9,'[C@c72d6ba'),(33169,'TE',9,'[C@242729bb'),(33170,'TE',9,'[C@a427ce9'),(33171,'TE',9,'[C@6ccaee5b'),(33172,'TE',9,'[C@7617227e'),(33173,'TE',9,'[C@6be0b7f6'),(33174,'TE',9,'[C@725c3b57'),(33201,'TE',10,'[C@49dfab71'),(33202,'TE',10,'[C@61464e6'),(33203,'TE',10,'[C@68a53cd5'),(33204,'TE',10,'[C@7b302415'),(33205,'TE',10,'[C@4f809c21'),(33206,'TE',10,'[C@6a16e263'),(33207,'TE',10,'[C@2b943860'),(33208,'TE',10,'[C@51feb18b'),(33209,'TE',10,'[C@1a545e01'),(33210,'TE',10,'[C@478ca2d2'),(33211,'TE',10,'[C@4dd1d57b'),(33212,'TE',10,'[C@698757a3'),(33213,'TE',10,'[C@519bb8c4'),(33214,'TE',10,'[C@73a31a17'),(33215,'TE',10,'[C@309a7315'),(33216,'TE',10,'[C@637310ea'),(33217,'TE',10,'[C@6fa2d9d8'),(33218,'TE',10,'[C@43a1599'),(33219,'TE',10,'[C@675bccd0'),(33220,'TE',10,'[C@1c547491'),(33221,'TE',10,'[C@65c112da'),(33222,'TE',10,'[C@31835526'),(33223,'TE',10,'[C@807328a'),(33224,'TE',10,'[C@37c83fe7'),(33225,'TE',10,'[C@5af2ac06'),(33226,'TE',10,'[C@7173e81b'),(33227,'TE',10,'[C@40d107dd'),(33228,'TE',10,'[C@36902f27'),(33229,'TE',10,'[C@79cd376f'),(33230,'TE',10,'[C@17903b7d'),(33231,'TE',10,'[C@5f3739bd'),(33232,'TE',10,'[C@68e9cc6b'),(33233,'TE',10,'[C@788ff856'),(33234,'TE',10,'[C@6e526fe9'),(33235,'TE',10,'[C@84e594f'),(33236,'TE',10,'[C@2ee246b9'),(33237,'TE',10,'[C@29a8467b'),(33238,'TE',10,'[C@54f84980'),(33239,'TE',10,'[C@2e06e671'),(33240,'TE',10,'[C@12edba86'),(33241,'TE',10,'[C@791dbd3e'),(33242,'TE',10,'[C@6f3f4fd4'),(33243,'TE',10,'[C@7613092c'),(33244,'TE',10,'[C@955a4e2'),(33245,'TE',10,'[C@1d350cbb'),(33246,'TE',10,'[C@861a126'),(33247,'TE',10,'[C@6655936f'),(33248,'TE',10,'[C@420359f3'),(33249,'TE',10,'[C@77e6d5dc'),(33250,'TE',10,'[C@728b3297'),(33251,'TE',10,'[C@388f0942'),(33252,'TE',10,'[C@601b0361'),(33253,'TE',10,'[C@2192728b'),(33254,'TE',10,'[C@a26f3a4'),(33255,'TE',10,'[C@4aa32ebb'),(33256,'TE',10,'[C@721b2c85'),(33257,'TE',10,'[C@402f1e67'),(33258,'TE',10,'[C@7da96e15'),(33259,'TE',10,'[C@2e2c51ed'),(33260,'TE',10,'[C@5783fa9'),(33261,'TE',10,'[C@3d1cd547'),(33262,'TE',10,'[C@b73cd37'),(33263,'TE',10,'[C@471c468d'),(33264,'TE',10,'[C@3ddbcb0'),(33265,'TE',10,'[C@58b0e761'),(33266,'TE',10,'[C@4dbf9335'),(33267,'TE',10,'[C@68328c21'),(33268,'TE',10,'[C@6e485ab'),(33269,'TE',10,'[C@5930f1f9'),(33270,'TE',10,'[C@6827f7d1'),(33301,'TE',11,'[C@14883d70'),(33302,'TE',11,'[C@36e32b97'),(33303,'TE',11,'[C@6802bb8b'),(33304,'TE',11,'[C@3f4c4025'),(33305,'TE',11,'[C@6a7a9901'),(33306,'TE',11,'[C@456ab84a'),(33307,'TE',11,'[C@38499d8f'),(33308,'TE',11,'[C@6559bfcb'),(33309,'TE',11,'[C@5b5590f0'),(33310,'TE',11,'[C@4b6dcb38'),(33311,'TE',11,'[C@3fbc823f'),(33312,'TE',11,'[C@17b3c5e4'),(33313,'TE',11,'[C@601615f2'),(33314,'TE',11,'[C@450736c3'),(33315,'TE',11,'[C@1e71f926'),(33316,'TE',11,'[C@17e483e9'),(33317,'TE',11,'[C@470dbd62'),(33318,'TE',11,'[C@3b402a6e'),(33319,'TE',11,'[C@2a694ce9'),(33320,'TE',11,'[C@19a17986'),(33321,'TE',11,'[C@336d317d'),(33322,'TE',11,'[C@9c47e24'),(33323,'TE',11,'[C@69aa65f1'),(33324,'TE',11,'[C@7bd55c0b'),(33325,'TE',11,'[C@21697cd5'),(33326,'TE',11,'[C@bf60382'),(33327,'TE',11,'[C@31c96ae0'),(33328,'TE',11,'[C@60ad4dd6'),(33329,'TE',11,'[C@ac80ac2'),(33330,'TE',11,'[C@3199f20a'),(33331,'TE',11,'[C@4bfd10b3'),(33332,'TE',11,'[C@41b427e7'),(33333,'TE',11,'[C@b60bb09'),(33334,'TE',11,'[C@751701cd'),(33335,'TE',11,'[C@56ccef54'),(33336,'TE',11,'[C@36277175'),(33337,'TE',11,'[C@38113c4b'),(33338,'TE',11,'[C@75455bed'),(33339,'TE',11,'[C@44c2bc5e'),(33340,'TE',11,'[C@4963d16a'),(33341,'TE',11,'[C@78a15f69'),(33342,'TE',11,'[C@27e4e9a3'),(33343,'TE',11,'[C@7615814d'),(33344,'TE',11,'[C@212af664'),(33345,'TE',11,'[C@5382bf3f'),(33346,'TE',11,'[C@532bfd1d'),(33347,'TE',11,'[C@96e11dc'),(33348,'TE',11,'[C@7f814f43'),(33349,'TE',11,'[C@393c6ccb'),(33350,'TE',11,'[C@3573bde4'),(33351,'TE',11,'[C@4c6aba67'),(33352,'TE',11,'[C@39641ffe'),(33353,'TE',11,'[C@63e4662d'),(33354,'TE',11,'[C@4b506b28'),(33355,'TE',11,'[C@52f059a7'),(33356,'TE',11,'[C@4bf227e8'),(33357,'TE',11,'[C@b67e5b5'),(33358,'TE',11,'[C@43a6d6da'),(33359,'TE',11,'[C@134b8268'),(33360,'TE',11,'[C@49dc3a8e'),(33361,'TE',11,'[C@7d22244d'),(33362,'TE',11,'[C@8473d35'),(33363,'TE',11,'[C@47d0a697'),(33364,'TE',11,'[C@6ff0fca9'),(33365,'TE',11,'[C@39cad56'),(33366,'TE',11,'[C@32038685'),(33367,'TE',11,'[C@70a56a4c'),(33368,'TE',11,'[C@18d8d545'),(33369,'TE',11,'[C@7e482d15'),(33370,'TE',11,'[C@50d1abf7'),(33371,'TE',11,'[C@bfd5cab'),(33372,'TE',11,'[C@55d1c26c'),(33373,'TE',11,'[C@6a4e7d46'),(33374,'TE',11,'[C@371dedeb'),(555500,'SE',18,'[C@30f800c3'),(555501,'SE',18,'[C@a38a9b6'),(555502,'SE',18,'[C@66c3eded'),(555503,'SE',18,'[C@3823ddc6'),(555504,'SE',18,'[C@48ad2c19'),(555505,'SE',18,'[C@79759a3'),(555506,'SE',18,'[C@7e426039'),(555507,'SE',18,'[C@58295fda'),(555508,'SE',18,'[C@79457d22'),(555509,'SE',18,'[C@442279e8'),(555510,'SE',18,'[C@298c8afd'),(555511,'SE',18,'[C@3b49d799'),(555512,'SE',18,'[C@693711bf'),(555513,'SE',18,'[C@3e0dd848'),(555514,'SE',18,'[C@739b6616'),(555515,'SE',18,'[C@61b82e3'),(555516,'SE',18,'[C@57f0d176'),(555517,'SE',18,'[C@76f8c58'),(555518,'SE',18,'[C@2f6cf175'),(555519,'SE',18,'[C@75ba72e1'),(555520,'SE',18,'[C@24106641'),(555521,'SE',18,'[C@5f6633d7'),(555522,'SE',18,'[C@17499617'),(555523,'SE',18,'[C@31c2c365'),(555524,'SE',18,'[C@16c79972'),(555525,'SE',18,'[C@78d1f8f6'),(555526,'SE',18,'[C@237320d5'),(555527,'SE',18,'[C@40d1635'),(555528,'SE',18,'[C@2eab03cf'),(555529,'SE',18,'[C@594a58a4'),(555530,'SE',18,'[C@6385bed0'),(555531,'SE',18,'[C@fd5b02b'),(555532,'SE',18,'[C@79166f65'),(555533,'SE',18,'[C@7212879b'),(555534,'SE',18,'[C@3c2fc437'),(555535,'SE',18,'[C@1e597f71'),(555536,'SE',18,'[C@547e5698'),(555537,'SE',18,'[C@32b62dd3'),(555538,'SE',18,'[C@70fa49ce'),(555539,'SE',18,'[C@258d0257'),(555540,'SE',18,'[C@3e15ae8');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_cat`
--

DROP TABLE IF EXISTS `student_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_cat` (
  `rollno` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  PRIMARY KEY (`rollno`,`tid`,`sid`),
  KEY `tid` (`tid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_cat`
--

LOCK TABLES `student_cat` WRITE;
/*!40000 ALTER TABLE `student_cat` DISABLE KEYS */;
INSERT INTO `student_cat` VALUES (33301,21,3),(33302,21,3),(33303,21,3),(33304,21,3),(33305,21,3),(33306,21,3),(33307,21,3),(33308,21,3),(33309,21,3),(33310,21,3),(33311,21,3),(33312,21,3),(33313,21,3),(33314,21,3),(33315,21,3),(33316,21,3),(33317,21,3),(33318,21,3),(33319,21,6666),(33320,21,6666),(33321,21,6666),(33322,21,6666),(33323,21,6666),(33324,21,6666),(33325,21,6666),(33326,21,6666),(33327,21,6666),(33328,21,6666),(33329,21,6666),(33330,21,6666),(33331,21,6666),(33332,21,6666),(33333,21,6666),(33334,21,6666),(33335,21,6666),(33336,21,6666),(33337,21,3),(33338,21,3),(33339,21,3),(33340,21,3),(33341,21,3),(33342,21,3),(33343,21,3),(33344,21,3),(33345,21,3),(33346,21,3),(33347,21,3),(33348,21,3),(33349,21,3),(33350,21,3),(33351,21,3),(33352,21,3),(33353,21,3),(33354,21,3),(33121,22,4),(33122,22,4),(33123,22,4),(33124,22,4),(33125,22,4),(33126,22,4),(33127,22,4),(33128,22,4),(33129,22,4),(33130,22,4),(33131,22,4),(33132,22,4),(33133,22,4),(33134,22,4),(33135,22,4),(33136,22,4),(33137,22,4),(33138,22,4),(33139,22,4),(33140,22,4),(33141,22,4),(33142,22,4),(33143,22,4),(33144,22,4),(33145,22,4),(33146,22,4),(33147,22,4),(33148,22,4),(33149,22,4),(33150,22,4),(33151,22,4),(33152,22,4),(33153,22,4),(33154,22,4),(33155,22,4),(33156,22,4),(33157,22,4),(33158,22,4),(33159,22,4),(33160,22,4),(33301,24,4),(33302,24,4),(33303,24,4),(33304,24,4),(33305,24,4),(33306,24,4),(33307,24,4),(33308,24,4),(33309,24,4),(33310,24,4),(33311,24,4),(33312,24,4),(33313,24,4),(33314,24,4),(33315,24,4),(33316,24,4),(33317,24,4),(33318,24,4),(33319,24,8888),(33320,24,8888),(33321,24,8888),(33322,24,8888),(33323,24,8888),(33324,24,8888),(33325,24,8888),(33326,24,8888),(33327,24,8888),(33328,24,8888),(33329,24,8888),(33330,24,8888),(33331,24,8888),(33332,24,8888),(33333,24,8888),(33334,24,8888),(33335,24,8888),(33336,24,8888),(33337,24,4),(33338,24,4),(33339,24,4),(33340,24,4),(33341,24,4),(33342,24,4),(33343,24,4),(33344,24,4),(33345,24,4),(33346,24,4),(33347,24,4),(33348,24,4),(33349,24,4),(33350,24,4),(33351,24,4),(33352,24,4),(33353,24,4),(33354,24,4),(33201,25,3),(33202,25,3),(33203,25,3),(33204,25,3),(33205,25,3),(33206,25,3),(33207,25,3),(33208,25,3),(33209,25,3),(33210,25,3),(33211,25,3),(33212,25,3),(33213,25,3),(33214,25,3),(33215,25,3),(33216,25,3),(33217,25,3),(33218,25,3),(33237,25,3),(33238,25,3),(33239,25,3),(33240,25,3),(33241,25,3),(33242,25,3),(33243,25,3),(33244,25,3),(33245,25,3),(33246,25,3),(33247,25,3),(33248,25,3),(33249,25,3),(33250,25,3),(33251,25,3),(33252,25,3),(33253,25,3),(33254,25,3),(21101,28,998877),(21102,28,998877),(21103,28,998877),(21104,28,998877),(21105,28,998877),(21106,28,998877),(21107,28,998877),(21108,28,998877),(21109,28,998877),(21110,28,998877),(21111,28,998877),(21112,28,998877),(21113,28,998877),(21114,28,998877),(21115,28,998877),(21116,28,998877),(21117,28,998877),(21118,28,998877),(21119,28,998877),(21120,28,998877),(21121,28,998877),(21122,28,998877),(21123,28,998877),(21124,28,998877),(21125,28,998877),(21126,28,998877),(21127,28,998877),(21128,28,998877),(21129,28,998877),(21130,28,998877),(21131,28,998877),(21132,28,998877),(21133,28,998877),(21134,28,998877),(21135,28,998877),(21136,28,998877),(21137,28,998877),(21138,28,998877),(21139,28,998877),(21140,28,998877),(555500,28,9999),(555501,28,9999),(555502,28,9999),(555503,28,9999),(555504,28,9999),(555505,28,9999),(555506,28,9999),(555507,28,9999),(555508,28,9999),(555509,28,9999),(555510,28,9999),(555511,28,9999),(555512,28,9999),(555513,28,9999),(555514,28,9999),(555515,28,9999),(555516,28,9999),(555517,28,9999),(555518,28,9999),(555519,28,9999),(555520,28,9999),(555521,28,9999),(555522,28,9999),(555523,28,9999),(555524,28,9999),(555525,28,9999),(555526,28,9999),(555527,28,9999),(555528,28,9999),(555529,28,9999),(555530,28,9999),(555531,28,9999),(555532,28,9999),(555533,28,9999),(555534,28,9999),(555535,28,9999),(555536,28,9999),(555537,28,9999),(555538,28,9999),(555539,28,9999),(555540,28,9999),(555541,28,9999),(555542,28,9999),(555543,28,9999),(555544,28,9999),(555545,28,9999),(555546,28,9999),(555547,28,9999),(555548,28,9999),(555549,28,9999),(555550,28,9999),(555551,28,9999),(555552,28,9999),(555553,28,9999),(555554,28,9999),(555555,28,9999),(555556,28,9999),(555557,28,9999),(555558,28,9999),(555559,28,9999);
/*!40000 ALTER TABLE `student_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `dept_id` varchar(20) DEFAULT NULL,
  `yr` char(2) DEFAULT NULL,
  `domain_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `domain_name` (`domain_name`),
  KEY `dept_id` (`dept_id`),
  KEY `yr` (`yr`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`domain_name`) REFERENCES `domain` (`domain_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subject_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`dept_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subject_ibfk_3` FOREIGN KEY (`yr`) REFERENCES `class` (`year`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'OS','IT','TE','SPORTS'),(2,'DBMS','IT','TE','SPORTS'),(3,'SLI','IT','TE','LTL'),(4,'SLII','IT','TE','LTL'),(333,'subjectX','EnTC','SE','CTL'),(9999,'Subject1','EnTC','SE','LTL'),(998877,'Subject_lab','EnTC','SE','LTL');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_class_subject`
--

DROP TABLE IF EXISTS `teacher_class_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_class_subject` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL,
  `cid_year` char(2) DEFAULT NULL,
  `cid_div` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `tid` (`tid`),
  KEY `cid_year` (`cid_year`,`cid_div`),
  KEY `sid` (`sid`),
  CONSTRAINT `teacher_class_subject_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_class_subject_ibfk_2` FOREIGN KEY (`cid_year`, `cid_div`) REFERENCES `class` (`year`, `division`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_class_subject_ibfk_3` FOREIGN KEY (`sid`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_class_subject`
--

LOCK TABLES `teacher_class_subject` WRITE;
/*!40000 ALTER TABLE `teacher_class_subject` DISABLE KEYS */;
INSERT INTO `teacher_class_subject` VALUES (8,19,'TE',11,1),(9,20,'TE',11,2),(10,21,'TE',11,3),(11,24,'TE',11,4),(12,26,'TE',10,2),(13,25,'TE',10,3),(15,19,'TE',9,1),(16,22,'TE',9,4),(18,28,'SE',18,9999),(19,29,'SE',15,333),(20,28,'SE',15,998877);
/*!40000 ALTER TABLE `teacher_class_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_subject_template`
--

DROP TABLE IF EXISTS `teacher_subject_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_subject_template` (
  `tid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `temp_id` varchar(20) DEFAULT NULL,
  KEY `tid` (`tid`),
  KEY `sid` (`sid`),
  KEY `temp_id` (`temp_id`),
  CONSTRAINT `teacher_subject_template_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_subject_template_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_subject_template_ibfk_3` FOREIGN KEY (`temp_id`) REFERENCES `template` (`temp_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_subject_template`
--

LOCK TABLES `teacher_subject_template` WRITE;
/*!40000 ALTER TABLE `teacher_subject_template` DISABLE KEYS */;
INSERT INTO `teacher_subject_template` VALUES (19,1,'CTL'),(20,2,'CTL'),(24,4,'LTL'),(21,3,'LTL'),(26,2,'CTL'),(25,3,'LTL'),(22,4,'LTL'),(19,1,'CTL'),(28,9999,'LTL'),(29,333,'CTL');
/*!40000 ALTER TABLE `teacher_subject_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept` varchar(30) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept` (`dept`),
  CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`dept`) REFERENCES `dept` (`dept_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (19,'IT','Buradkar'),(20,'IT','Murumkar'),(21,'IT','Kamble'),(22,'IT','Dharmadhikari'),(23,'IT','Londhe'),(24,'IT','Chhajed'),(25,'IT','Jakhete'),(26,'IT','Pande'),(27,'EnTC','Aniket'),(28,'EnTC','Manish'),(29,'EnTC','Kshitij');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_ques`
--

DROP TABLE IF EXISTS `temp_ques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_ques` (
  `temp_id` varchar(20) DEFAULT NULL,
  `qid` int(11) DEFAULT NULL,
  KEY `temp_id` (`temp_id`),
  KEY `qid` (`qid`),
  CONSTRAINT `temp_ques_ibfk_1` FOREIGN KEY (`temp_id`) REFERENCES `template` (`temp_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `temp_ques_ibfk_2` FOREIGN KEY (`qid`) REFERENCES `question` (`qid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_ques`
--

LOCK TABLES `temp_ques` WRITE;
/*!40000 ALTER TABLE `temp_ques` DISABLE KEYS */;
INSERT INTO `temp_ques` VALUES ('CTL',1),('CTL',2),('LTL',3),('LTL',4);
/*!40000 ALTER TABLE `temp_ques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template` (
  `temp_name` varchar(20) NOT NULL,
  PRIMARY KEY (`temp_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
INSERT INTO `template` VALUES ('CTL'),('LTL'),('template1');
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-22 15:29:49

--
-- Dumping routines for database 'feedback_main'
--
/*!50003 DROP PROCEDURE IF EXISTS `initfeed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `initfeed`()
BEGIN
DELETE from feedback;
    insert into feedback(cat_id,qid) SELECT cat_id,qid from teacher_class_subject join teacher_subject_template on teacher_class_subject.tid=teacher_subject_template.tid and teacher_subject_template.sid=teacher_class_subject.sid join temp_ques on teacher_subject_template.temp_id=temp_ques.temp_id;
    update feedback set score=0;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-22 15:29:49
