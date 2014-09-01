-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 02-07-2014 a las 10:48:48
-- Versión del servidor: 5.5.8
-- Versión de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `shoppingmadrid`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE IF NOT EXISTS `areas` (
  `idArea` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `description_es` text COLLATE utf8_spanish_ci NOT NULL,
  `description_en` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idArea`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=95 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departmentstore`
--

CREATE TABLE IF NOT EXISTS `departmentstore` (
  `idDepartmentStore` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idDepartmentStore`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=20 ;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `level` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mall`
--

CREATE TABLE IF NOT EXISTS `mall` (
  `idMall` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL,
  `street` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `number` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `zip` int(11) NOT NULL,
  `idArea` int(11) NOT NULL,
  `web` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `metro` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `description_es` text COLLATE utf8_spanish_ci NOT NULL,
  `description_en` text COLLATE utf8_spanish_ci NOT NULL,
  `maps` text COLLATE utf8_spanish_ci,
  PRIMARY KEY (`idMall`),
  KEY `idArea` (`idArea`),
  KEY `street` (`street`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=36 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `markets`
--

CREATE TABLE IF NOT EXISTS `markets` (
  `idMarket` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL,
  `street` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `number` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `zip` int(11) NOT NULL,
  `idArea` int(11) NOT NULL,
  `web` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `metro` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `description_es` text COLLATE utf8_spanish_ci NOT NULL,
  `description_en` text COLLATE utf8_spanish_ci NOT NULL,
  `maps` text COLLATE utf8_spanish_ci,
  PRIMARY KEY (`idMarket`),
  KEY `street` (`street`),
  KEY `idArea` (`idArea`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shops`
--

CREATE TABLE IF NOT EXISTS `shops` (
  `idShop` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL,
  `idStreet` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `zip` int(11) NOT NULL,
  `idArea` int(11) NOT NULL,
  `metro` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `web` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `idType` int(11) NOT NULL,
  PRIMARY KEY (`idShop`),
  KEY `idStreet` (`idStreet`),
  KEY `idArea` (`idArea`),
  KEY `idType` (`idType`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=385 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stores`
--

CREATE TABLE IF NOT EXISTS `stores` (
  `idStore` int(11) NOT NULL AUTO_INCREMENT,
  `idStreet` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `zip` int(11) NOT NULL,
  `idArea` int(11) NOT NULL,
  `web` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `idDepartamentStore` int(11) NOT NULL,
  PRIMARY KEY (`idStore`),
  KEY `idStreet` (`idStreet`),
  KEY `idArea` (`idArea`),
  KEY `idDepartamentStore` (`idDepartamentStore`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Estructura de tabla para la tabla `streets`
--

CREATE TABLE IF NOT EXISTS `streets` (
  `idStreet` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `idArea` int(11) NOT NULL,
  PRIMARY KEY (`idStreet`),
  KEY `idArea` (`idArea`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=40 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typeshop`
--

CREATE TABLE IF NOT EXISTS `typeshop` (
  `idType` int(11) NOT NULL AUTO_INCREMENT,
  `name_es` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `name_en` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=23 ;