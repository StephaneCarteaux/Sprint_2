-- MySQL dump 10.13  Distrib 5.7.39, for osx10.12 (x86_64)
--
-- Host: localhost    Database: pizzeria
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
-- Table structure for table `botiga`
--

DROP TABLE IF EXISTS `botiga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `botiga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adreça` varchar(45) NOT NULL,
  `codi_postal` varchar(5) NOT NULL,
  `localitat` varchar(25) NOT NULL,
  `provincia` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `botiga`
--

LOCK TABLES `botiga` WRITE;
/*!40000 ALTER TABLE `botiga` DISABLE KEYS */;
INSERT INTO `botiga` VALUES (1,'Calle Mayor 10','28001','Madrid','Madrid'),(2,'Rambla Catalunya 20','08001','Barcelona','Barcelona'),(3,'Calle Sierpes 30','41001','Sevilla','Sevilla'),(4,'Paseo Independencia 40','50001','Zaragoza','Zaragoza'),(5,'Gran Vía 50','28013','Madrid','Madrid');
/*!40000 ALTER TABLE `botiga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_pizza`
--

DROP TABLE IF EXISTS `categoria_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_pizza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_pizza`
--

LOCK TABLES `categoria_pizza` WRITE;
/*!40000 ALTER TABLE `categoria_pizza` DISABLE KEYS */;
INSERT INTO `categoria_pizza` VALUES (1,'Clásica'),(2,'Vegetariana'),(3,'Hawaiana'),(4,'Barbacoa'),(5,'Margarita');
/*!40000 ALTER TABLE `categoria_pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_producte`
--

DROP TABLE IF EXISTS `categoria_producte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_producte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` enum('pizze','hamburguese','begude') NOT NULL,
  `categoria_pizza_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categoria_producte_categoria_pizza_idx` (`categoria_pizza_id`),
  CONSTRAINT `fk_categoria_producte_categoria_pizza` FOREIGN KEY (`categoria_pizza_id`) REFERENCES `categoria_pizza` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_producte`
--

