
CREATE DATABASE  IF NOT EXISTS `supermark` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `supermark`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: supermark
-- ------------------------------------------------------
-- Server version   8.0.29

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
-- Table structure for table `comprobante`
--

DROP TABLE IF EXISTS `comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprobante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(1) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `id_usuario` int NOT NULL,
  `id_tc` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_comprobante_fk` (`id_usuario`),
  KEY `tc_comprobante_fk` (`id_tc`),
  CONSTRAINT `tc_comprobante_fk` FOREIGN KEY (`id_tc`) REFERENCES `tarjetacredito` (`numero`),
  CONSTRAINT `usuario_comprobante_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `descuento`
--

DROP TABLE IF EXISTS `descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descuento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `porcentaje` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detalle`
--

DROP TABLE IF EXISTS `detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_comprobante` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comprobante_fk` (`id_comprobante`),
  KEY `producto_fk` (`id_producto`),
  CONSTRAINT `comprobante_fk` FOREIGN KEY (`id_comprobante`) REFERENCES `comprobante` (`id`),
  CONSTRAINT `producto_fk` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domicilio`
--

DROP TABLE IF EXISTS `domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domicilio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calle1` varchar(30) DEFAULT NULL,
  `calle2` varchar(30) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `ruta` varchar(30) DEFAULT NULL,
  `km` int DEFAULT NULL,
  `depNumero` int DEFAULT NULL,
  `piso` int DEFAULT NULL,
  `id_localidad` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `localidad_fk` (`id_localidad`),
  CONSTRAINT `localidad_fk` FOREIGN KEY (`id_localidad`) REFERENCES `localidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provincia` varchar(20) DEFAULT NULL,
  `departamento` varchar(20) DEFAULT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `marca` varchar(20) DEFAULT NULL,
  `fecha_venc` date DEFAULT NULL,
  `precio` float NOT NULL,
  `stock` int DEFAULT NULL,
  `id_tipo` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_fk` (`id_tipo`),
  CONSTRAINT `tipo_fk` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tarjetacredito`
--

DROP TABLE IF EXISTS `tarjetacredito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjetacredito` (
  `numero` bigint unsigned NOT NULL,
  `banco` varchar(20) DEFAULT NULL,
  `titular` varchar(60) DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `usuario_tc_fk` (`id_usuario`),
  CONSTRAINT `usuario_tc_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(128) DEFAULT NULL,
  `id_descuento` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `descuento_fk` (`id_descuento`),
  CONSTRAINT `descuento_fk` FOREIGN KEY (`id_descuento`) REFERENCES `descuento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `dni` int unsigned NOT NULL,
  `contrasenia` varchar(16) DEFAULT NULL,
  `id_domicilio` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `domicilio_fk` (`id_domicilio`),
  CONSTRAINT `domicilio_fk` FOREIGN KEY (`id_domicilio`) REFERENCES `domicilio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;




CREATE TABLE Carrito(
id INT auto_increment PRIMARY KEY,
id_usuario INT NOT NULL,
id_producto INT NOT NULL,
cantidad INT,
CONSTRAINT usuario_fk FOREIGN KEY Carrito(id_usuario)
REFERENCES usuario(id),
CONSTRAINT producto2_fk FOREIGN KEY Carrito(id_producto)
REFERENCES producto(id)
);



INSERT INTO supermark.descuento(porcentaje)
VALUE(0);
INSERT INTO supermark.descuento(porcentaje)
VALUE(0.3);
INSERT INTO supermark.descuento(porcentaje)
VALUE(0.5);


INSERT INTO supermark.tipo(descripcion, id_descuento)
VALUES ("Carnes",1);
INSERT INTO supermark.tipo(descripcion, id_descuento)
VALUES ("Panaderia",3);
INSERT INTO supermark.tipo(descripcion, id_descuento)
VALUES ("Cereales",2);
    

INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Leche Descremada 1 Lt.","Ilolay","2023-05-05",120.25,200,2);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Leche Entera 1 Lt.","Ilolay","2023-05-05",140,200,2);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Leche Fortificada 1 Lt.","Ilolay","2023-05-05",240,200,2);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Leche Descremada 1 Lt.","Sancor","2023-07-05",150,300,2);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Leche Entera 1 Lt.","Sancor","2023-07-05",140,300,2);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Leche Fortificada 1 Lt.","Sancor","2023-07-05",300,200,2);



