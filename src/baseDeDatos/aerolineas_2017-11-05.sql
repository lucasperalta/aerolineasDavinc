# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.20)
# Base de datos: aerolineas
# Tiempo de Generación: 2017-11-05 23:14:06 +0000
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
  `idAvion` int(8) NOT NULL,
  `marca` varchar(150) NOT NULL,
  `modelo` varchar(150) NOT NULL,
  `matricula` varchar(100) NOT NULL,
  `cantidadButacas` int(11) NOT NULL,
  PRIMARY KEY (`idAvion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Volcado de tabla butacas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `butacas`;

CREATE TABLE `butacas` (
  `idAvion` int(8) NOT NULL,
  `numeroButaca` int(11) NOT NULL,
  `disponibilidad` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Volcado de tabla destinos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `destinos`;

CREATE TABLE `destinos` (
  `idDestino` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(150) NOT NULL,
  `provincia` varchar(150) NOT NULL,
  `ciudad` varchar(150) NOT NULL,
  PRIMARY KEY (`idDestino`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `destinos` WRITE;
/*!40000 ALTER TABLE `destinos` DISABLE KEYS */;

INSERT INTO `destinos` (`idDestino`, `pais`, `provincia`, `ciudad`)
VALUES
	(1,'Argentina','buenos aires','ezeiza'),
	(2,'Argentina','cordoba','carlos paz');

/*!40000 ALTER TABLE `destinos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla EMPLOYEE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EMPLOYEE`;

CREATE TABLE `EMPLOYEE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `joining_date` date NOT NULL,
  `salary` double NOT NULL,
  `ssn` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ssn` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;

INSERT INTO `EMPLOYEE` (`id`, `name`, `joining_date`, `salary`, `ssn`)
VALUES
	(3,'dwd','2009-09-20',12,'1212'),
	(4,'as121212','8972-09-20',1212,'12121');

/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla pasajes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pasajes`;

CREATE TABLE `pasajes` (
  `idPasaje` int(6) NOT NULL AUTO_INCREMENT,
  `nombreCliente` varchar(200) NOT NULL,
  `apellidoCliente` varchar(200) NOT NULL,
  `dniCliente` int(10) NOT NULL,
  `butaca` int(10) NOT NULL,
  `vuelo` int(10) NOT NULL,
  PRIMARY KEY (`idPasaje`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Volcado de tabla rutas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rutas`;

CREATE TABLE `rutas` (
  `idRuta` int(8) NOT NULL,
  `destinoLlegada` varchar(150) NOT NULL,
  `destinoInicio` varchar(150) NOT NULL,
  PRIMARY KEY (`idRuta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Volcado de tabla usuario
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `idUsuario` int(8) NOT NULL,
  `nombreUsuario` varchar(150) NOT NULL,
  `apellidoUsuario` varchar(150) NOT NULL,
  `rolUsuario` varchar(150) NOT NULL,
  `nickUsuario` varchar(150) NOT NULL,
  `password` varchar(100) NOT NULL DEFAULT '',
  `emailUsuario` varchar(150) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;

INSERT INTO `usuario` (`idUsuario`, `nombreUsuario`, `apellidoUsuario`, `rolUsuario`, `nickUsuario`, `password`, `emailUsuario`)
VALUES
	(0,'lperalta','peralta','analista','lperalta','827ccb0eea8a706c4c34a16891f84e7b','lucas.peralta@gmail.com');

/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla vuelos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vuelos`;

CREATE TABLE `vuelos` (
  `idVuelo` int(8) NOT NULL,
  `idAvion` int(8) NOT NULL,
  `idRuta` int(8) NOT NULL,
  `costoVuelo` float NOT NULL,
  PRIMARY KEY (`idVuelo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
