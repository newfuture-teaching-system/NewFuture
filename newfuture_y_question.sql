-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: newfuture
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `y_question`
--

DROP TABLE IF EXISTS `y_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `y_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(10) NOT NULL,
  `teacher_id` varchar(10) NOT NULL,
  `course_id` varchar(5) NOT NULL,
  `question_title` varchar(255) DEFAULT NULL,
  `question` longtext,
  `question_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `answer` longtext,
  `answer_time` timestamp NULL DEFAULT NULL,
  `question_state` int(1) DEFAULT NULL,
  PRIMARY KEY (`question_id`,`student_id`,`teacher_id`,`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `y_question`
--

LOCK TABLES `y_question` WRITE;
/*!40000 ALTER TABLE `y_question` DISABLE KEYS */;
INSERT INTO `y_question` VALUES (23,'1001','100001','10001','ajax','问题','2019-02-13 08:22:24','答案','2019-02-13 08:38:39',1),(24,'1001','100002','10004','？？？','啥?','2019-02-13 08:34:38',NULL,NULL,0),(25,'1001','100002','10003','数据库问题','请解答','2019-02-13 08:36:07',NULL,NULL,0),(26,'1001','100001','10008','为什么没有作业','为什么','2019-02-15 05:20:30','就是没有作业呀','2019-02-15 05:22:07',1);
/*!40000 ALTER TABLE `y_question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-19 21:38:21
