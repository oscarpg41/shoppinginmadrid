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

--
-- Volcar la base de datos para la tabla `areas`
--

INSERT INTO `areas` (`idArea`, `name`, `description_es`, `description_en`) VALUES
(1, 'Serrano-Goya', 'Es, pues, de saber que este sobredicho hidalgo, los ratos que estaba ocioso, que eran los más del año, se daba a leer libros de caballerías, con tanta afición y gusto, que olvidó casi de todo punto el ejercicio de la caza, y aun la administración de su hacienda. Y llegó a tanto su curiosidad y desatino en esto, que vendió muchas hanegas de tierra de sembradura para comprar libros de caballerías en que leer, y así, llevó a su casa todos cuantos pudo haber dellos; y de todos, ningunos le parecían tan bien como los que compuso el famoso Feliciano de Silva, porque la claridad de su prosa y aquellas entricadas razones suyas le parecían de perlas, y más cuando llegaba a leer aquellos requiebros y cartas de desafíos, donde en muchas partes hallaba escrito: La razón de la sinrazón que a mi razón se hace, de tal manera mi razón enflaquece, que con razón me quejo de la vuestra fermosura. Y también cuando leía: ...los altos cielos que de vuestra divinidad divinamente con las estrellas os fortifican, y os hacen merecedora del merecimiento que merece la vuestra grandeza. ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tincidunt, orci vitae luctus vestibulum, lacus magna commodo tellus, nec porttitor ligula felis non orci. Fusce libero augue, tempor vitae massa a, lobortis blandit lorem. Nam eu quam diam. Vestibulum eros ipsum, venenatis eget posuere vitae, tristique a orci. Pellentesque id malesuada tellus, sit amet mattis nisl. Sed vitae feugiat nibh. Sed lacinia ultricies turpis, et vulputate augue. Aenean rhoncus, diam nec adipiscing consequat, dolor tortor dignissim risus, et commodo neque dolor a elit. Praesent mauris ligula, pharetra sed mi eget, vehicula pretium nisl. Ut vestibulum vestibulum pretium. Vestibulum non erat eget quam lacinia malesuada. Maecenas laoreet tellus sed felis rutrum molestie. Aliquam euismod ligula sit amet eros ullamcorper, eget elementum mi molestie. Suspendisse non nulla mi. Aenean et vulputate massa.'),
(2, 'Gran Vía', 'La Gran Vía es una de las principales calles de Madrid (España). Comienza en la calle de Alcalá y termina en la plaza de España. Es un importante hito en la ciudad desde su construcción a principios de siglo XX visto desde el punto de vista comercial, turístico y de ocio.\r\n El tramo comprendido entre la red de San Luis y la plaza de Callao alberga en la actualidad numerosas tiendas de cadenas internacionales de moda.', 'Ya desde mediados del siglo XIX se venía pensando en la apertura de una vía que comunicara el noroeste y el centro de la ciudad y facilitara el tránsito por el entramado de callejuelas que conformaban el centro histórico de la ciudad, abriéndolas así hacia el ensanche proyectado por Carlos María de Castro. En 1862, tras la reforma de la Puerta del Sol realizada cinco años antes y la posterior prolongación de la calle Preciados hasta la zona de la actual plaza de Callao, la Junta Consultiva de Policía y Ornato del Ayuntamiento elaboró un primer proyecto consistente en la prolongación de la citada calle hasta la plaza de San Marcial, donde actualmente se encuentra la Plaza de España, para lo que, entre 1862 y 1868 se crea la plaza de Callao.'),
(7, 'Fuencarral', 'Es, pues, de saber que este sobredicho hidalgo, los ratos que estaba ocioso, que eran los más del año, se daba a leer libros de caballerías, con tanta afición y gusto, que olvidó casi de todo punto el ejercicio de la caza, y aun la administración de su hacienda. Y llegó a tanto su curiosidad y desatino en esto, que vendió muchas hanegas de tierra de sembradura para comprar libros de caballerías en que leer, y así, llevó a su casa todos cuantos pudo haber dellos; y de todos, ningunos le parecían tan bien como los que compuso el famoso Feliciano de Silva, porque la claridad de su prosa y aquellas entricadas razones suyas le parecían de perlas, y más cuando llegaba a leer aquellos requiebros y cartas de desafíos, donde en muchas partes hallaba escrito: La razón de la sinrazón que a mi razón se hace, de tal manera mi razón enflaquece, que con razón me quejo de la vuestra fermosura. Y también cuando leía: ...los altos cielos que de vuestra divinidad divinamente con las estrellas os fortifican, y os hacen merecedora del merecimiento que merece la vuestra grandeza.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tincidunt, orci vitae luctus vestibulum, lacus magna commodo tellus, nec porttitor ligula felis non orci. Fusce libero augue, tempor vitae massa a, lobortis blandit lorem. Nam eu quam diam. Vestibulum eros ipsum, venenatis eget posuere vitae, tristique a orci. Pellentesque id malesuada tellus, sit amet mattis nisl. Sed vitae feugiat nibh. Sed lacinia ultricies turpis, et vulputate augue. Aenean rhoncus, diam nec adipiscing consequat, dolor tortor dignissim risus, et commodo neque dolor a elit. Praesent mauris ligula, pharetra sed mi eget, vehicula pretium nisl. Ut vestibulum vestibulum pretium. Vestibulum non erat eget quam lacinia malesuada. Maecenas laoreet tellus sed felis rutrum molestie. Aliquam euismod ligula sit amet eros ullamcorper, eget elementum mi molestie. Suspendisse non nulla mi. Aenean et vulputate massa.'),
(8, 'Preciados-Sol', 'Es, pues, de saber que este sobredicho hidalgo, los ratos que estaba ocioso, que eran los más del año, se daba a leer libros de caballerías, con tanta afición y gusto, que olvidó casi de todo punto el ejercicio de la caza, y aun la administración de su hacienda. Y llegó a tanto su curiosidad y desatino en esto, que vendió muchas hanegas de tierra de sembradura para comprar libros de caballerías en que leer, y así, llevó a su casa todos cuantos pudo haber dellos; y de todos, ningunos le parecían tan bien como los que compuso el famoso Feliciano de Silva, porque la claridad de su prosa y aquellas entricadas razones suyas le parecían de perlas, y más cuando llegaba a leer aquellos requiebros y cartas de desafíos, donde en muchas partes hallaba escrito: La razón de la sinrazón que a mi razón se hace, de tal manera mi razón enflaquece, que con razón me quejo de la vuestra fermosura. Y también cuando leía: ...los altos cielos que de vuestra divinidad divinamente con las estrellas os fortifican, y os hacen merecedora del merecimiento que merece la vuestra grandeza. ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tincidunt, orci vitae luctus vestibulum, lacus magna commodo tellus, nec porttitor ligula felis non orci. Fusce libero augue, tempor vitae massa a, lobortis blandit lorem. Nam eu quam diam. Vestibulum eros ipsum, venenatis eget posuere vitae, tristique a orci. Pellentesque id malesuada tellus, sit amet mattis nisl. Sed vitae feugiat nibh. Sed lacinia ultricies turpis, et vulputate augue. Aenean rhoncus, diam nec adipiscing consequat, dolor tortor dignissim risus, et commodo neque dolor a elit. Praesent mauris ligula, pharetra sed mi eget, vehicula pretium nisl. Ut vestibulum vestibulum pretium. Vestibulum non erat eget quam lacinia malesuada. Maecenas laoreet tellus sed felis rutrum molestie. Aliquam euismod ligula sit amet eros ullamcorper, eget elementum mi molestie. Suspendisse non nulla mi. Aenean et vulputate massa.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departmentstore`
--

CREATE TABLE IF NOT EXISTS `departmentstore` (
  `idDepartmentStore` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idDepartmentStore`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=20 ;

--
-- Volcar la base de datos para la tabla `departmentstore`
--

INSERT INTO `departmentstore` (`idDepartmentStore`, `name`) VALUES
(1, 'El Corte Inglés');

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

--
-- Volcar la base de datos para la tabla `login`
--

INSERT INTO `login` (`idUser`, `user`, `password`, `level`, `name`) VALUES
(1, 'operez', '1e226c260992b4ea447979cd9951ba44', 0, 'Oskar Pérez'),
(2, 'usuario1', '122b738600a0f74f7c331c0ef59bc34c', 1, 'Usuario de test'),
(3, 'admin', '21232f297a57a5a743894a0e4a801fc3', 0, 'Administrador');

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

--
-- Volcar la base de datos para la tabla `mall`
--

INSERT INTO `mall` (`idMall`, `name`, `street`, `number`, `zip`, `idArea`, `web`, `metro`, `description_es`, `description_en`, `maps`) VALUES
(21, 'La Vaguada', 'Monforte de Lemos', '36', 28029, 0, 'http://www.enlavaguada.com', 'Barrio del Pilar. Linea 9', 'El Centro Comercial La Vaguada se encuentra en el madrileño barrio del Pilar (distrito de Fuencarral-El Pardo). Fue el primer centro comercial que se abrió en la capital de España.', 'The Trough The Mall is located in the Madrid suburb of Pilar (district of Fuencarral-El Pardo). It was the first shopping mall that opened in the capital of Spain.', 'http://maps.google.es/maps?f=q&amp;source=s_q&amp;hl=es&amp;geocode=&amp;q=Avenida+Monforte+de+Lemos+36,+Madrid&amp;sll=40.396764,-3.713379&amp;sspn=8.29796,19.753418&amp;ie=UTF8&amp;hq=&amp;hnear=Av+de+Monforte+de+Lemos,+36,+28029+Madrid,+Comunidad+de+Madrid&amp;ll=40.480414,-3.708766&amp;spn=0.008095,0.01929&amp;z=16&amp;iwloc=A&amp;output=embed'),
(22, 'La Gavia', 'Adolfo Bioy Casares, 2 - Ensanche de Vallecas', '', 28051, 0, 'http://www.lagavia.es', 'Las Suertes. Linea 1', 'La Gavia te ofrece un ambiente cálido y confortable, donde todos los detalles harán de tu visita una experiencia agradable: más de 100.000 m2 de superficie comercial, 5000 plazas de parking gratuito, más de 160 establecimientos...', 'The Gavia gives you a warm and comfortable atmosphere, where every detail will make your visit a pleasant experience: more than 100,000 m2 of retail space, 5,000 free parking spaces, more than 160 shops...', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6079.901935846103!2d-3.5984978995815533!3d40.36561154607199!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd4224dc54e8fc7d%3A0xb1009c2c0b15d3ec!2sCalle+Adolfo+Bioy+Casares%2C+2!5e0!3m2!1ses!2s!4v1402311130787'),
(32, 'Principe Pío', 'Paseo de la Florida', '2', 28008, 0, 'http://www.principepio.es', 'Principe Pío. Líneas 6, 10 y Ramal Opera', 'El Centro Comercial Príncipe Pío está ubicado en un edificio histórico catalogado como edificio singular de Nivel 1 y máxima protección. Con más de 100 años de antigüedad, el edificio fue inaugurado como estación de tren, denominada la ''Estación del Norte'', en el año 1879. Todavía se puede observar ese nombre en nuestra fachada principal.', 'Príncipe Pío Shopping Centre is located in a historical building classified as a Level 1 singular building with maximum protection. With over 100 years old, the building was inaugurated as a railway station called the ''Estación del Norte'' in 1879.<br>Up until now, you can still see its name in our main façade.', '');

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

--
-- Volcar la base de datos para la tabla `markets`
--

INSERT INTO `markets` (`idMarket`, `name`, `street`, `number`, `zip`, `idArea`, `web`, `metro`, `description_es`, `description_en`, `maps`) VALUES
(3, 'Mercado de San Miguel', 'Plaza de San Miguel', 's/n', 28005, 0, 'http://www.mercadodesanmiguel.es', 'Puerta del Sol. Línea 1, 2 ,3', 'El Mercado de San Miguel es un lugar histórico y monumental, cargado de reminiscencias literarias. Emplazado en el corazón del Madrid castizo, se halla en la zona de mayor personalidad de la ciudad y mejor oferta comercial, cultural y de ocio.Ahora está escribiendo una nueva página de su historia con el objetivo de aglutinar a los mejores comerciantes, profesionales, expertos y entusiastas de sus respectivas especialidades.', 'The Mercado de San Miguel is a historic and monumental place, full of literary reminiscences. Located in the heart of old Madrid, is in the area of ??greatest personality of the city and best commercial, cultural and ocio.Ahora is writing a new page in its history with the aim of bringing together the best merchants, professionals, experts and enthusiasts in their particular fields.', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3037.695308160409!2d-3.708771399999999!3d40.41560019999999!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd422879216ac947%3A0x99261df34b769e00!2sPlaza+San+Miguel!5e0!3m2!1ses!2ses!4v1402329742252'),
(5, 'Mercado San Antón', 'Augusto Figueroa', '24', 28004, 0, 'http://www.mercadosananton.com', 'Chueca. Linea 5', 'Ubicado en pleno corazón del barrio más colorido de la capital, renace el mítico Mercado de San Antón con un diseño vanguardista y un concepto de cooking en el que prima el gusto por las ''delicatessens'' para degustar en el mismo lugar.  Uno de los puntos más innovadores del mercado es el restaurante de 400 m2 -situado en la tercera planta-, el cual promociona el lema ''tú elige cocina de mercado'', siempre con productos frescos y naturales propios de temporada, inspirados en la  cocina tradicional española con algunos toques internacionales.', 'Located in the heart of the most colorful district of the capital stands the legendary Mercado de San Antón with a modern design and a concept of cooking where the taste for premium ''delicatessens'' to taste in the same place. One of the innovative points in the market is the restaurant of 400 m2, located on the third floor-which touts the slogan ''you choose kitchen market'', provided with its own natural and fresh seasonal produce, inspired by traditional cuisine Spanish with some international touches.', 'http://maps.google.es/maps?f=q&amp;source=s_q&amp;hl=es&amp;geocode=&amp;q=C%2F+Augusto+Figueroa,+24,+28004+Madrid&amp;aq=&amp;sll=40.396764,-3.713379&amp;sspn=11.039548,23.269043&amp;ie=UTF8&amp;hq=&amp;hnear=Calle+de+Augusto+Figueroa,+24,+28004+Madrid,+Comunidad+de+Madrid&amp;ll=40.427022,-3.6975&amp;spn=0.013459,0.026565&amp;z=15&amp;iwloc=A&amp;output=embed'),
(6, 'Mercado de San Fernando', 'Embajadores', '41', 28012, 0, 'http://www.mercadodesanfernando.es/', 'Lavapi?s, Embajadores. Linea 3', 'El Mercado Municipal de San Fernando, se encuentra en el distrito 2, en el oficial barrio de Embajadores y de oficios barrio de Lavapi?s, en una zona con intensa actividad comercial debido a la proximidad de El Rastro -el mayor mercado ambulante de la ciudad-.', 'The Municipal Market of San Fernando is located in the 2nd district, in the official section of Ambassadors and crafts Lavapies, in an area with intense commercial activity due to the proximity of El Rastro, the largest street market in the city-.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3038.0581844404073!2d-3.703205299999968!3d40.40756179999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd4227d354211acb%3A0x37aa47ac357eef59!2sCalle+de+Embajadores%2C+41!5e0!3m2!1ses!2ses!4v1402333003292'),
(7, 'Mercado de San Ildefonso', 'Fuencarrall', '57', 28410, 0, '', 'Tribunal, gran Via', 'A mediados de mayo, arrancará esta nueva ‘plaza’ gastronómica en la madrileña calle Fuencarral, bajo un proyecto impulsado por la promotora Grupo Nivel 29. Será un espacio de 500 metros cuadrados distribuidos en tres plantas, con 18 puestos de comida y 3 barras de bebidas.', 'A mediados de mayo, arrancará esta nueva ‘plaza’ gastronómica en la madrileña calle Fuencarral, bajo un proyecto impulsado por la promotora Grupo Nivel 29. Será un espacio de 500 metros cuadrados distribuidos en tres plantas, con 18 puestos de comida y 3 barras de bebidas.', '');

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

--
-- Volcar la base de datos para la tabla `shops`
--

INSERT INTO `shops` (`idShop`, `name`, `idStreet`, `number`, `zip`, `idArea`, `metro`, `web`, `idType`) VALUES
(1, 'Chopard', 2, 51, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', '', 5),
(2, 'Bulgari', 2, 49, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', '', 5),
(3, 'Gucci', 2, 49, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', '', 4),
(23, 'Arturo Aguayo', 2, 108, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', 'http://www.aguayojoyeria.es', 5),
(13, 'I Love phone', 3, 115, 28009, 1, 'Goya, Linea 2 y 4', '', 11),
(12, 'Pradillo', 3, 117, 28009, 1, 'Goya, Linea 2 y 4', 'http://www.calzadospradillo.com', 7),
(14, 'Odalisca', 3, 113, 28009, 1, 'Goya, Linea 2 y 4', '', 12),
(15, 'El Ropero', 3, 113, 28009, 1, 'Goya, Linea 2 y 4', '', 13),
(16, 'D''etiqueta', 3, 121, 28009, 1, 'Goya, Linea 2 y 4', 'http://www.d-etiqueta.com/', 3),
(17, 'Chico', 3, 107, 28009, 1, 'Goya, Linea 2 y 4', '', 13),
(18, 'Prenatal', 3, 99, 28009, 1, 'Goya, Linea 2 y 4', '', 13),
(19, 'Prada', 3, 4, 28001, 1, 'Serrano, Linea 4', 'http://www.prada.com/es/store-locator/show/store.170.4.111.112', 3),
(20, 'Imaginarium', 2, 57, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', '', 7),
(21, 'Movistar', 2, 59, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', '', 11),
(22, 'Suarez', 2, 63, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', 'http://www.joyeriasuarez.com/', 5),
(24, 'Adolfo Dominguez', 2, 96, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', 'http://www.adolfodominguez.com/', 4),
(25, 'Gocco', 2, 96, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', '', 13),
(26, 'Zadig & Voltaire', 2, 92, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', '', 4),
(27, 'Pepe González', 2, 92, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', '', 2),
(28, 'Zara Home', 2, 88, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', '', 14),
(29, 'SoloIo', 2, 86, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', 'http://www.soloio.com/', 3),
(30, 'Zenana', 2, 86, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', '', 5),
(31, 'Nicol''s', 2, 86, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', 'http://www.nicols.es/', 5),
(32, 'Marella', 2, 82, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', '', 2),
(33, 'Troa', 2, 80, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', '', 15),
(34, 'Carmen Steffens', 2, 78, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', 'http://www.carmensteffens.com/es/', 2),
(35, 'Carrera & Carrera', 2, 76, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', 'http://www.carreraycarrera.com/', 5),
(36, 'Cartier', 2, 74, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', '', 5),
(37, 'Maika', 2, 76, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', '', 2),
(38, 'Pedro Muñoz', 2, 72, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', 'http://www.sastreriapedromunoz.com/', 3),
(39, 'Folgueras', 2, 72, 28001, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', 'http://www.folgueras.es/', 5),
(40, 'Alfredo Villalba', 2, 70, 28001, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', 'http://alfredovillalba.es/', 2),
(41, 'Lottusse', 2, 68, 28001, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', '', 2),
(42, 'Lladró', 2, 68, 28001, 1, 'Nuñez de Balboa y Ruben Darío (Linea 5). Serrano (Linea 4)', 'http://www.lladro.com/porcelana/boutique_madrid/', 12),
(43, 'Applecross pure cashmere', 2, 76, 28006, 1, 'Nuñez de Balboa y Ruben Darío (Linea 5). Serrano (Linea 4)', 'https://es-es.facebook.com/pages/applecross-pure-cashmere/256000711109804', 4),
(44, 'Mont Blanc', 2, 66, 28006, 1, 'Nuñez de Balboa y Ruben Darío (Linea 5). Serrano (Linea 4)', '', 12),
(45, 'Suarez', 2, 62, 28001, 1, 'Nuñez de Balboa y Ruben Darío (Linea 5). Serrano (Linea 4)', 'http://www.joyeriasuarez.com', 5),
(46, 'Wempe', 2, 58, 28001, 1, 'Serrano (Linea 4)', '', 5),
(47, 'Bodybell', 2, 58, 28001, 1, 'Serrano (Linea 4)', '', 9),
(48, 'Bravo Java', 2, 56, 28001, 1, 'Serrano, Linea 4', 'http://www.bravojava.net/', 7),
(49, 'Intimissimi', 2, 56, 28001, 1, 'Serrano (Linea 4)', '', 2),
(50, 'General Opticas', 2, 56, 28001, 1, 'Serrano, Linea 4', '', 6),
(51, 'Yusty', 2, 56, 28001, 1, 'Serrano (Linea 4)', '', 3),
(52, 'Guante Varade', 2, 54, 28001, 1, 'Serrano (Linea 4)', '', 2),
(53, 'Lurueña', 2, 54, 28001, 1, 'Serrano (Linea 4)', '', 2),
(54, 'Rigat', 2, 50, 28001, 1, 'Serrano (Linea 4)', '', 2),
(55, 'Zara', 2, 48, 28001, 1, 'Serrano (Linea 4)', '', 4),
(56, 'El Ganso', 2, 46, 28001, 1, 'Serrano (Linea 4)', '', 3),
(57, 'Tous', 2, 46, 28001, 1, 'Serrano (Linea 4)', '', 5),
(58, 'Aristocrazy', 2, 46, 28001, 1, 'Serrano (Linea 4)', '', 5),
(59, 'Emporio Armani', 2, 44, 28001, 1, 'Serrano (Linea 4)', '', 4),
(60, '7 For All Mankind ', 2, 46, 28001, 1, 'Serrano (Linea 4)', '', 4),
(61, 'Carlos Jiménez', 2, 44, 28001, 1, 'Serrano (Linea 4)', '', 5),
(62, 'Real Boutique', 2, 42, 28001, 1, 'Serrano (Linea 4)', '', 2),
(63, 'Gb Bravo', 2, 42, 28001, 1, 'Serrano (Linea 4)', '', 7),
(64, 'Cortefiel', 2, 40, 28001, 1, 'Serrano (Linea 4)', 'http://www.cortefiel.com', 2),
(65, 'Uterque', 2, 40, 28001, 1, 'Serrano (Linea 4)', '', 2),
(66, 'Carmina', 2, 74, 28006, 1, 'Nuñez de Balboa y Ruben Darío. Linea 5', '', 7),
(67, 'Perodri', 2, 17, 28001, 1, 'Serrano (Linea 4)', 'http://www.perodri.es/', 5),
(68, 'Loewe', 2, 26, 28001, 1, 'Serrano (Linea 4)', '', 4),
(69, 'Saint Laurent', 2, 34, 28001, 1, 'Serrano (Linea 4)', '', 2),
(70, 'Rabat', 2, 32, 28001, 1, 'Serrano (Linea 4)', '', 5),
(71, 'Michael Kors', 2, 32, 28001, 1, 'Serrano (Linea 4)', '', 2),
(72, 'Geox', 2, 30, 28001, 1, 'Serrano (Linea 4)', '', 7),
(73, 'Bdba', 2, 28, 28001, 1, 'Serrano (Linea 4)', '', 2),
(74, 'Purificación García', 2, 28, 28001, 1, 'Serrano (Linea 4)', '', 2),
(75, 'Prada', 2, 26, 28001, 1, 'Serrano (Linea 4)', '', 2),
(76, 'Loewe', 2, 26, 28001, 1, 'Serrano (Linea 4)', '', 2),
(77, 'Camper', 2, 24, 28001, 1, 'Serrano (Linea 4)', '', 7),
(78, 'Pedro del Hierro', 2, 24, 28001, 1, 'Serrano (Linea 4)', '', 4),
(79, 'Bimba & Lola', 2, 22, 28001, 1, 'Serrano (Linea 4)', '', 2),
(80, 'Coach', 2, 22, 28001, 1, 'Serrano (Linea 4)', '', 2),
(81, 'Freywille', 2, 20, 28001, 1, 'Serrano (Linea 4)', '', 5),
(82, 'Trucco', 2, 20, 28001, 1, 'Serrano (Linea 4)', '', 2),
(83, 'Longchamp', 2, 20, 28001, 1, 'Serrano (Linea 4)', '', 2),
(84, 'Max&Co', 2, 18, 28001, 1, 'Serrano (Linea 4)', '', 2),
(85, 'Hoss', 2, 18, 28001, 1, 'Serrano (Linea 4)', '', 2),
(86, 'Custo Barcelona', 2, 16, 28001, 1, 'Serrano (Linea 4)', '', 2),
(87, 'Carolina Herrera', 2, 14, 28001, 1, 'Retiro (Linea 2) Serrano (Linea 4) ', '', 2),
(88, 'Brooks Brothers', 2, 14, 28001, 1, 'Serrano (Linea 4)', '', 4),
(89, 'Diesel', 2, 14, 28001, 1, 'Retiro (Linea 2) Serrano (Linea 4) ', '', 4),
(90, 'Fernando Duran', 2, 8, 28001, 1, 'Retiro (Linea 2) Serrano (Linea 4) ', '', 5),
(91, 'Boggi', 2, 8, 28001, 1, 'Retiro (Linea 2) Serrano (Linea 4) ', '', 3),
(92, 'Ferrari Store', 2, 6, 28001, 1, 'Retiro (Linea 2) Serrano (Linea 4) ', '', 4),
(93, 'Guzmán', 2, 2, 28001, 1, 'Retiro (Linea 2)', 'http://www.trajesguzman.com/', 3),
(94, 'Superdry Store', 2, 3, 28001, 1, 'Retiro (Linea 2)', 'http://www.superdry.es/', 4),
(95, 'Massimo Dutti', 2, 17, 28006, 1, 'Serrano (Linea 4)', '', 3),
(96, 'Monica García', 2, 25, 28006, 1, 'Serrano (Linea 4)', '', 7),
(97, 'Punto Roma', 2, 19, 28006, 1, 'Serrano, Linea 4', '', 2),
(98, 'Ermenegildo Zegna', 2, 21, 28006, 1, 'Serrano (Linea 4)', '', 3),
(99, 'Ulloa Optico', 2, 21, 28006, 1, 'Serrano (Linea 4)', '', 6),
(100, 'Los Pérez', 2, 27, 28006, 1, 'Serrano (Linea 4)', '', 5),
(101, 'Agatha Ruiz de la Prada', 2, 27, 28001, 1, 'Serrano (Linea 4)', 'http://www.agatharuizdelaprada.com/', 2),
(102, 'Zara', 2, 23, 28001, 1, 'Serrano (Linea 4)', '', 4),
(103, 'Best', 2, 27, 28001, 1, 'Serrano (Linea 4)', '', 3),
(104, 'Cortefiel', 2, 29, 28001, 1, 'Serrano (Linea 4)', 'http://www.cortefiel.com/', 3),
(105, 'Pronovias', 2, 31, 28006, 1, 'Serrano (Linea 4)', 'http://www.pronovias.es/', 2),
(106, 'Roberto Verino', 2, 33, 28001, 1, 's', 'http://www.robertoverino.com', 4),
(107, 'Javier Simorra', 2, 33, 28001, 1, 'Serrano (Linea 4)', 'http://www.simorra.com', 2),
(108, 'Mac', 3, 15, 28014, 1, 'Serrano (Linea 4)', 'http://www.maccosmetics.es/', 8),
(109, 'Di Dom', 3, 17, 28001, 1, 'Serrano (Linea 4)', 'http://www.didom.es/', 7),
(110, 'Julia y Belén', 3, 17, 28001, 1, 'Serrano (Linea 4)', 'http://www.juliaybelen.com/', 5),
(111, 'Pretty Ballerinas', 3, 17, 28001, 1, 'Serrano (Linea 4)', 'http://www.prettyballerinas.es', 7),
(112, 'SoloIo', 3, 17, 28001, 1, 'Serrano (Linea 4)', 'https://www.soloio.com/', 3),
(113, 'Be rich', 3, 19, 28001, 1, 'Serrano (Linea 4)', 'http://www.berich.es', 5),
(114, 'Durán', 3, 19, 28001, 1, 'Serrano (Linea 4)', 'http://www.duranmadrid.com/', 5),
(115, 'Orange', 3, 21, 28001, 1, 'Serrano (Linea 4)', '', 11),
(116, 'Rituals', 3, 23, 28001, 1, 'Serrano (Linea 4)', 'http://www.rituals.com', 8),
(117, 'H.E. by MANGO', 3, 23, 28001, 1, 'Serrano (Linea 4)', 'http://shop.mango.com/ES/hebymango', 3),
(118, 'Montejo', 3, 25, 28001, 1, 'Serrano (Linea 4)', 'http://www.montejojoyeros.es', 5),
(119, 'Tous', 3, 27, 28001, 1, 'Serrano (Linea 4)', 'http://www.tous.com/', 5),
(120, 'Aristocrazy', 3, 27, 28001, 1, 'Serrano (Linea 4)', 'http://www.aristocrazy.com', 5),
(121, 'Yanes', 3, 27, 28001, 1, 'Serrano (Linea 4)', 'http://www.yanes.es/', 5),
(122, 'Cortefiel', 3, 29, 28001, 1, 'Serrano, Velázquez (Linea 4)', 'http://www.cortefiel.com/', 4),
(123, 'Vision Lab', 3, 37, 28001, 1, 'Velázquez (Linea 4)', '', 6),
(124, 'Hakei', 3, 39, 28001, 1, 'Velázquez (Linea 4)', 'http://www.hakei.com/', 2),
(125, 'Outing', 3, 43, 28001, 1, 'Velázquez (Linea 4)', '', 7),
(126, 'Kiko', 3, 43, 28001, 1, 'Velázquez (Linea 4)', 'http://www.kikocosmetics.com/', 8),
(127, 'Antonio Parriego', 3, 47, 28001, 1, 'Velázquez (Linea 4)', '', 7),
(128, 'Zara', 3, 47, 28001, 1, 'Velázquez (Linea 4)', 'http://www.zara.com', 2),
(129, 'Etam', 3, 49, 28001, 1, 'Velázquez (Linea 4)', 'http://www.etam.com/', 2),
(130, 'Massimo Dutti', 3, 49, 28001, 1, 'Velázquez (Linea 4)', 'http://www.massimodutti.com/', 2),
(131, 'Women'' secret', 3, 51, 28001, 1, 'Velázquez (Linea 4)', 'http://womensecret.com/', 2),
(132, 'Juteco', 3, 51, 28001, 1, 'Velázquez (Linea 4)', 'http://www.juteco.es', 9),
(133, 'Lot of colors', 3, 53, 28001, 1, 'Velázquez (Linea 4)', '', 1),
(134, 'Nicol''s', 3, 55, 28001, 1, 'Velázquez (Linea 4)', 'http://www.nicols.es/', 5),
(135, 'Iris', 3, 57, 28001, 1, 'Velázquez (Linea 4)', '', 7),
(136, 'Parfois', 3, 57, 28001, 1, 'Velázquez (Linea 4)', 'http://www.parfois.com/', 2),
(137, 'Suite Blanco', 3, 59, 28001, 1, 'Velázquez (Linea 4)', 'http://www.blanco.com/', 2),
(138, 'Ontop', 3, 59, 28001, 1, 'Velázquez (Linea 4)', '', 2),
(139, 'Diez', 3, 61, 28001, 1, 'Velázquez (Linea 4)', '', 7),
(140, 'Springfield', 3, 63, 28001, 1, 'Velázquez (Linea 4)', 'http://spf.com', 3),
(141, 'United Colors of Benetton', 3, 63, 28001, 1, 'Velázquez (Linea 2), Goya (Linea 2 y 4)', 'http://es.benetton.com/index.html', 4),
(142, 'Oysho', 3, 67, 28001, 1, 'Velázquez (Linea 2), Goya (Linea 2 y 4)', 'http://www.oysho.com/', 2),
(143, 'Swatch', 3, 69, 28001, 1, 'Velázquez (Linea 2), Goya (Linea 2 y 4)', 'http://www.swatch.com/', 5),
(144, 'Sunglass hut', 3, 71, 28001, 1, 'Velázquez (Linea 2), Goya (Linea 2 y 4)', 'http://www.sunglasshut.com/', 6),
(145, 'Massimo Dutti', 3, 73, 28001, 1, 'Goya (Linea 2 y 4)', 'http://www.massimodutti.com/', 3),
(146, 'Promod', 3, 73, 28001, 1, 'Goya (Linea 2 y 4)', 'http://www.promod.es/', 4),
(147, 'Calzedonia', 3, 73, 28001, 1, 'Goya (Linea 2 y 4)', 'http://www.calzedonia.com/', 2),
(148, 'Trucco', 3, 75, 28001, 1, 'Goya (Linea 2 y 4)', 'http://truccoshop.com/', 2),
(149, 'L''Occitane', 3, 77, 28001, 1, 'Goya (Linea 2 y 4)', 'http://www.loccitane.com/', 8),
(150, 'Real Madrid Store', 3, 77, 28001, 1, 'Goya (Linea 2 y 4)', 'http://www.realmadridshop.com/', 1),
(151, 'H&M', 3, 81, 28001, 1, 'Goya (Linea 2 y 4)', 'http://www.hm.com', 4),
(152, 'Mango', 3, 83, 28001, 1, 'Goya (Linea 2 y 4)', 'http://www..mango.com/', 2),
(153, 'Gilgo', 3, 83, 28001, 1, 'Goya (Linea 2 y 4)', 'https://www.gilgo.es/', 9),
(154, 'Antonio Rivas', 3, 85, 28001, 1, 'Goya, Linea 2 y 4', '', 2),
(155, 'Asensio Medias', 3, 85, 28001, 1, 'Goya (Linea 2 y 4)', '', 2),
(156, 'Yves Rocher', 3, 85, 28001, 1, 'Goya (Linea 2 y 4)', 'http://www.yves-rocher.com/', 8),
(157, 'Sfera', 3, 89, 28001, 1, 'Goya (Linea 2 y 4)', 'http://www.sfera.eu/', 4),
(158, 'Springfield', 3, 95, 28001, 1, 'Goya (Linea 2 y 4)', 'http://spf.com/', 4),
(159, 'Intimissimi', 3, 95, 28009, 1, 'Goya (Linea 2 y 4)', 'http://www.intimissimi.com/', 2),
(160, 'Kaprice', 3, 86, 28009, 1, 'Goya (Linea 2 y 4)', 'http://www.kapricecollection.com/', 4),
(161, 'Eva Novias', 3, 84, 28009, 1, 'Goya (Linea 2 y 4)', 'http://www.evanovias.com/', 2),
(162, 'Marco Magliotti', 3, 84, 28009, 1, 'Goya (Linea 2 y 4)', 'http://marcomagliotti.com/', 3),
(163, 'Pavillon', 3, 84, 28009, 1, 'Goya (Linea 2 y 4)', '', 12),
(164, 'Rosi', 3, 84, 28009, 1, 'Goya (Linea 2 y 4)', '', 9),
(165, 'Chatelaine', 3, 84, 28009, 1, 'Goya (Linea 2 y 4)', 'http://www.chatelaine.es/', 2),
(166, 'Pitter', 3, 82, 28009, 1, 'Goya (Linea 2 y 4)', '', 13),
(167, 'Strover', 3, 64, 28009, 1, 'Goya (Linea 2 y 4)', 'http://www.strover.es/', 2),
(168, 'Mario Gretto', 3, 58, 28001, 1, 'Goya (Linea 2 y 4)', 'http://www.mariogretto.com/', 3),
(169, 'Lola Hurtado', 3, 56, 28001, 1, 'Goya (Linea 2 y 4)', 'http://www.lolahurtado.com/', 2),
(170, 'Supporter Shop', 3, 50, 28001, 1, 'Goya (Linea 2 y 4)', 'http://www.supportershop.es/', 1),
(171, 'Los caprichos de Goya', 3, 50, 28001, 1, 'Goya (Linea 2 y 4)', 'http://www.caprichosdegoya.com/', 12),
(172, 'Hosten', 3, 48, 28001, 1, 'Goya (Linea 2 y 4)', 'http://www.hostenshop.com/', 12),
(173, '1 para mí', 3, 46, 28001, 1, 'Velázquez(Linea 4), Goya (Linea 2 y 4)', 'http://www.1parami.com/', 12),
(174, 'Multiópticas', 3, 44, 28001, 1, 'Velázquez(Linea 4), Goya (Linea 2 y 4)', 'http://www.multiopticas.com/', 6),
(175, 'K-tuin', 3, 44, 28001, 1, 'Velázquez(Linea 4), Goya (Linea 2 y 4)', 'http://www.k-tuin.com/', 16),
(176, 'Fine watches & diamonds', 3, 40, 28001, 1, 'Velázquez (Linea 4)', '', 5),
(177, 'Pilar Prieto', 3, 40, 28001, 1, 'Velázquez (Linea 4)', 'http://www.pilarprieto.net/', 2),
(178, 'Menbur - The Shoes Collection', 3, 38, 28001, 1, 'Velázquez (Linea 4)', 'http://theshoescollection.com/zapatos-menbur.html', 7),
(179, 'Layda', 3, 34, 28001, 1, 'Velázquez (Linea 4)', 'http://www.laydamoda.com/', 2),
(180, 'Movistar', 3, 32, 28001, 1, 'Velázquez (Linea 4)', '', 11),
(181, 'Aires', 3, 30, 28001, 1, 'Velázquez (Linea 4)', 'http://www.aires.es', 8),
(182, 'C''est Possible', 3, 30, 28001, 1, 'Velázquez (Linea 4)', 'http://www.cestpossible.com.es', 2),
(183, 'Azucena Avila', 3, 28, 28001, 1, 'Velázquez (Linea 4)', '', 2),
(184, 'Zilian', 3, 22, 28001, 1, 'Velázquez (Linea 4)', '', 7),
(185, 'Tiger', 3, 20, 28001, 1, 'Velázquez (Linea 4)', 'http://www.tiger-stores.es/', 12),
(186, 'Rumbo', 3, 20, 28001, 1, 'Velázquez (Linea 4)', 'http://www.calzadosrumbo.com/', 7),
(187, 'Pilar Burgos', 3, 18, 28001, 1, 'Velázquez (Linea 4)', 'http://www.pilarburgos.com/', 7),
(188, 'Nicol''s', 3, 12, 28001, 1, 'Serrano (Linea 4)', 'http://www.nicols.es/', 5),
(189, 'Titto Bluni', 3, 12, 28001, 1, 'Serrano (Linea 4)', 'http://www.tittobluni.com/', 3),
(190, 'Muji', 3, 9, 28001, 1, 'Serrano (Linea 4)', 'http://www.muji.es/', 14),
(191, 'Salvatore Ferragamo', 2, 36, 28001, 1, 'Serrano (Linea 4)', 'http://www.ferragamo.com/', 7),
(192, 'Max Mara', 2, 38, 28001, 1, 'Serrano (Linea 4)', 'http://www.maxmara.com/', 2),
(193, 'Marina Rinaldi', 2, 38, 28001, 1, 'Serrano (Linea 4)', '', 2),
(195, 'Bravo Java', 4, 54, 28013, 2, 'Gran Vía (Linea 1 y 5), Sevilla (Linea 2)', 'http://www.bravojava.net/', 7),
(196, 'Iris', 4, 43, 28013, 2, 'Santo Domingo (Linea 2), Callao (Linea 3 y 5)', 'http://www.calzadosiris.com', 7),
(197, 'Carmina Shoemaker,', 4, 58, 28013, 2, 'Santo Domingo (Linea 2), Callao (Linea 3 y 5)', 'http://www.carminashoemaker.com/', 7),
(198, 'Adela Gil', 4, 56, 28013, 2, 'Santo Domingo (Linea 2), Callao (Linea 3 y 5)', 'http://www.adelagil.es/', 7),
(199, 'Ale-Hop', 4, 16, 28013, 2, 'Gran Vía (Linea 1 y 5), Sevilla (Linea 2), Banco España (Linea 2)', 'http://www.ale-hop.org/', 4),
(200, 'Multi-Ópticas', 4, 15, 28013, 2, 'Gran Vía (Linea 1 y 5), Sevilla (Linea 2)', 'http://www.multiopticas.com/', 6),
(206, 'Mango', 4, 32, 28013, 2, 'Gran Vía (Linea 1 y 5), Callao (Linea 3 y 5)', 'http://www.mango.com', 2),
(207, 'Lefties', 4, 32, 28013, 2, 'Gran Vía (Linea 1 y 5), Callao (Linea 3 y 5)', 'http://www.lefties.com/', 2),
(202, 'Tusso', 4, 26, 28013, 2, 'Gran Vía (Linea 1 y 5), Sevilla (Linea 2)', 'http://www.tusso.es/', 17),
(203, 'Sfera', 4, 30, 28013, 2, 'Gran Vía (Linea 1 y 5)', 'http://www.sfera.com/', 4),
(204, 'Stradivarius', 4, 30, 28013, 2, 'Gran Vía (Linea 1 y 5), Callao (Linea 3 y 5)', 'http://www.stradivarius.com/', 2),
(205, 'H&M', 4, 32, 28013, 2, 'Gran Vía (Linea 1 y 5), Callao (Linea 3 y 5)', 'http://www.hm.com', 4),
(208, 'Zara', 4, 34, 28013, 2, 'Gran Vía (Linea 1 y 5), Callao (Linea 3 y 5)', 'http://www.zara.com', 4),
(209, 'Jules', 4, 38, 28013, 2, 'Gran Vía (Linea 1 y 5), Callao (Linea 3 y 5)', 'http://www.jules.com/', 3),
(210, 'Nike', 4, 38, 28013, 2, 'Gran Vía (Linea 1 y 5), Callao (Linea 3 y 5)', 'http://store.nike.com/', 1),
(211, 'Springfield', 4, 40, 28013, 2, 'Callao (Linea 3 y 5), Gran Vía (Linea 1 y 5)', 'http://spf.com/', 4),
(212, 'Orange', 4, 44, 28013, 2, 'Callao (Linea 3 y 5), Gran Vía (Linea 1 y 5)', 'http://www.orange.com/', 11),
(213, 'Women''secret', 4, 46, 28013, 2, 'Callao (Linea 3 y 5)', 'http://womensecret.com/', 18),
(214, 'C&A', 4, 48, 28013, 2, 'Callao (Linea 3 y 5)', 'http://www.c-and-a.com/', 4),
(215, 'Geox', 4, 50, 28013, 2, 'Callao (Linea 3 y 5)', 'http://www.geox.com/', 7),
(216, 'Camper', 4, 54, 28013, 2, 'Santo Domingo (Linea 2), Callao (Linea 3 y 5)', 'http://www.camper.com/', 7),
(217, 'Lurueña', 4, 60, 28013, 2, 'Santo Domingo (Linea 2), Callao (Linea 3 y 5)', 'http://www.luruena.es/', 7),
(218, 'Clarks', 4, 68, 28013, 2, 'Santo Domingo (Linea 2), Callao (Linea 3 y 5), Pz. España (Linea3)', 'http://www.clarks.com/', 7),
(219, 'National Geographic', 4, 74, 28013, 2, 'Pz. España (Linea3)', 'http://www.ngmadridstore.com/madrid.html', 4),
(220, 'Springfield', 4, 76, 28013, 2, 'Pz. España (Linea3)', 'http://spf.com/', 4),
(221, 'Camiseria Hernando', 4, 71, 28013, 2, 'Pz. España (Linea3)', '', 4),
(222, 'Salvador Bachiller', 4, 65, 28013, 2, 'Pz. España (Linea3)', 'http://www.salvadorbachiller.com/', 19),
(223, 'Movistar', 4, 59, 28013, 2, 'Santo Domingo (Linea 2), Callao (Linea 3 y 5), Pz. España (Linea3)', 'http://www.movistar.es/', 11),
(224, 'Telecor', 4, 59, 28013, 2, 'Santo Domingo (Linea 2), Callao (Linea 3 y 5), Pz. España (Linea3)', 'https://www.telecor.es/', 11),
(225, 'Camille Lucie', 4, 57, 28013, 2, 'Santo Domingo (Linea 2), Callao (Linea 3 y 5), Pz. España (Linea3)', 'http://www.camille-lucie.com/', 17),
(226, 'Lacoste', 4, 51, 28013, 2, 'Santo Domingo (Linea 2), Callao (Linea 3 y 5)', 'http://www.lacoste.com/', 4),
(227, 'Bodybell', 4, 51, 28013, 2, 'Santo Domingo (Linea 2), Callao (Linea 3 y 5)', 'http://www.bodybell.com/', 9),
(228, 'Rustarazo', 4, 49, 28013, 2, 'Santo Domingo (Linea 2), Callao (Linea 3 y 5)', '', 19),
(229, 'Jacinto Rodriguez', 4, 29, 28013, 2, 'Santo Domingo (Linea 2), Callao (Linea 3 y 5)', 'http://www.peleteriasjacintorodriguez.es', 20),
(230, 'Blanco', 4, 49, 28013, 2, 'Santo Domingo (Linea 2), Callao (Linea 3 y 5)', 'http://www.blanco.com/', 2),
(231, 'Tiendas asi', 4, 47, 28013, 2, 'Santo Domingo (Linea 2), Callao (Linea 3 y 5)', 'http://www.tiendas-asi.com/', 21),
(232, 'Madrid Souvenirs.com', 4, 45, 28013, 2, 'Callao (Linea 3 y 5)', 'http://www.madridsouvenirs.com/', 10),
(233, 'Alain Afflelou', 4, 45, 28013, 2, 'Callao (Linea 3 y 5)', 'http://www.alainafflelou.es/', 6),
(234, 'Lladró', 4, 43, 28013, 2, 'Callao (Linea 3 y 5)', 'http://www.lladro.com/', 12),
(235, ' United Colors of Benetton', 4, 41, 28013, 2, 'Callao (Linea 3 y 5)', 'http://es.benetton.com/', 4),
(236, 'Ulanka', 4, 39, 28013, 2, 'Callao (Linea 3 y 5)', 'http://www.ulanka.com/', 7),
(237, 'Swarovsky', 4, 39, 28013, 2, 'Callao (Linea 3 y 5)', 'http://www.swarovski.com/', 5),
(238, 'H&M', 4, 37, 28013, 2, 'Callao (Linea 3 y 5)', 'http://www.hm.com/es/', 2),
(239, 'Punto Roma', 4, 33, 28013, 2, 'Callao (Linea 3 y 5)', 'http://www.puntroma.com/', 2),
(240, 'Light Luxuria', 4, 33, 28013, 2, 'Callao (Linea 3 y 5)', '', 5),
(241, 'Desigual', 4, 33, 28013, 2, 'Callao (Linea 3 y 5)', 'http://www.desigual.com/â??', 4),
(242, 'Oysho', 4, 33, 28013, 2, 'Callao (Linea 3 y 5)', 'http://www.oysho.com', 18),
(243, 'Pull & Bear', 4, 31, 28013, 2, 'Callao (Linea 3 y 5)', 'http://www.pullandbear.com', 4),
(244, 'Real Madrid Store', 4, 31, 28013, 2, 'Callao (Linea 3 y 5)', 'http://www.realmadridshop.com/', 1),
(245, 'La Casa del libro', 4, 29, 28013, 2, 'Callao (Linea 3 y 5), Gran Vía (Linea 1 y 5)', 'http://www.casadellibro.com/', 15),
(246, 'Yves Rocher', 4, 29, 28013, 2, 'Gran Vía (Linea 1 y 5), Callao (Linea 3 y 5)', 'http://www.yves-rocher.com/', 8),
(247, 'Cortefiel', 4, 27, 28013, 2, 'Gran Vía (Linea 1 y 5), Callao (Linea 3 y 5)', 'http://cortefiel.com/', 4),
(248, 'Julián López', 4, 27, 28013, 2, 'Gran Vía (Linea 1 y 5)', 'http://www.julianlopez.es', 14),
(249, 'Kiko (make up Milano)', 4, 27, 28013, 2, 'Gran Vía (Linea 1 y 5)', 'http://www.kikocosmetics.es/', 8),
(250, 'Bershka', 4, 27, 28013, 2, 'Gran Vía (Linea 1 y 5)', 'http://www.bershka.com', 4),
(251, 'Union Suiza Vendrell', 4, 26, 28013, 2, 'Gran Vía (Linea 1 y 5)', 'http://www.unionsuiza.com/', 5),
(252, 'Zapatos LG', 4, 11, 28013, 2, 'Gran Vía (Linea 1 y 5), Sevilla (Linea 2)', 'http://www.zapatoslg.com/', 19),
(253, 'Sanz', 4, 7, 28013, 2, 'Gran Vía (Linea 1 y 5) , Sevilla (Linea 2)', 'http://www.joyas-diseno.com/', 5),
(254, 'Loewe', 4, 8, 28013, 2, 'Gran Vía (Linea 1 y 5), Sevilla (Linea 2)', 'http://www.loewe.com/', 4),
(255, 'Grassy', 4, 1, 28013, 2, 'Gran Vía (Linea 1 y 5), Sevilla (Linea 2)', 'http://www.grassy.es/', 5),
(256, 'Futbol detup', 4, 2, 28013, 2, 'Sevilla - Banco de España (Linea 2)', 'http://www.futboldetup.com', 1),
(257, 'Lanas Alondra', 6, 1, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3)', 'http://www.lanasalondra.com/', 12),
(258, 'Coimbra', 6, 2, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3)', '', 7),
(259, 'Rosa Clará', 6, 5, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3)', 'http://www.rosaclara.es', 2),
(260, 'Pronovias', 6, 3, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3)', 'http://www.pronovias.es/', 2),
(261, 'La Cibeles', 6, 5, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3)', '', 10),
(262, 'Hakei', 6, 8, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3)', 'http://www.hakei.com/', 2),
(263, 'Yves Rocher', 6, 8, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3)', 'http://www.yves-rocher.es', 8),
(264, 'Desigual', 6, 11, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3)', 'http://www.desigual.com', 2),
(265, 'Etam', 4, 12, 28013, 2, 'Puerta del Sol (Linea 1, 2 y 3)', 'http://www.etam.es/', 18),
(266, 'Women''secret', 6, 9, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3)', 'http://womensecret.com/', 18),
(267, 'Circus Woman', 6, 14, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', '', 2),
(268, 'Punto Roma', 6, 16, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', 'http://www.puntroma.com', 2),
(269, 'Soccer Shop', 6, 0, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', 'http://www.madridsoccershop.com/', 1),
(270, 'Summun ', 6, 16, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', '', 7),
(271, 'Celio*', 6, 16, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', 'http://www.celio.com', 3),
(272, 'Misako', 6, 18, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', 'http://www.misako.com/', 19),
(273, 'Lot of colors', 6, 18, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', '', 1),
(274, 'Lola Rey', 6, 15, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', 'http://www.lolarey.com/', 7),
(275, 'Havaianas', 6, 15, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', '', 7),
(276, 'Tiendas asi', 6, 20, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', 'http://www.tiendas-asi.com/', 21),
(277, 'Esteve shoes', 6, 20, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', '', 7),
(278, 'Aerosoles', 6, 22, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', '', 7),
(279, 'Geox', 6, 19, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', 'http://www.geox.com', 7),
(280, 'Mango', 6, 24, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', 'http://www.mango.com', 2),
(281, 'Amichi', 6, 28, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', 'http://www.amichi.es/', 4),
(282, 'K-tuin', 6, 21, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', 'http://www.k-tuin.com/', 16),
(283, 'Sara Saenz', 6, 26, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', '', 7),
(284, 'Clarks', 6, 19, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', 'Http://www.clarks.es', 7),
(285, 'Madrid y Olé', 6, 21, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', '', 10),
(286, 'The extreme collection', 6, 26, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', 'http://www.theextremecollection.com/', 4),
(287, 'Padilla', 6, 26, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', '', 9),
(288, 'Natura', 6, 23, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', 'https://www.naturaselection.com/', 14),
(289, 'Cremades', 6, 20, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', '', 7),
(290, 'Futbol Shop', 6, 26, 28013, 8, 'Puerta del Sol (Linea 1, 2 y 3), Opera (Linea 2, 5 Ramal Norte)', '', 1),
(291, 'Apple', 38, 1, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3)', 'http://store.apple.com', 16),
(292, 'Vodafone', 38, 13, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3)', 'http://www.vodafone.es/', 11),
(293, 'Sephora', 38, 3, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3)', 'http://www.sephora.com/', 8),
(294, 'Mary Paz', 38, 4, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3)', 'http://www.marypaz.com', 7),
(295, 'Futbol Mania', 38, 5, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3)', 'http://www.futbolmanianet.com/', 1),
(296, 'Orange', 38, 12, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3)', 'http://www.orange.es', 11),
(297, 'Nuevos Guerrilleros', 38, 5, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3)', 'http://www.nuevosguerrilleros.com/', 7),
(298, 'Topshop', 38, 6, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3)', 'http://www.topshop.com/', 2),
(299, 'Casa de Diego', 38, 12, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3)', '', 19),
(300, 'Sol Souvenirs', 38, 3, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3)', '', 10),
(301, 'Du pareil', 38, 6, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3)', 'http://tiendasropainfantil.dpam.com', 13),
(302, 'Cortefiel', 38, 11, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3)', 'http://www.cortefiel.com', 4),
(303, 'Souvenirs', 38, 0, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3)', '', 10),
(304, 'Desigual', 5, 25, 28013, 8, 'Callao (Linea 3 y 5), Sol-Vodafone (Linea 1, 2 y 3)', 'http://www.desigual.com', 4),
(305, 'The Phone House', 5, 23, 28013, 8, 'Callao (Linea 3 y 5), Sol-Vodafone (Linea 1, 2 y 3)', 'http://www.phonehouse.es/', 11),
(306, 'Camper', 5, 23, 28013, 8, 'Callao (Linea 3 y 5), Sol-Vodafone (Linea 1, 2 y 3)', 'http://www.camper.com', 7),
(307, 'Geox', 5, 23, 28013, 8, 'Callao (Linea 3 y 5), Sol-Vodafone (Linea 1, 2 y 3)', 'http://www.geox.com', 7),
(308, 'Six Shop', 5, 23, 28013, 8, 'Callao (Linea 3 y 5), Sol-Vodafone (Linea 1, 2 y 3)', '', 17),
(309, 'Tacones', 5, 21, 28013, 8, 'Callao (Linea 3 y 5), Sol-Vodafone (Linea 1, 2 y 3)', '', 7),
(310, 'The Phone House', 5, 19, 28013, 8, 'Callao (Linea 3 y 5), Sol-Vodafone (Linea 1, 2 y 3)', 'http://www.phonehouse.es/', 11),
(311, 'Foot Locker', 5, 17, 28013, 8, 'Callao (Linea 3 y 5), Sol-Vodafone (Linea 1, 2 y 3)', 'http://www.footlocker.eu', 1),
(312, 'Fauna', 5, 15, 28013, 8, 'Callao (Linea 3 y 5), Sol-Vodafone (Linea 1, 2 y 3)', '', 2),
(313, 'Atrezzo', 5, 15, 28013, 8, 'Callao (Linea 3 y 5), Sol-Vodafone (Linea 1, 2 y 3)', '', 3),
(314, 'Simbolo', 5, 13, 28013, 8, 'Callao (Linea 3 y 5), Sol-Vodafone (Linea 1, 2 y 3)', '', 2),
(315, 'Springfield', 5, 13, 28013, 8, 'Callao (Linea 3 y 5), Sol-Vodafone (Linea 1, 2 y 3)', 'http://www.spf.com', 4),
(316, 'Swatch', 5, 24, 28013, 8, 'Callao (Linea 3 y 5), Sol-Vodafone (Linea 1, 2 y 3)', 'http://shop.swatch.com/', 5),
(317, 'Madrid Souvenirs.com', 5, 11, 28013, 8, 'Callao (Linea 3 y 5), Sol-Vodafone (Linea 1, 2 y 3)', 'http://www.madridsouvenirs.com/', 10),
(318, 'Touch', 5, 24, 28013, 8, 'Callao (Linea 3 y 5), Sol-Vodafone (Linea 1, 2 y 3)', 'http://touchcomplements.com/', 17),
(319, 'Vivar', 5, 11, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', '', 19),
(320, 'General Óptica', 5, 24, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', 'http://www.generaloptica.es/', 6),
(321, 'German Joyero', 5, 11, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', 'http://www.gayubo.com/es/german-joyero', 5),
(322, 'Calzedonia', 5, 11, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', 'http://www.calzedonia.it/es/', 2),
(323, 'Artesania Reyes', 5, 11, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', '', 22),
(324, 'Bershka', 5, 20, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', 'http://www.bershka.com', 2),
(325, 'Zara', 5, 18, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', 'http://www.zara.com', 4),
(326, 'El Danubio Azul', 5, 9, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', '', 4),
(327, 'Tierra', 5, 16, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', 'http://www.amigosdetierra.com/', 22),
(328, 'Parma', 5, 16, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', '', 2),
(329, 'Desigual', 5, 7, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', 'http://www.desigual.com', 2),
(330, 'Bijou Brigitte', 5, 7, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', 'http://www.group.bijou-brigitte.com', 17),
(331, 'Parfois', 5, 7, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', 'http://www.parfois.com', 17),
(332, 'Stradivarious', 5, 14, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', 'http://www.stradivarius.com', 2),
(333, 'Sport 2000', 5, 7, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', '', 3),
(334, 'H&M', 5, 6, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', 'http://www.hm.com/', 4),
(335, 'Sfera', 5, 4, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', 'http://www.sfera.eu/', 4),
(336, 'Pimkie', 5, 8, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', 'http://www.pimkie.es/', 2),
(337, 'Intimissimi', 5, 10, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', 'http://www.intimissimi.com/', 2),
(338, 'Mango', 5, 10, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', 'http://www.mango.com/', 2),
(339, 'Elices Company', 5, 10, 28013, 8, 'Sol-Vodafone (Linea 1, 2 y 3), Callao (Linea 3 y 5)', '', 4),
(340, 'Fnac', 5, 28, 28013, 8, 'Callao (Linea 3 y 5), Sol-Vodafone (Linea 1, 2 y 3)', 'http://www.fnac.es/', 15),
(341, 'Havaianas', 1, 53, 28004, 7, 'Tribunal (Linea 1, 10), Chueca (Linea 5), Gran Vía (Linea 1, 5)', 'http://www.havaianas-store.com', 7),
(342, 'El ganso', 1, 2, 28013, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.elganso.com', 3),
(343, 'Soloio', 1, 2, 28013, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.soloio.com', 3),
(344, 'El ganso', 1, 20, 28013, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.elganso.com/', 4),
(345, 'Foot Locker', 1, 4, 28013, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.footlocker.eu', 1),
(346, 'H.E by Mango', 1, 4, 28013, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.hebymango.com', 3),
(347, 'Adolfo Dominguez', 1, 5, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.adolfodominguez.com/', 3),
(348, 'Tezenis', 1, 6, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.tezenis.it/es/', 2),
(349, 'Calvin Klein', 1, 5, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://explore.calvinklein.com', 4),
(350, 'Bazar Congress', 1, 5, 28004, 7, 'Gran Vía (Linea 1 y 5)', '', 16),
(351, 'Fossil', 1, 9, 28004, 7, 'Gran Vía (Linea 1 y 5)', '', 19),
(352, 'Distrito 16', 1, 8, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.distrito16.com/', 4),
(353, 'Levi''s', 1, 9, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.levi.com/', 4),
(354, 'L''Occitane', 1, 11, 28004, 7, 'Gran Vía (Linea 1 y 5)', '', 8),
(355, 'Calzedonia', 1, 8, 28004, 7, 'Gran Vía (Linea 1 y 5)', '', 2),
(356, 'Maje', 1, 10, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.maje.com/', 4),
(357, 'Parfois', 1, 13, 28004, 7, 'Gran Vía (Linea 1 y 5)', '', 19),
(358, 'The body shop', 1, 10, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.thebodyshop.es/â??', 8),
(359, 'Blanco', 1, 13, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.blanco.com', 2),
(360, 'Michael Kors', 1, 9, 28004, 7, 'Gran Vía (Linea 1 y 5)', '', 2),
(361, 'Pikolinos', 1, 17, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.pikolinos.com', 7),
(362, 'Con un par', 1, 10, 28004, 7, 'Gran Vía (Linea 1 y 5)', '', 7),
(363, 'Uno de 50', 1, 17, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.unode50.com', 5),
(364, 'Asics', 1, 14, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.asics.es/', 1),
(365, 'Diesel', 1, 19, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.diesel.com/', 4),
(366, 'Hoss intropia', 1, 16, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.hossintropia.com/', 2),
(367, 'Solaris', 1, 42, 28004, 7, 'Gran Vía (Linea 1 y 5)', '', 6),
(368, 'Custo Barcelona', 1, 29, 28004, 7, 'Gran Vía (Linea 1 y 5), Tribunal', 'http://www.custo.com/', 2),
(369, 'Pepe jeans', 1, 23, 28004, 7, 'Gran Vía (Linea 1 y 5)', '', 4),
(370, 'Tommy Hilfiger Denim', 1, 23, 28004, 7, 'Gran Vía (Linea 1 y 5)', '', 4),
(371, 'Evo', 1, 40, 28004, 7, 'Gran Vía (Linea 1 y 5)', '', 7),
(372, 'Jack & Jones', 1, 41, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://jackjones.com/', 3),
(373, 'Pimkie', 1, 18, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.pimkie.es/', 2),
(374, 'Swarovski', 1, 34, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.swarovski.com/â??', 5),
(375, 'Mac', 1, 31, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.maccosmetics.es/', 8),
(376, 'Vas', 1, 33, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.zapatosvas.com/', 7),
(377, 'Ese o ese', 1, 50, 28004, 7, 'Gran Vía (Linea 1 y 5)', '', 2),
(378, 'Khiel''s', 1, 37, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.kiehls.es/', 8),
(379, 'Lot of Colors', 1, 16, 28004, 7, 'Gran Vía (Linea 1 y 5)', '', 1),
(380, 'Glo', 1, 25, 28004, 7, 'Gran Vía (Linea 1 y 5)', '', 7),
(381, 'QuickSilver', 1, 22, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.quiksilver.com/', 3),
(382, 'Elena Hernández', 1, 28, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.elenahernandezonline.com/', 7),
(383, 'Iris', 1, 31, 28004, 7, 'Gran Vía (Linea 1 y 5)', '', 7),
(384, 'Muji', 1, 36, 28004, 7, 'Gran Vía (Linea 1 y 5)', 'http://www.muji.es/', 14);

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
-- Volcar la base de datos para la tabla `stores`
--


-- --------------------------------------------------------

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

--
-- Volcar la base de datos para la tabla `streets`
--

INSERT INTO `streets` (`idStreet`, `name`, `idArea`) VALUES
(1, 'Fuencarral', 7),
(2, 'Serrano', 1),
(3, 'Goya', 1),
(4, 'Gran Vía', 2),
(5, 'Preciados', 8),
(6, 'Arenal', 8),
(38, 'Sol', 8);

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

--
-- Volcar la base de datos para la tabla `typeshop`
--

INSERT INTO `typeshop` (`idType`, `name_es`, `name_en`) VALUES
(1, 'Deportes', 'Sports'),
(2, 'Moda Mujer', 'Fashion (Woman)'),
(3, 'Moda Hombre', 'Fashion (Men)'),
(4, 'Moda', 'Fashion'),
(5, 'Joyería', 'Jewelry'),
(6, 'Optica', 'Optics'),
(7, 'Calzado', 'Shoe Store'),
(8, 'Maquillaje / Cosméticos', 'Makeup / Cosmetics'),
(9, 'Perfumería', 'Perfumery'),
(10, 'Souvenirs', 'Souvenirs'),
(11, 'Telefonía', 'Telephony'),
(12, 'Regalos originales', 'Originals gifts'),
(13, 'Moda infantil', 'Children''s fashion'),
(14, 'Hogar', 'Home'),
(15, 'Librerias', 'Library'),
(16, 'Tecnología', 'Tecnology'),
(17, 'Bisutería', 'Imitation jewelry'),
(18, 'Lencería', 'Lingerie'),
(19, 'Complementos / Calzado', 'Add-ins / Shoes'),
(20, 'Peletería', 'Peltry / Furriery'),
(21, 'Juguetería', 'Toy store'),
(22, 'Artesanía', 'Handmade');
