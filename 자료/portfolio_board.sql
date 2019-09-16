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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (27,'123123@naver.com','surveyType','ㅇㅇㅇㅇㅇㅇㅇㅇ','<p>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p>','2019-09-06 14:32:50',0,1,0,'Y','VS',NULL,7,NULL,'2019-09-20'),(28,'123123@naver.com','surveyType','모든 횡단보도를 과속방지턱으로 만들자','<p><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">현재는 장애인을 위해 횡단보도가 있는 곳은 보도의 높이를 낮추어 도로와 높이를 같게 하고 있다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">그러나 이러한 형태는 상당히 위험하다. 만일 유모차가 횡단보도 앞에서 잠시 놓치게 되면 그대로&nbsp;도로로 내려가버리는 구조이다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><u style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><strong>발상의 전환이 필요하다. 장애인의 통행을 위해서는 보도의 높이와 횡단보도의 높이가 같아야 하는데 이를 위해 꼭 보도의 높이를 낮춰서 만들 필요가 있을까? 차라리 도로의 높이를 보도의 높이에 맞추어 높여도 되지 않을까?</strong></u><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">요즘 고원식 횡단보도가 많이 설치되고 있으나 통일된 설치기준이 없는지 제각각이다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">그리고 설치된 고원식횡단보도가 과속방치턱과 같이 노랑색 검정색이 아니라서 잘 인식되지 않는다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">모든 횡단보도를 고원식으로 설치하고 그 설치기준을 통일했으면 좋겠다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">필자가 제시하는 설치기준은 이렇다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">일단 고원식 횡단보도의 높이는 보도의 높이와 같아야 한다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">그리고 횡단보도를 중앙 기준으로 양쪽 정지선까지는 고무형태의 과속방지턱(아래 그림)을 설치한다.</span></p>','2019-09-11 10:57:22',0,83,0,'Y','VS',NULL,8,NULL,'2019-09-25'),(29,'123123@naver.com','talkType','우리 기업의 해외인프라 수주 확대 지원방안을 제안해 주세요.','<p><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">안녕하십니까? 기획재정부 대외경제총괄과입니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">우리 경제의 활력 제고를 위해 우리 기업의 활발한 해외진출은 중요한 부분입니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">그 중 해외인프라 분야는 부가가치가 높고 발주국가와 경제교류도 증진되는 중요한 분야입니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">우리 기업의 해외건설 수주규모는 18년 기준 321억불로 17년&nbsp;290억불 대비 반등하였으나,</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">14년 660억불 대비 아직 부족한 상황입니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">우리 기업이 해외인프라 시장에 활발하게 참여하여 수주규모를 확대할 수 있는 지원방안, 무엇이 있을까요?</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">국민 여러분의 많은 아이디어를 부탁드립니다</span></p>','2019-09-16 12:45:17',0,6,0,'Y','',NULL,14,NULL,'2019-09-23'),(30,'123123@naver.com','talkType','지역주택조합 난립으로 인한 문제점을 해결할 수 있는 방안에는 어떤것이 있을까요??','<p><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">최근들어 부동산 폭등의 여파로 부산시 영도구 관내에는 지역주택조합 설립이 증가하고 있습니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">&nbsp;짧은 시간내에&nbsp;많은 조합원을 모집하기 위하여&nbsp;불법 홍보 광고물을 마구잡이로 설치하여 도시 미관을&nbsp;훼손하고</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">있으며 일단 조합이 설립되고 나면&nbsp;사업이 예정대로 추진되지 않아&nbsp;가입비등 많은 비용을 지불한 조합원들의 피해도 발생하고 있습니다.&nbsp;&nbsp;지역주택조합의 제도가 원래의 취지대로 추진된다면 서민들의 주택마련에 도움이 되는 순기능을 발휘될 수 있겠지만 현실은 사업이 추진되지 않는 조합이 대다수 입니다.&nbsp;&nbsp;</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">&nbsp;불볍광고물 설치로 도시 미관을 훼손하고 사업이 추진되지 않아 조합원들의 피해만 발생시키는 지역주택조합 제도의 개선방안에 대하여 의견을 제시해 봅시다.</span></p>','2019-09-16 12:46:26',0,3,0,'Y','',NULL,8,NULL,'2019-09-23'),(31,'123123@naver.com','surveyType','쓰레기종량제의 폐지','<p><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">쓰레기종량제를 폐지하고 모든 포장재에 폐기물부담금과 재활용보증금을 부과할 것을 제안합니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">현행 쓰레기종량제의 문제점을 말씀드리자면 폐기물처리수수료가 종량제봉투값으로 부과되기때문에 봉투에 넣은 쓰레기만 수거합니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">이에 따라 거리에는 종량제 봉투를 사용하지 않은 생활쓰레기가 투입되는것을 막기 위해 쓰레기통이 없어졌습니다 .</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">과거에는 커다란 쓰레기함(아래 그림과 같이 생긴 것)이 있어 청소차가 바로 상차 및 수거가 가능했는데 이제는 불가능합니다. 환경미화원이 일일이 봉투사용한 쓰레기만 골라서 들고 뛰어서 수거해야 합니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">거리는 낮에도 미리 내놓은 쓰레기봉투로 지저분해졌고, 여름에는 파리가 들끓고, 환경미화원은 봉투를 옮기다가 유리파편등에 다치는 일이 많습니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><img alt=\"\" src=\"https://idea.epeople.go.kr/uimages/idea/201905/a3046b68-68ba-4033-9978-9d18b0b2c87d.jpg\" style=\"margin-top: 10px; margin-bottom: 20px; border-width: 0px; border-color: initial; border-image: initial; max-width: 100%; height: 100px; font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica; width: 100px;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">필자가 말하는 쓰레기함</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">저런 쓰레기함을 사용못하는 이유가 종량제 때문입니다. 저런걸 설치해놓으면 봉투를 사용하지 않고 쓰레기를 배출하는 경우 가려내어 수거하기가 어렵기때문입니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">그리고 쓰레기봉투 자체가 쓰레기인데 수수료 냈다는 증명을 하기 위해 억지로 봉투를 덧씌워서 배출해야 합니다. 그럴때면 쓰레기를 줄이자는 취지와 달리 수수료를 냈다는 형식이 더 중요한것 아닌가 하는 생각도 듭니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">그래서 다음과 같이 제안합니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica; color: rgb(22, 160, 133);\"><u><strong>모든 포장재에 사전에 폐기물부담금과 재활용보증금을 매깁니다.<br>포장재는 결국 언젠가는 버리게 되고 많이 사는 사람이 많이 버리게되므로 다른 개념의 쓰레기종량제입니다.<br>현재와 같이 폐기물배출단계에서 수수료를 납부하는것이 아니라 상품구입단계에서 폐기물수수료를 미리 납부하고 버릴때는 그냥(종량제봉투를 사용하지 않고) 버린다는 개념입니다.<br>종량제 폐지하고 쓰레기 마구마구 버리자가 아니라 새로운 개념의 쓰레기종량제입니다.</strong></u></span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">폐기물부담금과 재활용보증금은 폐기물 처리의 용이성과 재활용의 용이성에 따라 부과됩니</span><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">다</span><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">가령 빈병과 같이 재활용이 용이한 것은 폐기물부담금은 없고 재활용보증금은 300원 이런 식으로 부과됩니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">반면 재활용이 어렵고 폐기물처리에 많은 비용이 드는 것은 폐기물부담금만 300원 부과됩니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">이러한 부담금,보증금은 포장재에 잘 보이도록 표기합니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">재활용보증금은 잘 분류(현행 재활용 배출요령에 따라 세척 및 이물질제거 등)하여 재활용센터에 가져올 경우 환급해줍니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">즉, 모든 사람이 폐기물수수료를 상품구입시 미리 납부하고(따라서 버릴때 다시 납부할 필요가 없음) 재활용분류를 잘해서 올 경우 환급해주는 방식입니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">소비자는 상품 구입시 해당 상품의 폐기물부담금과 보증금을 확인할 수 있고, 선택할 수 있습니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">(알뜰한 소비자는 재활용보증금이 높은 제품을 구입)</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">기업도 폐기물부담금이 높을 경우 제품가격이 높아지므로 과대포장등을 자제하게 되고 폐기물부담금이 높지 않는 포장재를 선호하게 됩니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">가장 중요한 것이 재활용센터의 운영방법과 보증금 환급방식입니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">현재는 빈병같은것을 마트에서 수거하게 하는데 사실 마트는 물건파는것에 관심있지 빈병수거에는 관심이 없습니다. 계속 마트에서 수거하게 하려면 빈병수거하는 것이 물건파는것 보다 더 큰 이익이 있도록 해줘야 합니다. 마트에서 빈병받기를 꺼려하니 갖다주는사람도 눈치보입니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">그러므로 가급적 국가가 재활용품을 수거하는 거점시설(가칭 에코센터)를 곳곳에 만들필요가 있습니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">쉽게 편리하게 이용할 수 있어야 재활용이 잘됩니다. 즉 많이 만들어야 합니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">여기서는 재활용품을 잘분류를 해오면 보증금을 에코카드에 포인트로 적립시켜줍니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">이렇게 적립된 포인트는 대중교통이용, 주차요금납부 등에 사용할 수 있습니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">에코센터에서 수집된 재활용품은 분류가 잘되어 있기때문에 압축처리만 해서 곧바로 재활용업체로 넘길 수 있습니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">이 제안이 받아들여진다면 쓰레기는 더이상 쓰레기가 아닙니다. 돈입니다. 쓰레기통 뒤져서 재활용품 분류 잘해가면 하루에 몇천원 벌 수 있습니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">만약 재활용분류를 도저히 귀찮아서 하기 싫다면 그냥 버리면 됩니다. 대신 그것은 돈을 그냥 버리는 것입니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">이러한 저의 제안에 대해서 많은 의견 부탁드립니다.</span></p>','2019-09-16 12:48:49',0,19,0,'Y','VS',NULL,10,NULL,'2019-09-30'),(32,'123123@naver.com','surveyType','네거리 교차로에 우회전 차로를 반드시 설치하자','<p><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">현재 네거리 교차로의 형태를 보면 그냥 +자 형태가 있고 교통섬과 우회전차선이 있는 형태가 있다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">항간에는 교통섬이 위험하다고 하는데 필자는 그렇게 생각하지 않는다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">그러한 문제는 교통섬이 잘 보이지 않기때문에 발생하는 문제로&nbsp;교통섬을 잘 보이게 한다면 해결되는 문제이다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">필자의 다른 제안에서와 같이 횡단보도가 고원식으로 보도의 높이와 같게 만들어진다면 그럴일이 없다고 생각한다. 현재와 같이 보도의 높이를 낮춰서 도로와 같게 하는 방식때문에 위험한 것이다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><u style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><strong>필자는 우회전차선이 있는 교통섬이 있는 형태로 네거리 교차로를 통일해야 한다고 생각한다</strong></u><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><img alt=\"\" src=\"https://idea.epeople.go.kr/uimages/idea/201905/9d51916f-4289-441f-ac90-8a82885a31c4.png\" style=\"margin-top: 10px; margin-bottom: 20px; border-width: 0px; border-color: initial; border-image: initial; max-width: 100%; height: 126px; font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica; width: 200px;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">&nbsp;이런 형태의 교차로를 말한다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">그 이유는 다음과 같다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">1. 우회전차량으로부터 횡단보도 보행자의 안전문제이다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">교통섬이 없는 +자 형태의 교차로에서는 우회전하는 차량은 열에 아홉은 우회전하는 방향의 횡단보도 신호를 보지 않고 반대방향에서 차가 오는지를 먼저 본다. 그렇기때문에 우회전차량이 우회전하는 과정에서 횡단보도의 보행자를 보지 못하고&nbsp;치는 사고가 많이 발생한다. 우회전차량 전방에 횡단보도가 있지 않기때문이다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">그러나 우회전차로가 있고 교통섬까지의 짧은 횡단보도(보통 신호가 없음)가 있는 경우는 우회전차량의 전방에 횡단보도가 있고 횡단보도를 지나고 나서야&nbsp;비로소 반대편에서 오는 차량에 주의하게 되기때문이다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">우회전차량의 전방에 횡단보도가 있기때문에 운전자가 보행자를 보지 못하여 치는 경우가 없다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">2. 교통의 원활한 흐름에 좋다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\">교통섬이 없는 +자 형태의 교차로는 우회전방향의 횡단보도 신호에 정지를 하여야 하지만 교통섬까지의 짧은 횡단보도는 신호가 없기때문에 우회전의 원활한 흐름에 도움이 된다. 그리고 우회전차로가 일종의 램프역할을 하기때문에 자연스럽게 본선으로 합류할 수 있어 원활한 교통흐름에 도움이 된다.</span></p>','2019-09-16 12:50:11',0,77,0,'Y','VS',NULL,8,NULL,'2019-10-16'),(33,'000999@naver.com','talkType','광주광역시교육청 주요업무 계획(학교업무정상화) 의견 수렴','<p><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈？占쏙옙占쎈？, Gulim, Arial, verdana, Helvetica;\">광주광역시교육청 2020년 주요업무 계획을 수립하기 위해 의견을 받습니다.</span><br style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈쨨占쏙옙占쎈턁, Gulim, Arial, verdana, Helvetica;\"><span style=\"font-family: &quot;Spoqa Han Sans&quot;, sans-serif, AppleGothic, 占쎈？占쏙옙占쎈？, Gulim, Arial, verdana, Helvetica;\">주요사업별로 소중한 의견 부탁드립니다.</span></p>','2019-09-16 14:12:12',0,1,0,'Y','',NULL,9,NULL,'2019-09-23'),(34,'123123@naver.com','talkType','테스트1','<p>테스트테스트</p>','2019-09-16 14:41:05',0,1,0,'Y','',NULL,1,NULL,'2019-09-23');
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

-- Dump completed on 2019-09-17  0:30:39
