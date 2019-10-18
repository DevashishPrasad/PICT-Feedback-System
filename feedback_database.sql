-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: feedback_main
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
INSERT INTO `accounts` VALUES ('admin','admin'),('Manish','Visave'),('Girish','12345'),('Deva','12345'),('admin','admin'),('Manish','Visave'),('Girish','12345'),('Deva','12345');
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
INSERT INTO `class` VALUES ('TE',10,'IT',33201,33270),('TE',11,'IT',33301,33374);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger c_stud after insert on class for each row begin declare r1 int; declare r2 int; set r1 = new.ran1; set r2 = new.ran2; while r1<= r2 do insert into student values(r1,new.year,new.division); set r1 = r1 + 1; end while; end */;;
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
INSERT INTO `domain` VALUES ('CTL'),('LTL');
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;
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
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES ('How are you today','1','2','3','54',1),('Why are you','76','9','56','4',2),('Where are you ','099','jkh','t5','5',3),('Why do you exist','kjl','o','9','8',4),('Why dont you die','jh','9','b','4',5),('Why do you exist LTL','m','u','fr','b',6),('Where are you TLT','lk','lk','f','hj',7),('Where are you LTL','kjkh','989','h','d',8),('Why dont you die LTL','n','v','y','ds',9);
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
INSERT INTO `student` VALUES (33201,'TE',10),(33202,'TE',10),(33203,'TE',10),(33204,'TE',10),(33205,'TE',10),(33206,'TE',10),(33207,'TE',10),(33208,'TE',10),(33209,'TE',10),(33210,'TE',10),(33211,'TE',10),(33212,'TE',10),(33213,'TE',10),(33214,'TE',10),(33215,'TE',10),(33216,'TE',10),(33217,'TE',10),(33218,'TE',10),(33219,'TE',10),(33220,'TE',10),(33221,'TE',10),(33222,'TE',10),(33223,'TE',10),(33224,'TE',10),(33225,'TE',10),(33226,'TE',10),(33227,'TE',10),(33228,'TE',10),(33229,'TE',10),(33230,'TE',10),(33231,'TE',10),(33232,'TE',10),(33233,'TE',10),(33234,'TE',10),(33235,'TE',10),(33236,'TE',10),(33237,'TE',10),(33238,'TE',10),(33239,'TE',10),(33240,'TE',10),(33241,'TE',10),(33242,'TE',10),(33243,'TE',10),(33244,'TE',10),(33245,'TE',10),(33246,'TE',10),(33247,'TE',10),(33248,'TE',10),(33249,'TE',10),(33250,'TE',10),(33251,'TE',10),(33252,'TE',10),(33253,'TE',10),(33254,'TE',10),(33255,'TE',10),(33256,'TE',10),(33257,'TE',10),(33258,'TE',10),(33259,'TE',10),(33260,'TE',10),(33261,'TE',10),(33262,'TE',10),(33263,'TE',10),(33264,'TE',10),(33265,'TE',10),(33266,'TE',10),(33267,'TE',10),(33268,'TE',10),(33269,'TE',10),(33270,'TE',10),(33301,'TE',11),(33302,'TE',11),(33303,'TE',11),(33304,'TE',11),(33305,'TE',11),(33306,'TE',11),(33307,'TE',11),(33308,'TE',11),(33309,'TE',11),(33310,'TE',11),(33311,'TE',11),(33312,'TE',11),(33313,'TE',11),(33314,'TE',11),(33315,'TE',11),(33316,'TE',11),(33317,'TE',11),(33318,'TE',11),(33319,'TE',11),(33320,'TE',11),(33321,'TE',11),(33322,'TE',11),(33323,'TE',11),(33324,'TE',11),(33325,'TE',11),(33326,'TE',11),(33327,'TE',11),(33328,'TE',11),(33329,'TE',11),(33330,'TE',11),(33331,'TE',11),(33332,'TE',11),(33333,'TE',11),(33334,'TE',11),(33335,'TE',11),(33336,'TE',11),(33337,'TE',11),(33338,'TE',11),(33339,'TE',11),(33340,'TE',11),(33341,'TE',11),(33342,'TE',11),(33343,'TE',11),(33344,'TE',11),(33345,'TE',11),(33346,'TE',11),(33347,'TE',11),(33348,'TE',11),(33349,'TE',11),(33350,'TE',11),(33351,'TE',11),(33352,'TE',11),(33353,'TE',11),(33354,'TE',11),(33355,'TE',11),(33356,'TE',11),(33357,'TE',11),(33358,'TE',11),(33359,'TE',11),(33360,'TE',11),(33361,'TE',11),(33362,'TE',11),(33363,'TE',11),(33364,'TE',11),(33365,'TE',11),(33366,'TE',11),(33367,'TE',11),(33368,'TE',11),(33369,'TE',11),(33370,'TE',11),(33371,'TE',11),(33372,'TE',11),(33373,'TE',11),(33374,'TE',11);
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
INSERT INTO `student_cat` VALUES (33319,21,6666),(33320,21,6666),(33321,21,6666),(33322,21,6666),(33323,21,6666),(33324,21,6666),(33325,21,6666),(33326,21,6666),(33327,21,6666),(33328,21,6666),(33329,21,6666),(33330,21,6666),(33331,21,6666),(33332,21,6666),(33333,21,6666),(33334,21,6666),(33335,21,6666),(33336,21,6666),(33319,24,8888),(33320,24,8888),(33321,24,8888),(33322,24,8888),(33323,24,8888),(33324,24,8888),(33325,24,8888),(33326,24,8888),(33327,24,8888),(33328,24,8888),(33329,24,8888),(33330,24,8888),(33331,24,8888),(33332,24,8888),(33333,24,8888),(33334,24,8888),(33335,24,8888),(33336,24,8888);
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
INSERT INTO `subject` VALUES (1111,'OS','IT','TE','CTL'),(2222,'SEPM','IT','TE','CTL'),(3333,'DBMS','IT','TE','CTL'),(4444,'HCI','IT','TE','CTL'),(6666,'SL1','IT','TE','LTL'),(8888,'SL2','IT','TE','LTL');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_class_subject`
--

DROP TABLE IF EXISTS `teacher_class_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_class_subject` (
  `tid` int(11) DEFAULT NULL,
  `cid_year` char(2) DEFAULT NULL,
  `cid_div` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  KEY `tid` (`tid`),
  KEY `cid_year` (`cid_year`,`cid_div`),
  KEY `sid` (`sid`),
  CONSTRAINT `teacher_class_subject_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_class_subject_ibfk_2` FOREIGN KEY (`cid_year`, `cid_div`) REFERENCES `class` (`year`, `division`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_class_subject_ibfk_3` FOREIGN KEY (`sid`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_class_subject`
--

LOCK TABLES `teacher_class_subject` WRITE;
/*!40000 ALTER TABLE `teacher_class_subject` DISABLE KEYS */;
INSERT INTO `teacher_class_subject` VALUES (19,'TE',11,1111),(21,'TE',11,3333),(22,'TE',11,2222),(23,'TE',11,4444),(24,'TE',11,8888),(21,'TE',11,6666);
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
INSERT INTO `teacher_subject_template` VALUES (21,6666,'LTL'),(24,8888,'LTL'),(19,1111,'CTL'),(21,3333,'CTL'),(22,2222,'CTL'),(19,1111,'CTL'),(23,4444,'CTL');
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
INSERT INTO `temp_ques` VALUES ('CTL',1),('CTL',2),('CTL',3),('CTL',4),('CTL',5),('LTL',6),('LTL',7),('LTL',8),('LTL',9);
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

-- Dump completed on 2019-10-18 14:44:32
