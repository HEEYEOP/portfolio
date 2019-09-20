CREATE DATABASE  IF NOT EXISTS `portfolio` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `portfolio`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
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
-- Table structure for table `commentvs`
--

DROP TABLE IF EXISTS `commentvs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commentvs` (
  `commentVSNum` int(11) NOT NULL AUTO_INCREMENT,
  `commentVSCommentNum` int(11) NOT NULL,
  `commentVSUserEmail` varchar(45) NOT NULL,
  `yORn` varchar(1) NOT NULL,
  PRIMARY KEY (`commentVSNum`),
  KEY `comment_num_idx` (`commentVSCommentNum`),
  KEY `user_email_idx` (`commentVSUserEmail`),
  CONSTRAINT `commentVSCommentNum` FOREIGN KEY (`commentVSCommentNum`) REFERENCES `comment` (`commentNum`),
  CONSTRAINT `commentVSUserEmail` FOREIGN KEY (`commentVSUserEmail`) REFERENCES `user` (`userEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentvs`
--

LOCK TABLES `commentvs` WRITE;
/*!40000 ALTER TABLE `commentvs` DISABLE KEYS */;
/*!40000 ALTER TABLE `commentvs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-20 18:26:59
