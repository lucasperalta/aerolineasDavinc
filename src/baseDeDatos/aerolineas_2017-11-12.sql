# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.20)
# Base de datos: aerolineas
# Tiempo de Generación: 2017-11-12 08:27:18 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla aviones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `aviones`;

CREATE TABLE `aviones` (
  `idAvion` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(255) DEFAULT NULL,
  `matricula` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idAvion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `aviones` WRITE;
/*!40000 ALTER TABLE `aviones` DISABLE KEYS */;

INSERT INTO `aviones` (`idAvion`, `marca`, `matricula`, `modelo`)
VALUES
	(1,'airbus','ung758','676');

/*!40000 ALTER TABLE `aviones` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla butacas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `butacas`;

CREATE TABLE `butacas` (
  `idButaca` int(11) NOT NULL AUTO_INCREMENT,
  `disponibilidad` varchar(255) DEFAULT NULL,
  `numeroButaca` int(11) DEFAULT NULL,
  `idAvion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idButaca`),
  KEY `FK_1p2vxm7c5mfhakuapeh4yis2u` (`idAvion`),
  CONSTRAINT `FK_1p2vxm7c5mfhakuapeh4yis2u` FOREIGN KEY (`idAvion`) REFERENCES `aviones` (`idAvion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `butacas` WRITE;
/*!40000 ALTER TABLE `butacas` DISABLE KEYS */;

INSERT INTO `butacas` (`idButaca`, `disponibilidad`, `numeroButaca`, `idAvion`)
VALUES
	(1,'SI',1,1),
	(2,'SI',2,1),
	(3,'SI',3,1),
	(4,'SI',4,1);

/*!40000 ALTER TABLE `butacas` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla destinos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `destinos`;

CREATE TABLE `destinos` (
  `idDestino` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(255) DEFAULT NULL,
  `provincia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idDestino`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `destinos` WRITE;
/*!40000 ALTER TABLE `destinos` DISABLE KEYS */;

INSERT INTO `destinos` (`idDestino`, `pais`, `provincia`)
VALUES
	(1,'Argentina','cordoba'),
	(2,'Argentina','buenos aires'),
	(3,'Argentina','san luis');

/*!40000 ALTER TABLE `destinos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla EMPLOYEE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EMPLOYEE`;

CREATE TABLE `EMPLOYEE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `JOINING_DATE` date NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `SALARY` decimal(10,2) NOT NULL,
  `SSN` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_p136ambt19xg166m0jf37p7wn` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Volcado de tabla pasajes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pasajes`;

CREATE TABLE `pasajes` (
  `idPasaje` int(11) NOT NULL AUTO_INCREMENT,
  `apellidoCliente` varchar(255) DEFAULT NULL,
  `butaca` int(11) DEFAULT NULL,
  `dniCliente` int(11) DEFAULT NULL,
  `nombreCliente` varchar(255) DEFAULT NULL,
  `vuelo_idVuelo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPasaje`),
  KEY `FK_kbdt202g8poy3c4rowcc76gly` (`vuelo_idVuelo`),
  CONSTRAINT `FK_kbdt202g8poy3c4rowcc76gly` FOREIGN KEY (`vuelo_idVuelo`) REFERENCES `vuelos` (`idVuelo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Volcado de tabla rutas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rutas`;

CREATE TABLE `rutas` (
  `idRuta` int(11) NOT NULL AUTO_INCREMENT,
  `destinoLlegada_idDestino` int(11) DEFAULT NULL,
  `destinoPartida_idDestino` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRuta`),
  KEY `FK_7oasy47rlm4isge1it8j1hx3q` (`destinoLlegada_idDestino`),
  KEY `FK_9l99hr4md79xt9ox8saolk7sh` (`destinoPartida_idDestino`),
  CONSTRAINT `FK_7oasy47rlm4isge1it8j1hx3q` FOREIGN KEY (`destinoLlegada_idDestino`) REFERENCES `destinos` (`idDestino`),
  CONSTRAINT `FK_9l99hr4md79xt9ox8saolk7sh` FOREIGN KEY (`destinoPartida_idDestino`) REFERENCES `destinos` (`idDestino`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `rutas` WRITE;
/*!40000 ALTER TABLE `rutas` DISABLE KEYS */;

INSERT INTO `rutas` (`idRuta`, `destinoLlegada_idDestino`, `destinoPartida_idDestino`)
VALUES
	(1,2,1),
	(2,2,3);

/*!40000 ALTER TABLE `rutas` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla usuario
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `apellidoUsuario` varchar(255) DEFAULT NULL,
  `nombreUsuario` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `rolUsuario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;

INSERT INTO `usuario` (`idUsuario`, `apellidoUsuario`, `nombreUsuario`, `password`, `rolUsuario`)
VALUES
	(1,'lperalta','lperalta','827ccb0eea8a706c4c34a16891f84e7b','analista'),
	(2,'lucas','peralta','827ccb0eea8a706c4c34a16891f84e7b','vendedor');

/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla vuelos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vuelos`;

CREATE TABLE `vuelos` (
  `idVuelo` int(11) NOT NULL AUTO_INCREMENT,
  `costoVuelo` float DEFAULT NULL,
  `avion_idAvion` int(11) DEFAULT NULL,
  `ruta_idRuta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVuelo`),
  KEY `FK_mq21qxa7s2vvxx39o9w5rs1r7` (`avion_idAvion`),
  KEY `FK_sl9b5exgqho38srrb9ohlgl5k` (`ruta_idRuta`),
  CONSTRAINT `FK_mq21qxa7s2vvxx39o9w5rs1r7` FOREIGN KEY (`avion_idAvion`) REFERENCES `aviones` (`idAvion`),
  CONSTRAINT `FK_sl9b5exgqho38srrb9ohlgl5k` FOREIGN KEY (`ruta_idRuta`) REFERENCES `rutas` (`idRuta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `vuelos` WRITE;
/*!40000 ALTER TABLE `vuelos` DISABLE KEYS */;

INSERT INTO `vuelos` (`idVuelo`, `costoVuelo`, `avion_idAvion`, `ruta_idRuta`)
VALUES
	(1,2343.23,1,2);

/*!40000 ALTER TABLE `vuelos` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
