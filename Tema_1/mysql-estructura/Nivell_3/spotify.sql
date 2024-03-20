-- MySQL dump 10.13  Distrib 5.7.39, for osx10.12 (x86_64)
--
-- Host: localhost    Database: spotify
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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `year` year(4) NOT NULL,
  `cover` blob NOT NULL,
  `artist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_album_artist1_idx` (`artist_id`),
  CONSTRAINT `fk_album_artist1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'Album1',2024,_binary 'cover1',1),(2,'Album2',2023,_binary 'cover2',2),(3,'Album3',2022,_binary 'cover3',3),(4,'Album4',2021,_binary 'cover4',4),(5,'Album5',2020,_binary 'cover5',5);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `image` blob NOT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `related_artist` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_artist_artist1_idx` (`artist_id`),
  CONSTRAINT `fk_artist_artist1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (1,'Artist1',_binary 'imagen1',NULL,NULL),(2,'Artist2',_binary 'imagen2',1,'Artist1'),(3,'Artist3',_binary 'imagen3',NULL,NULL),(4,'Artist4',_binary 'imagen4',3,'Artist3'),(5,'Artist5',_binary 'imagen5',NULL,NULL);
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `user_id` int(11) NOT NULL,
  `number` varchar(25) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `ccv` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_card_suscription1_idx` (`user_id`),
  CONSTRAINT `fk_card_suscription1` FOREIGN KEY (`user_id`) REFERENCES `suscription` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,'1234567890123456',12,2025,123),(2,'9876543210987654',11,2024,456),(3,'5432167890123456',10,2023,789);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deleted`
--

DROP TABLE IF EXISTS `deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleted` (
  `playlist_id` int(11) NOT NULL,
  `created` date NOT NULL,
  PRIMARY KEY (`playlist_id`),
  CONSTRAINT `fk_deleted_playlist1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleted`
--

LOCK TABLES `deleted` WRITE;
/*!40000 ALTER TABLE `deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paiement` (
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `order_number` int(11) NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `order_number_UNIQUE` (`order_number`),
  KEY `fk_paiement_suscription1_idx` (`user_id`),
  CONSTRAINT `fk_paiement_suscription1` FOREIGN KEY (`user_id`) REFERENCES `suscription` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paiement`
--

