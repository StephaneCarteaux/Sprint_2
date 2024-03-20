-- MySQL dump 10.13  Distrib 5.7.39, for osx10.12 (x86_64)
--
-- Host: localhost    Database: youtube
-- ------------------------------------------------------
-- Server version	5.7.39

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
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `creation` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_channel_user1_idx` (`user_id`),
  CONSTRAINT `fk_channel_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` VALUES (1,'Canal1','Descripción del Canal1','2024-03-20',1),(2,'Canal2','Descripción del Canal2','2024-03-19',2),(3,'Canal3','Descripción del Canal3','2024-03-18',3),(4,'Canal4','Descripción del Canal4','2024-03-17',4),(5,'Canal5','Descripción del Canal5','2024-03-16',5);
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `creation` datetime NOT NULL,
  `video_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_video1_idx` (`video_id`),
  KEY `fk_comment_user1_idx` (`user_id`),
  CONSTRAINT `fk_comment_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_video1` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Comentario 1','2024-03-20 12:00:00',1,1),(2,'Comentario 2','2024-03-19 12:00:00',2,2),(3,'Comentario 3','2024-03-18 12:00:00',3,3),(4,'Comentario 4','2024-03-17 12:00:00',4,4),(5,'Comentario 5','2024-03-16 12:00:00',5,5);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_has_like`
--

DROP TABLE IF EXISTS `comment_has_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_has_like` (
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `like` enum('like','dislike') NOT NULL,
  `creation` datetime NOT NULL,
  PRIMARY KEY (`comment_id`,`user_id`),
  KEY `fk_comment_user_user1_idx` (`user_id`),
  KEY `fk_comment_user_comment1_idx` (`comment_id`),
  CONSTRAINT `fk_comment_user_comment1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_has_like`
--

LOCK TABLES `comment_has_like` WRITE;
/*!40000 ALTER TABLE `comment_has_like` DISABLE KEYS */;
INSERT INTO `comment_has_like` VALUES (1,2,'like','2024-03-20 12:05:00'),(2,3,'like','2024-03-19 12:10:00'),(3,4,'like','2024-03-18 12:15:00'),(4,5,'like','2024-03-17 12:20:00'),(5,1,'like','2024-03-16 12:25:00');
/*!40000 ALTER TABLE `comment_has_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `creation` date NOT NULL,
  `visibility` enum('public','private') NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_playlist_user1_idx` (`user_id`),
  CONSTRAINT `fk_playlist_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,'Playlist1','2024-03-20','public',1),(2,'Playlist2','2024-03-19','private',2),(3,'Playlist3','2024-03-18','public',3),(4,'Playlist4','2024-03-17','private',4),(5,'Playlist5','2024-03-16','public',5);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'Tag1'),(2,'Tag2'),(3,'Tag3'),(4,'Tag4'),(5,'Tag5');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` char(40) NOT NULL,
  `user_name` varchar(25) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `country` varchar(25) NOT NULL,
  `zip_code` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'usuario1@example.com','password1','usuario1','1990-05-15','male','Mexico','12345'),(2,'usuario2@example.com','password2','usuario2','1985-08-20','female','Spain','54321'),(3,'usuario3@example.com','password3','usuario3','2000-01-10','male','USA','67890'),(4,'usuario4@example.com','password4','usuario4','1995-11-25','female','Canada','98765'),(5,'usuario5@example.com','password5','usuario5','1988-03-30','male','Brazil','13579');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_suscribe_channel`
--

DROP TABLE IF EXISTS `user_suscribe_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_suscribe_channel` (
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`user_id`),
  KEY `fk_channel_user_user1_idx` (`user_id`),
  KEY `fk_channel_user_channel1_idx` (`channel_id`),
  CONSTRAINT `fk_channel_user_channel1` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_channel_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_suscribe_channel`
--

LOCK TABLES `user_suscribe_channel` WRITE;
/*!40000 ALTER TABLE `user_suscribe_channel` DISABLE KEYS */;
INSERT INTO `user_suscribe_channel` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `user_suscribe_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titlte` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `size` int(11) NOT NULL,
  `filename` varchar(45) NOT NULL,
  `length` int(11) NOT NULL,
  `thumbnail` blob NOT NULL,
  `views` int(11) NOT NULL,
  `visibility` enum('public','ocult','private') NOT NULL,
  `published` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_video_user_idx` (`user_id`),
  KEY `fk_video_playlist1_idx` (`playlist_id`),
  CONSTRAINT `fk_video_playlist1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_video_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'Video1','Descripción del Video1',1024,'video1.mp4',120,_binary 'thumbnail1',1000,'public','2024-03-20 12:00:00',1,1),(2,'Video2','Descripción del Video2',2048,'video2.mp4',180,_binary 'thumbnail2',2000,'public','2024-03-19 12:00:00',2,2),(3,'Video3','Descripción del Video3',4096,'video3.mp4',240,_binary 'thumbnail3',3000,'public','2024-03-18 12:00:00',3,3),(4,'Video4','Descripción del Video4',8192,'video4.mp4',300,_binary 'thumbnail4',4000,'public','2024-03-17 12:00:00',4,4),(5,'Video5','Descripción del Video5',16384,'video5.mp4',360,_binary 'thumbnail5',5000,'public','2024-03-16 12:00:00',5,5);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_has_like`
--

DROP TABLE IF EXISTS `video_has_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_has_like` (
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `like` enum('like','dislike') NOT NULL,
  `creation` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`video_id`),
  KEY `fk_user_video_video1_idx` (`video_id`),
  KEY `fk_user_video_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_video_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_video_video1` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_has_like`
--

LOCK TABLES `video_has_like` WRITE;
/*!40000 ALTER TABLE `video_has_like` DISABLE KEYS */;
INSERT INTO `video_has_like` VALUES (1,2,'like','2024-03-20 12:30:00'),(2,3,'like','2024-03-19 12:35:00'),(3,4,'like','2024-03-18 12:40:00'),(4,5,'like','2024-03-17 12:45:00'),(5,1,'like','2024-03-16 12:50:00');
/*!40000 ALTER TABLE `video_has_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_has_tag`
--

DROP TABLE IF EXISTS `video_has_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_has_tag` (
  `tag_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`tag_id`,`video_id`),
  KEY `fk_tag_video_video1_idx` (`video_id`),
  KEY `fk_tag_video_tag1_idx` (`tag_id`),
  CONSTRAINT `fk_tag_video_tag1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tag_video_video1` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_has_tag`
--

LOCK TABLES `video_has_tag` WRITE;
/*!40000 ALTER TABLE `video_has_tag` DISABLE KEYS */;
INSERT INTO `video_has_tag` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `video_has_tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-20 12:44:43
