-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: feedback_main
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.10.1

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
INSERT INTO `class` VALUES ('SE',3,'IT',10,20),('TE',9,'IT',33101,33174),('TE',10,'IT',33201,33270),('TE',11,'IT',33301,33374);
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
INSERT INTO `dept` VALUES ('AS'),('CS'),('EnTC'),('IT');
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
INSERT INTO `feedback` VALUES (15,1,0),(12,1,0),(15,1,0),(15,2,0),(12,2,0),(15,2,0),(13,3,0),(16,3,0),(13,4,0),(16,4,0);
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
INSERT INTO `question` VALUES ('Can you hear the teacher','Good','Fair','Bad','Worst',1,'cant say'),('Can you understand teacher','Good','Fair','Bad','Worst',2,'cant say'),('Can you understand teacher','Good','Fair','Bad','Worst',3,'cant say'),('Can you perform well','Good','Fair','Bad','Worst',4,'cant say');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studcheck`
--

DROP TABLE IF EXISTS `studcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studcheck` (
  `rollno` int(11) NOT NULL,
  `year` varchar(3) DEFAULT NULL,
  `division` int(11) DEFAULT NULL,
  `sid` int(11) NOT NULL,
  `fc` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studcheck`
--

LOCK TABLES `studcheck` WRITE;
/*!40000 ALTER TABLE `studcheck` DISABLE KEYS */;
INSERT INTO `studcheck` VALUES (10,'SE',3,420,0),(11,'SE',3,420,0),(12,'SE',3,420,0),(13,'SE',3,420,0),(14,'SE',3,420,0),(15,'SE',3,420,0),(16,'SE',3,420,0),(17,'SE',3,420,0),(18,'SE',3,420,0),(19,'SE',3,420,0),(20,'SE',3,420,0),(10,'SE',3,111,0),(11,'SE',3,111,0),(12,'SE',3,111,0),(13,'SE',3,111,0),(14,'SE',3,111,0),(15,'SE',3,111,0),(16,'SE',3,111,0),(17,'SE',3,111,0),(18,'SE',3,111,0),(19,'SE',3,111,0),(20,'SE',3,111,0),(33301,'TE',11,2,0),(33302,'TE',11,2,0),(33303,'TE',11,2,0),(33304,'TE',11,2,0),(33305,'TE',11,2,0),(33306,'TE',11,2,0),(33307,'TE',11,2,0),(33308,'TE',11,2,0),(33309,'TE',11,2,0),(33310,'TE',11,2,0),(33311,'TE',11,2,0),(33312,'TE',11,2,0),(33313,'TE',11,2,0),(33314,'TE',11,2,0),(33315,'TE',11,2,0),(33316,'TE',11,2,0),(33317,'TE',11,2,0),(33318,'TE',11,2,0),(33319,'TE',11,2,0),(33320,'TE',11,2,0),(33321,'TE',11,2,0),(33322,'TE',11,2,0),(33323,'TE',11,2,0),(33324,'TE',11,2,0),(33325,'TE',11,2,0),(33326,'TE',11,2,0),(33327,'TE',11,2,0),(33328,'TE',11,2,0),(33329,'TE',11,2,0),(33330,'TE',11,2,0),(33331,'TE',11,2,0),(33332,'TE',11,2,0),(33333,'TE',11,2,0),(33334,'TE',11,2,0),(33335,'TE',11,2,0),(33336,'TE',11,2,0),(33337,'TE',11,2,0),(33338,'TE',11,2,0),(33339,'TE',11,2,0),(33340,'TE',11,2,0),(33341,'TE',11,2,0),(33342,'TE',11,2,0),(33343,'TE',11,2,0),(33344,'TE',11,2,0),(33345,'TE',11,2,0),(33346,'TE',11,2,0),(33347,'TE',11,2,0),(33348,'TE',11,2,0),(33349,'TE',11,2,0),(33350,'TE',11,2,0),(33351,'TE',11,2,0),(33352,'TE',11,2,0),(33353,'TE',11,2,0),(33354,'TE',11,2,0),(33355,'TE',11,2,0),(33356,'TE',11,2,0),(33357,'TE',11,2,0),(33358,'TE',11,2,0),(33359,'TE',11,2,0),(33360,'TE',11,2,0),(33361,'TE',11,2,0),(33362,'TE',11,2,0),(33363,'TE',11,2,0),(33364,'TE',11,2,0),(33365,'TE',11,2,0),(33366,'TE',11,2,0),(33367,'TE',11,2,0),(33368,'TE',11,2,0),(33369,'TE',11,2,0),(33370,'TE',11,2,0),(33371,'TE',11,2,0),(33372,'TE',11,2,0),(33373,'TE',11,2,0),(33374,'TE',11,2,0),(33301,'TE',11,1,0),(33302,'TE',11,1,0),(33303,'TE',11,1,0),(33304,'TE',11,1,0),(33305,'TE',11,1,0),(33306,'TE',11,1,0),(33307,'TE',11,1,0),(33308,'TE',11,1,0),(33309,'TE',11,1,0),(33310,'TE',11,1,0),(33311,'TE',11,1,0),(33312,'TE',11,1,0),(33313,'TE',11,1,0),(33314,'TE',11,1,0),(33315,'TE',11,1,0),(33316,'TE',11,1,0),(33317,'TE',11,1,0),(33318,'TE',11,1,0),(33319,'TE',11,1,0),(33320,'TE',11,1,0),(33321,'TE',11,1,0),(33322,'TE',11,1,0),(33323,'TE',11,1,0),(33324,'TE',11,1,0),(33325,'TE',11,1,0),(33326,'TE',11,1,0),(33327,'TE',11,1,0),(33328,'TE',11,1,0),(33329,'TE',11,1,0),(33330,'TE',11,1,0),(33331,'TE',11,1,0),(33332,'TE',11,1,0),(33333,'TE',11,1,0),(33334,'TE',11,1,0),(33335,'TE',11,1,0),(33336,'TE',11,1,0),(33337,'TE',11,1,0),(33338,'TE',11,1,0),(33339,'TE',11,1,0),(33340,'TE',11,1,0),(33341,'TE',11,1,0),(33342,'TE',11,1,0),(33343,'TE',11,1,0),(33344,'TE',11,1,0),(33345,'TE',11,1,0),(33346,'TE',11,1,0),(33347,'TE',11,1,0),(33348,'TE',11,1,0),(33349,'TE',11,1,0),(33350,'TE',11,1,0),(33351,'TE',11,1,0),(33352,'TE',11,1,0),(33353,'TE',11,1,0),(33354,'TE',11,1,0),(33355,'TE',11,1,0),(33356,'TE',11,1,0),(33357,'TE',11,1,0),(33358,'TE',11,1,0),(33359,'TE',11,1,0),(33360,'TE',11,1,0),(33361,'TE',11,1,0),(33362,'TE',11,1,0),(33363,'TE',11,1,0),(33364,'TE',11,1,0),(33365,'TE',11,1,0),(33366,'TE',11,1,0),(33367,'TE',11,1,0),(33368,'TE',11,1,0),(33369,'TE',11,1,0),(33370,'TE',11,1,0),(33371,'TE',11,1,0),(33372,'TE',11,1,0),(33373,'TE',11,1,0),(33374,'TE',11,1,0),(33301,'TE',11,3,0),(33302,'TE',11,3,0),(33303,'TE',11,3,0),(33304,'TE',11,3,0),(33305,'TE',11,3,0),(33306,'TE',11,3,0),(33307,'TE',11,3,0),(33308,'TE',11,3,0),(33309,'TE',11,3,0),(33310,'TE',11,3,0),(33311,'TE',11,3,0),(33312,'TE',11,3,0),(33313,'TE',11,3,0),(33314,'TE',11,3,0),(33315,'TE',11,3,0),(33316,'TE',11,3,0),(33317,'TE',11,3,0),(33318,'TE',11,3,0),(33319,'TE',11,3,0),(33320,'TE',11,3,0),(33321,'TE',11,3,0),(33322,'TE',11,3,0),(33323,'TE',11,3,0),(33324,'TE',11,3,0),(33325,'TE',11,3,0),(33326,'TE',11,3,0),(33327,'TE',11,3,0),(33328,'TE',11,3,0),(33329,'TE',11,3,0),(33330,'TE',11,3,0),(33331,'TE',11,3,0),(33332,'TE',11,3,0),(33333,'TE',11,3,0),(33334,'TE',11,3,0),(33335,'TE',11,3,0),(33336,'TE',11,3,0),(33337,'TE',11,3,0),(33338,'TE',11,3,0),(33339,'TE',11,3,0),(33340,'TE',11,3,0),(33341,'TE',11,3,0),(33342,'TE',11,3,0),(33343,'TE',11,3,0),(33344,'TE',11,3,0),(33345,'TE',11,3,0),(33346,'TE',11,3,0),(33347,'TE',11,3,0),(33348,'TE',11,3,0),(33349,'TE',11,3,0),(33350,'TE',11,3,0),(33351,'TE',11,3,0),(33352,'TE',11,3,0),(33353,'TE',11,3,0),(33354,'TE',11,3,0),(33355,'TE',11,3,0),(33356,'TE',11,3,0),(33357,'TE',11,3,0),(33358,'TE',11,3,0),(33359,'TE',11,3,0),(33360,'TE',11,3,0),(33361,'TE',11,3,0),(33362,'TE',11,3,0),(33363,'TE',11,3,0),(33364,'TE',11,3,0),(33365,'TE',11,3,0),(33366,'TE',11,3,0),(33367,'TE',11,3,0),(33368,'TE',11,3,0),(33369,'TE',11,3,0),(33370,'TE',11,3,0),(33371,'TE',11,3,0),(33372,'TE',11,3,0),(33373,'TE',11,3,0),(33374,'TE',11,3,0);
/*!40000 ALTER TABLE `studcheck` ENABLE KEYS */;
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
  `feedcheck` int(11) NOT NULL DEFAULT '0',
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
INSERT INTO `student` VALUES (10,'SE',3,NULL,0),(11,'SE',3,NULL,0),(12,'SE',3,NULL,0),(13,'SE',3,NULL,0),(14,'SE',3,NULL,0),(15,'SE',3,NULL,0),(16,'SE',3,NULL,0),(17,'SE',3,NULL,0),(18,'SE',3,NULL,0),(19,'SE',3,NULL,0),(20,'SE',3,NULL,0),(33101,'TE',9,'[C@5f7109af',0),(33102,'TE',9,'[C@41302ff3',0),(33103,'TE',9,'[C@26ff78e0',0),(33104,'TE',9,'[C@59dbe7ca',0),(33105,'TE',9,'[C@eb0b12f',0),(33106,'TE',9,'[C@4ebf58bd',0),(33107,'TE',9,'[C@13da01f2',0),(33108,'TE',9,'[C@153941f4',0),(33109,'TE',9,'[C@1e0ba3b5',0),(33110,'TE',9,'[C@2a457a79',0),(33111,'TE',9,'[C@69d32b52',0),(33112,'TE',9,'[C@36bae17d',0),(33113,'TE',9,'[C@756fea14',0),(33114,'TE',9,'[C@7478c072',0),(33115,'TE',9,'[C@481ec14',0),(33116,'TE',9,'[C@655144f0',0),(33117,'TE',9,'[C@6f642d04',0),(33118,'TE',9,'[C@5d2d1bca',0),(33119,'TE',9,'[C@5647ad37',0),(33120,'TE',9,'[C@395e15cb',0),(33121,'TE',9,'[C@779c13e9',0),(33122,'TE',9,'[C@42dab59b',0),(33123,'TE',9,'[C@299f86e2',0),(33124,'TE',9,'[C@60a63e57',0),(33125,'TE',9,'[C@77b27af1',0),(33126,'TE',9,'[C@60537ff1',0),(33127,'TE',9,'[C@352e4d8f',0),(33128,'TE',9,'[C@64ab89fb',0),(33129,'TE',9,'[C@aa126d',0),(33130,'TE',9,'[C@7bfd497e',0),(33131,'TE',9,'[C@3c7821bb',0),(33132,'TE',9,'[C@4a4939e',0),(33133,'TE',9,'[C@54cdd01d',0),(33134,'TE',9,'[C@456ad543',0),(33135,'TE',9,'[C@38e251ac',0),(33136,'TE',9,'[C@18fa1d4d',0),(33137,'TE',9,'[C@228d7b77',0),(33138,'TE',9,'[C@315e62a8',0),(33139,'TE',9,'[C@1b9b2a1e',0),(33140,'TE',9,'[C@53c34c55',0),(33141,'TE',9,'[C@1a5cd399',0),(33142,'TE',9,'[C@5855a958',0),(33143,'TE',9,'[C@1a5ca396',0),(33144,'TE',9,'[C@53b4e56c',0),(33145,'TE',9,'[C@2f083498',0),(33146,'TE',9,'[C@5a624748',0),(33147,'TE',9,'[C@25dd1f81',0),(33148,'TE',9,'[C@51b611d3',0),(33149,'TE',9,'[C@3f744389',0),(33150,'TE',9,'[C@77641b28',0),(33151,'TE',9,'[C@3a082352',0),(33152,'TE',9,'[C@5bd19549',0),(33153,'TE',9,'[C@4624edb1',0),(33154,'TE',9,'[C@11ce0306',0),(33155,'TE',9,'[C@6aa7a0de',0),(33156,'TE',9,'[C@3d8b0b1e',0),(33157,'TE',9,'[C@5ca3207b',0),(33158,'TE',9,'[C@3d14ceda',0),(33159,'TE',9,'[C@6ae238f6',0),(33160,'TE',9,'[C@f541d4f',0),(33161,'TE',9,'[C@4ab14426',0),(33162,'TE',9,'[C@514831b4',0),(33163,'TE',9,'[C@2a1686e3',0),(33164,'TE',9,'[C@507488b',0),(33165,'TE',9,'[C@4557ac79',0),(33166,'TE',9,'[C@5502e0f6',0),(33167,'TE',9,'[C@4b3d552b',0),(33168,'TE',9,'[C@74410fd7',0),(33169,'TE',9,'[C@c0d5142',0),(33170,'TE',9,'[C@4e4a0565',0),(33171,'TE',9,'[C@6f7f958a',0),(33172,'TE',9,'[C@133c0005',0),(33173,'TE',9,'[C@75ddd461',0),(33174,'TE',9,'[C@6ba28692',0),(33201,'TE',10,'[C@78628da9',0),(33202,'TE',10,'[C@b2d8688',0),(33203,'TE',10,'[C@10483550',0),(33204,'TE',10,'[C@6f21a7dd',0),(33205,'TE',10,'[C@3c26055',0),(33206,'TE',10,'[C@643caf63',0),(33207,'TE',10,'[C@350ff401',0),(33208,'TE',10,'[C@5772b232',0),(33209,'TE',10,'[C@4722a041',0),(33210,'TE',10,'[C@46e45871',0),(33211,'TE',10,'[C@c811350',0),(33212,'TE',10,'[C@4e20d3d0',0),(33213,'TE',10,'[C@1c5252fd',0),(33214,'TE',10,'[C@7891a6d6',0),(33215,'TE',10,'[C@7c8e3107',0),(33216,'TE',10,'[C@3478c315',0),(33217,'TE',10,'[C@3a33aadd',0),(33218,'TE',10,'[C@4fe11c5b',0),(33219,'TE',10,'[C@426a1aa9',0),(33220,'TE',10,'[C@3078099a',0),(33221,'TE',10,'[C@17ba380a',0),(33222,'TE',10,'[C@50fefd62',0),(33223,'TE',10,'[C@42d31a86',0),(33224,'TE',10,'[C@3297ef9f',0),(33225,'TE',10,'[C@742bebaf',0),(33226,'TE',10,'[C@53991da5',0),(33227,'TE',10,'[C@9c42a7a',0),(33228,'TE',10,'[C@422c7ca',0),(33229,'TE',10,'[C@2f7f3272',0),(33230,'TE',10,'[C@3410660d',0),(33231,'TE',10,'[C@1c2f1d0f',0),(33232,'TE',10,'[C@ea195d7',0),(33233,'TE',10,'[C@581bcad3',0),(33234,'TE',10,'[C@6f0cffd3',0),(33235,'TE',10,'[C@baf4058',0),(33236,'TE',10,'[C@92273d7',0),(33237,'TE',10,'[C@f696d72',0),(33238,'TE',10,'[C@713f92b',0),(33239,'TE',10,'[C@764fc411',0),(33240,'TE',10,'[C@6ce9bdc4',0),(33241,'TE',10,'[C@28af4fd6',0),(33242,'TE',10,'[C@306d3149',0),(33243,'TE',10,'[C@380a1419',0),(33244,'TE',10,'[C@192c8941',0),(33245,'TE',10,'[C@4bafa44d',0),(33246,'TE',10,'[C@12113308',0),(33247,'TE',10,'[C@7ad3478f',0),(33248,'TE',10,'[C@7c8af15',0),(33249,'TE',10,'[C@3173ee6d',0),(33250,'TE',10,'[C@2a611238',0),(33251,'TE',10,'[C@4a6ed7c4',0),(33252,'TE',10,'[C@89c699b',0),(33253,'TE',10,'[C@2632ee63',0),(33254,'TE',10,'[C@460d84f',0),(33255,'TE',10,'[C@388cfff0',0),(33256,'TE',10,'[C@53b799cb',0),(33257,'TE',10,'[C@62c73428',0),(33258,'TE',10,'[C@60672a9f',0),(33259,'TE',10,'[C@3f4b3a1c',0),(33260,'TE',10,'[C@505d95ff',0),(33261,'TE',10,'[C@be09da8',0),(33262,'TE',10,'[C@520a7d99',0),(33263,'TE',10,'[C@3477261e',0),(33264,'TE',10,'[C@8b9bf02',0),(33265,'TE',10,'[C@7bb6e60',0),(33266,'TE',10,'[C@6dc3dbb',0),(33267,'TE',10,'[C@b16bca8',0),(33268,'TE',10,'[C@4e925367',0),(33269,'TE',10,'[C@1286ecbb',0),(33270,'TE',10,'[C@75d03ab5',0),(33301,'TE',11,'[C@4b9d3b5b',0),(33302,'TE',11,'[C@17c84024',0),(33303,'TE',11,'[C@320e8552',0),(33304,'TE',11,'[C@46ff0434',0),(33305,'TE',11,'[C@649aa853',0),(33306,'TE',11,'[C@31860d84',0),(33307,'TE',11,'[C@77642af3',0),(33308,'TE',11,'[C@49045e8f',0),(33309,'TE',11,'[C@786dafcc',0),(33310,'TE',11,'[C@79066768',0),(33311,'TE',11,'[C@2f63f909',0),(33312,'TE',11,'[C@44783a4c',0),(33313,'TE',11,'[C@517eeec0',0),(33314,'TE',11,'[C@1b89fea0',0),(33315,'TE',11,'[C@2b92f769',0),(33316,'TE',11,'[C@2ebd020d',0),(33317,'TE',11,'[C@813f1f4',0),(33318,'TE',11,'[C@5cbb72a8',0),(33319,'TE',11,'[C@602effe9',0),(33320,'TE',11,'[C@26c5348b',0),(33321,'TE',11,'[C@31cefdf6',0),(33322,'TE',11,'[C@36e7f755',0),(33323,'TE',11,'[C@212187d7',0),(33324,'TE',11,'[C@2e4f9e14',0),(33325,'TE',11,'[C@68a8e766',0),(33326,'TE',11,'[C@617ce879',0),(33327,'TE',11,'[C@4cced4be',0),(33328,'TE',11,'[C@1ea35c0d',0),(33329,'TE',11,'[C@311f0b68',0),(33330,'TE',11,'[C@37260212',0),(33331,'TE',11,'[C@d775b6c',0),(33332,'TE',11,'[C@9b03dfb',0),(33333,'TE',11,'[C@40bd33ee',0),(33334,'TE',11,'[C@470c9f79',0),(33335,'TE',11,'[C@709710cf',0),(33336,'TE',11,'[C@7840b4c3',0),(33337,'TE',11,'[C@51cbda66',0),(33338,'TE',11,'[C@729f6071',0),(33339,'TE',11,'[C@3ac61785',0),(33340,'TE',11,'[C@475d5ab2',0),(33341,'TE',11,'[C@48caa0d5',0),(33342,'TE',11,'[C@41dfcd55',0),(33343,'TE',11,'[C@4baf80d4',0),(33344,'TE',11,'[C@668acbd9',0),(33345,'TE',11,'[C@7bdb13d5',0),(33346,'TE',11,'[C@44d1cc9e',0),(33347,'TE',11,'[C@734f5df0',0),(33348,'TE',11,'[C@432b9443',0),(33349,'TE',11,'[C@60cd6248',0),(33350,'TE',11,'[C@2a32f7f3',0),(33351,'TE',11,'[C@231b9f98',0),(33352,'TE',11,'[C@3c8d9e34',0),(33353,'TE',11,'[C@37d964cf',0),(33354,'TE',11,'[C@a6990a8',0),(33355,'TE',11,'[C@75713922',0),(33356,'TE',11,'[C@255d7586',0),(33357,'TE',11,'[C@59de92fe',0),(33358,'TE',11,'[C@1ff4a5bd',0),(33359,'TE',11,'[C@63b02748',0),(33360,'TE',11,'[C@2d8f9ffd',0),(33361,'TE',11,'[C@6ba1d0',0),(33362,'TE',11,'[C@3a88352d',0),(33363,'TE',11,'[C@58e0df53',0),(33364,'TE',11,'[C@941c3c5',0),(33365,'TE',11,'[C@5479861c',0),(33366,'TE',11,'[C@2f23f0e3',0),(33367,'TE',11,'[C@71e7a813',0),(33368,'TE',11,'[C@76bf0201',0),(33369,'TE',11,'[C@6e6e33ac',0),(33370,'TE',11,'[C@5efa726a',0),(33371,'TE',11,'[C@1291ee96',0),(33372,'TE',11,'[C@1c3059cf',0),(33373,'TE',11,'[C@3dceab6',0),(33374,'TE',11,'[C@e38b185',0);
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
  `fc` int(11) DEFAULT '0',
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
INSERT INTO `student_cat` VALUES (33121,22,4,0),(33122,22,4,0),(33123,22,4,0),(33124,22,4,0),(33125,22,4,0),(33126,22,4,0),(33127,22,4,0),(33128,22,4,0),(33129,22,4,0),(33130,22,4,0),(33131,22,4,0),(33132,22,4,0),(33133,22,4,0),(33134,22,4,0),(33135,22,4,0),(33136,22,4,0),(33137,22,4,0),(33138,22,4,0),(33139,22,4,0),(33140,22,4,0),(33141,22,4,0),(33142,22,4,0),(33143,22,4,0),(33144,22,4,0),(33145,22,4,0),(33146,22,4,0),(33147,22,4,0),(33148,22,4,0),(33149,22,4,0),(33150,22,4,0),(33151,22,4,0),(33152,22,4,0),(33153,22,4,0),(33154,22,4,0),(33155,22,4,0),(33156,22,4,0),(33157,22,4,0),(33158,22,4,0),(33159,22,4,0),(33160,22,4,0),(33201,25,3,0),(33202,25,3,0),(33203,25,3,0),(33204,25,3,0),(33205,25,3,0),(33206,25,3,0),(33207,25,3,0),(33208,25,3,0),(33209,25,3,0),(33210,25,3,0),(33211,25,3,0),(33212,25,3,0),(33213,25,3,0),(33214,25,3,0),(33215,25,3,0),(33216,25,3,0),(33217,25,3,0),(33218,25,3,0),(33237,25,3,0),(33238,25,3,0),(33239,25,3,0),(33240,25,3,0),(33241,25,3,0),(33242,25,3,0),(33243,25,3,0),(33244,25,3,0),(33245,25,3,0),(33246,25,3,0),(33247,25,3,0),(33248,25,3,0),(33249,25,3,0),(33250,25,3,0),(33251,25,3,0),(33252,25,3,0),(33253,25,3,0),(33254,25,3,0),(33301,21,3,1),(33301,24,4,1),(33302,21,3,0),(33302,24,4,0),(33303,21,3,0),(33303,24,4,0),(33304,21,3,0),(33304,24,4,0),(33305,21,3,0),(33305,24,4,0),(33306,21,3,0),(33306,24,4,0),(33307,21,3,0),(33307,24,4,0),(33308,21,3,0),(33308,24,4,0),(33309,21,3,0),(33309,24,4,0),(33310,21,3,0),(33310,24,4,0),(33311,21,3,0),(33311,24,4,0),(33312,21,3,0),(33312,24,4,0),(33313,21,3,0),(33313,24,4,0),(33314,21,3,0),(33314,24,4,0),(33315,21,3,0),(33315,24,4,0),(33316,21,3,0),(33316,24,4,0),(33317,21,3,0),(33317,24,4,0),(33318,21,3,0),(33318,24,4,0),(33319,21,3,0),(33319,21,6666,0),(33319,24,8888,0),(33320,21,3,0),(33320,21,6666,0),(33320,24,8888,0),(33321,21,3,0),(33321,21,6666,0),(33321,24,8888,0),(33322,21,3,0),(33322,21,6666,0),(33322,24,8888,0),(33323,21,3,0),(33323,21,6666,0),(33323,24,8888,0),(33324,21,3,0),(33324,21,6666,0),(33324,24,8888,0),(33325,21,3,0),(33325,21,6666,0),(33325,24,8888,0),(33326,21,3,0),(33326,21,6666,0),(33326,24,8888,0),(33327,21,3,0),(33327,21,6666,0),(33327,24,8888,0),(33328,21,3,0),(33328,21,6666,0),(33328,24,8888,0),(33329,21,3,0),(33329,21,6666,0),(33329,24,8888,0),(33330,21,3,0),(33330,21,6666,0),(33330,24,8888,0),(33331,21,3,0),(33331,21,6666,0),(33331,24,8888,0),(33332,21,3,0),(33332,21,6666,0),(33332,24,8888,0),(33333,21,3,0),(33333,21,6666,0),(33333,24,8888,0),(33334,21,3,0),(33334,21,6666,0),(33334,24,8888,0),(33335,21,3,0),(33335,21,6666,0),(33335,24,8888,0),(33336,21,3,0),(33336,21,6666,0),(33336,24,8888,0),(33337,21,3,0),(33337,24,4,0),(33338,21,3,0),(33338,24,4,0),(33339,21,3,0),(33339,24,4,0),(33340,21,3,0),(33340,24,4,0),(33341,21,3,0),(33341,24,4,0),(33342,21,3,0),(33342,24,4,0),(33343,21,3,0),(33343,24,4,0),(33344,21,3,0),(33344,24,4,0),(33345,21,3,0),(33345,24,4,0),(33346,21,3,0),(33346,24,4,0),(33347,21,3,0),(33347,24,4,0),(33348,21,3,0),(33348,24,4,0),(33349,21,3,0),(33349,24,4,0),(33350,21,3,0),(33350,24,4,0),(33351,21,3,0),(33351,24,4,0),(33352,21,3,0),(33352,24,4,0),(33353,21,3,0),(33353,24,4,0),(33354,21,3,0),(33354,24,4,0);
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
INSERT INTO `subject` VALUES (1,'OS','IT','TE','CTL'),(2,'DBMS','IT','TE','CTL'),(3,'SLI','IT','TE','LTL'),(4,'SLII','IT','TE','LTL'),(111,'jojo','IT','SE','CTL'),(420,'SAM','IT','SE','CTL'),(12345,'DB','IT','TE','CTL');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_class_subject`
--

LOCK TABLES `teacher_class_subject` WRITE;
/*!40000 ALTER TABLE `teacher_class_subject` DISABLE KEYS */;
INSERT INTO `teacher_class_subject` VALUES (12,26,'TE',10,2),(13,25,'TE',10,3),(14,23,'TE',9,12345),(15,19,'TE',9,1),(16,22,'TE',9,4),(17,19,'SE',3,420),(18,21,'SE',3,111),(19,20,'TE',11,2),(20,19,'TE',11,1),(21,21,'TE',11,3);
/*!40000 ALTER TABLE `teacher_class_subject` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`Deva`@`localhost`*/ /*!50003 TRIGGER `teacher_class_subject_AFTER_INSERT` AFTER INSERT ON `teacher_class_subject` FOR EACH ROW BEGIN
declare r1 int; declare r2 int; set r1 = (select ran1 from class where year =new.cid_year and class.division=new.cid_div); set r2 = (select ran2 from class where year =new.cid_year and  class.division =new.cid_div); while r1<= r2 do insert into studcheck(rollno,year,division,sid) values(r1,new.cid_year,new.cid_div,new.sid); set r1 = r1 + 1; end while;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `teacher_subject_template` VALUES (19,1,'CTL'),(20,2,'CTL'),(26,2,'CTL'),(25,3,'LTL'),(22,4,'LTL'),(19,1,'CTL'),(21,3,'LTL');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (19,'IT','Buradkar'),(20,'IT','Murumkar'),(21,'IT','Kamble'),(22,'IT','Dharmadhikari'),(23,'IT','Londhe'),(24,'IT','Chhajed'),(25,'IT','Jakhete'),(26,'IT','Pande');
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
INSERT INTO `template` VALUES ('CTL'),('LTL');
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

-- Dump completed on 2020-01-24 16:56:10