LOCK TABLES `categoria_producte` WRITE;
/*!40000 ALTER TABLE `categoria_producte` DISABLE KEYS */;
INSERT INTO `categoria_producte` VALUES (1,'pizze',1),(2,'hamburguese',NULL),(3,'begude',NULL);
/*!40000 ALTER TABLE `categoria_producte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `cognom1` varchar(25) NOT NULL,
  `cognom2` varchar(25) DEFAULT NULL,
  `adreça` varchar(45) NOT NULL,
  `codi_postal` varchar(5) NOT NULL,
  `localitat` varchar(25) NOT NULL,
  `provincia` varchar(25) NOT NULL,
  `telefon` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Juan','García','Martínez','Calle Mayor 123','28001','Madrid','Madrid','912345678'),(2,'María','López','Fernández','Calle Sol 45','08001','Barcelona','Barcelona','934567890'),(3,'Pedro','Rodríguez','González','Av. Libertad 67','41001','Sevilla','Sevilla','955678901'),(4,'Laura','Martínez','Díaz','Plaza España 89','50001','Zaragoza','Zaragoza','976789012'),(5,'Ana','Sánchez','Pérez','Calle Gran Vía 34','28013','Madrid','Madrid','911234567');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comanda`
--

DROP TABLE IF EXISTS `comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comanda` (
  `id` int(11) NOT NULL,
  `data_hora` datetime NOT NULL,
  `tipus` enum('repartiment','botiga') NOT NULL,
  `quantitat_productes` int(11) NOT NULL,
  `preu_total` float NOT NULL,
  `client_id` int(11) NOT NULL,
  `botiga_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comanda_client_idx` (`client_id`),
  KEY `fk_comanda_botiga1_idx` (`botiga_id`),
  CONSTRAINT `fk_comanda_botiga1` FOREIGN KEY (`botiga_id`) REFERENCES `botiga` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comanda`
--

LOCK TABLES `comanda` WRITE;
/*!40000 ALTER TABLE `comanda` DISABLE KEYS */;
INSERT INTO `comanda` VALUES (1,'2024-03-18 13:00:00','repartiment',2,25.5,1,1),(2,'2024-03-18 18:30:00','botiga',2,35.75,2,2),(3,'2024-03-18 20:15:00','repartiment',1,15.25,3,3),(4,'2024-03-18 21:45:00','botiga',2,20,4,4),(5,'2024-03-18 22:30:00','repartiment',3,30,5,5);
/*!40000 ALTER TABLE `comanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comanda_producte`
--

DROP TABLE IF EXISTS `comanda_producte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comanda_producte` (
  `comanda_id` int(11) NOT NULL,
  `producte_id` int(11) NOT NULL,
  `quantitat` int(11) NOT NULL,
  `subtotal` float DEFAULT NULL,
  PRIMARY KEY (`comanda_id`,`producte_id`),
  KEY `fk_comanda_has_producte_comanda_idx` (`comanda_id`),
  KEY `fk_comanda_has_producte_producte_idx` (`producte_id`),
  CONSTRAINT `fk_comanda_has_producte_comanda` FOREIGN KEY (`comanda_id`) REFERENCES `comanda` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_has_producte_producte` FOREIGN KEY (`producte_id`) REFERENCES `producte` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comanda_producte`
--

LOCK TABLES `comanda_producte` WRITE;
/*!40000 ALTER TABLE `comanda_producte` DISABLE KEYS */;
INSERT INTO `comanda_producte` VALUES (1,1,1,8.5),(1,5,1,1.75),(2,3,2,10),(3,4,1,9),(4,2,2,3.5),(5,1,2,17),(5,5,1,1.75);
/*!40000 ALTER TABLE `comanda_producte` ENABLE KEYS */;
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
  `cognom1` varchar(25) NOT NULL,
  `cognom2` varchar(25) DEFAULT NULL,
  `nif` varchar(9) NOT NULL,
  `telefon` varchar(12) NOT NULL,
  `tipus` enum('cuiner','repartidor') NOT NULL,
  `botiga_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_empleat_botiga_idx` (`botiga_id`),
  CONSTRAINT `fk_empleat_botiga1` FOREIGN KEY (`botiga_id`) REFERENCES `botiga` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleat`
--

LOCK TABLES `empleat` WRITE;
/*!40000 ALTER TABLE `empleat` DISABLE KEYS */;
INSERT INTO `empleat` VALUES (1,'Carlos','Gómez','Fernández','12345678A','611223344','cuiner',1),(2,'Elena','Pérez','Martínez','87654321B','655443322','repartidor',2),(3,'Antonio','Martín','González','98765432C','677889900','repartidor',3),(4,'Sara','Rodríguez','López','23456789D','633221100','cuiner',4),(5,'David','García','Sánchez','34567890E','688990011','repartidor',5);
/*!40000 ALTER TABLE `empleat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lliurament`
--

DROP TABLE IF EXISTS `lliurament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lliurament` (
  `data_hora` datetime NOT NULL,
  `comanda_id` int(11) NOT NULL,
  `empleat_id` int(11) NOT NULL,
  KEY `fk_lliurament_empleat_idx` (`empleat_id`),
  KEY `fk_lliurament_comanda_idx` (`comanda_id`),
  CONSTRAINT `fk_lliurament_comanda1` FOREIGN KEY (`comanda_id`) REFERENCES `comanda` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_lliurament_empleat1` FOREIGN KEY (`empleat_id`) REFERENCES `empleat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lliurament`
--

LOCK TABLES `lliurament` WRITE;
/*!40000 ALTER TABLE `lliurament` DISABLE KEYS */;
INSERT INTO `lliurament` VALUES ('2024-03-18 13:30:00',1,2),('2024-03-18 18:45:00',2,3),('2024-03-18 20:30:00',3,4),('2024-03-18 22:00:00',4,5),('2024-03-18 22:45:00',5,1);
/*!40000 ALTER TABLE `lliurament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producte`
--

DROP TABLE IF EXISTS `producte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `descripcio` tinytext NOT NULL,
  `imatge` blob NOT NULL,
  `preu` float NOT NULL,
  `categoria_producte_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_producte_categoria_producte_idx` (`categoria_producte_id`),
  CONSTRAINT `fk_producte_categoria_producte` FOREIGN KEY (`categoria_producte_id`) REFERENCES `categoria_producte` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producte`
--

LOCK TABLES `producte` WRITE;
/*!40000 ALTER TABLE `producte` DISABLE KEYS */;
INSERT INTO `producte` VALUES (1,'Pizza Margarita','Ingredientes: tomate, mozzarella, albahaca',_binary 'imagen_pizza_margarita.jpg',8.5,1),(2,'Coca-Cola','Refresco de cola',_binary 'imagen_coca_cola.jpg',1.75,3),(3,'Hamburguesa clásica','Carne de ternera, lechuga, tomate, cebolla, ketchup, mayonesa',_binary 'imagen_hamburguesa.jpg',5,2),(4,'Pizza Vegetariana','Ingredientes: tomate, mozzarella, champiñones, pimientos, cebolla, aceitunas',_binary 'imagen_pizza_vegetariana.jpg',9,1),(5,'Fanta','Refresco de naranja',_binary 'imagen_fanta.jpg',1.75,3);
/*!40000 ALTER TABLE `producte` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-20 11:02:37
