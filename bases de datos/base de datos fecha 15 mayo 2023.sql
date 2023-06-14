-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-05-2023 a las 01:51:36
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `qscbkfcv_wp998`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE PROCEDURE `sp_get_vacantes_nuevas` ()   SELECT vacantes.*, estados.Estado as estado, nacionalidades.Nacionalidad as nacionalidad, niveles_estudios.Nivel_estudio as nivel_estudio, sexos.Sexo as sexo FROM vacantes 
JOIN estados ON estados.Id = vacantes.Estado 
JOIN nacionalidades ON nacionalidades.Id = vacantes.Nacionalidad
JOIN niveles_estudios ON niveles_estudios.Id = vacantes.Nivel_estudio
JOIN sexos ON sexos.Id = vacantes.Sexo
WHERE vacantes.Estado = 1 ORDER BY Id DESC$$

CREATE PROCEDURE `sp_get_vacantes_publicadas` ()   SELECT vacantes.*, estados.Estado as estado, nacionalidades.Nacionalidad as nacionalidad, niveles_estudios.Nivel_estudio as nivel_estudio, sexos.Sexo as sexo FROM vacantes 
JOIN estados ON estados.Id = vacantes.Estado 
JOIN nacionalidades ON nacionalidades.Id = vacantes.Nacionalidad
JOIN niveles_estudios ON niveles_estudios.Id = vacantes.Nivel_estudio
JOIN sexos ON sexos.Id = vacantes.Sexo
WHERE vacantes.Estado = 2 ORDER BY Id DESC$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `Id` int(11) NOT NULL,
  `Estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`Id`, `Estado`) VALUES
(1, 'Nuevo'),
(2, 'Publicado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nacionalidades`
--

