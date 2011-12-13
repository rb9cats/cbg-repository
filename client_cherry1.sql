-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: client_cherry
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES (1,'admin','admin','admin@dckap.com','admin@dckap.com','2cfd6da09fc84a682507fbe40229a166eb5de748',1,'2011-09-15 09:49:07','2011-09-15 09:49:07');
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_image_lists`
--

DROP TABLE IF EXISTS `artist_image_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist_image_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_code` varchar(30) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `file_name` varchar(300) DEFAULT NULL,
  `image_type_id` int(11) DEFAULT NULL,
  `artist_image_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=571 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_image_lists`
--

LOCK TABLES `artist_image_lists` WRITE;
/*!40000 ALTER TABLE `artist_image_lists` DISABLE KEYS */;
INSERT INTO `artist_image_lists` VALUES (505,'752',4,'images_013.jpeg',1,198,1,'2011-11-30 04:35:14','2011-11-30 04:35:14'),(506,'23',5,'images_028.jpeg',2,198,1,'2011-11-30 04:35:14','2011-11-30 04:35:14'),(507,'962',6,'images_009.jpeg',3,198,1,'2011-11-30 04:35:14','2011-11-30 04:35:14'),(514,'950',6,'images_012.jpeg',1,202,1,'2011-11-30 06:14:48','2011-11-30 06:14:48'),(515,'261',6,'images_018.jpeg',2,202,1,'2011-11-30 06:14:49','2011-11-30 06:14:49'),(516,'463',6,'images_018.jpeg',3,202,1,'2011-11-30 06:14:49','2011-11-30 06:14:49'),(550,'899',30,'5.jpg',1,208,1,'2011-11-30 06:54:51','2011-11-30 06:54:51'),(551,'944',60,'sample-testing-for-long-name-image.jpg',2,208,1,'2011-11-30 06:54:51','2011-11-30 06:54:51'),(552,'392',90,'6.jpg',3,208,1,'2011-11-30 06:54:52','2011-11-30 06:54:52'),(553,'930',20,'4.jpg',1,204,1,'2011-11-30 07:00:12','2011-11-30 07:00:12'),(554,'523',40,'5.jpg',2,204,1,'2011-11-30 07:00:12','2011-11-30 07:00:12'),(555,'714',60,'6.jpg',3,204,1,'2011-11-30 07:00:12','2011-11-30 07:00:12'),(556,'526',100,'9.jpg',1,203,1,'2011-11-30 07:00:30','2011-11-30 07:00:30'),(557,'384',150,'10.jpg',2,203,1,'2011-11-30 07:00:30','2011-11-30 07:00:30'),(558,'177',200,'11.jpg',3,203,1,'2011-11-30 07:00:30','2011-11-30 07:00:30'),(559,'738',1000,'cartoon_dog_thankyou.jpg',1,207,1,'2011-11-30 07:02:19','2011-11-30 07:02:19'),(560,'961',2000,'werewolf-1024x768_0.jpeg',2,207,1,'2011-11-30 07:02:20','2011-11-30 07:02:20'),(561,'235',3000,'moon-moon-moon-wallpapers-moon-backgrounds-moon-desktops-moon-pictures-4066900273-1024x768.jpg',3,207,1,'2011-11-30 07:02:20','2011-11-30 07:02:20'),(562,'649',300,'images.jpg',1,201,1,'2011-11-30 07:03:50','2011-11-30 07:03:50'),(563,'20',600,'images1.jpg',2,201,1,'2011-11-30 07:03:50','2011-11-30 07:03:50'),(564,'264',900,'images2.jpg',3,201,1,'2011-11-30 07:03:50','2011-11-30 07:03:50'),(565,'276',12,'3.jpg',1,209,1,'2011-11-30 07:13:09','2011-11-30 07:13:09'),(566,'476',16,'08-mother-rests-with-cub-670.jpg',2,209,1,'2011-11-30 07:13:09','2011-11-30 07:13:09'),(567,'470',18,'170px-tux.svg.png',3,209,1,'2011-11-30 07:13:09','2011-11-30 07:13:09'),(568,'590',5,'images_008.jpeg',1,205,1,'2011-11-30 07:31:43','2011-11-30 07:31:43'),(569,'206',5,'images_016.jpeg',2,205,1,'2011-11-30 07:31:43','2011-11-30 07:31:43'),(570,'748',5,'images_018.jpeg',3,205,1,'2011-11-30 07:31:43','2011-11-30 07:31:43');
/*!40000 ALTER TABLE `artist_image_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_images`
--

DROP TABLE IF EXISTS `artist_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` tinytext NOT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_images`
--

