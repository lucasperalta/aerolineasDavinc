# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.20)
# Base de datos: aerolineas
# Tiempo de Generación: 2017-11-21 00:30:40 +0000
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
	(2,'airbus','555','676'),
	(3,'airbus','ung666','676'),
	(4,'boeing','232','345');

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
  KEY `idAvion` (`idAvion`),
  CONSTRAINT `butacas_ibfk_1` FOREIGN KEY (`idAvion`) REFERENCES `aviones` (`idAvion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `butacas` WRITE;
/*!40000 ALTER TABLE `butacas` DISABLE KEYS */;

INSERT INTO `butacas` (`idButaca`, `disponibilidad`, `numeroButaca`, `idAvion`)
VALUES
	(19,'SI',1,2),
	(20,'NO',2,2),
	(21,'NO',3,2),
	(22,'NO',4,2),
	(23,'SI',1,3),
	(24,'SI',1,4),
	(25,'NO',2,4),
	(26,'SI',3,4);

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
	(3,'Argentina','mendoza'),
	(4,'Argentina','cordoba'),
	(5,'Argentina','san luis');

/*!40000 ALTER TABLE `destinos` ENABLE KEYS */;
UNLOCK TABLES;


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
  KEY `vuelo_idVuelo` (`vuelo_idVuelo`),
  CONSTRAINT `pasajes_ibfk_1` FOREIGN KEY (`vuelo_idVuelo`) REFERENCES `vuelos` (`idVuelo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `pasajes` WRITE;
/*!40000 ALTER TABLE `pasajes` DISABLE KEYS */;

INSERT INTO `pasajes` (`idPasaje`, `apellidoCliente`, `butaca`, `dniCliente`, `nombreCliente`, `vuelo_idVuelo`)
VALUES
	(1,'pirulo',4,27659662,'lucas',1),
	(2,'dasdsadsadasdas',3,27659633,'lucas',3),
	(3,'3214ersdaf',4,23456345,'lucas',1);

/*!40000 ALTER TABLE `pasajes` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla rutas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rutas`;

CREATE TABLE `rutas` (
  `idRuta` int(11) NOT NULL AUTO_INCREMENT,
  `destinoLlegada_idDestino` int(11) DEFAULT NULL,
  `destinoPartida_idDestino` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRuta`),
  KEY `destinoLlegada_idDestino` (`destinoLlegada_idDestino`),
  KEY `destinoPartida_idDestino` (`destinoPartida_idDestino`),
  CONSTRAINT `rutas_ibfk_1` FOREIGN KEY (`destinoLlegada_idDestino`) REFERENCES `destinos` (`idDestino`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rutas_ibfk_2` FOREIGN KEY (`destinoPartida_idDestino`) REFERENCES `destinos` (`idDestino`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `rutas` WRITE;
/*!40000 ALTER TABLE `rutas` DISABLE KEYS */;

INSERT INTO `rutas` (`idRuta`, `destinoLlegada_idDestino`, `destinoPartida_idDestino`)
VALUES
	(2,3,3),
	(3,5,4),
	(4,4,5),
	(5,4,5);

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
  `vueloHabilitado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idVuelo`),
  KEY `avion_idAvion` (`avion_idAvion`),
  KEY `ruta_idRuta` (`ruta_idRuta`),
  CONSTRAINT `vuelos_ibfk_1` FOREIGN KEY (`avion_idAvion`) REFERENCES `aviones` (`idAvion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vuelos_ibfk_2` FOREIGN KEY (`ruta_idRuta`) REFERENCES `rutas` (`idRuta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `vuelos` WRITE;
/*!40000 ALTER TABLE `vuelos` DISABLE KEYS */;

INSERT INTO `vuelos` (`idVuelo`, `costoVuelo`, `avion_idAvion`, `ruta_idRuta`, `vueloHabilitado`)
VALUES
	(1,342,2,2,b'1'),
	(3,555,4,3,b'1');

/*!40000 ALTER TABLE `vuelos` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