CREATE TABLE `nacionalidades` (
  `Id` int(11) NOT NULL,
  `Nacionalidad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nacionalidades`
--

INSERT INTO `nacionalidades` (`Id`, `Nacionalidad`) VALUES
(1, 'Dominicano/a'),
(2, 'Extranjero/a'),
(3, 'Ambos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles_estudios`
--

CREATE TABLE `niveles_estudios` (
  `Id` int(11) NOT NULL,
  `Nivel_estudio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `niveles_estudios`
--

INSERT INTO `niveles_estudios` (`Id`, `Nivel_estudio`) VALUES
(1, 'Nivel basico'),
(2, 'Bachiller'),
(3, 'Tecnico'),
(4, 'Estudiante universitario'),
(5, 'Profesional'),
(6, 'Sin experiencia'),
(7, 'Con experiencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexos`
--

CREATE TABLE `sexos` (
  `Id` int(11) NOT NULL,
  `Sexo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sexos`
--

INSERT INTO `sexos` (`Id`, `Sexo`) VALUES
(1, 'Masculino'),
(2, 'Femenino'),
(3, 'Ambos sexos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacantes`
--

CREATE TABLE `vacantes` (
  `Id` int(11) NOT NULL,
  `Nombre_empresa` varchar(100) NOT NULL,
  `Provincia` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Sexo` int(11) NOT NULL,
  `Nacionalidad` int(11) NOT NULL,
  `Posicion_requerida` varchar(100) NOT NULL,
  `Nivel_estudio` int(11) NOT NULL,
  `Requisitos` varchar(200) NOT NULL,
  `Beneficios` varchar(200) NOT NULL,
  `Correo_electronico_aplicante` varchar(50) NOT NULL,
  `Numero_telefono` varchar(30) DEFAULT NULL,
  `Fecha_limite` varchar(10) DEFAULT NULL,
  `Categoria` varchar(50) NOT NULL,
  `Comentario_adicional` varchar(200) DEFAULT NULL,
  `Estado` int(11) NOT NULL,
  `Fecha_creacion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vacantes`
--

INSERT INTO `vacantes` (`Id`, `Nombre_empresa`, `Provincia`, `Direccion`, `Sexo`, `Nacionalidad`, `Posicion_requerida`, `Nivel_estudio`, `Requisitos`, `Beneficios`, `Correo_electronico_aplicante`, `Numero_telefono`, `Fecha_limite`, `Categoria`, `Comentario_adicional`, `Estado`, `Fecha_creacion`) VALUES
(1, 'NYSE', 'Emiliano Zapata', '9 Mitchell Park', 1, 2, 'Surveyor', 6, 'Chocolate - Mi - Amere Semi', 'Mitsubishi', 'apaulisch0@wired.com', '(430) 2903535', '7/1/2022', 'Overhead Doors', 'Sullivan County International Airport', 2, '15/05/2023'),
(2, 'NYSE', 'Ilhabela', '64 Vidon Plaza', 2, 1, 'Construction Foreman', 3, 'Wine - Cava Aria Estate Brut', 'Chevrolet', 'hminers1@behance.net', '(532) 4702666', '9/1/2022', 'Structural & Misc Steel Erection', 'Sila Airport', 2, '15/05/2023'),
(3, 'NYSE', 'Uherské Hradiště', '16456 Bunting Place', 2, 1, 'Construction Foreman', 6, 'Cheese - Roquefort Pappillon', 'Nissan', 'oolliar2@theglobeandmail.com', '(649) 2135655', '6/11/2022', 'Doors, Frames & Hardware', 'Palapye Airport', 2, '15/05/2023'),
(4, 'NYSE', 'Shicong', '8 Annamark Crossing', 2, 2, 'Project Manager', 6, 'Lemon Grass', 'Mazda', 'wedwicke3@dot.gov', '(363) 4611900', '10/21/2022', 'Wall Protection', 'Bratsk Airport', 2, '15/05/2023'),
(5, 'NYSE', 'São Caetano do Sul', '1987 Swallow Road', 3, 2, 'Subcontractor', 2, 'Cakes Assorted', 'GMC', 'cserrell4@livejournal.com', '(557) 9102053', '12/23/2022', 'Asphalt Paving', 'Lipetsk Airport', 2, '15/05/2023'),
(6, 'NYSE', 'Grybów', '05260 Columbus Parkway', 3, 1, 'Construction Foreman', 1, 'Wine - Casillero Deldiablo', 'Hyundai', 'mdabel5@mozilla.org', '(916) 3929110', '10/18/2022', 'Doors, Frames & Hardware', 'Pau Pyrénées Airport', 2, '15/05/2023'),
(7, 'NASDAQ', 'Rio de Moinhos', '5646 Dryden Plaza', 3, 3, 'Construction Worker', 3, 'Pasta - Penne, Rigate, Dry', 'Mitsubishi', 'ljudkins6@tiny.cc', '(685) 9720416', '3/3/2023', 'Termite Control', 'Mauke Airport', 2, '15/05/2023'),
(8, 'NYSE', 'Shanglu', '708 Knutson Court', 2, 1, 'Construction Manager', 4, 'Sauce - Caesar Dressing', 'Pontiac', 'gkubik7@hao123.com', '(304) 7479892', '11/26/2022', 'Hard Tile & Stone', 'Atizapan De Zaragoza Airport', 2, '15/05/2023'),
(9, 'NASDAQ', 'Arrabal', '5883 Spohn Plaza', 3, 1, 'Electrician', 2, 'Shrimp - Black Tiger 8 - 12', 'Lincoln', 'nleatham8@sogou.com', '(901) 4554281', '9/14/2022', 'Structural and Misc Steel (Fabrication)', 'Huntingburg Airport', 2, '15/05/2023'),
(10, 'NYSE', 'Dongfeng', '5516 Barnett Parkway', 3, 3, 'Subcontractor', 6, 'Buttons', 'Audi', 'menglefield9@google.com', '(841) 1373515', '8/9/2022', 'Curb & Gutter', 'Chinchilla Airport', 2, '15/05/2023'),
(11, 'NASDAQ', 'Kangar', '801 6th Drive', 3, 2, 'Project Manager', 7, 'V8 - Berry Blend', 'Lexus', 'rgaskoina@sourceforge.net', '(731) 4641411', '10/31/2022', 'Drywall & Acoustical (MOB)', 'Uchiza Airport', 2, '15/05/2023'),
(12, 'NASDAQ', 'Xinfeng', '562 Doe Crossing Point', 3, 2, 'Construction Manager', 1, 'Brandy Cherry - Mcguinness', 'Kia', 'keldenb@latimes.com', '(208) 5864678', '7/21/2022', 'Site Furnishings', 'Iki Airport', 2, '15/05/2023'),
(13, 'NASDAQ', 'Aksu', '6821 Schmedeman Park', 3, 1, 'Supervisor', 5, 'Soup - Campbells, Minestrone', 'Mitsubishi', 'skeijserc@scientificamerican.com', '(573) 3214877', '4/8/2023', 'EIFS', 'Southport Airport', 2, '15/05/2023'),
(14, 'NYSE', 'Al Buq‘ah', '27283 Crowley Trail', 2, 3, 'Surveyor', 7, 'Coffee - Irish Cream', 'Ford', 'mlishmand@wordpress.com', '(339) 5538444', '4/4/2023', 'Marlite Panels (FED)', 'Digby / Annapolis Regional Airport', 2, '15/05/2023'),
(15, 'NASDAQ', 'Pisão', '9 Morningstar Plaza', 2, 2, 'Subcontractor', 3, 'Sauerkraut', 'Chevrolet', 'gpotere@ask.com', '(876) 7147098', '1/24/2023', 'Roofing (Metal)', 'Bakalalan Airport', 2, '15/05/2023'),
(16, 'NASDAQ', 'Kašperské Hory', '6 Southridge Center', 3, 2, 'Project Manager', 3, 'Ice Cream Bar - Drumstick', 'Mitsubishi', 'hnelsonf@businesswire.com', '(688) 7549637', '9/24/2022', 'Doors, Frames & Hardware', 'Chicago Midway International Airport', 2, '15/05/2023'),
(17, 'NYSE', 'Kataba', '6715 Logan Place', 1, 2, 'Subcontractor', 6, 'Sage Ground Wiberg', 'Oldsmobile', 'mseifertg@forbes.com', '(462) 8483572', '12/20/2022', 'Landscaping & Irrigation', 'Jiamusi Airport', 2, '15/05/2023'),
(18, 'NYSE', 'Chester', '5 Tomscot Park', 1, 1, 'Subcontractor', 3, 'Apple - Delicious, Golden', 'Subaru', 'ptapperh@t.co', '(847) 8588962', '7/21/2022', 'Roofing (Asphalt)', 'Soewondo Air Force Base', 2, '15/05/2023'),
(19, 'NYSE', 'Malinaw', '567 Mandrake Street', 3, 1, 'Electrician', 2, 'Tea - Lemon Green Tea', 'Nissan', 'mheersi@va.gov', '(666) 4859952', '7/17/2022', 'Drywall & Acoustical (FED)', 'Serafin Enoss Bertaso Airport', 2, '15/05/2023'),
(20, 'NASDAQ', 'Madalena', '4111 Havey Lane', 2, 1, 'Surveyor', 1, 'Stock - Veal, White', 'Toyota', 'awallbridgej@businesswire.com', '(552) 2926455', '2/28/2023', 'Site Furnishings', 'RAF Mildenhall', 2, '15/05/2023'),
(21, 'NYSE', 'Riyue', '8 Columbus Pass', 2, 1, 'Surveyor', 2, 'Chicken - Leg, Boneless', 'Volkswagen', 'sswafieldk@issuu.com', '(771) 5072894', '12/9/2022', 'Temp Fencing, Decorative Fencing and Gates', 'Port Graham Airport', 2, '15/05/2023'),
(22, 'NASDAQ', 'Seboruco', '79 Sycamore Street', 1, 1, 'Construction Foreman', 1, 'Muffin Orange Individual', 'Jeep', 'jtarbinl@ebay.com', '(756) 7783023', '8/3/2022', 'Wall Protection', 'Yap International Airport', 2, '15/05/2023'),
(23, 'NYSE', 'Qinghu', '64 Hayes Terrace', 3, 1, 'Estimator', 3, 'True - Vue Containers', 'GMC', 'msparkwillm@biglobe.ne.jp', '(962) 4971345', '7/2/2022', 'Temp Fencing, Decorative Fencing and Gates', 'Darwin International Airport', 2, '15/05/2023'),
(24, 'NASDAQ', 'Ilha de Moçambique', '6642 Scofield Center', 1, 3, 'Subcontractor', 2, 'Curry Powder', 'Volkswagen', 'hyuryshevn@webnode.com', '(825) 1421403', '6/30/2022', 'Roofing (Asphalt)', 'Whitehorse / Erik Nielsen International Airport', 2, '15/05/2023'),
(25, 'NASDAQ', 'Boise', '0849 Twin Pines Drive', 2, 3, 'Project Manager', 1, 'Bouq All Italian - Primerba', 'Hyundai', 'cbrandto@bbb.org', '(208) 8464495', '5/8/2023', 'HVAC', 'Kaili Airport', 2, '15/05/2023'),
(26, 'NASDAQ', 'Mozhga', '3 Hanson Parkway', 1, 3, 'Construction Manager', 7, 'Soap - Pine Sol Floor Cleaner', 'Mitsubishi', 'mvarndellp@nih.gov', '(858) 6676337', '11/7/2022', 'Framing (Wood)', 'Simbai Airport', 2, '15/05/2023'),
(27, 'NYSE', 'Bordeaux', '26639 Memorial Crossing', 3, 1, 'Electrician', 2, 'Wine - Delicato Merlot', 'Lincoln', 'clichfieldq@nifty.com', '(998) 7631432', '9/25/2022', 'Wall Protection', 'Persian Gulf International Airport', 2, '15/05/2023'),
(28, 'NYSE', 'Brampton', '25845 Autumn Leaf Parkway', 2, 3, 'Supervisor', 7, 'Spaghetti Squash', 'Audi', 'smckeveneyr@1688.com', '(707) 1885363', '9/5/2022', 'Plumbing & Medical Gas', 'Creil Air Base', 2, '15/05/2023'),
(29, 'NASDAQ', 'Polanka Wielka', '3 Rockefeller Crossing', 3, 1, 'Construction Expeditor', 6, 'Pepper - Chilli Seeds Mild', 'Saab', 'mheinritzs@soundcloud.com', '(249) 2558696', '4/30/2023', 'RF Shielding', 'OR Tambo International Airport', 2, '15/05/2023'),
(30, 'NASDAQ', 'Banjar Jabejero', '688 Veith Alley', 1, 2, 'Supervisor', 5, 'Table Cloth 62x114 White', 'Lincoln', 'blorentzt@time.com', '(715) 7171685', '3/7/2023', 'Drywall & Acoustical (MOB)', 'Biggs Army Air Field (Fort Bliss)', 2, '15/05/2023'),
(31, 'NYSE', 'La Libertad', '027 Jenna Lane', 1, 2, 'Engineer', 2, 'Duck - Whole', 'Mazda', 'lmarfeu@51.la', '(117) 4264710', '9/15/2022', 'Retaining Wall and Brick Pavers', 'Perry-Foley Airport', 2, '15/05/2023'),
(32, 'NASDAQ', 'Stan-Bekhtemir', '123 Florence Road', 3, 1, 'Project Manager', 3, 'Squid - U - 10 Thailand', 'Audi', 'keltv@hp.com', '(697) 7794802', '5/31/2022', 'Masonry', 'Brownsville South Padre Island International Airport', 2, '15/05/2023'),
(33, 'NYSE', 'Lesuhe', '1940 South Pass', 1, 2, 'Project Manager', 2, 'Asparagus - Frozen', 'Volvo', 'pcharrierw@nbcnews.com', '(563) 3521506', '7/21/2022', 'Drywall & Acoustical (MOB)', 'Ruti Airport', 2, '15/05/2023'),
(34, 'NASDAQ', 'Los Angeles', '684 Stone Corner Plaza', 3, 2, 'Electrician', 6, 'Bread - Bistro White', 'GMC', 'glezemerex@technorati.com', '(683) 8454879', '7/14/2022', 'Retaining Wall and Brick Pavers', 'Capitan D Daniel Vazquez Airport', 2, '15/05/2023'),
(35, 'NASDAQ', 'Taung', '9 Judy Crossing', 1, 1, 'Construction Manager', 6, 'Chinese Foods - Cantonese', 'Lincoln', 'cwoolgary@linkedin.com', '(378) 5201368', '7/7/2022', 'Framing (Steel)', 'Coyoles Airport', 2, '15/05/2023'),
(36, 'NASDAQ', 'Isawa', '10 Mayfield Terrace', 3, 2, 'Electrician', 6, 'Cake - Cake Sheet Macaroon', 'Volkswagen', 'gattwaterz@symantec.com', '(760) 1452019', '11/8/2022', 'Drywall & Acoustical (MOB)', 'Hesler Noble Field', 2, '15/05/2023'),
(37, 'NYSE', 'Mailag', '15062 Carberry Lane', 3, 3, 'Construction Foreman', 6, 'Beef - Texas Style Burger', 'GMC', 'bwhitham10@mit.edu', '(811) 9874661', '3/24/2023', 'EIFS', 'Sofia Airport', 2, '15/05/2023'),
(38, 'NASDAQ', 'Saray', '48 Morning Drive', 3, 3, 'Construction Manager', 4, 'Coconut - Shredded, Unsweet', 'Acura', 'mtroctor11@weebly.com', '(512) 1917660', '6/18/2022', 'Framing (Wood)', 'Rouyn Noranda Airport', 2, '15/05/2023'),
(39, 'NASDAQ', 'Cabinda', '954 Sloan Trail', 2, 1, 'Construction Expeditor', 7, 'Spice - Pepper Portions', 'BMW', 'cstoggles12@europa.eu', '(360) 9779111', '1/19/2023', 'Hard Tile & Stone', 'Richard B Russell Airport', 2, '15/05/2023'),
(40, 'NYSE', 'Jambuwerkrajan', '883 Haas Junction', 1, 1, 'Electrician', 2, 'Island Oasis - Ice Cream Mix', 'Toyota', 'awitten13@archive.org', '(819) 2027777', '12/12/2022', 'Roofing (Asphalt)', 'Columbia Regional Airport', 2, '15/05/2023'),
(41, 'NASDAQ', 'Jaroměř', '10446 Huxley Terrace', 1, 3, 'Subcontractor', 3, 'Bread - Crusty Italian Poly', 'Honda', 'mmarl14@jiathis.com', '(358) 2142994', '6/5/2022', 'RF Shielding', 'Damazin Airport', 2, '15/05/2023'),
(42, 'NASDAQ', 'Ovalle', '918 Moland Plaza', 2, 3, 'Construction Foreman', 2, 'Roe - Lump Fish, Red', 'GMC', 'hschurig15@buzzfeed.com', '(649) 2338336', '10/14/2022', 'Structural & Misc Steel Erection', 'Pointe-à-Pitre Le Raizet', 2, '15/05/2023'),
(43, 'NYSE', 'Mendes', '45 Vahlen Pass', 3, 2, 'Construction Foreman', 1, 'Dried Peach', 'Buick', 'ktaylot16@arstechnica.com', '(144) 5009320', '10/4/2022', 'Structural and Misc Steel (Fabrication)', 'Vero Beach Regional Airport', 2, '15/05/2023'),
(44, 'NASDAQ', 'Shihudang', '0 Scoville Street', 2, 2, 'Engineer', 2, 'Strawberries - California', 'Ford', 'vquan17@sitemeter.com', '(640) 2302807', '7/28/2022', 'Overhead Doors', 'Talagi Airport', 2, '15/05/2023'),
(45, 'NASDAQ', 'Bulgan', '36757 Talmadge Parkway', 2, 2, 'Construction Manager', 1, 'Mikes Hard Lemonade', 'Lexus', 'vkerkham18@mapy.cz', '(418) 6944661', '9/20/2022', 'Asphalt Paving', 'El Golea Airport', 2, '15/05/2023'),
(46, 'NASDAQ', 'Baoxing', '0941 Dottie Avenue', 3, 1, 'Construction Expeditor', 7, 'Jello - Assorted', 'BMW', 'chattrick19@posterous.com', '(923) 9620727', '8/27/2022', 'Electrical and Fire Alarm', 'Open Bay Airport', 2, '15/05/2023'),
(47, 'NASDAQ', 'Tzaneen', '6843 Warrior Alley', 3, 1, 'Estimator', 3, 'Creamers - 10%', 'Suzuki', 'bpeters1a@istockphoto.com', '(667) 4113229', '4/23/2023', 'Marlite Panels (FED)', 'Gulkana Airport', 2, '15/05/2023'),
(48, 'NASDAQ', 'Amper', '9 Prentice Trail', 1, 2, 'Architect', 7, 'Straw - Regular', 'Ford', 'nkittredge1b@google.de', '(232) 9986609', '1/7/2023', 'Drywall & Acoustical (MOB)', 'Quonset State Airport', 2, '15/05/2023'),
(49, 'NYSE', 'San José del Guaviare', '911 Browning Hill', 1, 2, 'Construction Foreman', 1, 'Cinnamon Buns Sticky', 'GMC', 'gopdenort1c@plala.or.jp', '(915) 3248690', '8/10/2022', 'Structural and Misc Steel (Fabrication)', 'Cooma Snowy Mountains Airport', 2, '15/05/2023'),
(50, 'NYSE', 'Aleysk', '9 Crowley Street', 1, 1, 'Supervisor', 2, 'Shrimp - Baby, Warm Water', 'Ford', 'ncharrington1d@goo.gl', '(384) 3184471', '1/4/2023', 'Construction Clean and Final Clean', 'Brownwood Regional Airport', 2, '15/05/2023'),
(51, 'NASDAQ', 'Liulang', '05785 Northwestern Crossing', 1, 2, 'Architect', 1, 'Cheese - Comtomme', 'Mitsubishi', 'dthamelt1e@toplist.cz', '(414) 6627672', '7/24/2022', 'Exterior Signage', 'Xinguara Municipal Airport', 2, '15/05/2023'),
(52, 'NYSE', 'Leones', '541 Coolidge Trail', 3, 1, 'Project Manager', 7, 'Wine - Prem Select Charddonany', 'Kia', 'cdowyer1f@blogtalkradio.com', '(200) 5372275', '8/1/2022', 'Construction Clean and Final Clean', 'São Miguel do Araguaia Airport', 2, '15/05/2023'),
(53, 'NASDAQ', 'Dadapan', '34 Logan Alley', 2, 3, 'Electrician', 6, 'Wine - Clavet Saint Emilion', 'Pontiac', 'twimpey1g@umn.edu', '(785) 4114199', '6/2/2022', 'Soft Flooring and Base', 'Jack Northrop Field Hawthorne Municipal Airport', 2, '15/05/2023'),
(54, 'NYSE', 'Arrah', '1124 Cambridge Lane', 1, 3, 'Construction Worker', 6, 'Appetizer - Shrimp Puff', 'Mazda', 'acervantes1h@economist.com', '(321) 9145992', '1/2/2023', 'Exterior Signage', 'Riga International Airport', 2, '15/05/2023'),
(55, 'NASDAQ', 'Karasgede', '25 Columbus Center', 1, 1, 'Engineer', 2, 'Vinegar - Champagne', 'Chevrolet', 'nhanmer1i@eventbrite.com', '(377) 6933257', '10/4/2022', 'Curb & Gutter', 'Kenai Municipal Airport', 2, '15/05/2023'),
(56, 'NASDAQ', 'Simpang', '618 Haas Circle', 3, 1, 'Construction Foreman', 2, 'Bacardi Mojito', 'Bentley', 'bdaspar1j@sina.com.cn', '(854) 1780361', '3/16/2023', 'Temp Fencing, Decorative Fencing and Gates', 'Tamuin Airport', 2, '15/05/2023'),
(57, 'NASDAQ', 'Rokycany', '691 Superior Junction', 2, 1, 'Construction Worker', 7, 'Creamers - 10%', 'Lexus', 'ngleadle1k@squarespace.com', '(450) 7926119', '6/9/2022', 'Temp Fencing, Decorative Fencing and Gates', 'Rafsanjan Airport', 2, '15/05/2023'),
(58, 'NASDAQ', 'Carania', '300 Prentice Plaza', 2, 1, 'Supervisor', 3, 'Muffin Mix - Raisin Bran', 'Ford', 'aelce1l@wufoo.com', '(952) 8933007', '1/21/2023', 'Glass & Glazing', 'Santos Dumont Airport', 2, '15/05/2023'),
(59, 'NASDAQ', 'Aubagne', '039 Talmadge Street', 3, 3, 'Construction Worker', 1, 'Pop Shoppe Cream Soda', 'Mitsubishi', 'eschruurs1m@shop-pro.jp', '(877) 9873107', '4/14/2023', 'Electrical', 'Khoy Airport', 2, '15/05/2023'),
(60, 'NYSE', 'Velké Losiny', '264 Red Cloud Circle', 1, 3, 'Subcontractor', 2, 'Flour - Masa De Harina Mexican', 'Kia', 'rlinham1n@geocities.jp', '(994) 3752982', '3/4/2023', 'Rebar & Wire Mesh Install', 'Kamarang Airport', 2, '15/05/2023'),
(61, 'NYSE', 'Nyangao', '889 Main Place', 3, 3, 'Construction Foreman', 1, 'Pork - Chop, Frenched', 'Mercedes-Benz', 'dthurman1o@lycos.com', '(263) 1551134', '11/15/2022', 'Drywall & Acoustical (FED)', 'Haverfordwest Airport', 2, '15/05/2023'),
(62, 'NYSE', 'Nanyaojie', '721 Melody Center', 2, 3, 'Construction Worker', 6, 'Bay Leaf', 'Chevrolet', 'mkinvan1p@google.es', '(905) 3048444', '9/20/2022', 'HVAC', 'Mizan Teferi Airport', 2, '15/05/2023'),
(63, 'NASDAQ', 'Xiaojinkou', '8450 Bashford Plaza', 3, 2, 'Supervisor', 5, 'Bread - Corn Muffaleta Onion', 'Subaru', 'mfarland1q@artisteer.com', '(749) 9056673', '9/11/2022', 'Soft Flooring and Base', 'Alicante International Airport', 2, '15/05/2023'),
(64, 'NYSE', 'Damu', '9 Sachs Avenue', 3, 1, 'Construction Foreman', 7, 'Cheese - Gouda', 'Mazda', 'cschultheiss1r@hud.gov', '(591) 5240162', '8/4/2022', 'Construction Clean and Final Clean', 'Kornasoren Airfield', 2, '15/05/2023'),
(65, 'NASDAQ', 'Xuexi', '89 David Trail', 3, 3, 'Engineer', 5, 'Lamb - Shoulder', 'Audi', 'sbabalola1s@squarespace.com', '(861) 3538057', '7/1/2022', 'Ornamental Railings', 'Anaco Airport', 2, '15/05/2023'),
(66, 'NASDAQ', 'Wufeng', '6464 Schiller Hill', 2, 2, 'Project Manager', 5, 'Wine - Chianti Classica Docg', 'Mitsubishi', 'mstroobant1t@senate.gov', '(146) 7187309', '8/13/2022', 'Construction Clean and Final Clean', 'Iaşi Airport', 2, '15/05/2023'),
(67, 'NASDAQ', 'Xingang', '46 Anniversary Road', 2, 3, 'Supervisor', 4, 'Cookie Chocolate Chip With', 'Mazda', 'dcraighead1u@people.com.cn', '(462) 3732066', '9/19/2022', 'Landscaping & Irrigation', 'Manihi Airport', 2, '15/05/2023'),
(68, 'NASDAQ', 'Yatsushiro', '837 Hanson Way', 1, 2, 'Engineer', 1, 'Beer - Camerons Auburn', 'GMC', 'emcgoogan1v@networksolutions.com', '(391) 1920405', '6/16/2022', 'Site Furnishings', 'Kadanwari Airport', 2, '15/05/2023'),
(69, 'NYSE', 'Belišće', '0860 8th Place', 3, 1, 'Surveyor', 1, 'Flavouring - Rum', 'Chrysler', 'tgerbl1w@blinklist.com', '(362) 9614245', '7/22/2022', 'RF Shielding', 'Kaiapit Airport', 2, '15/05/2023'),
(70, 'NASDAQ', 'Araal', '0704 Scofield Parkway', 1, 3, 'Estimator', 7, 'Tea - Grapefruit Green Tea', 'Infiniti', 'pstaubyn1x@cnbc.com', '(715) 3869037', '7/25/2022', 'Wall Protection', 'Odessa International Airport', 2, '15/05/2023'),
(71, 'NASDAQ', 'San Pedro', '38359 Hoffman Alley', 3, 2, 'Construction Manager', 7, 'Bread Cranberry Foccacia', 'Toyota', 'bstrettell1y@hibu.com', '(512) 4234038', '5/27/2022', 'Soft Flooring and Base', 'Kalumburu Airport', 2, '15/05/2023'),
(72, 'NYSE', 'Chusovoy', '83307 Gina Hill', 3, 3, 'Construction Manager', 5, 'Water - Mineral, Natural', 'Honda', 'cgolby1z@diigo.com', '(907) 7614869', '1/6/2023', 'Sitework & Site Utilities', 'Nadunumu Airport', 2, '15/05/2023'),
(73, 'NASDAQ', 'South River', '4 Dawn Lane', 1, 1, 'Estimator', 2, 'Soup - Beef Conomme, Dry', 'Saab', 'dskeldinge20@umich.edu', '(553) 8869299', '9/16/2022', 'Roofing (Asphalt)', 'Livermore Municipal Airport', 2, '15/05/2023'),
(74, 'NASDAQ', 'Atengmelang', '7398 Northridge Hill', 3, 3, 'Estimator', 6, 'Gelatine Powder', 'Ford', 'vedkins21@washingtonpost.com', '(426) 5333437', '1/14/2023', 'Masonry & Precast', 'Mornington Island Airport', 2, '15/05/2023'),
(75, 'NYSE', 'Anfusi', '35 Fisk Way', 1, 2, 'Electrician', 4, 'Devonshire Cream', 'Volkswagen', 'yletrange22@networksolutions.com', '(507) 9310784', '10/20/2022', 'Rebar & Wire Mesh Install', 'Ben Slimane Airport', 2, '15/05/2023'),
(76, 'NYSE', 'Krasnyy Oktyabr’', '0 Sunbrook Way', 3, 3, 'Construction Worker', 1, 'Oil - Canola', 'Hyundai', 'jdrennan23@upenn.edu', '(990) 4170706', '12/11/2022', 'Elevator', 'Soalala Airport', 2, '15/05/2023'),
(77, 'NYSE', 'Novaya Usman’', '77 Becker Parkway', 3, 3, 'Construction Foreman', 5, 'Chutney Sauce - Mango', 'Ford', 'hbyre24@opera.com', '(394) 9355469', '2/12/2023', 'RF Shielding', 'Bahir Dar Airport', 2, '15/05/2023'),
(78, 'NYSE', 'Corozal', '2 Walton Place', 2, 1, 'Construction Foreman', 5, 'Cheese - Brie Roitelet', 'Lexus', 'scarslake25@discovery.com', '(187) 9586470', '8/3/2022', 'Masonry', 'Big Mountain Airport', 2, '15/05/2023'),
(79, 'NYSE', 'Dajasongai', '344 Knutson Park', 3, 3, 'Construction Worker', 7, 'Cups 10oz Trans', 'Oldsmobile', 'lwheowall26@tumblr.com', '(990) 6215611', '6/8/2022', 'Epoxy Flooring', 'Eagle Airport', 2, '15/05/2023'),
(80, 'NYSE', 'Bongor', '7959 Blue Bill Park Point', 3, 2, 'Surveyor', 7, 'Veal - Tenderloin, Untrimmed', 'BMW', 'dharuard27@bloomberg.com', '(753) 5262402', '4/21/2023', 'Fire Protection', 'Kribi Airport', 2, '15/05/2023'),
(81, 'NASDAQ', 'Tytuvėnėliai', '96 Loomis Trail', 2, 3, 'Construction Manager', 4, 'Soup - Knorr, Classic Can. Chili', 'GMC', 'sheale28@google.co.jp', '(493) 8052537', '10/23/2022', 'Roofing (Metal)', 'Surat Airport', 2, '15/05/2023'),
(82, 'NYSE', 'Socorro', '6308 Sundown Road', 1, 2, 'Architect', 5, 'Red Snapper - Fillet, Skin On', 'Infiniti', 'csoares29@jigsy.com', '(964) 9685534', '3/18/2023', 'Drilled Shafts', 'Takamatsu Airport', 2, '15/05/2023'),
(83, 'NYSE', 'Chengjiao', '212 Claremont Lane', 3, 1, 'Subcontractor', 5, 'Sping Loaded Cup Dispenser', 'Chevrolet', 'achataignier2a@time.com', '(950) 2123996', '11/4/2022', 'Sitework & Site Utilities', 'Calgary International Airport', 2, '15/05/2023'),
(84, 'NASDAQ', 'Coloncito', '456 Atwood Crossing', 2, 3, 'Construction Expeditor', 2, 'Beef - Ground Lean Fresh', 'Subaru', 'xshiel2b@businesswire.com', '(884) 1025508', '4/5/2023', 'Plumbing & Medical Gas', 'General Roberto Fierro Villalobos International Airport', 2, '15/05/2023'),
(85, 'NYSE', 'Beaumont', '9182 Prairie Rose Point', 1, 1, 'Supervisor', 7, 'Pepper - Green Thai', 'Nissan', 'cvigne2c@dmoz.org', '(348) 8974666', '11/7/2022', 'Fire Sprinkler System', 'Andrés Sabella Gálvez International Airport', 2, '15/05/2023'),
(86, 'NYSE', 'Cuntan', '4 Elmside Point', 1, 2, 'Construction Manager', 5, 'Chickensplit Half', 'Nissan', 'csalzberger2d@scribd.com', '(618) 3479922', '11/2/2022', 'Granite Surfaces', 'Mont Joli Airport', 2, '15/05/2023'),
(87, 'NASDAQ', 'Potulando', '78 Burning Wood Crossing', 1, 2, 'Construction Worker', 7, 'Devonshire Cream', 'Ford', 'bconnaughton2e@printfriendly.com', '(240) 1937961', '6/22/2022', 'Marlite Panels (FED)', 'Les Bases Airport', 2, '15/05/2023'),
(88, 'NASDAQ', 'Lupao', '5074 4th Street', 2, 2, 'Project Manager', 5, 'Wine - Alicanca Vinho Verde', 'Bentley', 'gbland2f@usnews.com', '(300) 2213752', '10/8/2022', 'Exterior Signage', 'Bamu Airport', 2, '15/05/2023'),
(89, 'NASDAQ', 'Jaša Tomić', '8 Morrow Center', 1, 3, 'Project Manager', 6, 'Wine - Clavet Saint Emilion', 'Eagle', 'aerett2g@arizona.edu', '(287) 3697377', '3/29/2023', 'Construction Clean and Final Clean', 'Bossangoa Airport', 2, '15/05/2023'),
(90, 'NASDAQ', 'Mamer', '83026 Westend Avenue', 2, 3, 'Estimator', 5, 'Beer - Sleeman Fine Porter', 'Mitsubishi', 'fhollyman2h@samsung.com', '(262) 3933857', '7/29/2022', 'Soft Flooring and Base', 'Luiza Airport', 2, '15/05/2023'),
(91, 'NASDAQ', 'Birmingham', '970 Buhler Pass', 1, 2, 'Supervisor', 6, 'Beans - French', 'GMC', 'tpettipher2i@aboutads.info', '(205) 8435942', '11/27/2022', 'RF Shielding', 'Twin Hills Airport', 2, '15/05/2023'),
(92, 'NASDAQ', 'San Antonio', '96 Riverside Park', 3, 3, 'Estimator', 6, 'Scotch - Queen Anne', 'Mercedes-Benz', 'bsinnett2j@qq.com', '(167) 7627057', '4/6/2023', 'Sitework & Site Utilities', 'Muan International Airport', 2, '15/05/2023'),
(93, 'NASDAQ', 'Quince Mil', '6 Caliangt Center', 2, 1, 'Project Manager', 6, 'Pork - Bacon Cooked Slcd', 'Ram', 'kgomersall2k@zimbio.com', '(218) 6371817', '2/2/2023', 'Landscaping & Irrigation', 'Hayfields Airport', 2, '15/05/2023'),
(94, 'NYSE', 'Custóias', '887 Anhalt Center', 2, 2, 'Supervisor', 7, 'Cake - Dulce De Leche', 'GMC', 'dbutten2l@cnet.com', '(530) 9468592', '7/29/2022', 'Doors, Frames & Hardware', 'Belbek Airport', 2, '15/05/2023'),
(95, 'NYSE', 'Celendín', '2778 Eagle Crest Alley', 2, 1, 'Estimator', 1, 'Rum - Dark, Bacardi, Black', 'Pontiac', 'skisby2m@fema.gov', '(857) 8185629', '12/2/2022', 'Prefabricated Aluminum Metal Canopies', 'Antrim County Airport', 2, '15/05/2023'),
(96, 'NASDAQ', 'Podhum', '172 Rusk Point', 1, 3, 'Electrician', 7, 'Vaccum Bag 10x13', 'Chevrolet', 'mgreenshields2n@buzzfeed.com', '(570) 9987230', '5/4/2023', 'Asphalt Paving', 'Jeju International Airport', 2, '15/05/2023'),
(97, 'NYSE', 'Stradbally', '7859 Moose Court', 2, 3, 'Construction Manager', 1, 'Calypso - Strawberry Lemonade', 'Mercedes-Benz', 'mscandroot2o@photobucket.com', '(727) 2442966', '2/20/2023', 'Ornamental Railings', 'Macau International Airport', 2, '15/05/2023'),
(98, 'NASDAQ', 'Cran-Gevrier', '5 Brickson Park Pass', 2, 2, 'Subcontractor', 5, 'Yogurt - Cherry, 175 Gr', 'Volkswagen', 'owoodham2p@japanpost.jp', '(144) 3807002', '4/24/2023', 'Soft Flooring and Base', 'Mkambati Airport', 2, '15/05/2023'),
(99, 'NASDAQ', 'Mulhouse', '66 Mayer Junction', 2, 3, 'Engineer', 1, 'Tomatoes - Cherry', 'Jeep', 'kshimony2q@who.int', '(838) 9748632', '3/13/2023', 'Marlite Panels (FED)', 'Leonora Airport', 2, '15/05/2023'),
(100, 'NYSE', 'Křížová', '5 Lake View Way', 3, 3, 'Electrician', 5, 'Wine - White, Riesling, Henry Of', 'Volkswagen', 'jpaxforde2r@prnewswire.com', '(774) 1471978', '10/16/2022', 'Structural & Misc Steel Erection', 'Pointe Vele Airport', 2, '15/05/2023'),
(101, 'NASDAQ', 'Ugba', '0 Jay Pass', 3, 3, 'Surveyor', 4, 'Soupfoamcont12oz 112con', 'Mazda', 'hrosenschein2s@fastcompany.com', '(799) 2098604', '7/26/2022', 'Curb & Gutter', 'Barimunya Airport', 2, '15/05/2023'),
(102, 'NASDAQ', 'Pangkalan', '5 Welch Junction', 1, 1, 'Architect', 4, 'Bar Mix - Lemon', 'Land Rover', 'jleivers2t@discuz.net', '(813) 8618479', '3/23/2023', 'Overhead Doors', 'Moreton Airport', 2, '15/05/2023'),
(103, 'NYSE', 'Castelo', '6 1st Junction', 3, 1, 'Supervisor', 7, 'Wine - Alsace Gewurztraminer', 'Chevrolet', 'bdevitt2u@altervista.org', '(763) 5154779', '6/21/2022', 'Masonry & Precast', 'La Grande-3 Airport', 2, '15/05/2023'),
(104, 'NASDAQ', 'Hidalgo', '4 Barnett Parkway', 1, 3, 'Subcontractor', 1, 'Veal - Chops, Split, Frenched', 'Dodge', 'kdelcastel2v@blogs.com', '(770) 1336355', '4/20/2023', 'Marlite Panels (FED)', 'Lincoln Airport', 2, '15/05/2023'),
(105, 'NASDAQ', 'Xiumei', '850 Bunting Junction', 3, 3, 'Supervisor', 4, 'Bagel - Everything Presliced', 'Toyota', 'sgallamore2w@boston.com', '(615) 9299343', '8/24/2022', 'Roofing (Metal)', 'Lawn Hill Airport', 2, '15/05/2023'),
(106, 'NYSE', 'Kirkkonummi', '9646 Basil Circle', 3, 2, 'Project Manager', 4, 'Sauce Bbq Smokey', 'Ford', 'bmatuska2x@facebook.com', '(233) 9161354', '3/8/2023', 'Drilled Shafts', 'Ankavandra Airport', 2, '15/05/2023'),
(107, 'NASDAQ', 'Cunday', '642 Hintze Road', 1, 3, 'Construction Foreman', 6, 'Lemon Grass', 'Volvo', 'vupstell2y@icq.com', '(322) 8847433', '8/16/2022', 'Doors, Frames & Hardware', 'Myrtle Beach International Airport', 2, '15/05/2023'),
(108, 'NASDAQ', 'Luzon', '9 Hollow Ridge Pass', 1, 1, 'Estimator', 2, 'Wine - Beaujolais Villages', 'Volkswagen', 'scrimes2z@issuu.com', '(288) 6070297', '3/25/2023', 'Epoxy Flooring', 'Maiana Airport', 2, '15/05/2023'),
(109, 'NASDAQ', 'Fréjus', '99 Superior Pass', 1, 3, 'Architect', 5, 'Alize Sunset', 'Chevrolet', 'icapeloff30@posterous.com', '(306) 7309162', '3/1/2023', 'Hard Tile & Stone', 'Stephens Island Seaplane Base', 2, '15/05/2023'),
(110, 'NYSE', 'Río Grande', '6617 Carberry Crossing', 3, 1, 'Supervisor', 5, 'Snapple - Mango Maddness', 'MINI', 'rloisi31@jimdo.com', '(398) 4739552', '3/6/2023', 'Asphalt Paving', 'Sky Harbor Airport', 2, '15/05/2023'),
(111, 'NYSE', 'Cimuncang', '65 Steensland Street', 3, 1, 'Estimator', 1, 'Zucchini - Yellow', 'Toyota', 'pcranmore32@com.com', '(707) 3398989', '11/12/2022', 'RF Shielding', 'Miramichi Airport', 2, '15/05/2023'),
(112, 'NYSE', 'Masaran', '791 7th Terrace', 2, 2, 'Electrician', 7, 'Lamb Shoulder Boneless Nz', 'Mitsubishi', 'amccarney33@mediafire.com', '(376) 1383772', '3/14/2023', 'Framing (Steel)', 'Hesa Airport', 2, '15/05/2023'),
(113, 'NYSE', 'Xiahan', '30524 Cardinal Terrace', 1, 1, 'Supervisor', 3, 'Tia Maria', 'Lexus', 'vformigli34@joomla.org', '(704) 9500550', '11/23/2022', 'Drilled Shafts', 'Amanab Airport', 2, '15/05/2023'),
(114, 'NYSE', 'Khalkhāl', '06 Hanson Center', 3, 3, 'Supervisor', 2, 'Chicken - Leg / Back Attach', 'Mitsubishi', 'wanthony35@netscape.com', '(256) 5947799', '1/26/2023', 'Epoxy Flooring', 'Reginaldo Hammer Airport', 2, '15/05/2023'),
(115, 'NYSE', 'Dasi', '715 Onsgard Circle', 1, 2, 'Construction Expeditor', 3, 'Melon - Watermelon Yellow', 'Acura', 'cmager36@nydailynews.com', '(131) 6944441', '5/27/2022', 'Landscaping & Irrigation', 'Randolph Air Force Base', 2, '15/05/2023'),
(116, 'NASDAQ', 'Subusub', '2198 Southridge Avenue', 1, 3, 'Electrician', 4, 'Amaretto', 'Mazda', 'mtomasian37@scribd.com', '(756) 7456709', '3/14/2023', 'Waterproofing & Caulking', 'Pingtung North Airport', 2, '15/05/2023'),
(117, 'NYSE', 'Bergen op Zoom', '5 Dennis Plaza', 3, 1, 'Engineer', 5, 'Beer - Muskoka Cream Ale', 'Suzuki', 'mpatron38@newsvine.com', '(590) 9373256', '10/24/2022', 'Termite Control', 'Zhigansk Airport', 2, '15/05/2023'),
(118, 'NASDAQ', 'Gebre Guracha', '64429 Merry Lane', 1, 3, 'Construction Worker', 1, 'Bagel - Everything', 'Chrysler', 'zhordle39@histats.com', '(565) 8737861', '7/9/2022', 'Framing (Wood)', 'La Sarre Airport', 2, '15/05/2023'),
(119, 'NASDAQ', 'Bailieborough', '85323 Troy Street', 2, 2, 'Engineer', 3, 'Bay Leaf', 'Mercedes-Benz', 'bwillingham3a@lulu.com', '(862) 1837239', '9/18/2022', 'Waterproofing & Caulking', 'Lesobeng Airport', 2, '15/05/2023'),
(120, 'NYSE', 'Can-Avid', '5236 Schurz Crossing', 3, 3, 'Construction Manager', 3, 'Pork Ham Prager', 'Subaru', 'grealy3b@guardian.co.uk', '(616) 8960391', '12/19/2022', 'Epoxy Flooring', 'Colmar-Houssen Airport', 2, '15/05/2023'),
(121, 'NASDAQ', 'Taen Tengah', '8 Rieder Circle', 3, 1, 'Estimator', 7, 'Lemonade - Natural, 591 Ml', 'Suzuki', 'tmcguirk3c@scribd.com', '(780) 4217639', '5/23/2022', 'Granite Surfaces', 'Bengbu Airport', 2, '15/05/2023'),
(122, 'NASDAQ', 'Aíyira', '4749 Lakewood Lane', 1, 3, 'Construction Foreman', 7, 'Bread - White, Sliced', 'GMC', 'tgrim3d@seattletimes.com', '(301) 6855776', '6/28/2022', 'Framing (Steel)', 'Avignon-Caumont Airport', 2, '15/05/2023'),
(123, 'NYSE', 'Kirkton', '19 Twin Pines Center', 2, 1, 'Electrician', 7, 'Broom - Angled', 'Isuzu', 'wscola3e@chronoengine.com', '(216) 7746509', '3/22/2023', 'EIFS', 'Waterford Airport', 2, '15/05/2023'),
(124, 'NYSE', 'Villa Ángela', '3344 Beilfuss Park', 3, 1, 'Construction Manager', 7, 'Oil - Truffle, White', 'Ford', 'wthurlborn3f@4shared.com', '(889) 7524344', '12/30/2022', 'Framing (Wood)', 'Jinggangshan Airport', 2, '15/05/2023'),
(125, 'NASDAQ', 'Votkinsk', '8729 Randy Street', 1, 2, 'Surveyor', 1, 'Yeast - Fresh, Fleischman', 'Mitsubishi', 'jhugli3g@sakura.ne.jp', '(440) 6430688', '2/14/2023', 'Masonry', 'Serui Airport', 2, '15/05/2023'),
(126, 'NASDAQ', 'Opařany', '739 Knutson Lane', 1, 3, 'Construction Manager', 7, 'Mushroom - Porcini, Dry', 'Land Rover', 'rmathivon3h@taobao.com', '(348) 3107624', '6/27/2022', 'Landscaping & Irrigation', 'Lindi Airport', 2, '15/05/2023'),
(127, 'NYSE', 'Vale da Serra', '2 Dwight Road', 1, 1, 'Construction Worker', 5, 'Bagel - Whole White Sesame', 'Ford', 'vsprigings3i@adobe.com', '(894) 2612470', '8/18/2022', 'Drywall & Acoustical (FED)', 'Žilina Airport', 2, '15/05/2023'),
(128, 'NASDAQ', 'Zaraysk', '744 Northwestern Drive', 3, 3, 'Construction Foreman', 3, 'Sole - Iqf', 'Lincoln', 'rmacaskill3j@hao123.com', '(523) 1419202', '11/29/2022', 'Framing (Wood)', 'Greater Binghamton/Edwin A Link field', 2, '15/05/2023'),
(129, 'NASDAQ', 'Al Quţayfah', '42 Union Hill', 3, 1, 'Construction Worker', 1, 'Pie Shell - 9', 'Acura', 'gbuckenham3k@geocities.jp', '(927) 9666364', '5/26/2022', 'Roofing (Asphalt)', 'John Glenn Columbus International Airport', 2, '15/05/2023'),
(130, 'NYSE', 'Paleran', '9 Esch Parkway', 2, 2, 'Subcontractor', 7, 'Higashimaru Usukuchi Soy', 'Dodge', 'lkilpatrick3l@google.com.hk', '(637) 5916184', '1/23/2023', 'Hard Tile & Stone', 'Worcester Regional Airport', 2, '15/05/2023'),
(131, 'NYSE', 'Tremembé', '085 Eggendart Way', 1, 1, 'Architect', 5, 'Spic And Span All Purpose', 'Mercedes-Benz', 'tberston3m@microsoft.com', '(449) 2410597', '10/16/2022', 'Rebar & Wire Mesh Install', 'Emalamo Sanana Airport', 2, '15/05/2023'),
(132, 'NASDAQ', 'Harhorin', '3 Sheridan Avenue', 2, 1, 'Project Manager', 7, 'Pasta - Fett Alfredo, Single Serve', 'Acura', 'atumelty3n@ask.com', '(515) 6185689', '1/31/2023', 'Elevator', 'Pdte. Carlos Ibañez del Campo Airport', 2, '15/05/2023'),
(133, 'NYSE', 'Nombre de Jesús', '72 Huxley Crossing', 3, 1, 'Subcontractor', 1, 'Longan', 'Nissan', 'imacrierie3o@behance.net', '(730) 6350388', '11/29/2022', 'Hard Tile & Stone', 'Goulimime Airport', 2, '15/05/2023'),
(134, 'NASDAQ', 'Argasari', '4474 Melody Road', 2, 1, 'Subcontractor', 1, 'Oil - Coconut', 'Toyota', 'hnisbet3p@ibm.com', '(260) 2235675', '10/14/2022', 'Epoxy Flooring', 'Laramie Regional Airport', 2, '15/05/2023'),
(135, 'NASDAQ', 'Bobrov', '3 Talisman Plaza', 3, 2, 'Construction Expeditor', 3, 'Croissant, Raw - Mini', 'Mazda', 'abargery3q@uiuc.edu', '(132) 1787355', '8/16/2022', 'Masonry', 'Karonga Airport', 2, '15/05/2023'),
(136, 'NYSE', 'Kuncen', '6900 Schiller Parkway', 1, 3, 'Construction Foreman', 2, 'Soap - Pine Sol Floor Cleaner', 'Toyota', 'rserman3r@bing.com', '(743) 8601521', '9/5/2022', 'Ornamental Railings', 'Illaga Airport', 2, '15/05/2023'),
(137, 'NYSE', 'Semënov', '106 Transport Junction', 3, 3, 'Construction Foreman', 2, 'Sausage - Andouille', 'Panoz', 'jdorwood3s@npr.org', '(310) 5553525', '1/25/2023', 'Casework', 'Skive Airport', 2, '15/05/2023'),
(138, 'NASDAQ', 'Përmet', '9 Rieder Street', 1, 1, 'Engineer', 2, 'Mushroom - Chantrelle, Fresh', 'Cadillac', 'ajouannisson3t@last.fm', '(296) 1530238', '3/18/2023', 'Roofing (Metal)', 'Illinois Valley Regional Airport-Walter A Duncan Field', 2, '15/05/2023'),
(139, 'NASDAQ', 'Ciperang', '449 Little Fleur Circle', 2, 3, 'Supervisor', 3, 'Toamtoes 6x7 Select', 'Ford', 'bdreng3u@reference.com', '(352) 2884832', '8/23/2022', 'Fire Sprinkler System', 'Juan Gualberto Gomez International Airport', 2, '15/05/2023'),
(140, 'NYSE', 'Qaxa', '8424 Gale Crossing', 2, 1, 'Estimator', 6, 'Chicken - Wieners', 'BMW', 'efogel3v@army.mil', '(892) 1788847', '4/30/2023', 'Framing (Steel)', 'Lake Havasu City Airport', 2, '15/05/2023'),
(141, 'NYSE', 'Khŭjand', '37 Schiller Avenue', 2, 3, 'Project Manager', 4, 'Sugar - Brown', 'Mercedes-Benz', 'ebraunfeld3w@sciencedaily.com', '(326) 4607501', '1/24/2023', 'Prefabricated Aluminum Metal Canopies', 'San Jose Airport', 2, '15/05/2023'),
(142, 'NASDAQ', 'Iwo', '65777 Cardinal Center', 3, 1, 'Subcontractor', 2, 'Sprouts - Peppercress', 'Saab', 'awoodyer3x@odnoklassniki.ru', '(554) 4312418', '8/25/2022', 'Drywall & Acoustical (FED)', 'Lehigh Valley International Airport', 2, '15/05/2023'),
(143, 'NYSE', 'Yushugou', '75 Boyd Circle', 2, 3, 'Estimator', 4, 'Chivas Regal - 12 Year Old', 'Honda', 'jbean3y@pinterest.com', '(949) 8292409', '11/6/2022', 'Wall Protection', 'Sfax Thyna International Airport', 2, '15/05/2023'),
(144, 'NYSE', 'Melaka', '786 Annamark Park', 3, 3, 'Surveyor', 4, 'Baking Powder', 'Suzuki', 'bnorkutt3z@house.gov', '(446) 6823653', '9/26/2022', 'Site Furnishings', 'Oradea International Airport', 2, '15/05/2023'),
(145, 'NYSE', 'Bozoum', '98 Dorton Lane', 1, 3, 'Construction Foreman', 7, 'Duck - Legs', 'Mazda', 'tsone40@altervista.org', '(657) 1423351', '9/28/2022', 'Asphalt Paving', 'Colac Airport', 2, '15/05/2023'),
(146, 'NASDAQ', 'Monte Carmelo', '6 Bartillon Road', 3, 2, 'Construction Worker', 3, 'Pie Box - Cello Window 2.5', 'Hummer', 'mslessar41@gravatar.com', '(380) 3428105', '7/2/2022', 'Elevator', 'San Nicolas Airport', 2, '15/05/2023'),
(147, 'NYSE', 'Olinda', '99 Lukken Junction', 2, 3, 'Construction Expeditor', 7, 'Veal - Leg', 'Ford', 'jboorer42@squidoo.com', '(596) 1638135', '9/12/2022', 'Granite Surfaces', 'Bowman Field', 2, '15/05/2023'),
(148, 'NYSE', 'Charlton', '8 Boyd Way', 1, 1, 'Electrician', 6, 'Appetiser - Bought', 'Cadillac', 'wlewing43@salon.com', '(520) 2893606', '6/2/2022', 'Fire Protection', 'Dinwiddie County Airport', 2, '15/05/2023'),
(149, 'NYSE', 'Dimiao', '474 Corscot Court', 2, 1, 'Electrician', 2, 'Clams - Canned', 'Toyota', 'lpalfreeman44@mediafire.com', '(316) 5377359', '3/8/2023', 'Curb & Gutter', 'Peace River Airport', 2, '15/05/2023'),
(150, 'NASDAQ', 'Sondo', '377 Cascade Street', 1, 3, 'Engineer', 1, 'Ice Cream Bar - Oreo Cone', 'Mercury', 'alarcier45@vkontakte.ru', '(807) 6547742', '5/4/2023', 'Roofing (Asphalt)', 'George Bush Intercontinental Houston Airport', 2, '15/05/2023'),
(151, 'NYSE', 'Chengbei', '6413 Springs Road', 3, 2, 'Construction Worker', 7, 'Cheese - Boursin, Garlic / Herbs', 'Ford', 'cboylin46@dedecms.com', '(317) 9178611', '5/21/2022', 'Painting & Vinyl Wall Covering', 'Anqing Tianzhushan Airport', 2, '15/05/2023'),
(152, 'NASDAQ', 'Gwandu', '9053 East Parkway', 2, 1, 'Construction Expeditor', 1, 'Pop - Club Soda Can', 'Suzuki', 'dkupisz47@yale.edu', '(578) 8843214', '12/22/2022', 'Masonry & Precast', 'Rokeby Airport', 2, '15/05/2023'),
(153, 'NYSE', 'Qifang', '3 Farmco Place', 3, 1, 'Supervisor', 4, 'Beans - Black Bean, Canned', 'Acura', 'aridgeway48@auda.org.au', '(966) 1703417', '1/4/2023', 'Rebar & Wire Mesh Install', 'Coonamble Airport', 2, '15/05/2023'),
(154, 'NASDAQ', 'Ten’gushevo', '34523 Fairview Trail', 2, 3, 'Engineer', 4, 'Fish - Halibut, Cold Smoked', 'Lincoln', 'aboich49@aol.com', '(324) 1275365', '10/21/2022', 'Wall Protection', 'Prieska Airport', 2, '15/05/2023'),
(155, 'NASDAQ', 'Pateros', '55 Stephen Junction', 1, 3, 'Subcontractor', 1, 'Soup - Knorr, French Onion', 'BMW', 'gsappy4a@weebly.com', '(865) 3323100', '8/21/2022', 'Epoxy Flooring', 'Lancang Jingmai Airport', 2, '15/05/2023'),
(156, 'NASDAQ', 'Gongchang Zhen', '0435 Muir Alley', 2, 3, 'Supervisor', 6, 'Pepper - Green, Chili', 'GMC', 'mcoleson4b@bbb.org', '(325) 1741056', '2/14/2023', 'Drywall & Acoustical (FED)', 'Ibn Batouta Airport', 2, '15/05/2023'),
(157, 'NASDAQ', 'Clearwater', '33 Northport Street', 2, 3, 'Project Manager', 4, 'Pasta - Bauletti, Chicken White', 'Kia', 'crosenbusch4c@networkadvertising.org', '(786) 9525349', '5/7/2023', 'Prefabricated Aluminum Metal Canopies', 'Clovis Municipal Airport', 2, '15/05/2023'),
(158, 'NASDAQ', 'Miskolc', '0244 Village Point', 2, 2, 'Electrician', 3, 'Apple - Delicious, Golden', 'Buick', 'kadams4d@europa.eu', '(241) 2307948', '8/17/2022', 'Soft Flooring and Base', 'Burao Airport', 2, '15/05/2023'),
(159, 'NYSE', 'Songshan', '37081 Ruskin Hill', 2, 1, 'Project Manager', 3, 'Chocolate - Chips Compound', 'Subaru', 'deginton4e@va.gov', '(710) 1272156', '3/24/2023', 'Site Furnishings', 'Gagnoa Airport', 2, '15/05/2023'),
(160, 'NYSE', 'Guluoshan', '688 Starling Plaza', 2, 3, 'Subcontractor', 1, 'Chocolate Liqueur - Godet White', 'GMC', 'tbanham4f@ted.com', '(419) 6838466', '3/28/2023', 'Temp Fencing, Decorative Fencing and Gates', 'Pinehouse Lake Airport', 2, '15/05/2023'),
(161, 'NYSE', 'Dukuh Kaler', '1726 Express Place', 3, 2, 'Project Manager', 7, 'Longos - Grilled Salmon With Bbq', 'Mazda', 'astroband4g@nih.gov', '(270) 1497505', '5/16/2022', 'Roofing (Asphalt)', 'Jamestown Regional Airport', 2, '15/05/2023'),
(162, 'NYSE', 'Liběšice', '71 Village Place', 2, 2, 'Construction Expeditor', 3, 'Liqueur Banana, Ramazzotti', 'Chevrolet', 'npandey4h@e-recht24.de', '(743) 8038261', '1/9/2023', 'Structural & Misc Steel Erection', 'Unalaska Airport', 2, '15/05/2023'),
(163, 'NASDAQ', 'Oklahoma City', '467 Fordem Avenue', 3, 2, 'Engineer', 7, 'Sultanas', 'Hyundai', 'lshawell4i@discuz.net', '(405) 8855639', '6/8/2022', 'Landscaping & Irrigation', 'La Chinita International Airport', 2, '15/05/2023'),
(164, 'NASDAQ', 'Pueblo Viejo', '25715 Muir Trail', 1, 2, 'Surveyor', 5, 'Beer - Labatt Blue', 'Honda', 'pmacskeagan4j@slideshare.net', '(462) 5252505', '7/7/2022', 'HVAC', 'Coolawanyah Airport', 2, '15/05/2023'),
(165, 'NASDAQ', 'Liuzhuang', '618 Farragut Place', 2, 1, 'Construction Manager', 4, 'Wine - Chenin Blanc K.w.v.', 'Hyundai', 'gliversidge4k@woothemes.com', '(163) 5778827', '9/21/2022', 'Sitework & Site Utilities', 'Pagadian Airport', 2, '15/05/2023'),
(166, 'NYSE', 'Brumadinho', '3255 Mcguire Place', 1, 3, 'Supervisor', 5, 'Steampan - Foil', 'Jeep', 'mbusain4l@ted.com', '(516) 6549203', '2/11/2023', 'Doors, Frames & Hardware', 'Debre Tabor Airport', 2, '15/05/2023'),
(167, 'NYSE', 'Rates', '81664 Mandrake Way', 2, 2, 'Surveyor', 3, 'Tarragon - Fresh', 'Chrysler', 'jpickersail4m@blogger.com', '(276) 4877309', '12/7/2022', 'Construction Clean and Final Clean', 'Kosti Airport', 2, '15/05/2023'),
(168, 'NYSE', 'Singajaya', '1347 5th Way', 1, 1, 'Construction Worker', 6, 'Pasta - Cannelloni, Sheets, Fresh', 'Saturn', 'ncleugher4n@liveinternet.ru', '(249) 7090640', '6/12/2022', 'Elevator', 'Merdei Airport', 2, '15/05/2023'),
(169, 'NASDAQ', 'Mandalgovi', '7 Barnett Plaza', 2, 2, 'Construction Worker', 2, 'Soup - Knorr, Ministrone', 'Mazda', 'bpeatheyjohns4o@tmall.com', '(951) 3795226', '4/1/2023', 'Retaining Wall and Brick Pavers', 'Mojica Airport', 2, '15/05/2023'),
(170, 'NYSE', 'Balekambang', '84216 Karstens Plaza', 2, 2, 'Estimator', 5, 'Marsala - Sperone, Fine, D.o.c.', 'Cadillac', 'jpadkin4p@imageshack.us', '(316) 7504491', '4/29/2023', 'Painting & Vinyl Wall Covering', 'Tobago-Crown Point Airport', 2, '15/05/2023'),
(171, 'NYSE', 'Jinniu', '5 Division Park', 3, 3, 'Construction Expeditor', 1, 'Mushroom - Crimini', 'Acura', 'gpearch4q@hostgator.com', '(169) 4226742', '11/18/2022', 'Landscaping & Irrigation', 'Harrison County Airport', 2, '15/05/2023'),
(172, 'NYSE', 'Shuvakish', '501 Straubel Parkway', 3, 3, 'Construction Expeditor', 6, 'Cake - Mini Potato Pancake', 'Audi', 'khuikerby4r@typepad.com', '(527) 1323488', '9/14/2022', 'Plumbing & Medical Gas', 'Vatulele Airport', 2, '15/05/2023'),
(173, 'NASDAQ', 'Revelstoke', '16621 Quincy Terrace', 3, 2, 'Project Manager', 7, 'Longos - Lasagna Beef', 'Lexus', 'vbetterton4s@taobao.com', '(666) 6334771', '3/10/2023', 'Electrical and Fire Alarm', 'Tumolbil Airport', 2, '15/05/2023'),
(174, 'NASDAQ', 'Bardalah', '46242 Fulton Junction', 2, 2, 'Supervisor', 4, 'Wine - Gewurztraminer Pierre', 'Subaru', 'kmcatamney4t@list-manage.com', '(995) 1003661', '9/3/2022', 'Electrical', 'Sugraly Airport', 2, '15/05/2023'),
(175, 'NYSE', 'Heyin', '917 Becker Crossing', 1, 1, 'Estimator', 1, 'Pepper - Roasted Red', 'Chevrolet', 'bspacie4u@nps.gov', '(727) 6749468', '6/12/2022', 'Roofing (Metal)', 'Sabetta International Airport', 2, '15/05/2023'),
(176, 'NYSE', 'Ichuña', '29972 Canary Lane', 1, 2, 'Estimator', 5, 'Chocolate - Chips Compound', 'Pontiac', 'mjorio4v@intel.com', '(697) 2159712', '6/28/2022', 'Framing (Wood)', 'Waco Kungo Airport', 2, '15/05/2023'),
(177, 'NASDAQ', 'Gołkowice', '0 Becker Park', 2, 2, 'Construction Manager', 1, 'Beef - Kobe Striploin', 'Cadillac', 'asnawdon4w@artisteer.com', '(824) 8677865', '8/14/2022', 'Termite Control', 'Dywer Airbase', 2, '15/05/2023'),
(178, 'NYSE', 'Huesca', '0 Sycamore Circle', 3, 3, 'Electrician', 3, 'Quail - Whole, Boneless', 'Volkswagen', 'efaux4x@bbb.org', '(923) 9652818', '5/8/2023', 'Fire Protection', 'Nkongsamba Airport', 2, '15/05/2023'),
(179, 'NASDAQ', 'Alvarães', '63 Mesta Center', 3, 2, 'Engineer', 4, 'Pop Shoppe Cream Soda', 'Saab', 'lgrix4y@cyberchimps.com', '(136) 9026884', '7/7/2022', 'Temp Fencing, Decorative Fencing and Gates', 'Oksapmin Airport', 2, '15/05/2023'),
(180, 'NYSE', 'Pyay', '112 Florence Point', 1, 2, 'Estimator', 5, 'Coriander - Seed', 'GMC', 'lambresin4z@about.me', '(800) 2943651', '10/21/2022', 'Prefabricated Aluminum Metal Canopies', 'Santa Cruz Island Airport', 2, '15/05/2023'),
(181, 'NYSE', 'Ladan', '6148 Spohn Alley', 3, 3, 'Electrician', 7, 'Brandy Apricot', 'GMC', 'jdulling50@unc.edu', '(557) 5788332', '10/5/2022', 'Site Furnishings', 'RAF Greenham Common', 2, '15/05/2023'),
(182, 'NYSE', 'Ramos', '520 Magdeline Road', 3, 3, 'Electrician', 5, 'Taro Root', 'Mercedes-Benz', 'vromer51@cbslocal.com', '(364) 4213693', '8/25/2022', 'EIFS', 'New York Skyports Inc Seaplane Base', 2, '15/05/2023'),
(183, 'NYSE', 'Papelón', '91717 Oxford Junction', 1, 3, 'Architect', 7, 'Apricots - Dried', 'Mercedes-Benz', 'bebbetts52@ucoz.ru', '(907) 7183965', '12/29/2022', 'Electrical and Fire Alarm', 'Inisheer Aerodrome', 2, '15/05/2023'),
(184, 'NASDAQ', 'Oenopu', '75 Donald Parkway', 3, 3, 'Estimator', 2, 'Coke - Classic, 355 Ml', 'Buick', 'mlugden53@meetup.com', '(373) 5435558', '12/17/2022', 'Drywall & Acoustical (FED)', 'Jaisalmer Airport', 2, '15/05/2023'),
(185, 'NASDAQ', 'Brudzew', '92722 Rigney Road', 3, 2, 'Supervisor', 5, 'Olives - Nicoise', 'Pontiac', 'ghenryson54@japanpost.jp', '(636) 7355930', '10/29/2022', 'Prefabricated Aluminum Metal Canopies', 'Nullagine Airport', 2, '15/05/2023'),
(186, 'NYSE', 'Longsheng', '2774 Sachs Road', 3, 2, 'Surveyor', 2, 'Chicken Giblets', 'Toyota', 'nlaurentin55@lulu.com', '(264) 7746628', '6/19/2022', 'Wall Protection', 'Antalya International Airport', 2, '15/05/2023'),
(187, 'NASDAQ', 'Ángeles', '1097 Northland Terrace', 3, 1, 'Supervisor', 6, 'Miso Paste White', 'Dodge', 'ecoultass56@creativecommons.org', '(409) 3014638', '12/18/2022', 'Hard Tile & Stone', 'Zhangjiakou Ningyuan Airport', 2, '15/05/2023'),
(188, 'NYSE', 'Kainan', '4 Pierstorff Crossing', 2, 3, 'Architect', 6, 'Muffin Hinge - 211n', 'Jeep', 'dsoame57@sphinn.com', '(233) 5512496', '7/14/2022', 'Structural & Misc Steel Erection', 'Fazenda das Represas Airport', 2, '15/05/2023'),
(189, 'NYSE', 'Kara Suu', '73730 Lotheville Junction', 1, 1, 'Construction Manager', 2, 'Cookie Dough - Chocolate Chip', 'Jeep', 'mhawkett58@chicagotribune.com', '(500) 6664073', '3/13/2023', 'Exterior Signage', 'Miramar Marine Corps Air Station - Mitscher Field', 2, '15/05/2023'),
(190, 'NYSE', 'Deneysville', '27 Kedzie Plaza', 2, 1, 'Surveyor', 3, 'Juice - Mango', 'Ford', 'sglanz59@nsw.gov.au', '(601) 2556628', '8/10/2022', 'HVAC', 'Fianarantsoa Airport', 2, '15/05/2023'),
(191, 'NASDAQ', 'Ochër', '4 Gina Center', 1, 1, 'Subcontractor', 6, 'Oil - Sesame', 'Mitsubishi', 'crosenbarg5a@smugmug.com', '(670) 5212748', '10/20/2022', 'Elevator', 'Ville Airport', 2, '15/05/2023'),
(192, 'NYSE', 'Sukarama', '478 Schurz Trail', 2, 3, 'Project Manager', 7, 'Cheese - Augre Des Champs', 'Ford', 'darnatt5b@marriott.com', '(387) 5247229', '4/8/2023', 'Rebar & Wire Mesh Install', 'Vienna International Airport', 2, '15/05/2023'),
(193, 'NYSE', 'Le Pontet', '9 Manitowish Place', 3, 2, 'Electrician', 4, 'Monkfish - Fresh', 'Nissan', 'hbozworth5c@weibo.com', '(623) 3345894', '1/13/2023', 'Electrical and Fire Alarm', 'Mulia Airport', 2, '15/05/2023'),
(194, 'NYSE', 'Igbaras', '1 Anhalt Street', 1, 2, 'Project Manager', 6, 'Scotch - Queen Anne', 'Volkswagen', 'hpatrickson5d@privacy.gov.au', '(970) 9569402', '3/21/2023', 'Structural and Misc Steel (Fabrication)', 'Summer Beaver Airport', 2, '15/05/2023'),
(195, 'NASDAQ', 'Zhifang', '39755 Hoepker Place', 1, 2, 'Estimator', 2, 'Red Currants', 'Ford', 'mluc5e@tinyurl.com', '(245) 9244499', '4/12/2023', 'Doors, Frames & Hardware', 'Palm Beach County Park Airport', 2, '15/05/2023'),
(196, 'NASDAQ', 'Orlovo', '006 Novick Place', 1, 3, 'Estimator', 6, 'Cheese - Woolwich Goat, Log', 'Honda', 'cdilrew5f@microsoft.com', '(827) 4488955', '1/26/2023', 'Retaining Wall and Brick Pavers', 'Frederick Regional Airport', 2, '15/05/2023'),
(197, 'NASDAQ', 'Xinhui', '4 Manley Hill', 2, 3, 'Construction Expeditor', 5, 'Appetiser - Bought', 'BMW', 'pdhenin5g@nba.com', '(934) 3973285', '12/26/2022', 'Construction Clean and Final Clean', 'Safia Airport', 2, '15/05/2023'),
(198, 'NYSE', 'Kitapak', '84 Ohio Avenue', 3, 3, 'Project Manager', 6, 'Wasabi Powder', 'Chevrolet', 'fgrenshiels5h@examiner.com', '(296) 4131364', '5/23/2022', 'Roofing (Metal)', 'Lebel-sur-Quevillon Airport', 2, '15/05/2023'),
(199, 'NASDAQ', 'Floriana', '536 Stephen Park', 1, 3, 'Electrician', 1, 'Wine - George Duboeuf Rose', 'Mitsubishi', 'sciccoloi5i@blogs.com', '(444) 4506927', '10/23/2022', 'Asphalt Paving', 'Fulton County Airport Brown Field', 2, '15/05/2023'),
(200, 'NASDAQ', 'Jidd Ḩafş', '8 Heath Terrace', 1, 3, 'Supervisor', 3, 'Syrup - Kahlua Chocolate', 'Volkswagen', 'mcallicott5j@gmpg.org', '(622) 7186800', '6/24/2022', 'Termite Control', 'Lábrea Airport', 2, '15/05/2023'),
(201, 'NYSE', 'Dongfeng', '2 Bowman Street', 3, 3, 'Construction Expeditor', 4, 'Coconut - Creamed, Pure', 'Toyota', 'hcollidge5k@etsy.com', '(229) 6565648', '4/19/2023', 'Elevator', 'Piloto Civil N. Fernández Airport', 2, '15/05/2023'),
(202, 'NASDAQ', 'Sumurgayam', '2 Eliot Plaza', 2, 3, 'Subcontractor', 2, 'Sugar - Icing', 'Jaguar', 'tlambarton5l@cnn.com', '(293) 1830224', '7/21/2022', 'Drywall & Acoustical (FED)', 'Çiğli Airport', 2, '15/05/2023'),
(203, 'NYSE', 'Rancanyenang', '9784 Canary Alley', 1, 2, 'Engineer', 5, 'Nantucket Apple Juice', 'Audi', 'gcowmeadow5m@ed.gov', '(409) 2742778', '9/17/2022', 'Fire Protection', 'Detroit Lakes Airport - Wething Field', 2, '15/05/2023'),
(204, 'NYSE', 'Sandviken', '29971 Roth Drive', 2, 2, 'Surveyor', 6, 'Soup - Campbells, Chix Gumbo', 'Dodge', 'mnolder5n@fastcompany.com', '(966) 5688632', '5/23/2022', 'Drywall & Acoustical (FED)', 'Akieni Airport', 2, '15/05/2023'),
(205, 'NASDAQ', 'Saijō', '347 Hoffman Park', 3, 3, 'Construction Expeditor', 7, 'Bread Cranberry Foccacia', 'Ford', 'eangelo5o@hatena.ne.jp', '(451) 7800234', '11/30/2022', 'Sitework & Site Utilities', 'Beale Air Force Base', 2, '15/05/2023'),
(206, 'NYSE', 'Saraza', '8 Manufacturers Park', 3, 2, 'Construction Expeditor', 7, 'Skewers - Bamboo', 'Dodge', 'egilbart5p@pbs.org', '(115) 9559124', '6/20/2022', 'Hard Tile & Stone', 'Aberdeen Regional Airport', 2, '15/05/2023'),
(207, 'NYSE', 'Perbaungan', '17118 Eastwood Parkway', 1, 3, 'Construction Expeditor', 2, 'Bread - Sour Sticks With Onion', 'Ford', 'tgusticke5q@spotify.com', '(258) 5063931', '6/6/2022', 'Sitework & Site Utilities', 'St. Paul Airport', 2, '15/05/2023'),
(208, 'NASDAQ', 'Anbyŏn-ŭp', '4 Bashford Park', 2, 3, 'Construction Manager', 7, 'Cookie - Oreo 100x2', 'Mercury', 'strusty5r@wikia.com', '(408) 8748738', '6/6/2022', 'Rebar & Wire Mesh Install', 'Satwag Airport', 2, '15/05/2023'),
(209, 'NYSE', 'La Gomera', '4 Hazelcrest Avenue', 2, 2, 'Electrician', 2, 'Cookies - Fortune', 'Jeep', 'tletson5s@smh.com.au', '(391) 5731391', '6/13/2022', 'Retaining Wall and Brick Pavers', 'Santa Maria Airport', 2, '15/05/2023'),
(210, 'NYSE', 'Payapa', '05637 Elmside Circle', 3, 1, 'Supervisor', 3, 'Cheese - Asiago', 'Mercury', 'ncoronas5t@blogger.com', '(995) 7018704', '9/6/2022', 'Casework', 'Jefferson County International Airport', 2, '15/05/2023'),
(211, 'NYSE', 'Hualin', '910 Daystar Hill', 1, 1, 'Construction Worker', 1, 'Bread - Raisin', 'Nissan', 'mpalombi5u@ehow.com', '(302) 2413738', '11/26/2022', 'Framing (Wood)', 'Chisana Airport', 2, '15/05/2023'),
(212, 'NYSE', 'Dar Chabanne', '73 Sachtjen Junction', 1, 1, 'Electrician', 1, 'Lid Tray - 12in Dome', 'Suzuki', 'nbaines5v@umn.edu', '(542) 6550475', '1/26/2023', 'Sitework & Site Utilities', 'Denver International Airport', 2, '15/05/2023'),
(213, 'NYSE', 'Bojawa', '7 Fordem Plaza', 1, 1, 'Engineer', 2, 'Beef Wellington', 'Corbin', 'cszreter5w@dell.com', '(509) 9546590', '4/21/2023', 'Painting & Vinyl Wall Covering', 'Nambaiyufa Airport', 2, '15/05/2023'),
(214, 'NYSE', 'Jianghai', '9844 Fulton Plaza', 1, 3, 'Construction Manager', 7, 'Saskatoon Berries - Frozen', 'Panoz', 'kpiddocke5x@miitbeian.gov.cn', '(680) 6473210', '12/4/2022', 'Asphalt Paving', 'Pecos Municipal Airport', 2, '15/05/2023');
INSERT INTO `vacantes` (`Id`, `Nombre_empresa`, `Provincia`, `Direccion`, `Sexo`, `Nacionalidad`, `Posicion_requerida`, `Nivel_estudio`, `Requisitos`, `Beneficios`, `Correo_electronico_aplicante`, `Numero_telefono`, `Fecha_limite`, `Categoria`, `Comentario_adicional`, `Estado`, `Fecha_creacion`) VALUES
(215, 'NASDAQ', 'Itajuípe', '549 Melby Park', 2, 2, 'Supervisor', 7, 'Ham Black Forest', 'Plymouth', 'mfronczak5y@blogger.com', '(709) 9489781', '8/7/2022', 'Drywall & Acoustical (FED)', 'Tahsis Seaplane Base', 2, '15/05/2023'),
(216, 'NASDAQ', 'San Isidro', '8 Independence Hill', 1, 3, 'Construction Expeditor', 2, 'Pepper - Julienne, Frozen', 'BMW', 'jmurt5z@marriott.com', '(717) 2686089', '11/5/2022', 'Prefabricated Aluminum Metal Canopies', 'Tamana Island Airport', 2, '15/05/2023'),
(217, 'NASDAQ', 'Netrakona', '5022 Dapin Pass', 1, 2, 'Construction Manager', 7, 'Chicken Thigh - Bone Out', 'Chrysler', 'dimm60@harvard.edu', '(308) 8402860', '12/6/2022', 'Temp Fencing, Decorative Fencing and Gates', 'Phnom Penh International Airport', 2, '15/05/2023'),
(218, 'NYSE', 'Areado', '40 Shasta Plaza', 1, 3, 'Construction Worker', 4, 'Dill Weed - Fresh', 'Honda', 'ebapty61@ustream.tv', '(731) 9248821', '4/16/2023', 'Doors, Frames & Hardware', 'Braga Municipal Aerodrome', 2, '15/05/2023'),
(219, 'NYSE', 'Jardin', '0756 Summer Ridge Lane', 3, 2, 'Architect', 3, 'Wine - Magnotta, Merlot Sr Vqa', 'Cadillac', 'savesque62@123-reg.co.uk', '(989) 5973228', '10/7/2022', 'Plumbing & Medical Gas', 'Livingstone Airport', 2, '15/05/2023'),
(220, 'NYSE', 'Haugesund', '7 Cordelia Plaza', 3, 1, 'Surveyor', 3, 'Juice - Happy Planet', 'Pontiac', 'pstrattan63@cocolog-nifty.com', '(332) 4173320', '4/28/2023', 'Hard Tile & Stone', 'Wewak International Airport', 2, '15/05/2023'),
(221, 'NASDAQ', 'Aranguren', '45 Amoth Plaza', 1, 3, 'Construction Foreman', 4, 'Puree - Guava', 'Tesla', 'bkopacek64@wp.com', '(861) 4497952', '7/28/2022', 'Fire Sprinkler System', 'Hydaburg Seaplane Base', 2, '15/05/2023'),
(222, 'NASDAQ', 'Paraćin', '29940 Independence Trail', 3, 2, 'Construction Foreman', 4, 'Port - 74 Brights', 'Ford', 'gschuchmacher65@drupal.org', '(960) 4252453', '10/20/2022', 'Termite Control', 'Serui Airport', 2, '15/05/2023'),
(223, 'NASDAQ', 'Oudtshoorn', '05045 Schurz Terrace', 3, 2, 'Surveyor', 1, 'Juice - Happy Planet', 'GMC', 'nleggott66@va.gov', '(913) 9288434', '5/21/2022', 'Plumbing & Medical Gas', 'Kinston Regional Jetport At Stallings Field', 2, '15/05/2023'),
(224, 'NYSE', 'Shahrak-e Bākharz', '1 Farwell Parkway', 3, 1, 'Construction Foreman', 3, 'Wine - Red, Gamay Noir', 'Chevrolet', 'hphipardshears67@wp.com', '(466) 2202242', '4/4/2023', 'Sitework & Site Utilities', 'Long Lama Airport', 2, '15/05/2023'),
(225, 'NASDAQ', 'Tripoli', '228 Merry Point', 1, 2, 'Construction Manager', 2, 'Rum - Cream, Amarula', 'Toyota', 'bmcgeown68@cmu.edu', '(197) 4814883', '8/5/2022', 'Landscaping & Irrigation', 'Capitán Av. Salvador Ogaya G. airport', 2, '15/05/2023'),
(226, 'NYSE', 'Igpit', '8689 Westridge Hill', 2, 2, 'Architect', 5, 'Pants Custom Dry Clean', 'Mazda', 'odumbare69@walmart.com', '(226) 3321209', '8/21/2022', 'Exterior Signage', 'Porto de Moz Airport', 2, '15/05/2023'),
(227, 'NYSE', 'Issa', '554 Cherokee Terrace', 2, 2, 'Construction Expeditor', 7, 'Sachet', 'Suzuki', 'hkowalski6a@harvard.edu', '(708) 6873250', '9/10/2022', 'Elevator', 'Francisco de Sá Carneiro Airport', 2, '15/05/2023'),
(228, 'NYSE', 'Washington', '553 Bunker Hill Crossing', 3, 3, 'Electrician', 5, 'Container - Hngd Cll Blk 7x7x3', 'Nissan', 'cwagg6b@i2i.jp', '(202) 4939159', '2/11/2023', 'Glass & Glazing', 'Gaylord Regional Airport', 2, '15/05/2023'),
(229, 'NASDAQ', 'Luzhi', '04392 Cardinal Place', 1, 2, 'Surveyor', 4, 'Galliano', 'Chevrolet', 'wdemoge6c@apache.org', '(284) 8189347', '7/14/2022', 'Casework', 'Oxford (Kidlington) Airport', 2, '15/05/2023'),
(230, 'NYSE', 'Los Tangos', '31 Boyd Trail', 2, 1, 'Surveyor', 1, 'Tamarillo', 'Ford', 'hfackrell6d@google.cn', '(222) 1869326', '12/21/2022', 'Electrical and Fire Alarm', 'Tuzla International Airport', 2, '15/05/2023'),
(231, 'NASDAQ', 'Pasarkayu', '38845 Ridgeway Center', 2, 2, 'Engineer', 3, 'Shrimp - Baby, Cold Water', 'Chevrolet', 'aandrzejczak6e@forbes.com', '(940) 1184362', '1/29/2023', 'Fire Protection', 'Takotna Airport', 2, '15/05/2023'),
(232, 'NASDAQ', 'Dalupaon', '69 Main Hill', 2, 3, 'Engineer', 3, 'Pastry - Chocolate Marble Tea', 'Hyundai', 'rambroz6f@globo.com', '(521) 4216665', '12/24/2022', 'Drywall & Acoustical (MOB)', 'Bradshaw Army Airfield', 2, '15/05/2023'),
(233, 'NYSE', 'Siukh', '4930 Pearson Hill', 2, 1, 'Subcontractor', 2, 'Syrup - Monin, Swiss Choclate', 'Nissan', 'stingle6g@cyberchimps.com', '(359) 1153861', '6/2/2022', 'Marlite Panels (FED)', 'Narita International Airport', 2, '15/05/2023'),
(234, 'NYSE', 'Bulgan', '0364 Jenna Pass', 1, 1, 'Project Manager', 1, 'Wine - White, Ej', 'Toyota', 'lduly6h@youtube.com', '(806) 2090509', '12/23/2022', 'Framing (Steel)', 'Atikokan Municipal Airport', 2, '15/05/2023'),
(235, 'NYSE', 'Slobodnica', '1 Summer Ridge Lane', 3, 1, 'Surveyor', 5, 'Zucchini - Mini, Green', 'Ford', 'rtyer6i@baidu.com', '(432) 5958865', '1/16/2023', 'Soft Flooring and Base', 'Vanrook Station Airport', 2, '15/05/2023'),
(236, 'NYSE', 'Marne-la-Vallée', '8134 Ridgeview Crossing', 3, 2, 'Construction Manager', 7, 'Table Cloth 81x81 White', 'Dodge', 'amcfarlane6j@uol.com.br', '(141) 6044137', '5/17/2022', 'Granite Surfaces', 'Masindi Airport', 2, '15/05/2023'),
(237, 'NYSE', 'Khāndbāri', '8 Waubesa Center', 2, 1, 'Project Manager', 6, 'Cheese - Romano, Grated', 'Oldsmobile', 'jpache6k@sfgate.com', '(823) 7840626', '12/2/2022', 'Electrical', 'Nejjo Airport', 2, '15/05/2023'),
(238, 'NYSE', 'Naples', '2 Brown Hill', 2, 1, 'Surveyor', 4, 'Fish - Bones', 'Dodge', 'mtomowicz6l@ebay.com', '(239) 6543849', '6/16/2022', 'Drilled Shafts', 'Tenkodogo Airport', 2, '15/05/2023'),
(239, 'NASDAQ', 'Shuangkou', '567 West Way', 2, 3, 'Architect', 1, 'Glass Clear 8 Oz', 'Toyota', 'mfairnington6m@huffingtonpost.com', '(349) 4899962', '5/29/2022', 'Electrical', 'Hall Beach Airport', 2, '15/05/2023'),
(240, 'NASDAQ', 'Sinop', '4656 Nova Circle', 3, 2, 'Supervisor', 7, 'Beets - Pickled', 'Lexus', 'rmcgeaney6n@abc.net.au', '(660) 9896639', '11/28/2022', 'Marlite Panels (FED)', 'Alroy Downs Airport', 2, '15/05/2023'),
(241, 'NYSE', 'Moissy-Cramayel', '1228 Westport Hill', 1, 2, 'Supervisor', 1, 'Vodka - Lemon, Absolut', 'Chevrolet', 'aling6o@mtv.com', '(917) 6378147', '11/27/2022', 'HVAC', 'Ihu Airport', 2, '15/05/2023'),
(242, 'NYSE', 'Pasirdalem', '52 Sugar Terrace', 3, 3, 'Project Manager', 5, 'Lamb - Shoulder, Boneless', 'Cadillac', 'cflanner6p@nifty.com', '(800) 1604481', '1/21/2023', 'Retaining Wall and Brick Pavers', 'Willow Run Airport', 2, '15/05/2023'),
(243, 'NYSE', 'Khuzhir', '8509 Vermont Circle', 2, 2, 'Construction Foreman', 4, 'Beef - Diced', 'Subaru', 'jcominotti6q@e-recht24.de', '(272) 6984435', '6/20/2022', 'Granite Surfaces', 'Goondiwindi Airport', 2, '15/05/2023'),
(244, 'NYSE', 'Askersund', '801 High Crossing Way', 1, 3, 'Architect', 1, 'Wine - Barossa Valley Estate', 'Chevrolet', 'mtrimnell6r@oakley.com', '(754) 2841338', '8/8/2022', 'Framing (Steel)', 'Fukue Airport', 2, '15/05/2023'),
(245, 'NYSE', 'Maceda', '156 Towne Court', 2, 2, 'Construction Expeditor', 2, 'Juice - Lagoon Mango', 'Suzuki', 'mmadle6s@nps.gov', '(707) 4456661', '8/22/2022', 'Roofing (Metal)', 'Kabala Airport', 2, '15/05/2023'),
(246, 'NASDAQ', 'Magdalena', '246 Morrow Circle', 1, 3, 'Electrician', 4, 'Mushroom - Oyster, Fresh', 'Land Rover', 'ccoltart6t@arizona.edu', '(626) 5250499', '10/14/2022', 'Wall Protection', 'Delma Airport', 2, '15/05/2023'),
(247, 'NASDAQ', 'Vila Verde', '2 Ridgeway Alley', 3, 3, 'Subcontractor', 2, 'Chocolate Bar - Smarties', 'Acura', 'tromanelli6u@prlog.org', '(577) 1578519', '5/7/2023', 'Doors, Frames & Hardware', 'Sultan Azlan Shah Airport', 2, '15/05/2023'),
(248, 'NYSE', 'Johor Bahru', '81 Milwaukee Way', 1, 3, 'Surveyor', 6, 'Lamb - Shanks', 'Land Rover', 'lshackell6v@over-blog.com', '(373) 3971213', '10/19/2022', 'Marlite Panels (FED)', 'Robin Hood Doncaster Sheffield Airport', 2, '15/05/2023'),
(249, 'NYSE', 'Dresden', '2 Union Circle', 3, 3, 'Engineer', 7, 'Lamb - Bones', 'Mitsubishi', 'plippiett6w@domainmarket.com', '(759) 4528443', '1/8/2023', 'Drywall & Acoustical (FED)', 'Adana Airport', 2, '15/05/2023'),
(250, 'NASDAQ', 'Patrol', '0310 Nelson Point', 3, 3, 'Estimator', 6, 'Sauce - Fish 25 Ozf Bottle', 'Mitsubishi', 'egarms6x@google.com.au', '(826) 1469688', '3/1/2023', 'Glass & Glazing', 'Monument Valley Airport', 2, '15/05/2023'),
(251, 'NASDAQ', 'Le Raincy', '778 Dapin Park', 2, 1, 'Engineer', 2, 'Veal - Nuckle', 'Toyota', 'hbrittan6y@unblog.fr', '(207) 1685152', '10/28/2022', 'HVAC', 'Beijing Nanyuan Airport', 1, '15/05/2023'),
(252, 'NYSE', 'Bosilovo', '96024 Northport Trail', 3, 1, 'Engineer', 6, 'Pork - Loin, Boneless', 'Jeep', 'ydoxey6z@cnet.com', '(170) 9687792', '8/15/2022', 'RF Shielding', 'Birmingham-Shuttlesworth International Airport', 1, '15/05/2023'),
(253, 'NASDAQ', 'Umburarameha', '1 Hazelcrest Circle', 1, 2, 'Construction Expeditor', 7, 'Dip - Tapenade', 'Geo', 'ranthon70@sfgate.com', '(453) 2589970', '2/18/2023', 'Retaining Wall and Brick Pavers', 'Castro Airport', 1, '15/05/2023'),
(254, 'NASDAQ', 'El Cacao', '1 Ridge Oak Way', 3, 2, 'Subcontractor', 2, 'Sauce - Gravy, Au Jus, Mix', 'Mercedes-Benz', 'tayre71@de.vu', '(174) 6958004', '5/11/2023', 'Plumbing & Medical Gas', 'Kemerovo Airport', 1, '15/05/2023'),
(255, 'NYSE', 'Chociwel', '56331 Waubesa Terrace', 3, 1, 'Surveyor', 3, 'Energy Drink Bawls', 'Mitsubishi', 'agregr72@google.es', '(651) 9757093', '8/22/2022', 'Temp Fencing, Decorative Fencing and Gates', 'Khark Island Airport', 1, '15/05/2023'),
(256, 'NASDAQ', 'Khorramābād', '4713 Warrior Parkway', 3, 1, 'Project Manager', 2, 'Beer - Paulaner Hefeweisse', 'Volkswagen', 'mbatstone73@ucoz.ru', '(353) 2346183', '5/19/2022', 'Roofing (Metal)', 'Fangatau Airport', 1, '15/05/2023'),
(257, 'NASDAQ', 'Albi', '03 Namekagon Place', 2, 2, 'Architect', 3, 'Thermometer Digital', 'Dodge', 'hdwyr74@nature.com', '(348) 8416556', '2/17/2023', 'Epoxy Flooring', 'Midland Airpark', 1, '15/05/2023'),
(258, 'NYSE', 'Gävle', '01 Leroy Circle', 3, 1, 'Construction Manager', 4, 'Pasta - Linguini, Dry', 'Chevrolet', 'cstoltz75@i2i.jp', '(523) 8035960', '3/1/2023', 'Casework', 'Cancún International Airport', 1, '15/05/2023'),
(259, 'NYSE', 'Sucre', '203 Helena Crossing', 2, 3, 'Supervisor', 1, 'Cookies - Fortune', 'Mazda', 'kdelayglesia76@edublogs.org', '(843) 9245805', '5/7/2023', 'Painting & Vinyl Wall Covering', 'Fort Lauderdale Executive Airport', 1, '15/05/2023'),
(260, 'NASDAQ', 'Villa General Belgrano', '5 Green Terrace', 1, 2, 'Construction Foreman', 7, 'Pasta - Penne Primavera, Single', 'Toyota', 'kfirmage77@accuweather.com', '(946) 7953064', '7/26/2022', 'Plumbing & Medical Gas', 'N\'zeto Airport', 1, '15/05/2023'),
(261, 'NYSE', 'Molde', '72309 Kensington Park', 2, 3, 'Construction Expeditor', 6, 'Temperature Recording Station', 'Chevrolet', 'cwetton78@instagram.com', '(359) 2935823', '1/13/2023', 'RF Shielding', 'St Clair County Airport', 1, '15/05/2023'),
(262, 'NYSE', 'Parapat', '019 Iowa Court', 1, 1, 'Electrician', 3, 'Bandage - Flexible Neon', 'Ford', 'hyakobowitz79@samsung.com', '(405) 3643330', '7/19/2022', 'Overhead Doors', 'Dix-Sept Rosado Airport', 1, '15/05/2023'),
(263, 'NYSE', 'Xicheng', '88421 Lunder Avenue', 1, 1, 'Project Manager', 7, 'Pepper - Chipotle, Canned', 'Toyota', 'rjoslyn7a@sbwire.com', '(385) 8098757', '6/5/2022', 'Sitework & Site Utilities', 'Dori Airport', 1, '15/05/2023'),
(264, 'NYSE', 'Örebro', '37 International Place', 2, 1, 'Engineer', 6, 'Mussels - Frozen', 'Mazda', 'oanwyl7b@netvibes.com', '(845) 1049801', '3/22/2023', 'Sitework & Site Utilities', 'Guaporé Airport', 1, '15/05/2023'),
(265, 'NYSE', 'Lima Pampa', '1560 Beilfuss Court', 1, 3, 'Engineer', 1, '7up Diet, 355 Ml', 'Cadillac', 'crichard7c@cisco.com', '(740) 3401698', '11/3/2022', 'Fire Protection', 'Sanhe Airport', 1, '15/05/2023'),
(266, 'NASDAQ', 'Wangjiahe', '74 Buell Junction', 2, 3, 'Subcontractor', 5, 'Oats Large Flake', 'Maserati', 'bbeale7d@unicef.org', '(668) 1695206', '10/28/2022', 'Fire Protection', 'Borg El Arab International Airport', 1, '15/05/2023'),
(267, 'NYSE', 'Duancun', '641 Northridge Court', 2, 2, 'Electrician', 2, 'Cinnamon - Ground', 'Ford', 'araggles7e@phoca.cz', '(465) 9686161', '1/18/2023', 'Hard Tile & Stone', 'Adelaide International Airport', 1, '15/05/2023'),
(268, 'NASDAQ', 'Quarteira', '70056 Chive Road', 2, 3, 'Construction Manager', 1, 'Pasta - Agnolotti - Butternut', 'BMW', 'apllu7f@bigcartel.com', '(263) 6007506', '8/29/2022', 'Structural and Misc Steel (Fabrication)', 'Girua Airport', 1, '15/05/2023'),
(269, 'NYSE', 'Foz Sousa', '05249 Bunting Avenue', 3, 2, 'Construction Manager', 6, 'Wine - Saint - Bris 2002, Sauv', 'Lexus', 'dwaddup7g@wp.com', '(237) 3457245', '9/2/2022', 'Painting & Vinyl Wall Covering', 'Shindand Airport', 1, '15/05/2023'),
(270, 'NASDAQ', 'Fëdorovskoye', '59 Summerview Center', 2, 1, 'Engineer', 5, 'Tomatoes - Plum, Canned', 'Dodge', 'eedgerly7h@netlog.com', '(559) 6759439', '1/12/2023', 'Painting & Vinyl Wall Covering', 'Pinar Del Rio Airport', 1, '15/05/2023'),
(271, 'NYSE', 'Catanauan', '26613 Waubesa Way', 3, 1, 'Project Manager', 5, 'Cheese - Manchego, Spanish', 'Mazda', 'ashaylor7i@census.gov', '(512) 8161624', '10/28/2022', 'Hard Tile & Stone', 'Dubuque Regional Airport', 1, '15/05/2023'),
(272, 'NASDAQ', 'Araçuaí', '89886 Anhalt Place', 3, 2, 'Project Manager', 1, 'Fib N9 - Prague Powder', 'Mazda', 'svannoni7j@sakura.ne.jp', '(816) 3328359', '12/5/2022', 'Glass & Glazing', 'Leribe Airport', 1, '15/05/2023'),
(273, 'NYSE', 'Antequera', '909 Reindahl Lane', 3, 2, 'Estimator', 1, 'Pepper - Roasted Red', 'Nissan', 'kwick7k@tripadvisor.com', '(975) 3507432', '12/27/2022', 'RF Shielding', 'Columbus Lowndes County Airport', 1, '15/05/2023'),
(274, 'NASDAQ', 'Newtown', '8 Fremont Street', 2, 1, 'Architect', 7, 'Mountain Dew', 'Acura', 'tstickland7l@ibm.com', '(842) 5396133', '11/27/2022', 'Exterior Signage', 'Sumbawanga Airport', 1, '15/05/2023'),
(275, 'NYSE', 'Silae', '204 Mayfield Parkway', 2, 2, 'Construction Manager', 4, 'Muffin Batt - Choc Chk', 'Toyota', 'nfernely7m@twitpic.com', '(763) 2845937', '2/19/2023', 'Overhead Doors', 'Antsirabato Airport', 1, '15/05/2023'),
(276, 'NYSE', 'Agogo', '0 Schmedeman Alley', 1, 1, 'Project Manager', 4, 'Pork - Ham Hocks - Smoked', 'GMC', 'sderuel7n@fema.gov', '(136) 7163354', '1/7/2023', 'RF Shielding', 'New Ishigaki Airport', 1, '15/05/2023'),
(277, 'NASDAQ', 'Paltamo', '901 Beilfuss Center', 2, 1, 'Engineer', 6, 'Marjoram - Fresh', 'Mazda', 'amansion7o@bloglines.com', '(785) 9420148', '5/15/2022', 'Termite Control', 'South Jersey Regional Airport', 1, '15/05/2023'),
(278, 'NASDAQ', 'Puutura', '60942 Sundown Court', 3, 3, 'Construction Foreman', 7, 'Sardines', 'Chrysler', 'emendes7p@taobao.com', '(176) 9864071', '1/30/2023', 'Structural & Misc Steel Erection', 'Paloich Airport, Heliport', 1, '15/05/2023'),
(279, 'NYSE', 'Liulin', '79554 Commercial Trail', 1, 3, 'Estimator', 5, 'Bar Energy Chocchip', 'Mercedes-Benz', 'dmatura7q@un.org', '(187) 1219447', '7/6/2022', 'EIFS', 'Arnold Palmer Regional Airport', 1, '15/05/2023'),
(280, 'NASDAQ', 'Beaumont', '8468 Bobwhite Circle', 3, 1, 'Architect', 5, 'Lobster - Canned Premium', 'Chrysler', 'bmattys7r@nih.gov', '(942) 1208222', '2/26/2023', 'Wall Protection', 'Banja Luka International Airport', 1, '15/05/2023'),
(281, 'NYSE', 'Macachín', '660 Fairview Way', 3, 3, 'Architect', 4, 'Basil - Pesto Sauce', 'Isuzu', 'fbadini7s@hexun.com', '(665) 1114808', '3/18/2023', 'Plumbing & Medical Gas', 'Sullivan Bay Seaplane Base', 1, '15/05/2023'),
(282, 'NASDAQ', 'Lovisa', '50766 Sunnyside Circle', 1, 1, 'Electrician', 4, 'Beer - True North Lager', 'Kia', 'aswanbourne7t@sphinn.com', '(197) 3387986', '1/24/2023', 'Construction Clean and Final Clean', 'Barcelonnette - Saint-Pons Airport', 1, '15/05/2023'),
(283, 'NASDAQ', 'Matala', '71728 Memorial Crossing', 2, 2, 'Construction Foreman', 7, 'Soup - Campbells, Beef Barley', 'GMC', 'bgammett7u@omniture.com', '(873) 9044403', '2/10/2023', 'Granite Surfaces', 'Wedau Airport', 1, '15/05/2023'),
(284, 'NASDAQ', 'Lupane', '4 Sherman Crossing', 3, 2, 'Supervisor', 7, 'Vinegar - Raspberry', 'Toyota', 'mwerrilow7v@scientificamerican.com', '(535) 8846160', '11/16/2022', 'Landscaping & Irrigation', 'Wajir Airport', 1, '15/05/2023'),
(285, 'NASDAQ', 'El Rancho', '6 Pleasure Plaza', 3, 3, 'Engineer', 7, 'Tortillas - Flour, 10', 'Buick', 'jeilers7w@moonfruit.com', '(353) 9349092', '12/11/2022', 'Drywall & Acoustical (FED)', 'Northeast Ohio Regional Airport', 1, '15/05/2023'),
(286, 'NYSE', 'Prachatice', '57769 Muir Drive', 2, 3, 'Subcontractor', 6, 'Cocoa Powder - Dutched', 'GMC', 'ewinsom7x@geocities.com', '(946) 2099702', '12/23/2022', 'Temp Fencing, Decorative Fencing and Gates', 'Le Mans-Arnage Airport', 1, '15/05/2023'),
(287, 'NASDAQ', 'Chateaubelair', '77674 Ryan Drive', 3, 2, 'Construction Expeditor', 4, 'Plate - Foam, Bread And Butter', 'Mercedes-Benz', 'jtoombes7y@acquirethisname.com', '(587) 6205116', '6/21/2022', 'Electrical and Fire Alarm', 'Burevestnik Airport', 1, '15/05/2023'),
(288, 'NYSE', 'Snizhne', '2323 Kennedy Alley', 3, 2, 'Construction Foreman', 1, 'Honey - Comb', 'Ford', 'rverrell7z@cpanel.net', '(211) 2356549', '8/25/2022', 'Roofing (Asphalt)', 'Bukhovtsi Airfield', 1, '15/05/2023'),
(289, 'NASDAQ', 'Apopa', '805 Lakewood Drive', 3, 3, 'Supervisor', 4, 'Wine - White, Riesling, Henry Of', 'Mazda', 'fmurthwaite80@craigslist.org', '(198) 8156403', '7/21/2022', 'Soft Flooring and Base', 'Yokota Air Base', 1, '15/05/2023'),
(290, 'NYSE', 'Elato', '79939 Raven Court', 1, 1, 'Construction Foreman', 2, 'Sausage - Liver', 'Mercury', 'nyuill81@google.es', '(171) 6779856', '6/11/2022', 'Fire Protection', 'Pyongyang Sunan International Airport', 1, '15/05/2023'),
(291, 'NYSE', 'Lianrao', '20 Dixon Alley', 3, 3, 'Construction Manager', 3, 'Beef - Striploin', 'GMC', 'gbraybrooke82@ustream.tv', '(276) 6584850', '8/16/2022', 'Granite Surfaces', 'Lindi Airport', 1, '15/05/2023'),
(292, 'NYSE', 'Vanino', '55 Forest Point', 1, 2, 'Electrician', 2, 'Vinegar - Red Wine', 'Suzuki', 'ccasham83@privacy.gov.au', '(557) 6449972', '2/5/2023', 'Exterior Signage', 'Orlando Sanford International Airport', 1, '15/05/2023'),
(293, 'NYSE', 'Dijon', '470 Buell Plaza', 1, 2, 'Construction Foreman', 1, 'Wine - White, Pelee Island', 'Honda', 'akeilloh84@1und1.de', '(982) 9156581', '5/18/2022', 'Drilled Shafts', 'Fazenda Santa Maria Airport', 1, '15/05/2023'),
(294, 'NASDAQ', 'Colonia Catuete', '77 New Castle Street', 2, 3, 'Surveyor', 3, 'Beer - Molson Excel', 'Ford', 'aduffield85@surveymonkey.com', '(421) 9720745', '12/10/2022', 'Granite Surfaces', 'Newcastle Airport', 1, '15/05/2023'),
(295, 'NYSE', 'Guanban', '37347 Moland Center', 3, 3, 'Supervisor', 1, 'Beef - Eye Of Round', 'Hyundai', 'bmcboyle86@livejournal.com', '(545) 5299527', '6/6/2022', 'Structural and Misc Steel (Fabrication)', 'Fakahina Airport', 1, '15/05/2023'),
(296, 'NYSE', 'Fukuechō', '80 Fulton Pass', 3, 2, 'Construction Worker', 7, 'Plate Foam Laminated 9in Blk', 'Infiniti', 'jrulf87@prlog.org', '(513) 5787027', '10/31/2022', 'Site Furnishings', 'City of Derry Airport', 1, '15/05/2023'),
(297, 'NASDAQ', 'As Sayyānī', '97 Atwood Trail', 1, 3, 'Construction Expeditor', 3, 'Catfish - Fillets', 'Toyota', 'mrozea88@tamu.edu', '(902) 4166911', '8/4/2022', 'Sitework & Site Utilities', 'Soekarno-Hatta International Airport', 1, '15/05/2023'),
(298, 'NYSE', 'Nis’oni', '0 Continental Avenue', 2, 2, 'Supervisor', 1, 'Triple Sec - Mcguinness', 'Hyundai', 'hmcgarvie89@ycombinator.com', '(541) 1182633', '9/20/2022', 'Casework', 'Groton New London Airport', 1, '15/05/2023'),
(299, 'NASDAQ', 'Wenfeng Zhen', '223 Coolidge Pass', 2, 2, 'Estimator', 6, 'Cheese - Cheddar, Old White', 'Chevrolet', 'bogrogane8a@wp.com', '(577) 2216712', '10/21/2022', 'Fire Sprinkler System', 'Cabinda Airport', 1, '15/05/2023'),
(300, 'NASDAQ', 'Kembang', '401 Lukken Circle', 1, 2, 'Estimator', 2, 'Almonds Ground Blanched', 'Mercedes-Benz', 'kyushin8b@blogspot.com', '(917) 1659929', '10/21/2022', 'Retaining Wall and Brick Pavers', 'Al Asad Air Base', 1, '15/05/2023'),
(301, 'NASDAQ', 'Khamyāb', '20 Luster Place', 1, 2, 'Construction Expeditor', 3, 'Creme De Cacao White', 'GMC', 'ochild8c@drupal.org', '(387) 7420961', '4/7/2023', 'Painting & Vinyl Wall Covering', 'Zenata – Messali El Hadj Airport', 1, '15/05/2023'),
(302, 'NYSE', 'Aloja', '1755 Sommers Center', 3, 2, 'Project Manager', 4, 'Bagel - Everything Presliced', 'Acura', 'bpriver8d@fastcompany.com', '(964) 3092527', '12/26/2022', 'Construction Clean and Final Clean', 'Cincinnati Municipal Airport Lunken Field', 1, '15/05/2023'),
(303, 'NYSE', 'Pisão', '96 Katie Way', 1, 3, 'Electrician', 2, 'Beer - Blue Light', 'Suzuki', 'ffarnish8e@123-reg.co.uk', '(748) 4256403', '4/7/2023', 'RF Shielding', 'Selbang Airport', 1, '15/05/2023'),
(304, 'NYSE', 'Ugbokpo', '462 Summer Ridge Trail', 3, 3, 'Construction Worker', 2, 'Pepper - Yellow Bell', 'Pontiac', 'agrindell8f@behance.net', '(380) 3388591', '4/30/2023', 'Masonry & Precast', 'Roanne-Renaison Airport', 1, '15/05/2023'),
(305, 'NASDAQ', 'Yafran', '09 Kipling Place', 1, 2, 'Architect', 1, 'Bread Sour Rolls', 'Mazda', 'fbrownlea8g@huffingtonpost.com', '(207) 6554989', '4/13/2023', 'Asphalt Paving', 'Hanzhong Chenggu Airport', 1, '15/05/2023'),
(306, 'NYSE', 'Lhakangtang', '1 Warbler Parkway', 3, 3, 'Electrician', 6, 'Fish - Soup Base, Bouillon', 'Cadillac', 'kjepperson8h@drupal.org', '(400) 2111032', '2/4/2023', 'Drywall & Acoustical (FED)', 'Mobile Downtown Airport', 1, '15/05/2023'),
(307, 'NYSE', 'Paris 04', '52 Brown Parkway', 1, 2, 'Subcontractor', 3, 'Lettuce - California Mix', 'Mitsubishi', 'ktesto8i@people.com.cn', '(476) 6072272', '6/29/2022', 'Waterproofing & Caulking', 'Ottawa / Rockcliffe Airport', 1, '15/05/2023'),
(308, 'NASDAQ', 'Wŏnju', '73840 Ridge Oak Way', 1, 3, 'Construction Expeditor', 3, 'Lamb - Sausage Casings', 'Dodge', 'lfranzolini8j@squidoo.com', '(738) 4168320', '2/6/2023', 'Wall Protection', 'Mfuwe Airport', 1, '15/05/2023'),
(309, 'NASDAQ', 'Gonābād', '2 Tony Terrace', 2, 3, 'Construction Worker', 4, 'Oil - Sesame', 'Ford', 'akermon8k@bbc.co.uk', '(677) 6854788', '1/24/2023', 'Fire Protection', 'Sehulea Airport', 1, '15/05/2023'),
(310, 'NYSE', 'Sławoborze', '5 Sunfield Street', 3, 2, 'Engineer', 3, 'Chocolate Bar - Smarties', 'Buick', 'bbolte8l@google.it', '(968) 7806100', '11/26/2022', 'Doors, Frames & Hardware', 'Pukapuka Island Airport', 1, '15/05/2023'),
(311, 'NASDAQ', 'Nizhnedevitsk', '20 Forest Dale Place', 2, 2, 'Construction Expeditor', 3, 'Potatoes - Peeled', 'Honda', 'estower8m@netvibes.com', '(836) 1612296', '1/18/2023', 'Waterproofing & Caulking', 'Rouyn Noranda Airport', 1, '15/05/2023'),
(312, 'NYSE', 'Reni', '3822 Calypso Avenue', 3, 3, 'Construction Expeditor', 3, 'Cloves - Ground', 'Ford', 'eserjeant8n@homestead.com', '(736) 4052075', '6/23/2022', 'Structural & Misc Steel Erection', 'Iraan Municipal Airport', 1, '15/05/2023'),
(313, 'NYSE', 'Nashville', '04 Lake View Street', 3, 2, 'Construction Expeditor', 6, 'Salt And Pepper Mix - White', 'Infiniti', 'sbines8o@blogtalkradio.com', '(615) 4068165', '9/19/2022', 'Structural & Misc Steel Erection', 'Shungnak Airport', 1, '15/05/2023'),
(314, 'NYSE', 'Hengtang', '7 Porter Terrace', 1, 2, 'Construction Manager', 6, 'Pie Filling - Apple', 'Mitsubishi', 'wpyrton8p@biblegateway.com', '(851) 8317601', '1/28/2023', 'Rebar & Wire Mesh Install', 'San Luis De Palenque Airport', 1, '15/05/2023'),
(315, 'NYSE', 'Cotonou', '118 Helena Circle', 1, 1, 'Electrician', 7, 'Lettuce - Arugula', 'Mazda', 'gorchard8q@prweb.com', '(412) 1579168', '3/19/2023', 'Sitework & Site Utilities', 'Xanxerê Airport', 1, '15/05/2023'),
(316, 'NYSE', 'Sam Chuk', '66 Fuller Parkway', 1, 1, 'Construction Foreman', 4, 'Pepper - Pablano', 'Mercury', 'aatchly8r@51.la', '(480) 4442117', '5/21/2022', 'RF Shielding', 'Northway Airport', 1, '15/05/2023'),
(317, 'NASDAQ', 'Ballyhaunis', '65 Merry Junction', 1, 3, 'Architect', 5, 'Pasta - Orecchiette', 'Scion', 'mmarmyon8s@xrea.com', '(403) 5515249', '7/29/2022', 'Plumbing & Medical Gas', 'Marshall Islands International Airport', 1, '15/05/2023'),
(318, 'NASDAQ', 'Clisson', '07 Eagle Crest Avenue', 1, 2, 'Estimator', 3, 'Oil - Grapeseed Oil', 'Hyundai', 'kmeller8t@chicagotribune.com', '(796) 4842691', '5/14/2023', 'Roofing (Metal)', 'Süleyman Demirel International Airport', 1, '15/05/2023'),
(319, 'NASDAQ', 'Randuboto', '2786 Fairview Pass', 1, 1, 'Subcontractor', 2, 'Higashimaru Usukuchi Soy', 'Lincoln', 'achedzoy8u@cdc.gov', '(985) 4042919', '12/2/2022', 'Drilled Shafts', 'Solwesi Airport', 1, '15/05/2023'),
(320, 'NYSE', 'Miami', '68209 Spenser Court', 3, 3, 'Electrician', 2, 'Sugar - Palm', 'Acura', 'areen8v@tamu.edu', '(305) 2421222', '8/11/2022', 'Roofing (Metal)', 'Lar Airport', 1, '15/05/2023'),
(321, 'NASDAQ', 'Banarankrajan', '3 Tomscot Park', 3, 2, 'Estimator', 2, 'Steel Wool', 'BMW', 'rcoultard8w@baidu.com', '(778) 9049735', '6/9/2022', 'Fire Sprinkler System', 'Colatina Airport', 1, '15/05/2023'),
(322, 'NYSE', 'Leninogorsk', '51135 Rigney Trail', 3, 3, 'Project Manager', 4, 'Pepperoni Slices', 'Subaru', 'ntrousdale8x@ca.gov', '(628) 9997952', '3/1/2023', 'Curb & Gutter', 'Jinchuan Airport', 1, '15/05/2023'),
(323, 'NASDAQ', 'Pedro García', '24 West Place', 1, 2, 'Surveyor', 7, 'Mustard - Individual Pkg', 'Pontiac', 'epaylor8y@cocolog-nifty.com', '(610) 6128689', '11/27/2022', 'Fire Sprinkler System', 'Cache Creek-Ashcroft Regional Airport', 1, '15/05/2023'),
(324, 'NASDAQ', 'Strawczyn', '1948 Clarendon Street', 1, 1, 'Estimator', 2, 'Tart Shells - Sweet, 3', 'Chevrolet', 'ctrimme8z@icq.com', '(116) 4236926', '10/8/2022', 'Hard Tile & Stone', 'Lauro Carneiro de Loyola Airport', 1, '15/05/2023'),
(325, 'NYSE', 'Maple Plain', '92394 Sauthoff Place', 1, 2, 'Subcontractor', 7, 'Filling - Mince Meat', 'Mazda', 'hstabbins90@redcross.org', '(952) 5806313', '2/13/2023', 'Marlite Panels (FED)', 'Shepparton Airport', 1, '15/05/2023'),
(326, 'NYSE', 'Fengtai Chengguanzhen', '948 Straubel Terrace', 3, 1, 'Engineer', 3, 'Puree - Passion Fruit', 'Dodge', 'gcastagne91@opera.com', '(460) 9303866', '1/16/2023', 'EIFS', 'Kauhava Airport', 1, '15/05/2023'),
(327, 'NYSE', 'Weishan', '8 Rockefeller Drive', 2, 2, 'Architect', 2, 'Versatainer Nc - 9388', 'Acura', 'ssheahan92@amazon.co.uk', '(375) 8213575', '4/6/2023', 'Curb & Gutter', 'Ambatondrazaka Airport', 1, '15/05/2023'),
(328, 'NASDAQ', 'Petersfield', '4 Warrior Terrace', 2, 1, 'Construction Worker', 6, 'Carbonated Water - Blackcherry', 'Chevrolet', 'tloughton93@tmall.com', '(127) 9709172', '4/26/2023', 'Marlite Panels (FED)', 'Afton Municipal Airport', 1, '15/05/2023'),
(329, 'NYSE', 'Morelos', '76439 Logan Plaza', 1, 2, 'Subcontractor', 6, 'Sole - Dover, Whole, Fresh', 'Ferrari', 'rpaulich94@statcounter.com', '(457) 1561856', '8/26/2022', 'Termite Control', 'Pilanesberg International Airport', 1, '15/05/2023'),
(330, 'NYSE', 'Ijuí', '6606 Daystar Street', 3, 2, 'Project Manager', 4, 'Beef - Striploin', 'BMW', 'rfinneran95@java.com', '(305) 6218550', '9/1/2022', 'Retaining Wall and Brick Pavers', 'Porto Seguro Airport', 1, '15/05/2023'),
(331, 'NASDAQ', 'Primorsko', '8781 Superior Center', 2, 2, 'Project Manager', 2, 'Steam Pan - Half Size Deep', 'Pontiac', 'akobu96@networkadvertising.org', '(915) 2469051', '3/11/2023', 'Plumbing & Medical Gas', 'Ust-Kamennogorsk Airport', 1, '15/05/2023'),
(332, 'NYSE', 'Ibaraki', '210 Gale Crossing', 3, 3, 'Surveyor', 3, 'Nori Sea Weed - Gold Label', 'Chevrolet', 'kgrubey97@angelfire.com', '(720) 1069603', '11/3/2022', 'Granite Surfaces', 'Tampa Padang Airport', 1, '15/05/2023'),
(333, 'NYSE', 'Gorki Vtoryye', '64067 Coleman Park', 3, 3, 'Construction Manager', 4, 'Wine - Zinfandel California 2002', 'Ford', 'chellsdon98@e-recht24.de', '(706) 5168551', '7/23/2022', 'Sitework & Site Utilities', 'San Tomé Airport', 1, '15/05/2023'),
(334, 'NASDAQ', 'Ferreñafe', '71139 Tennyson Crossing', 1, 3, 'Engineer', 2, 'Wine - Prosecco Valdobiaddene', 'BMW', 'kcreigan99@skype.com', '(429) 5211415', '7/16/2022', 'Temp Fencing, Decorative Fencing and Gates', 'Coondewanna Airport', 1, '15/05/2023'),
(335, 'NASDAQ', 'Dingle', '79 Artisan Circle', 3, 1, 'Construction Manager', 2, 'Danishes - Mini Raspberry', 'Toyota', 'rfuzzens9a@dropbox.com', '(268) 2499748', '1/31/2023', 'Elevator', 'Flensburg-Schäferhaus Airport', 1, '15/05/2023'),
(336, 'NYSE', 'Tongda', '31 Little Fleur Parkway', 2, 1, 'Supervisor', 6, 'Nut - Chestnuts, Whole', 'Acura', 'jgroveham9b@stumbleupon.com', '(858) 4757236', '12/5/2022', 'Granite Surfaces', 'Saipan International Airport', 1, '15/05/2023'),
(337, 'NASDAQ', 'Kayapa', '5 Mallard Parkway', 3, 2, 'Electrician', 5, 'Wine - Red, Antinori Santa', 'Lexus', 'jleades9c@fastcompany.com', '(739) 7420828', '2/11/2023', 'Waterproofing & Caulking', 'Monfort Airport', 1, '15/05/2023'),
(338, 'NASDAQ', 'Thawat Buri', '39 Dwight Court', 3, 1, 'Construction Expeditor', 5, 'The Pop Shoppe - Black Cherry', 'Lamborghini', 'mvoysey9d@wiley.com', '(544) 4712309', '12/30/2022', 'EIFS', 'Timbedra Airport', 1, '15/05/2023'),
(339, 'NASDAQ', 'Dunlewy', '9 Anniversary Street', 3, 2, 'Construction Foreman', 7, 'Syrup - Monin - Granny Smith', 'Audi', 'hsalling9e@paginegialle.it', '(872) 7985835', '5/5/2023', 'Waterproofing & Caulking', 'Cananea National Airport', 1, '15/05/2023'),
(340, 'NYSE', 'Kveda Chkhorots’q’u', '132 Boyd Hill', 1, 1, 'Construction Manager', 6, 'Beef - Tenderloin Tails', 'Buick', 'llamborne9f@creativecommons.org', '(938) 8440663', '3/25/2023', 'Structural & Misc Steel Erection', 'Amasya Merzifon Airport', 1, '15/05/2023'),
(341, 'NYSE', 'Thị Trấn Nghèn', '71 Morningstar Junction', 3, 3, 'Supervisor', 3, 'Bar Mix - Lime', 'Hyundai', 'erossander9g@studiopress.com', '(731) 7859033', '2/11/2023', 'Masonry & Precast', 'Arandis Airport', 1, '15/05/2023'),
(342, 'NYSE', 'Puputan', '8 Meadow Vale Street', 3, 3, 'Supervisor', 6, 'Beer - Sleemans Cream Ale', 'Land Rover', 'etimperley9h@cam.ac.uk', '(945) 2278254', '11/8/2022', 'Rebar & Wire Mesh Install', 'Auburn Lewiston Municipal Airport', 1, '15/05/2023'),
(343, 'NYSE', 'Babahoyo', '2 Redwing Court', 3, 2, 'Supervisor', 3, 'Eggplant - Regular', 'Mercedes-Benz', 'bstamp9i@fotki.com', '(964) 9334046', '9/14/2022', 'Wall Protection', 'Sønderborg Airport', 1, '15/05/2023'),
(344, 'NASDAQ', '‘Aqrah', '5572 South Plaza', 3, 2, 'Construction Manager', 2, 'Pork - Ham, Virginia', 'Kia', 'jpattini9j@wunderground.com', '(224) 9685731', '11/14/2022', 'Elevator', 'Port Walter Seaplane Base', 1, '15/05/2023'),
(345, 'NYSE', 'Doloon', '259 Mallory Avenue', 1, 2, 'Construction Worker', 1, 'Rhubarb', 'Chevrolet', 'baxelbey9k@ameblo.jp', '(505) 1968397', '3/30/2023', 'Soft Flooring and Base', 'Salgado Filho Airport', 1, '15/05/2023'),
(346, 'NYSE', 'Shikeng', '617 Trailsway Parkway', 1, 2, 'Electrician', 3, 'Clams - Bay', 'Infiniti', 'gfrill9l@about.com', '(659) 3958205', '10/11/2022', 'Site Furnishings', 'Moussoro Airport', 1, '15/05/2023'),
(347, 'NYSE', 'Siruma', '7 Troy Center', 3, 1, 'Estimator', 3, 'Oil - Pumpkinseed', 'Isuzu', 'rhailwood9m@alibaba.com', '(768) 2701757', '9/3/2022', 'Electrical and Fire Alarm', 'Mineral Wells Airport', 1, '15/05/2023'),
(348, 'NASDAQ', 'Balaogan', '610 Center Park', 2, 3, 'Construction Foreman', 1, 'Potatoes - Parissienne', 'Kia', 'vdunsford9n@ezinearticles.com', '(630) 4378463', '5/29/2022', 'Curb & Gutter', 'Tunggul Wulung Airport', 1, '15/05/2023'),
(349, 'NASDAQ', 'Lubomierz', '37567 Pierstorff Parkway', 1, 3, 'Construction Expeditor', 5, 'Cake Slab', 'Infiniti', 'sclarson9o@msu.edu', '(281) 8113279', '7/23/2022', 'Plumbing & Medical Gas', 'Culberson County Airport', 1, '15/05/2023'),
(350, 'NASDAQ', 'Nicolas Bravo', '782 Westridge Pass', 2, 2, 'Project Manager', 7, 'Gatorade - Orange', 'Cadillac', 'rkingdom9p@digg.com', '(472) 5993587', '1/5/2023', 'Fire Sprinkler System', 'St. Mary\'s Airport', 1, '15/05/2023'),
(351, 'NASDAQ', 'Villa Ángela', '61835 Steensland Road', 2, 1, 'Surveyor', 7, 'Trout - Rainbow, Fresh', 'Mercury', 'lclayden9q@tmall.com', '(734) 5351777', '1/18/2023', 'Epoxy Flooring', 'Bembridge Airport', 1, '15/05/2023'),
(352, 'NASDAQ', 'Adela', '79 Vernon Hill', 3, 3, 'Construction Worker', 1, 'Vegetable - Base', 'Kia', 'cpettisall9r@pinterest.com', '(386) 1104128', '8/26/2022', 'Retaining Wall and Brick Pavers', 'Tahsis Seaplane Base', 1, '15/05/2023'),
(353, 'NYSE', 'Lanas', '0581 Manufacturers Pass', 3, 3, 'Surveyor', 4, 'Food Colouring - Pink', 'Nissan', 'cjanuszewicz9s@mit.edu', '(558) 1786202', '12/10/2022', 'Elevator', 'Adam Airport', 1, '15/05/2023'),
(354, 'NASDAQ', 'Vista Hermosa', '2 Glendale Circle', 1, 2, 'Estimator', 1, 'Bacardi Limon', 'Ford', 'jsharply9t@51.la', '(787) 2703208', '1/2/2023', 'Plumbing & Medical Gas', 'Priština International Airport', 1, '15/05/2023'),
(355, 'NASDAQ', 'La Estrella', '26 Portage Way', 2, 2, 'Estimator', 1, 'Apple - Delicious, Red', 'Jeep', 'alucian9u@goo.gl', '(658) 7952476', '12/19/2022', 'Masonry & Precast', 'Tacuarembo Airport', 1, '15/05/2023'),
(356, 'NYSE', 'Buenos Aires', '34777 Lindbergh Center', 2, 2, 'Construction Manager', 3, 'Mushroom - Chantrelle, Fresh', 'Audi', 'smacdougall9v@pen.io', '(352) 4197488', '8/7/2022', 'RF Shielding', 'Brno-Tuřany Airport', 1, '15/05/2023'),
(357, 'NASDAQ', 'Yongjiahe', '0 Spohn Place', 2, 3, 'Supervisor', 7, 'Bread Roll Foccacia', 'Honda', 'lbishopp9w@umich.edu', '(344) 8345921', '6/7/2022', 'Masonry', 'Beersheba (Teyman) Airport', 1, '15/05/2023'),
(358, 'NYSE', 'Huaminglou', '5857 Artisan Plaza', 1, 1, 'Engineer', 1, 'Syrup - Monin - Blue Curacao', 'Saturn', 'cperrin9x@amazon.com', '(192) 6714617', '8/26/2022', 'EIFS', 'Kuyol Airport', 1, '15/05/2023'),
(359, 'NYSE', 'Vichy', '9 Hoffman Plaza', 3, 2, 'Subcontractor', 1, 'Wheat - Soft Kernal Of Wheat', 'Mitsubishi', 'obattleson9y@thetimes.co.uk', '(423) 5645186', '2/16/2023', 'Framing (Wood)', 'Gan International Airport', 1, '15/05/2023'),
(360, 'NASDAQ', 'Shibushi', '07 Comanche Park', 3, 1, 'Surveyor', 6, 'Petit Baguette', 'Audi', 'amatherson9z@yale.edu', '(803) 6368723', '8/16/2022', 'RF Shielding', 'Aktion National Airport', 1, '15/05/2023'),
(361, 'NYSE', 'Avarua', '0 Fieldstone Street', 1, 2, 'Construction Manager', 6, 'Curry Paste - Green Masala', 'Toyota', 'cburgwyna0@gravatar.com', '(459) 6039721', '11/11/2022', 'Rebar & Wire Mesh Install', 'Bursa Yenişehir Airport', 1, '15/05/2023'),
(362, 'NYSE', 'A’ershan', '982 Brentwood Road', 2, 2, 'Supervisor', 7, 'Oil - Canola', 'Volkswagen', 'jscardafielda1@flickr.com', '(592) 7395554', '11/11/2022', 'Epoxy Flooring', 'Corcoran Airport', 1, '15/05/2023'),
(363, 'NYSE', 'Ongi', '2412 Gulseth Pass', 2, 2, 'Project Manager', 2, 'Trout Rainbow Whole', 'GMC', 'eferraoa2@networkadvertising.org', '(842) 7754222', '8/3/2022', 'Wall Protection', 'Pescara International Airport', 1, '15/05/2023'),
(364, 'NYSE', 'San Pedro', '153 Bartillon Plaza', 2, 1, 'Project Manager', 2, 'Cheese - Goat', 'Toyota', 'hbilbrookea3@topsy.com', '(600) 9539131', '4/12/2023', 'RF Shielding', 'Paloich Airport, Heliport', 1, '15/05/2023'),
(365, 'NASDAQ', 'Karangturi', '13418 Nancy Court', 1, 3, 'Engineer', 5, 'Tilapia - Fillets', 'Ford', 'cfronksa4@joomla.org', '(755) 5124336', '6/2/2022', 'Drywall & Acoustical (MOB)', 'Devi Ahilyabai Holkar Airport', 1, '15/05/2023'),
(366, 'NASDAQ', 'Xiaochuan', '121 Anthes Drive', 3, 1, 'Supervisor', 1, 'Caviar - Salmon', 'Mitsubishi', 'vmenurea5@cisco.com', '(482) 6901531', '3/8/2023', 'Waterproofing & Caulking', 'Moises Benzaquen Rengifo Airport', 1, '15/05/2023'),
(367, 'NYSE', 'Milagros', '4 Claremont Crossing', 3, 1, 'Engineer', 3, 'Lettuce - Curly Endive', 'Chrysler', 'blaighta6@cpanel.net', '(688) 4299600', '3/7/2023', 'Termite Control', 'Igloolik Airport', 1, '15/05/2023'),
(368, 'NASDAQ', 'Nirgua', '620 Donald Way', 3, 2, 'Construction Expeditor', 3, 'Rosemary - Fresh', 'Nissan', 'chowletta7@facebook.com', '(623) 8295068', '5/31/2022', 'Electrical and Fire Alarm', 'Hissar Airport', 1, '15/05/2023'),
(369, 'NYSE', 'Looc', '6 Arkansas Hill', 1, 3, 'Estimator', 3, 'Sauce - Fish 25 Ozf Bottle', 'Ford', 'holdinga8@sina.com.cn', '(226) 9751303', '12/24/2022', 'Electrical', 'Decatur Shores Airport', 1, '15/05/2023'),
(370, 'NYSE', 'Zliten', '7645 Warrior Center', 1, 2, 'Construction Manager', 7, 'Skewers - Bamboo', 'Chevrolet', 'mtremainea9@ucoz.com', '(439) 3450488', '1/31/2023', 'Framing (Wood)', 'Toussus-le-Noble Airport', 1, '15/05/2023'),
(371, 'NASDAQ', 'Segovia', '5611 Evergreen Drive', 1, 3, 'Electrician', 2, 'Beer - Upper Canada Lager', 'Kia', 'ealdrichaa@edublogs.org', '(213) 6965266', '8/23/2022', 'Framing (Wood)', 'Lakeland Airport', 1, '15/05/2023'),
(372, 'NASDAQ', 'Ligang', '6132 Stang Terrace', 3, 1, 'Architect', 7, 'Eggplant - Asian', 'Pontiac', 'tgilliab@constantcontact.com', '(731) 9621277', '1/13/2023', 'Elevator', 'George Bush Intercontinental Houston Airport', 1, '15/05/2023'),
(373, 'NYSE', 'Tubli', '0 Daystar Crossing', 1, 1, 'Construction Foreman', 4, '7up Diet, 355 Ml', 'Volkswagen', 'tloweac@fc2.com', '(484) 2127746', '12/16/2022', 'Asphalt Paving', 'Rafha Domestic Airport', 1, '15/05/2023'),
(374, 'NASDAQ', 'Zaleszany', '80 Eagan Point', 2, 3, 'Project Manager', 1, 'Truffle Cups - Red', 'Dodge', 'plaleveead@patch.com', '(997) 8960708', '10/15/2022', 'Doors, Frames & Hardware', 'Red Dog Airport', 1, '15/05/2023'),
(375, 'NASDAQ', 'Karlstad', '5 Fair Oaks Lane', 1, 3, 'Subcontractor', 2, 'Wine - White, Riesling, Semi - Dry', 'Volkswagen', 'ckeaysae@domainmarket.com', '(780) 8312477', '1/31/2023', 'Landscaping & Irrigation', 'Negarbo(Negabo) Airport', 1, '15/05/2023'),
(376, 'NASDAQ', 'Tijucas', '2645 Eagan Terrace', 2, 2, 'Construction Foreman', 7, 'Pork - Inside', 'Scion', 'awhybornaf@wsj.com', '(993) 7659276', '10/13/2022', 'Fire Protection', 'Governador Aluízio Alves International Airport', 1, '15/05/2023'),
(377, 'NYSE', 'San Francisco', '342 Hagan Junction', 3, 3, 'Project Manager', 5, 'Wine - Maipo Valle Cabernet', 'Acura', 'dmcmurtyag@eventbrite.com', '(151) 1195786', '9/4/2022', 'Construction Clean and Final Clean', 'Sanga Sanga Airport', 1, '15/05/2023'),
(378, 'NASDAQ', 'El Paso', '188 Fallview Terrace', 1, 3, 'Supervisor', 7, 'Tomatoes', 'Kia', 'emcconigalah@tuttocitta.it', '(915) 2818920', '7/4/2022', 'Doors, Frames & Hardware', 'Tekirdağ Çorlu Airport', 1, '15/05/2023'),
(379, 'NASDAQ', 'Pak Phayun', '0 Grover Alley', 1, 1, 'Supervisor', 6, 'Nutmeg - Ground', 'Ford', 'dkettellai@tuttocitta.it', '(750) 3011667', '7/19/2022', 'Site Furnishings', 'Kaili Airport', 1, '15/05/2023'),
(380, 'NASDAQ', 'Włocławek', '78 Talisman Trail', 3, 2, 'Construction Expeditor', 6, 'Lemonade - Kiwi, 591 Ml', 'Toyota', 'gpiscotaj@nih.gov', '(998) 8736585', '9/21/2022', 'Prefabricated Aluminum Metal Canopies', 'Buraimi Airport', 1, '15/05/2023'),
(381, 'NYSE', 'Svenljunga', '78 Fremont Street', 2, 2, 'Construction Manager', 6, 'Onions - Cooking', 'Hyundai', 'rpennaak@bizjournals.com', '(838) 7910253', '3/26/2023', 'Asphalt Paving', 'Lonesome Pine Airport', 1, '15/05/2023'),
(382, 'NYSE', 'Delgermörön', '7 Shopko Point', 3, 3, 'Construction Expeditor', 2, 'Muffin Batt - Carrot Spice', 'Subaru', 'pcorbettal@jalbum.net', '(308) 5857798', '1/30/2023', 'Sitework & Site Utilities', 'Innamincka Airport', 1, '15/05/2023'),
(383, 'NYSE', 'Londres', '02 Corry Terrace', 3, 1, 'Surveyor', 6, 'Flounder - Fresh', 'Lexus', 'timmam@deviantart.com', '(217) 6532424', '10/16/2022', 'Retaining Wall and Brick Pavers', 'Pinto Martins International Airport', 1, '15/05/2023'),
(384, 'NASDAQ', 'Chunxi', '6949 Northview Trail', 2, 2, 'Supervisor', 5, 'Tortillas - Flour, 12', 'Pontiac', 'cgrestean@ucla.edu', '(444) 7345754', '5/15/2022', 'Drilled Shafts', 'Indiana County/Jimmy Stewart Fld/ Airport', 1, '15/05/2023'),
(385, 'NYSE', 'Tandou', '05 Sauthoff Junction', 3, 2, 'Estimator', 3, 'Chicken - Whole Fryers', 'Chevrolet', 'ehayesao@bloomberg.com', '(416) 7992308', '2/13/2023', 'Painting & Vinyl Wall Covering', 'Nunam Iqua Airport', 1, '15/05/2023'),
(386, 'NYSE', 'Zapod', '595 Veith Road', 1, 2, 'Architect', 3, 'Rum - Spiced, Captain Morgan', 'Chevrolet', 'shackworthap@gizmodo.com', '(162) 6758405', '4/30/2023', 'Elevator', 'Kamusi Airport', 1, '15/05/2023'),
(387, 'NASDAQ', 'Kasakh', '32 Carey Lane', 2, 3, 'Construction Manager', 4, 'Pears - Fiorelle', 'Subaru', 'kelenaq@amazon.com', '(622) 6631456', '7/26/2022', 'Fire Sprinkler System', 'Gisborne Airport', 1, '15/05/2023'),
(388, 'NYSE', 'Jiekeng', '92 Randy Road', 1, 1, 'Construction Worker', 2, 'Water - Mineral, Carbonated', 'Ford', 'diacomiar@twitter.com', '(296) 1170257', '5/6/2023', 'Elevator', 'Sukhumi Dranda Airport', 1, '15/05/2023'),
(389, 'NYSE', 'Paldiski', '14 Golf Trail', 1, 3, 'Construction Worker', 6, 'Wine - Red, Metus Rose', 'Subaru', 'jbusstas@usda.gov', '(688) 1734975', '4/24/2023', 'Site Furnishings', 'Osmany International Airport', 1, '15/05/2023'),
(390, 'NYSE', 'Cambuga', '67938 Michigan Circle', 1, 3, 'Engineer', 6, 'Onions - Cippolini', 'Nissan', 'wmathwinat@un.org', '(499) 1147161', '9/16/2022', 'Fire Sprinkler System', 'El Tajín National Airport', 1, '15/05/2023'),
(391, 'NYSE', 'Kadipaten', '8074 Granby Terrace', 1, 1, 'Construction Expeditor', 2, 'Cumin - Whole', 'Mitsubishi', 'aoronanau@biblegateway.com', '(967) 9924706', '6/4/2022', 'Termite Control', 'Václav Havel Airport Prague', 1, '15/05/2023'),
(392, 'NYSE', 'Santo Isidro', '36027 Memorial Lane', 3, 2, 'Supervisor', 6, 'Muffin Batt - Carrot Spice', 'Infiniti', 'npickstonav@tuttocitta.it', '(563) 9443573', '8/21/2022', 'HVAC', 'Bhatinda Air Force Station', 1, '15/05/2023'),
(393, 'NYSE', 'Luyang', '08 Karstens Court', 3, 2, 'Construction Foreman', 5, 'Liqueur Banana, Ramazzotti', 'Hyundai', 'epundyaw@china.com.cn', '(224) 8680894', '6/21/2022', 'Elevator', 'Z M Jack Stell Field', 1, '15/05/2023'),
(394, 'NASDAQ', 'Los Andes', '5496 Nancy Lane', 1, 2, 'Electrician', 2, 'Syrup - Monin - Granny Smith', 'Mazda', 'aruggsax@comsenz.com', '(844) 1328949', '1/22/2023', 'Exterior Signage', 'Kigoma Airport', 1, '15/05/2023'),
(395, 'NYSE', 'Novopokrovka', '663 Aberg Point', 3, 2, 'Project Manager', 3, 'Pepper - Yellow Bell', 'Chevrolet', 'tjirkaay@google.com.br', '(545) 6165956', '3/7/2023', 'Roofing (Asphalt)', 'Pompano Beach Airpark', 1, '15/05/2023'),
(396, 'NYSE', 'Paris La Défense', '9 Sunnyside Hill', 1, 3, 'Construction Worker', 7, 'Wine - Vouvray Cuvee Domaine', 'Chevrolet', 'rdarrowaz@walmart.com', '(370) 4493526', '10/13/2022', 'Glass & Glazing', 'Guacamayas Airport', 1, '15/05/2023'),
(397, 'NASDAQ', 'Seredeyskiy', '282 Oak Valley Street', 3, 3, 'Construction Expeditor', 2, 'Crush - Orange, 355ml', 'Toyota', 'clefevreb0@nbcnews.com', '(125) 7014351', '12/17/2022', 'Rebar & Wire Mesh Install', 'San Javier Airport', 1, '15/05/2023'),
(398, 'NYSE', 'Mętków', '92 Rusk Drive', 2, 1, 'Architect', 5, 'Cake - Mini Potato Pancake', 'Ford', 'bsymcockb1@i2i.jp', '(207) 2064790', '9/5/2022', 'Asphalt Paving', 'Rurenabaque Airport', 1, '15/05/2023'),
(399, 'NYSE', 'Vryburg', '449 Hudson Circle', 3, 2, 'Construction Worker', 5, 'Spice - Montreal Steak Spice', 'Ford', 'bdrinanb2@un.org', '(741) 8006087', '8/24/2022', 'Plumbing & Medical Gas', 'Capital City Airport', 1, '15/05/2023'),
(400, 'NASDAQ', 'Shuiying', '41 Ludington Avenue', 3, 3, 'Electrician', 2, 'Sauce - Salsa', 'Suzuki', 'rhedderlyb3@kickstarter.com', '(146) 1877618', '8/16/2022', 'Temp Fencing, Decorative Fencing and Gates', 'Wonsan Kalma International Airport', 1, '15/05/2023'),
(401, 'NYSE', 'Niort', '3044 Heath Hill', 3, 2, 'Construction Foreman', 7, 'Oil - Avocado', 'Dodge', 'lcrichb4@msu.edu', '(578) 3986267', '9/9/2022', 'Wall Protection', 'Ziguinchor Airport', 1, '15/05/2023'),
(402, 'NASDAQ', 'Igcocolo', '7487 Eagle Crest Hill', 2, 3, 'Construction Foreman', 2, 'Cheese - Perron Cheddar', 'Mercury', 'bliveleyb5@fastcompany.com', '(854) 9236302', '5/14/2023', 'Landscaping & Irrigation', 'Lawson Army Air Field (Fort Benning)', 1, '15/05/2023'),
(403, 'NASDAQ', 'Basud', '6064 Hoepker Center', 1, 1, 'Architect', 6, 'Chicken - Wings, Tip Off', 'Mercury', 'fkuhnhardtb6@mail.ru', '(610) 4116027', '10/26/2022', 'Granite Surfaces', 'Medicine Hat Airport', 1, '15/05/2023'),
(404, 'NYSE', 'Trzciana', '2055 Independence Parkway', 3, 1, 'Construction Worker', 4, 'Wine - Two Oceans Cabernet', 'Dodge', 'sgillanib7@time.com', '(711) 2062969', '6/30/2022', 'Electrical and Fire Alarm', 'Charleville Airport', 1, '15/05/2023'),
(405, 'NYSE', 'Douala', '3747 Debs Point', 2, 1, 'Subcontractor', 6, 'Eggplant Oriental', 'Chevrolet', 'kdreweryb8@cargocollective.com', '(783) 3871612', '9/5/2022', 'Hard Tile & Stone', 'Bodaybo Airport', 1, '15/05/2023'),
(406, 'NASDAQ', 'Hamamatsu', '8 Brentwood Street', 3, 1, 'Construction Foreman', 3, 'Iced Tea - Lemon, 340ml', 'GMC', 'fbeddallb9@nsw.gov.au', '(832) 1383286', '6/12/2022', 'Prefabricated Aluminum Metal Canopies', 'Twentynine Palms Airport', 1, '15/05/2023'),
(407, 'NASDAQ', 'Dongxiaokou', '8 Browning Pass', 3, 3, 'Electrician', 3, 'Raisin - Dark', 'Lexus', 'spittamba@hostgator.com', '(640) 2606215', '3/21/2023', 'Overhead Doors', 'Fort McMurray / Mildred Lake Airport', 1, '15/05/2023'),
(408, 'NYSE', 'Dongmaku', '26 Hoffman Circle', 1, 3, 'Surveyor', 7, 'Iced Tea - Lemon, 460 Ml', 'Lexus', 'dadsheadbb@amazon.de', '(604) 9221146', '4/12/2023', 'Waterproofing & Caulking', 'Pine Island Airport', 1, '15/05/2023'),
(409, 'NYSE', 'Aranđelovac', '8008 Anniversary Way', 3, 3, 'Construction Foreman', 3, 'Hot Chocolate - Individual', 'Toyota', 'tantunesbc@1und1.de', '(674) 6926306', '4/13/2023', 'Epoxy Flooring', 'Ubon Ratchathani Airport', 1, '15/05/2023'),
(410, 'NYSE', 'Baizhong', '07937 Nancy Plaza', 2, 1, 'Engineer', 2, 'Crush - Orange, 355ml', 'Nissan', 'cmoxhambd@amazonaws.com', '(627) 1390631', '7/19/2022', 'Roofing (Asphalt)', 'Perth International Airport', 1, '15/05/2023'),
(411, 'NASDAQ', 'Wanjia', '4575 Stephen Point', 3, 1, 'Construction Foreman', 5, 'Salmon Atl.whole 8 - 10 Lb', 'Mitsubishi', 'mpitrassobe@ifeng.com', '(616) 3589842', '2/14/2023', 'EIFS', 'Rizhao Shanzihe Airport', 1, '15/05/2023'),
(412, 'NASDAQ', 'Cawayan Bugtong', '58 Lyons Place', 1, 3, 'Project Manager', 2, 'Pasta - Fett Alfredo, Single Serve', 'Nissan', 'fandreottibf@ucsd.edu', '(447) 2371822', '3/17/2023', 'Masonry', 'Norseman Airport', 1, '15/05/2023'),
(413, 'NASDAQ', 'Sykiés', '53 Mandrake Place', 1, 2, 'Construction Foreman', 2, 'Cardamon Seed / Pod', 'Pontiac', 'kgrummittbg@free.fr', '(700) 2418444', '10/25/2022', 'RF Shielding', 'Boigu Airport', 1, '15/05/2023'),
(414, 'NASDAQ', 'Angkup', '9496 Southridge Plaza', 2, 3, 'Electrician', 1, 'Wine - Pinot Noir Pond Haddock', 'Chrysler', 'babrahambh@epa.gov', '(773) 4386642', '10/30/2022', 'Ornamental Railings', 'Beersheba (Teyman) Airport', 1, '15/05/2023'),
(415, 'NASDAQ', 'Serpukhov', '6 Heffernan Center', 3, 3, 'Electrician', 5, 'Anisette - Mcguiness', 'Ford', 'mabilowitzbi@dropbox.com', '(665) 8306935', '5/19/2022', 'Roofing (Metal)', 'Salisbury Ocean City Wicomico Regional Airport', 1, '15/05/2023'),
(416, 'NASDAQ', 'Lapuyan', '494 Moose Center', 1, 3, 'Project Manager', 1, 'Oil - Margarine', 'Chevrolet', 'abraunleinbj@xrea.com', '(419) 4028747', '7/18/2022', 'Temp Fencing, Decorative Fencing and Gates', 'Dayton-Wright Brothers Airport', 1, '15/05/2023'),
(417, 'NASDAQ', 'Taizi', '52 Schlimgen Crossing', 1, 3, 'Construction Expeditor', 3, 'Turnip - Wax', 'BMW', 'ezupabk@google.de', '(389) 7739617', '9/26/2022', 'Waterproofing & Caulking', 'Desert Rock Airport', 1, '15/05/2023'),
(418, 'NYSE', 'Guzhu', '44 Village Park', 1, 2, 'Construction Worker', 6, 'Initation Crab Meat', 'BMW', 'bheadingtonbl@timesonline.co.uk', '(139) 1307249', '2/27/2023', 'Masonry & Precast', 'Mumias Airport', 1, '15/05/2023'),
(419, 'NASDAQ', 'Krasnyy Oktyabr’', '71810 Arizona Avenue', 3, 2, 'Surveyor', 4, 'Squid Ink', 'GMC', 'wkunischbm@ft.com', '(233) 8112991', '12/2/2022', 'Termite Control', 'Preguiça Airport', 1, '15/05/2023'),
(420, 'NASDAQ', 'Verkhniy Rohachyk', '6 Delaware Drive', 1, 1, 'Electrician', 5, 'Butter Sweet', 'Buick', 'cjossebn@rambler.ru', '(714) 6012217', '7/12/2022', 'HVAC', 'Vernon Airport', 1, '15/05/2023'),
(421, 'NASDAQ', 'Cicurug', '44 Cody Plaza', 3, 2, 'Supervisor', 6, 'Mousse - Banana Chocolate', 'Peugeot', 'mhaberfieldbo@technorati.com', '(826) 9635002', '6/19/2022', 'Soft Flooring and Base', 'Batangafo Airport', 1, '15/05/2023'),
(422, 'NASDAQ', 'Adrasmon', '2 Clyde Gallagher Pass', 3, 3, 'Supervisor', 4, 'Nut - Pecan, Pieces', 'Mercedes-Benz', 'shazelbp@ca.gov', '(248) 3587796', '4/20/2023', 'Structural and Misc Steel (Fabrication)', 'Ngot Nzoungou Airport', 1, '15/05/2023'),
(423, 'NYSE', 'Mosteirô', '47 Ryan Trail', 1, 2, 'Architect', 4, 'Capers - Ox Eye Daisy', 'Hyundai', 'rgeddisbq@com.com', '(360) 1740754', '9/7/2022', 'Ornamental Railings', 'Zaporizhzhia International Airport', 1, '15/05/2023'),
(424, 'NASDAQ', 'Sijing', '277 Briar Crest Junction', 1, 1, 'Construction Manager', 5, 'Island Oasis - Peach Daiquiri', 'Buick', 'aobrallaghanbr@sciencedaily.com', '(315) 6319678', '12/21/2022', 'Structural and Misc Steel (Fabrication)', 'University of Illinois Willard Airport', 1, '15/05/2023'),
(425, 'NASDAQ', 'Kolumbug', '40931 Chinook Pass', 3, 1, 'Estimator', 6, 'Foam Cup 6 Oz', 'Mitsubishi', 'rlummasanabs@theatlantic.com', '(199) 8773803', '10/18/2022', 'Wall Protection', 'Puas Airport', 1, '15/05/2023'),
(426, 'NASDAQ', 'Ḩablah', '649 Larry Circle', 1, 3, 'Electrician', 4, 'Cheese - Mascarpone', 'Mercury', 'sminchibt@so-net.ne.jp', '(880) 2658810', '11/18/2022', 'Roofing (Metal)', 'Whiteriver Airport', 1, '15/05/2023'),
(427, 'NYSE', 'Épinal', '705 Ohio Pass', 3, 1, 'Construction Foreman', 5, 'Cherries - Bing, Canned', 'Honda', 'mscroytonbu@columbia.edu', '(603) 4185330', '11/6/2022', 'Casework', 'Spriggs Payne Airport', 1, '15/05/2023');
INSERT INTO `vacantes` (`Id`, `Nombre_empresa`, `Provincia`, `Direccion`, `Sexo`, `Nacionalidad`, `Posicion_requerida`, `Nivel_estudio`, `Requisitos`, `Beneficios`, `Correo_electronico_aplicante`, `Numero_telefono`, `Fecha_limite`, `Categoria`, `Comentario_adicional`, `Estado`, `Fecha_creacion`) VALUES
(428, 'NASDAQ', 'Fulu', '32464 Sycamore Parkway', 1, 2, 'Subcontractor', 2, 'Papadam', 'Chevrolet', 'bthongerbv@mac.com', '(582) 4423990', '4/7/2023', 'Prefabricated Aluminum Metal Canopies', 'Prince Said Ibrahim International Airport', 1, '15/05/2023'),
(429, 'NASDAQ', 'Pithoro', '4459 Pond Plaza', 3, 3, 'Engineer', 4, 'Lid - Translucent, 3.5 And 6 Oz', 'GMC', 'kdeerybw@miibeian.gov.cn', '(847) 4972696', '9/24/2022', 'Temp Fencing, Decorative Fencing and Gates', 'Nikolski Air Station', 1, '15/05/2023'),
(430, 'NASDAQ', 'Puerto Parra', '6196 Blackbird Trail', 2, 2, 'Supervisor', 2, 'Soupcontfoam16oz 116con', 'Porsche', 'bcreekbx@deliciousdays.com', '(691) 2481319', '11/21/2022', 'Landscaping & Irrigation', 'Sir Abubakar Tafawa Balewa International Airport', 1, '15/05/2023'),
(431, 'NYSE', 'Basel', '53584 Scoville Circle', 2, 3, 'Engineer', 7, 'Sea Urchin', 'Mazda', 'kmeinekingby@meetup.com', '(916) 2293916', '1/24/2023', 'Hard Tile & Stone', 'Cannon Air Force Base', 1, '15/05/2023'),
(432, 'NYSE', 'Perelyub', '77 Crownhardt Avenue', 1, 2, 'Construction Expeditor', 4, 'Wiberg Super Cure', 'Volvo', 'pwadelingbz@state.tx.us', '(717) 9862112', '8/10/2022', 'Rebar & Wire Mesh Install', 'Emden Airport', 1, '15/05/2023'),
(433, 'NASDAQ', 'Penedono', '42 Killdeer Center', 2, 3, 'Construction Worker', 2, 'Petit Baguette', 'Ford', 'ltennantc0@chron.com', '(554) 7760879', '6/10/2022', 'Exterior Signage', 'Abu Simbel Airport', 1, '15/05/2023'),
(434, 'NASDAQ', 'Mieszkowice', '51 Del Mar Parkway', 1, 2, 'Subcontractor', 3, 'Pears - Bosc', 'Bentley', 'wbackshillc1@etsy.com', '(404) 2829234', '11/11/2022', 'Casework', 'St Michael Airport', 1, '15/05/2023'),
(435, 'NYSE', 'Fotolívos', '658 Bashford Terrace', 3, 2, 'Estimator', 6, 'Skirt - 29 Foot', 'Toyota', 'iwaggattc2@drupal.org', '(585) 7001299', '7/3/2022', 'Roofing (Metal)', 'Akita Airport', 1, '15/05/2023'),
(436, 'NYSE', 'Bukama', '3 Truax Alley', 2, 1, 'Project Manager', 7, 'Bread - White, Sliced', 'Infiniti', 'kkerfodc3@comcast.net', '(754) 6253855', '2/28/2023', 'Framing (Steel)', 'Khuzdar Airport', 1, '15/05/2023'),
(437, 'NASDAQ', 'Pásion', '6345 Thompson Circle', 2, 3, 'Electrician', 6, 'Coffee - Hazelnut Cream', 'Volkswagen', 'medinburghc4@eventbrite.com', '(927) 1616540', '7/20/2022', 'Plumbing & Medical Gas', 'Antsirabato Airport', 1, '15/05/2023'),
(438, 'NYSE', 'Belogorsk', '793 Sunnyside Pass', 1, 2, 'Construction Expeditor', 3, 'The Pop Shoppe - Root Beer', 'GMC', 'dgerritzenc5@unesco.org', '(863) 9261977', '11/30/2022', 'Overhead Doors', 'Sacramento Mather Airport', 1, '15/05/2023'),
(439, 'NYSE', 'Takaoka', '406 Dottie Avenue', 2, 1, 'Electrician', 7, 'Cookie Choc', 'Volkswagen', 'amartonfic6@xrea.com', '(801) 6666663', '2/10/2023', 'Casework', 'Easton Newnam Field', 1, '15/05/2023'),
(440, 'NYSE', 'Olympia', '0 Hagan Road', 2, 1, 'Supervisor', 7, 'Beef - Salted', 'Mitsubishi', 'ttaftc7@independent.co.uk', '(253) 2364986', '10/8/2022', 'Exterior Signage', 'Guernsey Airport', 1, '15/05/2023'),
(441, 'NYSE', 'Lajinha', '179 Goodland Point', 2, 2, 'Electrician', 6, 'Cranberry Foccacia', 'Chrysler', 'sricardoc8@si.edu', '(320) 1148369', '10/25/2022', 'Structural & Misc Steel Erection', 'Balıkesir Merkez Airport', 1, '15/05/2023'),
(442, 'NASDAQ', 'Tambaú', '453 Derek Alley', 2, 3, 'Construction Manager', 4, 'Cumin - Ground', 'Mazda', 'uscogginc9@tinypic.com', '(232) 1972136', '10/22/2022', 'Casework', 'Teniente Vidal Airport', 1, '15/05/2023'),
(443, 'NASDAQ', 'Padangtepung', '87 Kingsford Way', 2, 2, 'Construction Manager', 3, 'Grand Marnier', 'BMW', 'sironsca@goo.ne.jp', '(976) 9030692', '1/23/2023', 'Framing (Wood)', 'Caye Caulker Airport', 1, '15/05/2023'),
(444, 'NYSE', 'Gantang', '63009 Mockingbird Avenue', 2, 1, 'Construction Foreman', 1, 'Oil - Peanut', 'Audi', 'cstreetcb@redcross.org', '(354) 8228893', '8/6/2022', 'Exterior Signage', 'Chennault International Airport', 1, '15/05/2023'),
(445, 'NYSE', 'Goubétto', '12 Columbus Circle', 1, 3, 'Architect', 6, 'Sauce - Alfredo', 'Acura', 'rhartilcc@slashdot.org', '(710) 8101948', '1/28/2023', 'Retaining Wall and Brick Pavers', 'Cotswold Airport', 1, '15/05/2023'),
(446, 'NASDAQ', 'Herzliyya', '1 Arrowood Parkway', 1, 2, 'Architect', 1, 'Dill Weed - Fresh', 'Pontiac', 'bscatescd@umn.edu', '(168) 5965984', '4/4/2023', 'Electrical and Fire Alarm', 'Francisco de Sá Carneiro Airport', 1, '15/05/2023'),
(447, 'NASDAQ', 'Dalmatovo', '465 Bellgrove Street', 2, 1, 'Construction Expeditor', 3, 'Chocolate Liqueur - Godet White', 'GMC', 'hdurbince@slashdot.org', '(145) 1180113', '4/5/2023', 'Asphalt Paving', 'Khoka Moya Airport', 1, '15/05/2023'),
(448, 'NYSE', 'Cabinda', '65692 8th Point', 1, 1, 'Construction Expeditor', 6, 'Beer - Muskoka Cream Ale', 'Chevrolet', 'afauntcf@elpais.com', '(227) 1343370', '7/21/2022', 'Temp Fencing, Decorative Fencing and Gates', 'Ottawa / Rockcliffe Seaplane Base', 1, '15/05/2023'),
(449, 'NYSE', 'Brotas', '2 Stuart Plaza', 1, 3, 'Estimator', 7, 'Godiva White Chocolate', 'Dodge', 'rroskillycg@networkadvertising.org', '(956) 9887766', '11/1/2022', 'Structural & Misc Steel Erection', 'Palma De Mallorca Airport', 1, '15/05/2023'),
(450, 'NASDAQ', 'Mukun', '53808 Old Shore Street', 1, 3, 'Construction Foreman', 1, 'Cheese - Valancey', 'Ford', 'fmaciasch@walmart.com', '(603) 2205315', '4/24/2023', 'Painting & Vinyl Wall Covering', 'Soalala Airport', 1, '15/05/2023'),
(451, 'NASDAQ', 'Xuxiake', '33 Sage Court', 1, 2, 'Construction Expeditor', 4, 'Lid Tray - 12in Dome', 'Pontiac', 'tgalpinci@admin.ch', '(246) 3920092', '7/4/2022', 'Landscaping & Irrigation', 'Attu Heliport', 1, '15/05/2023'),
(452, 'NYSE', 'Haninge', '56311 Loeprich Center', 2, 2, 'Construction Expeditor', 1, 'Dill Weed - Dry', 'Mazda', 'erosewarnecj@omniture.com', '(937) 6920515', '3/14/2023', 'Electrical and Fire Alarm', 'Chaitén Airport', 1, '15/05/2023'),
(453, 'NYSE', 'Tsowkêy', '34 Mendota Park', 3, 3, 'Project Manager', 2, 'Salami - Genova', 'Toyota', 'labercrombieck@wiley.com', '(389) 9890050', '12/12/2022', 'Sitework & Site Utilities', 'Del Rio International Airport', 1, '15/05/2023'),
(454, 'NASDAQ', 'Puerto Rico', '9 Bay Point', 3, 2, 'Construction Manager', 1, 'Chilli Paste, Hot Sambal Oelek', 'Lexus', 'jghiroldicl@comsenz.com', '(387) 3724827', '6/19/2022', 'Hard Tile & Stone', 'Neuchatel Airport', 1, '15/05/2023'),
(455, 'NYSE', 'Beima', '880 Golden Leaf Center', 3, 1, 'Construction Manager', 6, 'Bread - Multigrain', 'Chevrolet', 'umarrettcm@creativecommons.org', '(554) 9107722', '4/15/2023', 'Roofing (Asphalt)', 'Tuscaloosa Regional Airport', 1, '15/05/2023'),
(456, 'NASDAQ', 'Radā‘', '39371 Knutson Park', 1, 3, 'Architect', 2, 'Carbonated Water - Orange', 'Volvo', 'mtutingcn@constantcontact.com', '(448) 7170014', '4/12/2023', 'Electrical', 'Soko Airport', 1, '15/05/2023'),
(457, 'NASDAQ', 'Tambarangan', '9 Towne Point', 3, 2, 'Electrician', 5, 'Oil - Canola', 'Land Rover', 'pecclestonco@desdev.cn', '(709) 8779210', '8/26/2022', 'Framing (Steel)', 'Arthur N Neu Airport', 1, '15/05/2023'),
(458, 'NYSE', 'Paniówki', '281 Anhalt Parkway', 2, 2, 'Construction Worker', 2, 'Bag - Clear 7 Lb', 'Jeep', 'acallowcp@spiegel.de', '(316) 8348037', '6/12/2022', 'Ornamental Railings', 'Clarks Point Airport', 1, '15/05/2023'),
(459, 'NYSE', 'Shangcun', '23671 Twin Pines Place', 3, 3, 'Engineer', 6, 'Wine - Redchard Merritt', 'Nissan', 'kbucknillcq@timesonline.co.uk', '(231) 8521900', '12/10/2022', 'Framing (Wood)', 'Les Bases Airport', 1, '15/05/2023'),
(460, 'NASDAQ', 'Doubravice nad Svitavou', '68 American Plaza', 2, 3, 'Architect', 1, 'Potatoes - Instant, Mashed', 'GMC', 'omenilovecr@quantcast.com', '(730) 1672120', '2/4/2023', 'Marlite Panels (FED)', 'Moffett Federal Airfield', 1, '15/05/2023'),
(461, 'NYSE', 'Bagrāmī', '04084 Pepper Wood Plaza', 1, 3, 'Estimator', 2, 'Vinegar - Raspberry', 'MINI', 'kkissickcs@tinypic.com', '(610) 1778545', '4/17/2023', 'Hard Tile & Stone', 'Marudi Airport', 1, '15/05/2023'),
(462, 'NASDAQ', 'Helsingborg', '4 Nelson Park', 2, 3, 'Electrician', 2, 'Bagel - Everything Presliced', 'Ford', 'lgussinct@seattletimes.com', '(385) 2871878', '7/1/2022', 'Asphalt Paving', 'Cuamba Airport', 1, '15/05/2023'),
(463, 'NYSE', 'San Roque', '009 Maple Wood Street', 2, 3, 'Construction Foreman', 4, 'Muffin - Mix - Mango Sour Cherry', 'Buick', 'ctebbetcu@edublogs.org', '(420) 8638790', '9/2/2022', 'Ornamental Railings', 'Caiguna Airport', 1, '15/05/2023'),
(464, 'NASDAQ', 'Rennes', '339 Graceland Place', 1, 3, 'Project Manager', 7, 'Truffle Shells - Semi - Sweet', 'Chevrolet', 'vseabrookcv@psu.edu', '(759) 9322545', '10/31/2022', 'Painting & Vinyl Wall Covering', 'Ontario Municipal Airport', 1, '15/05/2023'),
(465, 'NASDAQ', 'Shums’k', '7404 Judy Trail', 2, 2, 'Surveyor', 3, 'Flavouring Vanilla Artificial', 'Mitsubishi', 'ldoigecw@princeton.edu', '(148) 7235257', '8/21/2022', 'Waterproofing & Caulking', 'George F. L. Charles Airport', 1, '15/05/2023'),
(466, 'NASDAQ', 'Selajambe Satu', '20802 Meadow Ridge Road', 3, 3, 'Electrician', 4, 'Apple - Fuji', 'Volvo', 'pdudleycx@drupal.org', '(364) 3848489', '4/27/2023', 'Prefabricated Aluminum Metal Canopies', 'Southern Seaplane Airport', 1, '15/05/2023'),
(467, 'NASDAQ', 'Ludwin', '305 Ridge Oak Parkway', 2, 2, 'Construction Worker', 3, 'Scallops - U - 10', 'Volkswagen', 'jwitherbycy@over-blog.com', '(447) 4988801', '11/26/2022', 'Construction Clean and Final Clean', 'Zhob Airport', 1, '15/05/2023'),
(468, 'NYSE', 'Muhos', '894 Schmedeman Hill', 1, 1, 'Construction Worker', 4, 'Lemonade - Strawberry, 591 Ml', 'Volkswagen', 'mwildbloodcz@pagesperso-orange.fr', '(196) 2894496', '12/15/2022', 'Soft Flooring and Base', 'Wuvulu Island Airport', 1, '15/05/2023'),
(469, 'NYSE', 'Shibganj', '752 Anzinger Lane', 3, 3, 'Construction Worker', 6, 'Tomatoes - Heirloom', 'Infiniti', 'mlenaghend0@prlog.org', '(220) 4588352', '7/13/2022', 'Prefabricated Aluminum Metal Canopies', 'Bujumbura International Airport', 1, '15/05/2023'),
(470, 'NYSE', 'Aluminé', '822 Lillian Drive', 3, 1, 'Subcontractor', 6, 'Crackers - Water', 'BMW', 'smcgurkd1@symantec.com', '(216) 2441457', '8/11/2022', 'Marlite Panels (FED)', 'Suavanao Airport', 1, '15/05/2023'),
(471, 'NASDAQ', 'Akaki', '0 Bay Circle', 1, 2, 'Engineer', 1, 'Cattail Hearts', 'Bentley', 'dmenaryd2@adobe.com', '(810) 3711614', '11/1/2022', 'Termite Control', 'Beech Factory Airport', 1, '15/05/2023'),
(472, 'NYSE', 'Gręboszów', '7286 Hovde Way', 3, 1, 'Subcontractor', 4, 'Haggis', 'Ford', 'litzhakd3@soup.io', '(492) 4394260', '5/22/2022', 'Fire Sprinkler System', 'Postville Airport', 1, '15/05/2023'),
(473, 'NYSE', 'Bendo', '0 Dottie Court', 1, 2, 'Supervisor', 4, 'Mountain Dew', 'Audi', 'bdombrelld4@lycos.com', '(894) 4183079', '12/13/2022', 'Asphalt Paving', 'General WM J Fox Airfield', 1, '15/05/2023'),
(474, 'NYSE', 'Łącko', '8672 Vidon Crossing', 1, 2, 'Construction Foreman', 3, 'Mushroom - Trumpet, Dry', 'Infiniti', 'dwitherbedd5@marriott.com', '(130) 8553726', '9/24/2022', 'Retaining Wall and Brick Pavers', 'Casa Grande Municipal Airport', 1, '15/05/2023'),
(475, 'NASDAQ', 'Huancapallac', '6149 Birchwood Street', 3, 1, 'Electrician', 7, 'Bread - Petit Baguette', 'Chrysler', 'sristed6@fotki.com', '(469) 7976029', '3/25/2023', 'Drywall & Acoustical (MOB)', 'Ivano-Frankivsk International Airport', 1, '15/05/2023'),
(476, 'NASDAQ', 'Pingzhuang', '92226 Lunder Circle', 2, 1, 'Construction Expeditor', 4, 'Chicken - White Meat, No Tender', 'Toyota', 'pclewlowd7@scribd.com', '(516) 8285418', '4/8/2023', 'Roofing (Asphalt)', 'Dachuan Airport', 1, '15/05/2023'),
(477, 'NASDAQ', 'Muro', '05095 Calypso Alley', 2, 1, 'Construction Foreman', 5, 'Shrimp - 31/40', 'BMW', 'chawardend8@dagondesign.com', '(157) 7798453', '5/19/2022', 'Hard Tile & Stone', 'Es Senia Airport', 1, '15/05/2023'),
(478, 'NASDAQ', 'Akzhal', '8 Brickson Park Terrace', 1, 3, 'Construction Manager', 6, 'Milk - Chocolate 250 Ml', 'Scion', 'msaundersd9@flavors.me', '(168) 2315759', '1/8/2023', 'Hard Tile & Stone', 'Washington Island Airstrip', 1, '15/05/2023'),
(479, 'NASDAQ', 'Lixin', '7791 Shelley Street', 2, 1, 'Construction Expeditor', 5, 'Cactus Pads', 'Toyota', 'gtoulamainda@sourceforge.net', '(271) 7878871', '4/1/2023', 'Hard Tile & Stone', 'Rome State Airport', 1, '15/05/2023'),
(480, 'NYSE', 'Cangkeuteuk Sabrang', '6927 Leroy Road', 1, 3, 'Electrician', 1, 'Vanilla Beans', 'Mercury', 'bkalkerdb@redcross.org', '(252) 1343012', '12/14/2022', 'Plumbing & Medical Gas', 'Varandey Airport', 1, '15/05/2023'),
(481, 'NASDAQ', 'Nakkila', '075 Golden Leaf Avenue', 1, 2, 'Construction Manager', 2, 'Bread - Focaccia Quarter', 'Subaru', 'gbiggsdc@etsy.com', '(470) 2798680', '7/2/2022', 'Electrical', 'Morro do Chapéu Airport', 1, '15/05/2023'),
(482, 'NYSE', 'Tsu-shi', '07 Bartillon Alley', 1, 3, 'Electrician', 6, 'Rabbit - Frozen', 'Mazda', 'aharewooddd@ocn.ne.jp', '(405) 1967990', '10/12/2022', 'Drilled Shafts', 'Truth Or Consequences Municipal Airport', 1, '15/05/2023'),
(483, 'NASDAQ', 'Plovdiv', '48242 Grayhawk Hill', 2, 2, 'Architect', 1, 'Pears - Anjou', 'Chevrolet', 'jberardde@scientificamerican.com', '(856) 6101594', '9/15/2022', 'Framing (Steel)', 'Longreach Airport', 1, '15/05/2023'),
(484, 'NASDAQ', 'Ubá', '6695 Hauk Alley', 3, 3, 'Project Manager', 2, 'Bonito Flakes - Toku Katsuo', 'Pontiac', 'hcuerdadf@youku.com', '(702) 9948066', '7/12/2022', 'Fire Sprinkler System', 'Kampot Airport', 1, '15/05/2023'),
(485, 'NASDAQ', 'Columbus', '068 Larry Drive', 3, 1, 'Supervisor', 7, 'Coffee Cup 8oz 5338cd', 'Audi', 'jumbertdg@soundcloud.com', '(614) 5291129', '10/29/2022', 'Roofing (Asphalt)', 'Bawean Airport', 1, '15/05/2023'),
(486, 'NYSE', 'Huangcun', '13 Brickson Park Plaza', 3, 2, 'Surveyor', 1, 'Milk - Chocolate 250 Ml', 'Mazda', 'epoxondh@census.gov', '(664) 9725874', '11/28/2022', 'Structural & Misc Steel Erection', 'Casiguran Airport', 1, '15/05/2023'),
(487, 'NASDAQ', 'Baratleke', '23610 Blackbird Junction', 3, 1, 'Construction Expeditor', 4, 'Tilapia - Fillets', 'Toyota', 'brosiellodi@craigslist.org', '(150) 5075321', '10/9/2022', 'Fire Sprinkler System', 'Bowen Airport', 1, '15/05/2023'),
(488, 'NASDAQ', 'Tieshan', '71563 5th Plaza', 3, 3, 'Electrician', 1, 'Saskatoon Berries - Frozen', 'Suzuki', 'amethvendj@vkontakte.ru', '(938) 2667443', '3/11/2023', 'Structural & Misc Steel Erection', 'Chichester/Goodwood Airport', 1, '15/05/2023'),
(489, 'NASDAQ', 'Saint-Étienne', '8 Stone Corner Court', 1, 3, 'Construction Foreman', 5, 'Cake - Bande Of Fruit', 'Bentley', 'cferrarindk@jimdo.com', '(467) 5741534', '10/20/2022', 'Structural and Misc Steel (Fabrication)', 'Hillenbrand Industries Airport', 1, '15/05/2023'),
(490, 'NYSE', 'Balayong', '15 Elmside Crossing', 1, 2, 'Construction Worker', 1, 'Soup - Chicken And Wild Rice', 'GMC', 'mdillawaydl@bbb.org', '(346) 1468251', '8/11/2022', 'Ornamental Railings', 'Angers-Loire Airport', 1, '15/05/2023'),
(491, 'NASDAQ', 'Zákynthos', '64 Manley Lane', 2, 2, 'Construction Worker', 6, 'Wine - Barolo Fontanafredda', 'Land Rover', 'broartydm@sbwire.com', '(189) 8694756', '8/14/2022', 'Termite Control', 'Fetlar Airport', 1, '15/05/2023'),
(492, 'NASDAQ', 'Hedao', '2 Blackbird Terrace', 3, 2, 'Estimator', 2, 'Wine - Red, Lurton Merlot De', 'Mitsubishi', 'lpollarddn@friendfeed.com', '(131) 9995205', '2/28/2023', 'Drilled Shafts', 'Lábrea Airport', 1, '15/05/2023'),
(493, 'NASDAQ', 'Bin’an', '2 School Plaza', 1, 3, 'Construction Foreman', 7, 'Dried Cranberries', 'GMC', 'ooronando@dmoz.org', '(307) 9280666', '3/23/2023', 'Drywall & Acoustical (MOB)', 'Esbjerg Airport', 1, '15/05/2023'),
(494, 'NASDAQ', 'Río Tercero', '09593 Everett Crossing', 1, 2, 'Subcontractor', 6, 'Energy - Boo - Koo', 'Lexus', 'rpinckeddp@tripadvisor.com', '(729) 2328227', '4/3/2023', 'Drywall & Acoustical (FED)', 'Douglas Lake Airport', 1, '15/05/2023'),
(495, 'NASDAQ', 'Kitahama', '78364 Butternut Place', 1, 2, 'Supervisor', 2, 'Blackberries', 'Oldsmobile', 'lbrambilldq@miibeian.gov.cn', '(199) 6332680', '4/18/2023', 'Drywall & Acoustical (MOB)', 'Serui Airport', 1, '15/05/2023'),
(496, 'NYSE', 'Alurbulu', '99239 Esch Trail', 2, 3, 'Construction Expeditor', 7, 'Flour - Buckwheat, Dark', 'Eagle', 'geggintondr@auda.org.au', '(271) 8120052', '11/10/2022', 'Termite Control', 'Iğdır Airport', 1, '15/05/2023'),
(497, 'NYSE', 'Banjar Mambalkajanan', '81 Union Circle', 3, 2, 'Architect', 3, 'Tarragon - Fresh', 'Tesla', 'thughmands@com.com', '(146) 5585043', '10/4/2022', 'Framing (Steel)', 'Capital City Airport', 1, '15/05/2023'),
(498, 'NASDAQ', 'San Francisco', '918 Moose Center', 1, 2, 'Construction Expeditor', 3, 'Yucca', 'Nissan', 'ybartkiewiczdt@blogs.com', '(303) 1703332', '2/19/2023', 'Plumbing & Medical Gas', 'Farewell Airport', 1, '15/05/2023'),
(499, 'NASDAQ', 'Arnhem', '1 Meadow Ridge Crossing', 3, 1, 'Estimator', 1, 'Orange - Canned, Mandarin', 'Chevrolet', 'cchealdu@gmpg.org', '(519) 1087673', '3/26/2023', 'Plumbing & Medical Gas', 'Chiloquin State Airport', 1, '15/05/2023'),
(500, 'NYSE', 'Londiani', '82 Maple Wood Park', 2, 1, 'Construction Worker', 6, 'Soup - Campbellschix Stew', 'Mitsubishi', 'tmarendv@godaddy.com', '(717) 5748291', '6/15/2022', 'Fire Protection', 'Hechi Jinchengjiang Airport', 1, '15/05/2023');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `nacionalidades`
--
ALTER TABLE `nacionalidades`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `niveles_estudios`
--
ALTER TABLE `niveles_estudios`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `sexos`
--
ALTER TABLE `sexos`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `vacantes`
--
ALTER TABLE `vacantes`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Sexo` (`Sexo`),
  ADD KEY `Nacionalidad` (`Nacionalidad`),
  ADD KEY `Nivel_estudio` (`Nivel_estudio`),
  ADD KEY `Estado` (`Estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `nacionalidades`
--
ALTER TABLE `nacionalidades`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `niveles_estudios`
--
ALTER TABLE `niveles_estudios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `sexos`
--
ALTER TABLE `sexos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `vacantes`
--
ALTER TABLE `vacantes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `vacantes`
--
ALTER TABLE `vacantes`
  ADD CONSTRAINT `vacantes_ibfk_1` FOREIGN KEY (`Sexo`) REFERENCES `sexos` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `vacantes_ibfk_2` FOREIGN KEY (`Nacionalidad`) REFERENCES `nacionalidades` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `vacantes_ibfk_3` FOREIGN KEY (`Nivel_estudio`) REFERENCES `niveles_estudios` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `vacantes_ibfk_4` FOREIGN KEY (`Estado`) REFERENCES `estados` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
