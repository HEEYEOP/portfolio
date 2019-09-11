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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `board` (
  `boardNum` int(11) NOT NULL AUTO_INCREMENT,
  `boardUserEmail` varchar(45) NOT NULL,
  `boardType` varchar(45) NOT NULL,
  `boardTitle` varchar(100) NOT NULL,
  `boardContents` longtext NOT NULL,
  `registrationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `commentsCount` int(11) NOT NULL DEFAULT '0',
  `viewsCount` int(11) NOT NULL DEFAULT '0',
  `likesCount` int(11) NOT NULL DEFAULT '0',
  `display` varchar(1) NOT NULL DEFAULT 'Y',
  `boardSubtype` varchar(45) NOT NULL,
  `answer` varchar(1) DEFAULT NULL,
  `boardFieldNum` int(11) NOT NULL,
  `boardInquiryNum` int(11) DEFAULT NULL,
  `boardDeadline` date DEFAULT NULL,
  PRIMARY KEY (`boardNum`),
  KEY `user_email_idx` (`boardUserEmail`),
  KEY `field_num_idx` (`boardFieldNum`),
  KEY `inquiry_num_idx` (`boardInquiryNum`),
  CONSTRAINT `boardFieldNum` FOREIGN KEY (`boardFieldNum`) REFERENCES `field` (`fieldNum`),
  CONSTRAINT `boardInquiryNum` FOREIGN KEY (`boardInquiryNum`) REFERENCES `inquiry` (`inquiryNum`),
  CONSTRAINT `boardUserEmail` FOREIGN KEY (`boardUserEmail`) REFERENCES `user` (`userEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'123123@naver.com','talkType','111','<p>222</p>','2019-09-05 14:49:52',0,0,0,'Y','',NULL,12,NULL,NULL),(2,'123123@naver.com','talkType','이게 모게','<p>이게 모게</p>','2019-09-05 15:05:58',0,0,0,'Y','',NULL,3,NULL,NULL),(3,'123123@naver.com','talkType','파일테스트 그만하고싶다','<p>파일테스트중&nbsp;&nbsp;&nbsp;&nbsp;</p>','2019-09-05 15:47:17',0,0,0,'Y','',NULL,3,NULL,NULL),(4,'123123@naver.com','talkType','파테파테','<p>파테내용내용</p>','2019-09-05 15:52:10',0,0,0,'Y','',NULL,1,NULL,NULL),(5,'123123@naver.com','talkType','파테2','ㅠㅏ튜ㅏ타ㅠㅍ','2019-09-05 15:55:38',0,0,0,'Y','',NULL,12,NULL,NULL),(6,'123123@naver.com','talkType','ㅁㅇㅁㄴㅇ','<p>ㅁㅇㅁㅇㅁㄴㅇㅁ</p>','2019-09-05 15:56:41',0,0,0,'Y','',NULL,1,NULL,NULL),(7,'123123@naver.com','talkType','ㅁㅇㅁㅇ','<p>ㅁㅇㅁㄴㅇ</p>','2019-09-05 15:59:33',0,0,0,'Y','',NULL,4,NULL,NULL),(8,'123123@naver.com','talkType','ㅁㄴㅇㅁㅇㅁ','<p>ㅇㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇ</p>','2019-09-05 16:05:46',0,0,0,'Y','',NULL,1,NULL,NULL),(9,'123123@naver.com','talkType','파일테스트 마지막이야 제발','<p>잘잘잘</p>','2019-09-05 16:34:38',0,0,0,'Y','',NULL,1,NULL,NULL),(10,'123123@naver.com','talkType','123','<p>123</p>','2019-09-06 09:47:06',0,0,0,'Y','',NULL,2,NULL,NULL),(11,'123123@naver.com','surveyType','ㅁㅇㅁ','<p>ㅁㅇㄴㅇㅁ</p>','2019-09-06 10:05:01',0,0,0,'Y','VS',NULL,4,NULL,NULL),(12,'123123@naver.com','surveyType','ㄹㄴㄹ','<p>ㄴㄹㅇㄴㅇㄹ</p>','2019-09-06 10:06:43',0,0,0,'Y','VS',NULL,1,NULL,NULL),(13,'123123@naver.com','surveyType','123','<p>123</p>','2019-09-06 10:27:42',0,0,0,'Y','VS',NULL,14,NULL,NULL),(14,'123123@naver.com','surveyType','123','<p>123</p>','2019-09-06 10:32:17',0,0,0,'Y','VS',NULL,2,NULL,'2019-09-20'),(15,'123123@naver.com','surveyType','123','<p>123</p>','2019-09-06 10:35:21',0,0,0,'Y','VS',NULL,2,NULL,'2019-09-20'),(16,'123123@naver.com','surveyType','제발넘어가넘어가','<p>넘어가뚀가뚀</p>','2019-09-06 10:39:23',0,0,0,'Y','SURVEY',NULL,3,NULL,'2019-10-06'),(17,'123123@naver.com','surveyType','찬반테스트중','<p>찬반테스트</p>','2019-09-06 11:26:48',0,0,0,'Y','VS',NULL,5,NULL,'2019-09-20'),(18,'123123@naver.com','surveyType','123123123123','<p>123123123123</p>','2019-09-06 12:35:25',0,0,0,'Y','VS',NULL,12,NULL,'2019-09-20'),(19,'123123@naver.com','surveyType','111111','<p>111111</p>','2019-09-06 12:37:14',0,0,0,'Y','VS',NULL,5,NULL,'2019-09-20'),(20,'123123@naver.com','surveyType','제목이양','<p>양양내용</p>','2019-09-06 14:02:54',0,0,0,'Y','VS',NULL,4,NULL,'2019-09-20'),(21,'123123@naver.com','surveyType','서비스까지 테스트','<p>서비스까지 테스트중</p>','2019-09-06 14:23:46',0,0,0,'Y','VS',NULL,5,NULL,'2019-10-06'),(23,'123123@naver.com','surveyType','ㅂㅂㅂㅂㅂ','<p>ㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂ</p>','2019-09-06 14:26:09',0,0,0,'Y','VS',NULL,6,NULL,'2019-09-20'),(25,'123123@naver.com','surveyType','ㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓ','<p>ㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓ</p>','2019-09-06 14:27:56',0,0,0,'Y','VS',NULL,6,NULL,'2019-09-20'),(26,'123123@naver.com','surveyType','ㅁㄴㅇㅁㅇㅁㅇ','<p>ㅁㅇㄴㅁㅇㅁㅇㄴㅇ</p>','2019-09-06 14:29:04',0,0,0,'Y','VS',NULL,6,NULL,'2019-10-06'),(27,'123123@naver.com','surveyType','ㅇㅇㅇㅇㅇㅇㅇㅇ','<p>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p>','2019-09-06 14:32:50',0,0,0,'Y','VS',NULL,7,NULL,'2019-09-20'),(28,'123123@naver.com','surveyType','모든 횡단보도를 과속방지턱으로 만들자','<p><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">현재는 장애인을 위해 횡단보도가 있는 곳은 보도의 높이를 낮추어 도로와 높이를 같게 하고 있다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">그러나 이러한 형태는 상당히 위험하다. 만일 유모차가 횡단보도 앞에서 잠시 놓치게 되면 그대로&nbsp;도로로 내려가버리는 구조이다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><u style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><strong>발상의 전환이 필요하다. 장애인의 통행을 위해서는 보도의 높이와 횡단보도의 높이가 같아야 하는데 이를 위해 꼭 보도의 높이를 낮춰서 만들 필요가 있을까? 차라리 도로의 높이를 보도의 높이에 맞추어 높여도 되지 않을까?</strong></u><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">요즘 고원식 횡단보도가 많이 설치되고 있으나 통일된 설치기준이 없는지 제각각이다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">그리고 설치된 고원식횡단보도가 과속방치턱과 같이 노랑색 검정색이 아니라서 잘 인식되지 않는다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">모든 횡단보도를 고원식으로 설치하고 그 설치기준을 통일했으면 좋겠다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">필자가 제시하는 설치기준은 이렇다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">일단 고원식 횡단보도의 높이는 보도의 높이와 같아야 한다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">그리고 횡단보도를 중앙 기준으로 양쪽 정지선까지는 고무형태의 과속방지턱(아래 그림)을 설치한다.</span></p>','2019-09-11 10:57:22',0,0,0,'Y','VS',NULL,8,NULL,'2019-09-25');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-11 18:48:10
