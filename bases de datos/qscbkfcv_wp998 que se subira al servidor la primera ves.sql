-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-05-2023 a las 03:52:43
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
CREATE PROCEDURE `sp_add_vacante` (IN `p_nombre_empresa` VARCHAR(100), IN `p_provincia` VARCHAR(100), IN `p_direccion` VARCHAR(100), IN `p_sexo` INT, IN `p_nacionalidad` INT, IN `p_posicion` VARCHAR(100), IN `p_nivel_estudio` INT, IN `p_requisitos` VARCHAR(200), IN `p_beneficios` VARCHAR(200), IN `p_correo` VARCHAR(50), IN `p_telefono` VARCHAR(30), IN `p_fecha` VARCHAR(10), IN `p_categoria` VARCHAR(50), IN `p_comentarios` VARCHAR(200), IN `p_estado` INT, IN `p_fecha_creacion` VARCHAR(30))   INSERT INTO vacantes (Nombre_empresa, Provincia, Direccion, Sexo, Nacionalidad, Posicion_requerida, Nivel_estudio, Requisitos, Beneficios, Correo_electronico_aplicante, Numero_telefono, Fecha_limite, Categoria, Comentario_adicional, Estado, Fecha_creacion)
    VALUES (p_nombre_empresa, p_provincia, p_direccion, p_sexo, p_nacionalidad, p_posicion, p_nivel_estudio, p_requisitos, p_beneficios, p_correo, p_telefono, p_fecha, p_categoria, p_comentarios, p_estado, p_fecha_creacion)$$

CREATE PROCEDURE `sp_change_status_vacante` (IN `p_id` INT)   UPDATE vacantes SET Estado = 2 WHERE Id = p_id$$

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

CREATE PROCEDURE `sp_get_vacante_by_id` (IN `p_id` INT)   SELECT vacantes.*, estados.Estado as estado, nacionalidades.Nacionalidad as nacionalidad, niveles_estudios.Nivel_estudio as nivel_estudio, sexos.Sexo as sexo FROM vacantes 
JOIN estados ON estados.Id = vacantes.Estado 
JOIN nacionalidades ON nacionalidades.Id = vacantes.Nacionalidad
JOIN niveles_estudios ON niveles_estudios.Id = vacantes.Nivel_estudio
JOIN sexos ON sexos.Id = vacantes.Sexo
WHERE vacantes.Id = p_id$$

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=518;

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
