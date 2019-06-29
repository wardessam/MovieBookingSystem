-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: bookingsystem
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
-- Table structure for table `chairscheck`
--

DROP TABLE IF EXISTS `chairscheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chairscheck` (
  `chair_id` varchar(60) NOT NULL,
  `hall_id` int(11) NOT NULL,
  `cinema_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  `show_type` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`chair_id`,`hall_id`,`cinema_id`,`show_id`,`show_type`,`date`,`movie_id`),
  KEY `fk_chairscheck_hall_has_show1_idx` (`hall_id`,`cinema_id`,`show_id`,`show_type`,`movie_id`),
  CONSTRAINT `fk_chairscheck_hall_has_show1` FOREIGN KEY (`hall_id`, `cinema_id`, `show_id`, `show_type`, `movie_id`) REFERENCES `hall_has_show` (`hall_id`, `cinema_id`, `show_id`, `show_type`, `movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chairscheck`
--

LOCK TABLES `chairscheck` WRITE;
/*!40000 ALTER TABLE `chairscheck` DISABLE KEYS */;
INSERT INTO `chairscheck` VALUES ('C3',1,3,1,'2D','2019-05-06',4),('C3',1,3,1,'2D','2019-05-07',4),('C3',1,3,2,'2D','2019-04-29',4),('C3',1,3,2,'2D','2019-05-14',4),('C3',1,3,2,'2D','2019-05-28',4),('C3',1,3,3,'2D','2019-05-07',4);
/*!40000 ALTER TABLE `chairscheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cinema` (
  `cinema_id` int(11) NOT NULL AUTO_INCREMENT,
  `cinema_name` varchar(60) NOT NULL,
  `cinema_city` varchar(60) NOT NULL,
  PRIMARY KEY (`cinema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,'ay78aa','cairo'),(2,'null','null'),(3,'CarRadio','Cairo'),(4,'SuicideIsPainless','Cairo'),(5,'AddictWithApen','Cairo');
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_phone` varchar(60) NOT NULL,
  `customer_email` varchar(60) NOT NULL,
  `customer_username` varchar(60) NOT NULL,
  `customer_password` varchar(60) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_ID_UNIQUE` (`customer_id`),
  UNIQUE KEY `customer_username_UNIQUE` (`customer_username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'01272575767','yussefayman98@gmail.com','username','12345678');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_hist`
--

DROP TABLE IF EXISTS `customer_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_hist` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Ticket_Price` float NOT NULL,
  `customer_customer_id` int(11) NOT NULL,
  `customer_hist_date` date NOT NULL,
  `chair_id` varchar(60) NOT NULL,
  `hall_id` int(11) NOT NULL,
  `cinema_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  `show_type` varchar(45) NOT NULL,
  `movie_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`history_id`,`customer_customer_id`),
  KEY `fk_customer_hist_customer1_idx` (`customer_customer_id`),
  KEY `fk_customer_hist_chairscheck1_idx` (`chair_id`,`hall_id`,`cinema_id`,`show_id`,`show_type`,`movie_id`,`customer_hist_date`),
  KEY `fk_customer_hist_chairscheck1` (`chair_id`,`hall_id`,`cinema_id`,`show_id`,`show_type`,`customer_hist_date`),
  CONSTRAINT `fk_customer_hist_customer1` FOREIGN KEY (`customer_customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_hist`
--

LOCK TABLES `customer_hist` WRITE;
/*!40000 ALTER TABLE `customer_hist` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hall`
--

DROP TABLE IF EXISTS `hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hall` (
  `hall_id` int(11) NOT NULL,
  `cinema_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`hall_id`,`cinema_id`,`movie_id`),
  KEY `fk_hall_cinema1_idx` (`cinema_id`),
  KEY `fk_hall_movie1_idx` (`movie_id`),
  CONSTRAINT `fk_hall_cinema1` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`),
  CONSTRAINT `fk_hall_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hall`
--

LOCK TABLES `hall` WRITE;
/*!40000 ALTER TABLE `hall` DISABLE KEYS */;
INSERT INTO `hall` VALUES (1,1,2),(1,2,3),(1,3,4),(2,3,1),(3,3,7),(4,3,6),(1,4,8),(2,4,9),(3,4,10),(1,5,11),(2,5,13);
/*!40000 ALTER TABLE `hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hall_has_show`
--

DROP TABLE IF EXISTS `hall_has_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hall_has_show` (
  `hall_id` int(11) NOT NULL,
  `cinema_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  `show_type` varchar(45) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`hall_id`,`cinema_id`,`show_id`,`show_type`,`movie_id`),
  KEY `fk_hall_has_show_hall1_idx` (`hall_id`,`cinema_id`,`movie_id`),
  KEY `fk_hall_has_show_show1_idx` (`show_id`,`show_type`),
  CONSTRAINT `fk_hall_has_show_hall1` FOREIGN KEY (`hall_id`, `cinema_id`, `movie_id`) REFERENCES `hall` (`hall_id`, `cinema_id`, `movie_id`),
  CONSTRAINT `fk_hall_has_show_show1` FOREIGN KEY (`show_id`, `show_type`) REFERENCES `show` (`show_id`, `show_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hall_has_show`
--

LOCK TABLES `hall_has_show` WRITE;
/*!40000 ALTER TABLE `hall_has_show` DISABLE KEYS */;
INSERT INTO `hall_has_show` VALUES (1,1,1,'2D',2),(1,1,2,'2D',2),(1,1,3,'2D',2),(1,1,4,'3D',2),(1,2,1,'2D',3),(1,2,2,'2D',3),(1,2,3,'2D',3),(1,2,4,'3D',3),(1,3,1,'2D',4),(1,3,2,'2D',4),(1,3,3,'2D',4),(1,3,4,'3D',4),(1,4,1,'2D',8),(1,4,2,'2D',8),(1,4,3,'2D',8),(1,4,4,'3D',8),(1,5,1,'2D',11),(1,5,2,'2D',11),(1,5,3,'2D',11),(1,5,4,'3D',11),(1,5,5,'4D',11);
/*!40000 ALTER TABLE `hall_has_show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(60) NOT NULL,
  `movie_release_date` varchar(30) NOT NULL,
  `movie_genre` varchar(60) DEFAULT NULL,
  `movie_desc` longtext,
  `movie_poster` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`movie_id`),
  UNIQUE KEY `movie_id_UNIQUE` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'endgame','2019-10-20','genre','aa','image1.jpg'),(2,'hash','2019-10-10','genre','aaaa','image1.jpg'),(3,'ay87aga','2019-10-10','genre','aa','image1.jpg'),(4,'zeft','2019-10-11','genre','aa','image1.jpg'),(5,'endgame','2019-10-10','genre','aa','image2.jpg'),(6,'hai','2019-10-10','genre','aaa','image2.jpg'),(7,'endFuckenGame','2019-10-10','genre','aaa','\0mage2.jpg'),(8,'aa','2019-10-10','genre','aa','image2.jpg'),(9,'www','2019-10-10','www','www','image1.jpg'),(10,'add','2019-10-10','genre','1aa','rename.jpg'),(11,'loveofmylief','2019-10-10','genre','desc','image1.jpg'),(13,'btngana','2019-10-10','genre','bring me back','image2.jpg');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show`
--

DROP TABLE IF EXISTS `show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `show` (
  `show_id` int(11) NOT NULL,
  `show_time` time NOT NULL,
  `show_price` int(11) NOT NULL,
  `show_type` varchar(45) NOT NULL,
  PRIMARY KEY (`show_id`,`show_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show`
--

LOCK TABLES `show` WRITE;
/*!40000 ALTER TABLE `show` DISABLE KEYS */;
INSERT INTO `show` VALUES (1,'15:00:00',30,'2D'),(2,'18:00:00',40,'2D'),(3,'21:00:00',50,'2D'),(4,'00:00:00',70,'3D'),(5,'03:00:00',100,'4D');
/*!40000 ALTER TABLE `show` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-09  8:45:12