INSERT INTO supermark.tipo(descripcion, id_descuento)
VALUES ("Harinas",1);
INSERT INTO supermark.tipo(descripcion, id_descuento)
VALUES ("Aceites",1);
INSERT INTO supermark.tipo(descripcion, id_descuento)
VALUES ("Aderezos",1);
INSERT INTO supermark.tipo(descripcion, id_descuento)
VALUES ("Conservas",1);
INSERT INTO supermark.tipo(descripcion, id_descuento)
VALUES ("Golosinas",1);
INSERT INTO supermark.tipo(descripcion, id_descuento)
VALUES ("Panaderia",1);
INSERT INTO supermark.tipo(descripcion, id_descuento)
VALUES ("Untables",1);
INSERT INTO supermark.tipo(descripcion, id_descuento)
VALUES ("Cuidado personal",1);
INSERT INTO supermark.tipo(descripcion, id_descuento)
VALUES ("Limpieza",1);
INSERT INTO supermark.tipo(descripcion, id_descuento)
VALUES ("Infusiones y Endulzante",1);
INSERT INTO supermark.tipo(descripcion, id_descuento)
VALUES ("Bebidas con alcohol",1);
INSERT INTO supermark.tipo(descripcion, id_descuento)
VALUES ("Bebidas sin alcohol",1);

INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Cereales Azucarados 500 gr.","Skarchitos","2023-08-23",229.80,30,4);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Cereales Froot Loops 175 gr.","Kelloggs","2023-10-20",413,45,4);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Cereales Zucaritas 300 gr.","Kelloggs","2023-07-15",419,38,4);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Cereales Avena y Miel 200 gr.","QUAKER","2023-04-14",361.20,18,4);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Cereal Baloncitos 150 gr.","GRANIX","2022-11-20",126.28,55,4);

INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Polenta 500 gr.","Prestapronto","2022-12-21",94.95,120,5);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Polenta 1 Kg.","Morixe","2022-10-20",145,100,5);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Harina 000 Ultra refinada 1 Kg.","Cañuelas","2022-12-24",85,180,5);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Harina 000 1 Kg.","Favorita","2023-01-20",84,173,5);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Harina de trigo 000 1 Kg.","Blancaflor","2023-02-04",87.89,165,5);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Harina para Pizza con Levadura 1 Kg.","PUREZA","2023-07-13",170.08,126,5);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Harina 0000 1 Kg.","Blancaflor","2023-01-14",151.99,179,5);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Harina 0000 Vitazinc 1 Kg.","Favorita","2022-11-20",142.07,157,5);

INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Aceite de Girasol 900 Ml.","PUREZA","2023-12-21",393.25,220,6);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Aceite de Girasol 1,5 Lts.","PUREZA","2023-11-11",615.79,190,6);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Aceite de Girasol 900 Ml.","Cañuelas","2022-12-24",173.19,176,6);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Aceite de Girasol Alto Oleico 900 Ml.","Cocinero","2022-10-11",462,135,6);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Aceite Mezcla 1.5 Lts.","Cocinero","2023-02-24",260,90,6);

INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Mayonesa Clasica 320 gr.","Hellmanns","2022-12-26",220.60,126,7);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Aderezo a base de Mostaza 500 gr.","Savora","2022-09-23",215.10,93,7);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Ketchup 500 gr.","Hellmanns","2022-11-28",268.76,89,7);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Sal fina en paquete 500 gr.","Celusal","2025-12-26",87,138,7);


INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Atun al natural 170 gr.","La Campagnola","2026-10-16",272,90,8);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Atun al aceite 170 gr.","La Campagnola","2026-10-05",272,102,8);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Garbanzos 300 gr.","La Campagnola","2026-02-13",114.93,70,8);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Pure de Tomate 520 gr.","Salsati","2025-11-03",77.54,65,8);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Choclo Amarillo en grano 300 gr.","ARCOR","2025-06-17",127.92,93,8);


INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Turron con Mani 25 gr.","ARCOR","2022-10-16",37,106,9);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Bombon relleno 15 gr.","Bon o Bon","2022-12-13",35,96,9);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Alfajor torta Oreo 61 gr.","Milka","2022-11-27",121,64,9);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Alfajor Triple 57 gr.","Pepitos","2022-10-14",126,47,9);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Alfajor Triple 70 gr.","Terrabusi","2022-09-14",68.28,42,9);

INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Pan Lactal de Molde 550 gr.","FARGO","2022-08-16",332.87,36,10);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Pan de Salvado 350 gr.","FARGO","2022-08-22",273.63,25,10);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Fajitas 280 gr.","Lucchetti","2022-09-14",213.73,45,10);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Tostadas de Arroz 120 gr.","Tia Maruca","2022-09-21",79.58,55,10);
INSERT INTO supermark.producto(nombre,marca,fecha_venc,precio,stock,id_tipo)
VALUE("Pan Rallado 500 gr.","Cañuelas","2022-12-13",84.61,78,10);

