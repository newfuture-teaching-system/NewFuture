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
-- Table structure for table `y_work_onetwo`
--

DROP TABLE IF EXISTS `y_work_onetwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `y_work_onetwo` (
  `work_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(5) NOT NULL,
  `catalog_one_id` varchar(10) NOT NULL,
  `catalog_two_id` varchar(10) NOT NULL,
  `work` longtext,
  PRIMARY KEY (`work_id`,`course_id`,`catalog_one_id`,`catalog_two_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `y_work_onetwo`
--

LOCK TABLES `y_work_onetwo` WRITE;
/*!40000 ALTER TABLE `y_work_onetwo` DISABLE KEYS */;
INSERT INTO `y_work_onetwo` VALUES (1,'10001','0001','00011','ajax作业'),(2,'10001','0002','00012','js作业'),(3,'10002','0001','00011','数据类型作业'),(4,'10002','0002','00012','面向对象作业'),(5,'10003','0001','00011','建表作业'),(6,'10003','0002','00012','表表联合作业'),(7,'10004','0001','00011','CSS作业'),(8,'10004','0002','00012','模态框作业');
/*!40000 ALTER TABLE `y_work_onetwo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-19 21:38:22
