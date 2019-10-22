-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2019 at 03:24 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `feedback_main`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `name` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`name`, `pass`) VALUES
('admin', 'admin'),
('Manish', 'Visave'),
('Girish', '12345'),
('Deva', '12345'),
('admin', 'admin'),
('Manish', 'Visave'),
('Girish', '12345'),
('Deva', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `year` char(2) NOT NULL,
  `division` int(11) NOT NULL,
  `dept` varchar(20) DEFAULT NULL,
  `ran1` int(11) DEFAULT NULL,
  `ran2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`year`, `division`, `dept`, `ran1`, `ran2`) VALUES
('TE', 10, 'IT', 33201, 33270),
('TE', 11, 'IT', 33301, 33374);

--
-- Triggers `class`
--
DELIMITER $$
CREATE TRIGGER `c_stud` AFTER INSERT ON `class` FOR EACH ROW begin declare r1 int; declare r2 int; set r1 = new.ran1; set r2 = new.ran2; while r1<= r2 do insert into student values(r1,new.year,new.division); set r1 = r1 + 1; end while; end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE `dept` (
  `dept_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`dept_name`) VALUES
('CS'),
('EnTC'),
('IT');

-- --------------------------------------------------------

--
-- Table structure for table `domain`
--

CREATE TABLE `domain` (
  `domain_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `domain`
--

INSERT INTO `domain` (`domain_name`) VALUES
('CTL'),
('LTL');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `cat_id` int(11) DEFAULT NULL,
  `qid` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`cat_id`, `qid`, `score`) VALUES
(5, 6, 80),
(5, 7, 80),
(5, 8, 80),
(5, 9, 80),
(6, 6, 120),
(6, 7, 120),
(6, 8, 120),
(6, 9, 120);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `question` varchar(120) DEFAULT NULL,
  `option1` varchar(50) DEFAULT NULL,
  `option2` varchar(50) DEFAULT NULL,
  `option3` varchar(50) DEFAULT NULL,
  `option4` varchar(50) DEFAULT NULL,
  `qid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`question`, `option1`, `option2`, `option3`, `option4`, `qid`) VALUES
('How are you today', '1', '2', '3', '54', 1),
('Why are you', '76', '9', '56', '4', 2),
('Where are you ', '099', 'jkh', 't5', '5', 3),
('Why do you exist', 'kjl', 'o', '9', '8', 4),
('Why dont you die', 'jh', '9', 'b', '4', 5),
('Why do you exist LTL', 'm', 'u', 'fr', 'b', 6),
('Where are you TLT', 'lk', 'lk', 'f', 'hj', 7),
('Where are you LTL', 'kjkh', '989', 'h', 'd', 8),
('Why dont you die LTL', 'n', 'v', 'y', 'ds', 9);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `rollno` int(11) NOT NULL,
  `year` char(2) DEFAULT NULL,
  `division` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`rollno`, `year`, `division`) VALUES
