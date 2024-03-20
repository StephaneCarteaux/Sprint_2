-- MySQL dump 10.13  Distrib 5.7.39, for osx10.12 (x86_64)
--
-- Host: localhost    Database: optica
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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `carrer` varchar(45) NOT NULL,
  `numero` varchar(5) DEFAULT NULL,
  `pis` varchar(5) DEFAULT NULL,
  `porta` varchar(5) DEFAULT NULL,
  `ciutat` varchar(25) NOT NULL,
  `codi_postal` varchar(5) NOT NULL,
  `pais` varchar(25) NOT NULL,
  `telefon` varchar(12) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `data_registre` date NOT NULL,
  `recomenat_per_client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_clients_crecomenat_per_client_idx` (`recomenat_per_client_id`),
  CONSTRAINT `fk_clients_clients1` FOREIGN KEY (`recomenat_per_client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Cliente 1','Calle 6','123',NULL,NULL,'Ciudad 6','12345','País 6','123456789','cliente1@email.com','2024-03-15',NULL),(2,'Cliente 2','Calle 7','456','3','B','Ciudad 7','23456','País 7','987654321','cliente2@email.com','2024-03-15',1),(3,'Cliente 3','Calle 8','789',NULL,NULL,'Ciudad 8','34567','País 8','456789123','cliente3@email.com','2024-03-15',2),(4,'Cliente 4','Calle 9','1011','2','C','Ciudad 9','45678','País 9','789123456','cliente4@email.com','2024-03-15',3),(5,'Cliente 5','Calle 10','1213','1','A','Ciudad 10','56789','País 10','321654987','cliente5@email.com','2024-03-15',4);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_compra_ullere`
--

DROP TABLE IF EXISTS `client_compra_ullere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_compra_ullere` (
  `client_id` int(11) NOT NULL,
  `ullere_id` int(11) NOT NULL,
  `empleat_id` int(11) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`client_id`,`ullere_id`),
  KEY `fk_client_compra_ullere_client_idx` (`client_id`),
  KEY `fk_client_compra_ullere_ullere_idx` (`ullere_id`),
  KEY `fk_client_compra_ullere_empleat_idx` (`empleat_id`),
  CONSTRAINT `fk_ullere_client_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ullere_client_empleat1` FOREIGN KEY (`empleat_id`) REFERENCES `empleat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ullere_client_ullere1` FOREIGN KEY (`ullere_id`) REFERENCES `ullere` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_compra_ullere`
--

LOCK TABLES `client_compra_ullere` WRITE;
/*!40000 ALTER TABLE `client_compra_ullere` DISABLE KEYS */;
INSERT INTO `client_compra_ullere` VALUES (1,2,1,'2023-03-15'),(1,3,2,'2023-04-20'),(3,4,1,'2023-06-03'),(4,4,3,'2023-09-22'),(5,5,1,'2024-02-21');
/*!40000 ALTER TABLE `client_compra_ullere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleat`
--

DROP TABLE IF EXISTS `empleat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `cognom_1` varchar(25) NOT NULL,
  `cognom_2` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleat`
--

LOCK TABLES `empleat` WRITE;
/*!40000 ALTER TABLE `empleat` DISABLE KEYS */;
INSERT INTO `empleat` VALUES (1,'Empleado 1','Apellido 1','Apellido 2'),(2,'Empleado 2','Apellido 3','Apellido 4'),(3,'Empleado 3','Apellido 5','Apellido 6'),(4,'Empleado 4','Apellido 7','Apellido 8'),(5,'Empleado 5','Apellido 9','Apellido 10');
/*!40000 ALTER TABLE `empleat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveidor`
--

DROP TABLE IF EXISTS `proveidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveidor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `carrer` varchar(45) NOT NULL,
  `numero` varchar(5) DEFAULT NULL,
  `pis` varchar(5) DEFAULT NULL,
  `porta` varchar(5) DEFAULT NULL,
  `ciutat` varchar(25) NOT NULL,
  `codi_postal` varchar(5) NOT NULL,
  `pais` varchar(25) NOT NULL,
  `telefon` varchar(12) DEFAULT NULL,
  `fax` varchar(12) DEFAULT NULL,
  `nif` varchar(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveidor`
--

LOCK TABLES `proveidor` WRITE;
/*!40000 ALTER TABLE `proveidor` DISABLE KEYS */;
INSERT INTO `proveidor` VALUES (1,'Proveedor 1','Calle 1','123',NULL,NULL,'Ciudad 1','12345','País 1','123456789','987654321','23456789A'),(2,'Proveedor 2','Calle 2','456','3','B','Ciudad 2','23456','País 2','987654321','123456789','87654321B'),(3,'Proveedor 3','Calle 3','789',NULL,NULL,'Ciudad 3','34567','País 3','456789123','987654321','56789123C'),(4,'Proveedor 4','Calle 4','1011','2','C','Ciudad 4','45678','País 4','789123456','123456789','89123456D'),(5,'Proveedor 5','Calle 5','1213','1','A','Ciudad 5','56789','País 5','321654987','987654321','21654987E');
/*!40000 ALTER TABLE `proveidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ullere`
--

DROP TABLE IF EXISTS `ullere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ullere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(25) NOT NULL,
  `graduacio_l` float NOT NULL,
  `graduacio_r` float NOT NULL,
  `tipus_montura` enum('flotant','pasta','metàl.lica') NOT NULL,
  `color_montura` varchar(25) NOT NULL,
  `color_vidre` varchar(25) NOT NULL,
  `preu` float NOT NULL,
  `proveidor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_ullere_proveidor_idx` (`proveidor_id`),
  CONSTRAINT `fk_ullere_proveidor1` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ullere`
--

LOCK TABLES `ullere` WRITE;
/*!40000 ALTER TABLE `ullere` DISABLE KEYS */;
INSERT INTO `ullere` VALUES (1,'Marca 1',-1.25,-1.5,'flotant','Negro','Transparente',150,1),(2,'Marca 2',-2,-2.25,'pasta','Marrón','Marrón',200,2),(3,'Marca 3',-1.75,-2,'metàl.lica','Plata','Gris',180,3),(4,'Marca 4',-1.5,-1.75,'flotant','Azul','Azul',170,4),(5,'Marca 5',-2.25,-2.5,'pasta','Rojo','Rojo',190,5);
/*!40000 ALTER TABLE `ullere` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-20 11:02:05
