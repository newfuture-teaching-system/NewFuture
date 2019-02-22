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
-- Table structure for table `y_work`
--

DROP TABLE IF EXISTS `y_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `y_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_id` varchar(10) NOT NULL,
  `student_id` varchar(10) NOT NULL,
  `work_content` varchar(255) DEFAULT NULL,
  `work_submit_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `work_check_time` datetime DEFAULT NULL,
  `work_state` int(1) DEFAULT NULL,
  `work_check_content` longtext,
  PRIMARY KEY (`id`,`work_id`,`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `y_work`
--

LOCK TABLES `y_work` WRITE;
/*!40000 ALTER TABLE `y_work` DISABLE KEYS */;
INSERT INTO `y_work` VALUES (21,'1','1001','C:/eclipse workspace/NewFuture Teaching System/WebContent/textImage/image201902131622.png','2019-02-13 08:22:05','2019-02-13 16:37:01',1,'优秀'),(22,'7','1001','C:/eclipse workspace/NewFuture Teaching System/WebContent/textImage/image201902131634.png','2019-02-13 08:34:22','2019-02-13 16:45:00',1,'这是哪的'),(23,'5','1001','C:/eclipse workspace/NewFuture Teaching System/WebContent/textImage/image201902131635.png','2019-02-13 08:35:51','2019-02-13 16:37:47',1,'在哪'),(24,'4','1001','C:/eclipse workspace/NewFuture Teaching System/WebContent/textImage/image201902151311.png','2019-02-15 05:11:01',NULL,0,NULL);
/*!40000 ALTER TABLE `y_work` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-19 21:38:18