LOCK TABLES `paiement` WRITE;
/*!40000 ALTER TABLE `paiement` DISABLE KEYS */;
INSERT INTO `paiement` VALUES (1,'2024-01-01',12345,9.99),(2,'2024-02-01',23456,4.99),(3,'2024-03-01',34567,9.99),(4,'2024-04-01',45678,9.99),(5,'2024-05-01',56789,4.99);
/*!40000 ALTER TABLE `paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal`
--

DROP TABLE IF EXISTS `paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal` (
  `user_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_paypal_suscription1_idx` (`user_id`),
  CONSTRAINT `fk_paypal_suscription1` FOREIGN KEY (`user_id`) REFERENCES `suscription` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal`
--

LOCK TABLES `paypal` WRITE;
/*!40000 ALTER TABLE `paypal` DISABLE KEYS */;
INSERT INTO `paypal` VALUES (4,'user4_paypal'),(5,'user5_paypal');
/*!40000 ALTER TABLE `paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) NOT NULL,
  `number_of_songs` int(11) NOT NULL,
  `creation` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `shared` tinyint(2) NOT NULL,
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
INSERT INTO `playlist` VALUES (1,'Playlist1',10,'2024-01-01',1,1),(2,'Playlist2',8,'2024-02-01',2,1),(3,'Playlist3',15,'2024-03-01',3,0),(4,'Playlist4',20,'2024-04-01',4,1),(5,'Playlist5',5,'2024-05-01',5,0);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_has_song`
--

DROP TABLE IF EXISTS `playlist_has_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist_has_song` (
  `playlist_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `added` date NOT NULL,
  PRIMARY KEY (`playlist_id`,`song_id`),
  KEY `fk_playlist_song_song1_idx` (`song_id`),
  KEY `fk_playlist_song_playlist1_idx` (`playlist_id`),
  KEY `fk_playlist_has_song_user1_idx` (`user_id`),
  CONSTRAINT `fk_playlist_has_song_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_playlist_song_playlist1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_playlist_song_song1` FOREIGN KEY (`song_id`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_has_song`
--

LOCK TABLES `playlist_has_song` WRITE;
/*!40000 ALTER TABLE `playlist_has_song` DISABLE KEYS */;
INSERT INTO `playlist_has_song` VALUES (1,1,1,'2024-01-01'),(2,2,2,'2024-02-01'),(3,3,3,'2024-03-01'),(4,4,4,'2024-04-01'),(5,5,5,'2024-05-01');
/*!40000 ALTER TABLE `playlist_has_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `duration` time NOT NULL,
  `reproduction` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_song_album1_idx` (`album_id`),
  CONSTRAINT `fk_song_album1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'Song1','00:03:30',1000,1),(2,'Song2','00:04:15',1500,2),(3,'Song3','00:03:45',1200,3),(4,'Song4','00:05:00',2000,4),(5,'Song5','00:04:30',1800,5);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscription`
--

DROP TABLE IF EXISTS `suscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suscription` (
  `user_id` int(11) NOT NULL,
  `start` date NOT NULL,
  `renew` date NOT NULL,
  `payment` enum('card','paypal') NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_suscription_user1_idx` (`user_id`),
  CONSTRAINT `fk_suscription_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscription`
--

LOCK TABLES `suscription` WRITE;
/*!40000 ALTER TABLE `suscription` DISABLE KEYS */;
INSERT INTO `suscription` VALUES (1,'2024-01-01','2024-01-31','card'),(2,'2024-02-01','2024-02-28','paypal'),(3,'2024-03-01','2024-03-31','card'),(4,'2024-04-01','2024-04-30','card'),(5,'2024-05-01','2024-05-31','paypal');
/*!40000 ALTER TABLE `suscription` ENABLE KEYS */;
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
  `username` varchar(25) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `country` varchar(25) NOT NULL,
  `zip_code` varchar(5) NOT NULL,
  `type` enum('free','premium') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user1@example.com','password1','user1','1990-05-15','male','USA','12345','premium'),(2,'user2@example.com','password2','user2','1985-08-20','female','Canada','54321','free'),(3,'user3@example.com','password3','user3','2000-01-10','male','Mexico','67890','premium'),(4,'user4@example.com','password4','user4','1995-11-25','female','Spain','98765','premium'),(5,'user5@example.com','password5','user5','1988-03-30','male','UK','13579','free');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_follow_artist`
--

DROP TABLE IF EXISTS `user_follow_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_follow_artist` (
  `artist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`artist_id`,`user_id`),
  KEY `fk_artist_user_user1_idx` (`user_id`),
  KEY `fk_artist_user_artist1_idx` (`artist_id`),
  CONSTRAINT `fk_artist_user_artist1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_artist_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_follow_artist`
--

LOCK TABLES `user_follow_artist` WRITE;
/*!40000 ALTER TABLE `user_follow_artist` DISABLE KEYS */;
INSERT INTO `user_follow_artist` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `user_follow_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_favorite_album`
--

DROP TABLE IF EXISTS `user_has_favorite_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_favorite_album` (
  `album_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`album_id`,`user_id`),
  KEY `fk_album_user_user1_idx` (`user_id`),
  KEY `fk_album_user_album1_idx` (`album_id`),
  CONSTRAINT `fk_album_user_album1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_album_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_favorite_album`
--

LOCK TABLES `user_has_favorite_album` WRITE;
/*!40000 ALTER TABLE `user_has_favorite_album` DISABLE KEYS */;
INSERT INTO `user_has_favorite_album` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `user_has_favorite_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_favorite_song`
--

DROP TABLE IF EXISTS `user_has_favorite_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_favorite_song` (
  `song_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`song_id`,`user_id`),
  KEY `fk_song_user_user1_idx` (`user_id`),
  KEY `fk_song_user_song1_idx` (`song_id`),
  CONSTRAINT `fk_song_user_song1` FOREIGN KEY (`song_id`) REFERENCES `song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_song_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_favorite_song`
--

LOCK TABLES `user_has_favorite_song` WRITE;
/*!40000 ALTER TABLE `user_has_favorite_song` DISABLE KEYS */;
INSERT INTO `user_has_favorite_song` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `user_has_favorite_song` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-20 12:40:44
