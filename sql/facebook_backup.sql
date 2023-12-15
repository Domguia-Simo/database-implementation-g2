-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: facebook
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `com_likes`
--

DROP TABLE IF EXISTS `com_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_likes` (
  `id_user` int NOT NULL,
  `id_comm` int NOT NULL,
  `reaction` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_user`,`id_comm`),
  KEY `id_comm` (`id_comm`),
  CONSTRAINT `com_likes_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `com_likes_ibfk_2` FOREIGN KEY (`id_comm`) REFERENCES `comment` (`id_comm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_likes`
--

LOCK TABLES `com_likes` WRITE;
/*!40000 ALTER TABLE `com_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id_comm` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_post` int DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_comm`),
  KEY `id_user` (`id_user`),
  KEY `id_post` (`id_post`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,1,'good morning'),(2,2,2,'thanks so much'),(3,3,8,'ok nice'),(4,4,9,'very good'),(5,5,10,'good bye');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follower`
--

DROP TABLE IF EXISTS `follower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follower` (
  `id_follow` int NOT NULL AUTO_INCREMENT,
  `id_user1` int DEFAULT NULL,
  `id_user2` int DEFAULT NULL,
  PRIMARY KEY (`id_follow`),
  KEY `id_user1` (`id_user1`),
  KEY `id_user2` (`id_user2`),
  CONSTRAINT `follower_ibfk_1` FOREIGN KEY (`id_user1`) REFERENCES `user` (`id_user`),
  CONSTRAINT `follower_ibfk_2` FOREIGN KEY (`id_user2`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follower`
--

LOCK TABLES `follower` WRITE;
/*!40000 ALTER TABLE `follower` DISABLE KEYS */;
/*!40000 ALTER TABLE `follower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id_image` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `path` varchar(40) DEFAULT NULL,
  `id_post` int DEFAULT NULL,
  PRIMARY KEY (`id_image`),
  KEY `id_post` (`id_post`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id_post` int NOT NULL AUTO_INCREMENT,
  `content` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`id_post`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'wow cool','2020-10-24 00:00:00',1),(2,'hello world','2009-03-07 00:00:00',2),(8,'hello guys','2015-02-10 00:00:00',3),(9,'the day is bright','2017-06-11 00:00:00',4),(10,'hello guys','2021-01-11 00:00:00',5);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_likes`
--

DROP TABLE IF EXISTS `post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_likes` (
  `id_user` int NOT NULL,
  `id_post` int NOT NULL,
  `reaction` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_user`,`id_post`),
  KEY `id_post` (`id_post`),
  CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `post_likes_ibfk_2` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_likes`
--

LOCK TABLES `post_likes` WRITE;
/*!40000 ALTER TABLE `post_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(40) NOT NULL,
  `phone` int DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'megdjiane@gmail.com','djiane','Megane',NULL,NULL),(2,'juniorken@gmail.com','rolf','junior',NULL,NULL),(3,'fordjiane@gmail.com','last','fortune',NULL,NULL),(4,'wilbesso@gmail.com','mad','wilfried',NULL,NULL),(5,'merveillebess@gmail.com','first','Merveille',NULL,NULL),(6,'jc@gmail.com','dad','claude',NULL,NULL),(7,'ec@gmail.com','mom','claire',NULL,NULL),(9,'test@gmail.com','12345','Megane',644545,45),(11,'simo@gmail.com','12345','simo',677498538,19),(12,'tom@gmail.com','123','tom',456789,40),(13,'yaa@gmail.com','12345','yaya',67889944,23),(14,'test@gmail.com','as','test',67889944,23),(15,'tst@gmail.com','as','test',67889944,23);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-15  9:34:52
