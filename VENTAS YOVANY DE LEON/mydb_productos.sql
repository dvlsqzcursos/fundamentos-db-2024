-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idProductos` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descrpcion` varchar(45) DEFAULT NULL,
  `Codigo_sku` int DEFAULT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `Saldo` varchar(45) DEFAULT NULL,
  `Precio_Compra` decimal(10,0) DEFAULT NULL,
  `Precio_venta` decimal(10,0) DEFAULT NULL,
  `Proveedores_idProveedores` int NOT NULL,
  PRIMARY KEY (`idProductos`),
  KEY `fk_Productos_Proveedores1_idx` (`Proveedores_idProveedores`),
  CONSTRAINT `fk_Productos_Proveedores1` FOREIGN KEY (`Proveedores_idProveedores`) REFERENCES `proveedores` (`idProveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Producto 1','Descripción del producto 1',12345,'Categoría 1','10 unidades',100,151,1),(2,'Producto 2','Descripción del producto 2',67890,'Categoría 2','15 unidades',120,181,2),(3,'Producto 3','Descripción del producto 3',24680,'Categoría 1','20 unidades',90,135,3),(4,'Producto 4','Descripción del producto 4',13579,'Categoría 3','5 unidades',150,225,1),(5,'Producto 5','Descripción del producto 5',97531,'Categoría 2','12 unidades',110,166,2),(6,'Producto 6','Descripción del producto 6',86420,'Categoría 1','8 unidades',130,195,3),(7,'Producto 7','Descripción del producto 7',75309,'Categoría 3','18 unidades',95,143,1),(8,'Producto 8','Descripción del producto 8',58203,'Categoría 2','25 unidades',85,128,2),(9,'Producto 9','Descripción del producto 9',49382,'Categoría 1','30 unidades',105,158,3),(10,'Producto 10','Descripción del producto 10',32049,'Categoría 3','22 unidades',140,210,1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-17 12:02:29
