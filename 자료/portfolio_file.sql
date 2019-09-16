CREATE DATABASE  IF NOT EXISTS `portfolio` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `portfolio`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: portfolio
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `file` (
  `fileNum` int(11) NOT NULL AUTO_INCREMENT,
  `fileBoardNum` int(11) NOT NULL,
  `isMainImg` varchar(1) NOT NULL DEFAULT 'N',
  `fileTitle` varchar(255) NOT NULL,
  `display` varchar(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`fileNum`),
  KEY `board_num_idx` (`fileBoardNum`),
  CONSTRAINT `fileBoardNum` FOREIGN KEY (`fileBoardNum`) REFERENCES `board` (`boardNum`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (27,27,'Y','/2019/09/06/ca4b3114-6ea3-4f73-9bc2-e0247ec75565_mug_obj_143028493262198199.jpg','Y'),(28,28,'Y','/2019/09/11/5ef58dd5-0574-4528-b89f-fc15d54b43af_교통.jpg','Y'),(29,29,'Y','/2019/09/16/eb66ca5b-bc9c-4604-92fd-dbb1501be115_','Y'),(30,30,'Y','/2019/09/16/8353ebc5-afe8-4797-a60c-f5b25c090f44_','Y'),(31,31,'Y','/2019/09/16/2d4ee566-52bb-407b-97cc-3725f6ba2b1e_','Y'),(32,32,'Y','/2019/09/16/49ac84e2-9a5c-4964-be1c-b9def617ee6f_','Y'),(33,34,'Y','/2019/09/16/c6dd5b6c-0272-4705-915a-a2ae3fb63b39_','Y');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-17  0:30:39