(33201, 'TE', 10),
(33202, 'TE', 10),
(33203, 'TE', 10),
(33204, 'TE', 10),
(33205, 'TE', 10),
(33206, 'TE', 10),
(33207, 'TE', 10),
(33208, 'TE', 10),
(33209, 'TE', 10),
(33210, 'TE', 10),
(33211, 'TE', 10),
(33212, 'TE', 10),
(33213, 'TE', 10),
(33214, 'TE', 10),
(33215, 'TE', 10),
(33216, 'TE', 10),
(33217, 'TE', 10),
(33218, 'TE', 10),
(33219, 'TE', 10),
(33220, 'TE', 10),
(33221, 'TE', 10),
(33222, 'TE', 10),
(33223, 'TE', 10),
(33224, 'TE', 10),
(33225, 'TE', 10),
(33226, 'TE', 10),
(33227, 'TE', 10),
(33228, 'TE', 10),
(33229, 'TE', 10),
(33230, 'TE', 10),
(33231, 'TE', 10),
(33232, 'TE', 10),
(33233, 'TE', 10),
(33234, 'TE', 10),
(33235, 'TE', 10),
(33236, 'TE', 10),
(33237, 'TE', 10),
(33238, 'TE', 10),
(33239, 'TE', 10),
(33240, 'TE', 10),
(33241, 'TE', 10),
(33242, 'TE', 10),
(33243, 'TE', 10),
(33244, 'TE', 10),
(33245, 'TE', 10),
(33246, 'TE', 10),
(33247, 'TE', 10),
(33248, 'TE', 10),
(33249, 'TE', 10),
(33250, 'TE', 10),
(33251, 'TE', 10),
(33252, 'TE', 10),
(33253, 'TE', 10),
(33254, 'TE', 10),
(33255, 'TE', 10),
(33256, 'TE', 10),
(33257, 'TE', 10),
(33258, 'TE', 10),
(33259, 'TE', 10),
(33260, 'TE', 10),
(33261, 'TE', 10),
(33262, 'TE', 10),
(33263, 'TE', 10),
(33264, 'TE', 10),
(33265, 'TE', 10),
(33266, 'TE', 10),
(33267, 'TE', 10),
(33268, 'TE', 10),
(33269, 'TE', 10),
(33270, 'TE', 10),
(33301, 'TE', 11),
(33302, 'TE', 11),
(33303, 'TE', 11),
(33304, 'TE', 11),
(33305, 'TE', 11),
(33306, 'TE', 11),
(33307, 'TE', 11),
(33308, 'TE', 11),
(33309, 'TE', 11),
(33310, 'TE', 11),
(33311, 'TE', 11),
(33312, 'TE', 11),
(33313, 'TE', 11),
(33314, 'TE', 11),
(33315, 'TE', 11),
(33316, 'TE', 11),
(33317, 'TE', 11),
(33318, 'TE', 11),
(33319, 'TE', 11),
(33320, 'TE', 11),
(33321, 'TE', 11),
(33322, 'TE', 11),
(33323, 'TE', 11),
(33324, 'TE', 11),
(33325, 'TE', 11),
(33326, 'TE', 11),
(33327, 'TE', 11),
(33328, 'TE', 11),
(33329, 'TE', 11),
(33330, 'TE', 11),
(33331, 'TE', 11),
(33332, 'TE', 11),
(33333, 'TE', 11),
(33334, 'TE', 11),
(33335, 'TE', 11),
(33336, 'TE', 11),
(33337, 'TE', 11),
(33338, 'TE', 11),
(33339, 'TE', 11),
(33340, 'TE', 11),
(33341, 'TE', 11),
(33342, 'TE', 11),
(33343, 'TE', 11),
(33344, 'TE', 11),
(33345, 'TE', 11),
(33346, 'TE', 11),
(33347, 'TE', 11),
(33348, 'TE', 11),
(33349, 'TE', 11),
(33350, 'TE', 11),
(33351, 'TE', 11),
(33352, 'TE', 11),
(33353, 'TE', 11),
(33354, 'TE', 11),
(33355, 'TE', 11),
(33356, 'TE', 11),
(33357, 'TE', 11),
(33358, 'TE', 11),
(33359, 'TE', 11),
(33360, 'TE', 11),
(33361, 'TE', 11),
(33362, 'TE', 11),
(33363, 'TE', 11),
(33364, 'TE', 11),
(33365, 'TE', 11),
(33366, 'TE', 11),
(33367, 'TE', 11),
(33368, 'TE', 11),
(33369, 'TE', 11),
(33370, 'TE', 11),
(33371, 'TE', 11),
(33372, 'TE', 11),
(33373, 'TE', 11),
(33374, 'TE', 11);

-- --------------------------------------------------------

--
-- Table structure for table `student_cat`
--

CREATE TABLE `student_cat` (
  `rollno` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_cat`
--

INSERT INTO `student_cat` (`rollno`, `tid`, `sid`) VALUES
(33319, 21, 6666),
(33319, 24, 8888),
(33320, 21, 6666),
(33320, 24, 8888),
(33321, 21, 6666),
(33321, 24, 8888),
(33322, 21, 6666),
(33322, 24, 8888),
(33323, 21, 6666),
(33323, 24, 8888),
(33324, 21, 6666),
(33324, 24, 8888),
(33325, 21, 6666),
(33325, 24, 8888),
(33326, 21, 6666),
(33326, 24, 8888),
(33327, 21, 6666),
(33327, 24, 8888),
(33328, 21, 6666),
(33328, 24, 8888),
(33329, 21, 6666),
(33329, 24, 8888),
(33330, 21, 6666),
(33330, 24, 8888),
(33331, 21, 6666),
(33331, 24, 8888),
(33332, 21, 6666),
(33332, 24, 8888),
(33333, 21, 6666),
(33333, 24, 8888),
(33334, 21, 6666),
(33334, 24, 8888),
(33335, 21, 6666),
(33335, 24, 8888),
(33336, 21, 6666),
(33336, 24, 8888);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `dept_id` varchar(20) DEFAULT NULL,
  `yr` char(2) DEFAULT NULL,
  `domain_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `subject_name`, `dept_id`, `yr`, `domain_name`) VALUES
