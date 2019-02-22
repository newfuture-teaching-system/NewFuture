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
-- Table structure for table `y_catalog_onetwo`
--

DROP TABLE IF EXISTS `y_catalog_onetwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `y_catalog_onetwo` (
  `course_id` varchar(5) NOT NULL,
  `catalog_one_id` varchar(10) NOT NULL,
  `catalog_two_id` varchar(10) NOT NULL,
  `num` int(11) NOT NULL,
  `catalog_two_name` varchar(255) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`course_id`,`catalog_one_id`,`catalog_two_id`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `y_catalog_onetwo`
--

LOCK TABLES `y_catalog_onetwo` WRITE;
/*!40000 ALTER TABLE `y_catalog_onetwo` DISABLE KEYS */;
INSERT INTO `y_catalog_onetwo` VALUES ('10001','0001','00011',0,'AJAX','AJAX'),('10001','0002','00012',0,'JS方法','JS方法'),('10002','0001','00011',0,'数据类型','数据类型'),('10002','0002','00012',0,'面向对象思想','面向对象思想'),('10003','0001','00011',0,'Mysql建表语句','Mysql建表语句'),('10003','0002','00012',0,'Mysql多表联合','Mysql多表联合'),('10004','0001','00011',0,'CSS样式','CSS样式'),('10004','0002','00012',0,'bootstrap模态框','bootstrap模态框');
/*!40000 ALTER TABLE `y_catalog_onetwo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-19 21:38:20