LOCK TABLES `artist_images` WRITE;
/*!40000 ALTER TABLE `artist_images` DISABLE KEYS */;
INSERT INTO `artist_images` VALUES (198,'saf','sdf',100,1,'2011-11-08 09:40:19','2011-11-08 09:40:19'),(201,'Testing','Testing-sample',103,1,'2011-11-08 10:35:46','2011-11-30 07:03:50'),(202,'Siva-testing','',104,1,'2011-11-30 06:13:47','2011-11-30 06:13:47'),(203,'siva-testing-3','sample testing',104,1,'2011-11-30 06:15:50','2011-11-30 06:15:50'),(204,'','',104,1,'2011-11-30 06:23:06','2011-11-30 06:23:06'),(205,'','',100,1,'2011-11-30 06:25:49','2011-11-30 06:25:49'),(207,'sample-testing','Sample-testing-3',106,1,'2011-11-30 06:35:46','2011-11-30 07:02:19'),(208,'testing-long-name','',106,1,'2011-11-30 06:54:51','2011-11-30 06:54:51'),(209,'testing-5','testing-5',107,1,'2011-11-30 07:13:09','2011-11-30 07:13:09');
/*!40000 ALTER TABLE `artist_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` tinytext,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (100,'ramana','ramana',1,'2011-11-08 09:40:02','2011-11-08 09:40:02'),(103,'suresh','sample',1,'2011-11-08 10:35:26','2011-11-30 06:24:36'),(104,'Siva','Artist-sample',1,'2011-11-30 06:13:11','2011-11-30 06:25:03'),(106,'mahesh','Testing',1,'2011-11-30 06:35:31','2011-11-30 07:02:29'),(107,'Testing-5','testing-5',1,'2011-11-30 07:11:15','2011-11-30 07:11:15');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_type_lists`
--

DROP TABLE IF EXISTS `image_type_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_type_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `description` tinytext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_type_lists`
--

LOCK TABLES `image_type_lists` WRITE;
/*!40000 ALTER TABLE `image_type_lists` DISABLE KEYS */;
INSERT INTO `image_type_lists` VALUES (1,'Small','100*200 size Images','2011-09-16 07:33:32','2011-09-16 07:34:25'),(2,'Medium','300*200  size Images','2011-09-16 07:36:42','2011-09-16 07:36:42'),(3,'Large','500*200 size Images ','2011-09-16 07:37:25','2011-09-16 07:37:25');
/*!40000 ALTER TABLE `image_type_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_transactions`
--

DROP TABLE IF EXISTS `order_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `image_type` varchar(255) DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_transactions`
--

LOCK TABLES `order_transactions` WRITE;
/*!40000 ALTER TABLE `order_transactions` DISABLE KEYS */;
INSERT INTO `order_transactions` VALUES (18,26,'Small',100,'2011-11-08 10:10:51','2011-11-08 10:10:51'),(19,27,'Large',100,'2011-11-08 10:28:59','2011-11-08 10:28:59'),(20,28,'Medium',103,'2011-11-08 10:36:57','2011-11-08 10:36:57'),(21,28,'Large',103,'2011-11-08 10:36:57','2011-11-08 10:36:57'),(22,29,'Small',103,'2011-11-30 05:21:38','2011-11-30 05:21:38'),(23,30,'Medium',103,'2011-11-30 05:53:45','2011-11-30 05:53:45'),(24,31,'Small',100,'2011-11-30 06:09:11','2011-11-30 06:09:11'),(25,31,'Large',100,'2011-11-30 06:09:11','2011-11-30 06:09:11'),(26,32,'Large',100,'2011-11-30 06:12:46','2011-11-30 06:12:46'),(27,33,'Small',105,'2011-11-30 06:58:03','2011-11-30 06:58:03'),(28,34,'Medium',106,'2011-11-30 07:14:29','2011-11-30 07:14:29'),(29,34,'Large',106,'2011-11-30 07:14:29','2011-11-30 07:14:29');
/*!40000 ALTER TABLE `order_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `card_expires_on` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `artist_image_name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_price` decimal(10,0) DEFAULT NULL,
  `success` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (26,'ala','ramana','visa','2020','2165895067',100,'saf',50,'4',1,'2011-11-08 10:10:51','2011-11-08 10:10:51'),(27,'ala','ramana','visa','2020','2165896072',100,'saf',50,'4',1,'2011-11-08 10:28:59','2011-11-08 10:28:59'),(28,'ala','ramana','visa','2019','2165896495',103,'dsf',50,'12',1,'2011-11-08 10:36:57','2011-11-08 10:36:57'),(29,'ala','ramana','visa','2019','2166791574',103,'dsf',50,'4',1,'2011-11-30 05:21:37','2011-11-30 05:21:38'),(30,'ala','ramana','visa','2020','2166791905',103,'dsf',50,'5',1,'2011-11-30 05:53:45','2011-11-30 05:53:45'),(31,'ala','ramana','visa','2020','2166792142',100,'saf',50,'10',1,'2011-11-30 06:09:11','2011-11-30 06:09:11'),(32,'siva','elango','master','2012','2166792177',100,'saf',51,'6',1,'2011-11-30 06:12:46','2011-11-30 06:12:46'),(33,'Siva','Elango','visa','2012','2166792967',105,'Large image',51,'5',1,'2011-11-30 06:58:03','2011-11-30 06:58:03'),(34,'Elango','Shai','american_express','2012','2166793344',106,'sample-testing',51,'5000',1,'2011-11-30 07:14:29','2011-11-30 07:14:29');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20110914071414'),('20110914113738'),('20110915044601'),('20110915075538'),('20110915075628'),('20110915075644'),('20110915075700'),('20110915075721'),('20111017064845'),('20111018130539');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `activated_at` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (50,'ala','ram','alaramanaiah@dckap.com','alaramana','d2f5490f50f0867d1400c9f5b4f45eace3bcb89a','2011-11-08 09:33:43','2011-11-30 06:11:07','','2011-11-08 09:33:43',1),(51,'Siva-sample','Elango-testing','sivaelangop@dckap.com','Siva','dd822deb94d1a5448e8e99758c01fd7dec0021b1','2011-11-30 06:07:42','2011-11-30 06:58:31',NULL,'2011-11-30 06:10:43',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-11-30 13:14:25