(1111, 'OS', 'IT', 'TE', 'CTL'),
(2222, 'SEPM', 'IT', 'TE', 'CTL'),
(3333, 'DBMS', 'IT', 'TE', 'CTL'),
(4444, 'HCI', 'IT', 'TE', 'CTL'),
(6666, 'SL1', 'IT', 'TE', 'LTL'),
(8888, 'SL2', 'IT', 'TE', 'LTL');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `dept` varchar(30) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `dept`, `name`) VALUES
(19, 'IT', 'Buradkar'),
(20, 'IT', 'Murumkar'),
(21, 'IT', 'Kamble'),
(22, 'IT', 'Dharmadhikari'),
(23, 'IT', 'Londhe'),
(24, 'IT', 'Chhajed'),
(25, 'IT', 'Jakhete'),
(26, 'IT', 'Pande');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_class_subject`
--

CREATE TABLE `teacher_class_subject` (
  `cat_id` int(11) NOT NULL,
  `tid` int(11) DEFAULT NULL,
  `cid_year` char(2) DEFAULT NULL,
  `cid_div` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_class_subject`
--

INSERT INTO `teacher_class_subject` (`cat_id`, `tid`, `cid_year`, `cid_div`, `sid`) VALUES
(1, 19, 'TE', 11, 1111),
(2, 21, 'TE', 11, 3333),
(3, 22, 'TE', 11, 2222),
(4, 23, 'TE', 11, 4444),
(5, 24, 'TE', 11, 8888),
(6, 21, 'TE', 11, 6666);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subject_template`
--

CREATE TABLE `teacher_subject_template` (
  `tid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `temp_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_subject_template`
--

INSERT INTO `teacher_subject_template` (`tid`, `sid`, `temp_id`) VALUES
(21, 6666, 'LTL'),
(24, 8888, 'LTL'),
(19, 1111, 'CTL'),
(21, 3333, 'CTL'),
(22, 2222, 'CTL'),
(19, 1111, 'CTL'),
(23, 4444, 'CTL');

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE `template` (
  `temp_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`temp_name`) VALUES
('CTL'),
('LTL');

-- --------------------------------------------------------

--
-- Table structure for table `temp_ques`
--

CREATE TABLE `temp_ques` (
  `temp_id` varchar(20) DEFAULT NULL,
  `qid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_ques`
--

INSERT INTO `temp_ques` (`temp_id`, `qid`) VALUES
('CTL', 1),
('CTL', 2),
('CTL', 3),
('CTL', 4),
('CTL', 5),
('LTL', 6),
('LTL', 7),
('LTL', 8),
('LTL', 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`year`,`division`),
  ADD KEY `fk3` (`dept`);

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`dept_name`);

--
-- Indexes for table `domain`
--
ALTER TABLE `domain`
  ADD PRIMARY KEY (`domain_name`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD KEY `fk1` (`cat_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`rollno`),
  ADD KEY `year` (`year`,`division`);

--
-- Indexes for table `student_cat`
--
ALTER TABLE `student_cat`
  ADD PRIMARY KEY (`rollno`,`tid`,`sid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `domain_name` (`domain_name`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `yr` (`yr`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dept` (`dept`);

--
-- Indexes for table `teacher_class_subject`
--
ALTER TABLE `teacher_class_subject`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `tid` (`tid`),
  ADD KEY `cid_year` (`cid_year`,`cid_div`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `teacher_subject_template`
--
ALTER TABLE `teacher_subject_template`
  ADD KEY `tid` (`tid`),
  ADD KEY `sid` (`sid`),
  ADD KEY `temp_id` (`temp_id`);

--
-- Indexes for table `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`temp_name`);

--
-- Indexes for table `temp_ques`
--
ALTER TABLE `temp_ques`
  ADD KEY `temp_id` (`temp_id`),
  ADD KEY `qid` (`qid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `teacher_class_subject`
--
ALTER TABLE `teacher_class_subject`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `fk3` FOREIGN KEY (`dept`) REFERENCES `dept` (`dept_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`cat_id`) REFERENCES `teacher_class_subject` (`cat_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`year`,`division`) REFERENCES `class` (`year`, `division`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`domain_name`) REFERENCES `domain` (`domain_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subject_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`dept_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subject_ibfk_3` FOREIGN KEY (`yr`) REFERENCES `class` (`year`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`dept`) REFERENCES `dept` (`dept_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher_class_subject`
--
ALTER TABLE `teacher_class_subject`
  ADD CONSTRAINT `teacher_class_subject_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_class_subject_ibfk_2` FOREIGN KEY (`cid_year`,`cid_div`) REFERENCES `class` (`year`, `division`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_class_subject_ibfk_3` FOREIGN KEY (`sid`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher_subject_template`
--
ALTER TABLE `teacher_subject_template`
  ADD CONSTRAINT `teacher_subject_template_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_subject_template_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_subject_template_ibfk_3` FOREIGN KEY (`temp_id`) REFERENCES `template` (`temp_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `temp_ques`
--
ALTER TABLE `temp_ques`
  ADD CONSTRAINT `temp_ques_ibfk_1` FOREIGN KEY (`temp_id`) REFERENCES `template` (`temp_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `temp_ques_ibfk_2` FOREIGN KEY (`qid`) REFERENCES `question` (`qid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
