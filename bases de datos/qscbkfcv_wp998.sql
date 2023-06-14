-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 08-06-2023 a las 16:20:03
-- Versión del servidor: 10.6.12-MariaDB-cll-lve
-- Versión de PHP: 8.1.16

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
$$

$$

$$

$$

$$

$$

$$

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
  `Requisitos` varchar(4000) NOT NULL,
  `Beneficios` varchar(4000) NOT NULL,
  `Correo_electronico_aplicante` varchar(50) NOT NULL,
  `Numero_telefono` varchar(30) DEFAULT NULL,
  `Fecha_limite` varchar(10) DEFAULT NULL,
  `Categoria` varchar(50) NOT NULL,
  `Comentario_adicional` varchar(4000) DEFAULT NULL,
  `Estado` int(11) NOT NULL,
  `Fecha_creacion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vacantes`
--

INSERT INTO `vacantes` (`Id`, `Nombre_empresa`, `Provincia`, `Direccion`, `Sexo`, `Nacionalidad`, `Posicion_requerida`, `Nivel_estudio`, `Requisitos`, `Beneficios`, `Correo_electronico_aplicante`, `Numero_telefono`, `Fecha_limite`, `Categoria`, `Comentario_adicional`, `Estado`, `Fecha_creacion`) VALUES
(2, 'APPLY MARKETING', 'Santo Domingo, Dominican Republic.', 'Santo Domingo, Dominican Republic.', 2, 2, 'Digital Sales Executive', 5, 'Requirements:\n– 100% fluency in written and spoken English\n– Outbound B2B Sales Experience\n– Sales Tools Basic Knowledge ( CRM, Email, VoIP,etc.).\n– Able to work/learn in fast paced environment.\n– Int', 'Benefits:\n– Competitive Base\n– Amazing Commissions\n– Weekends off.  Work only Mon-Fri from 10 to 6.\n– Friendly Work Environment\n– Growth Opportunities', 'info@applydigitalmarketing.com', '3103253760', '2023-05-31', 'mercadeo', 'Miami based Digital Marketing Agency is looking for Digital Sales Executives in Santo Domingo, Dominican Republic.  Apply via the form below. If you are selected as a candidate, we will e-mail or call', 2, '24/5/23'),
(5, 'FL Betances', 'Santo Domingo', 'C. Armando Oscar Pacheco 9-12, Santo Domingo', 3, 1, 'Senior Python Developer', 3, '➢ Licenciatura en Ciencias de la Computación u otro campo técnico. \n➢ 5 años de experiencia en Python. \n➢ 3 años de experiencia con la plataforma Google Cloud. \n➢ Experiencia con metodología Scrum / A', 'De ley entre otros organizacionales.', 'vacantes@flbetances.com', '', '2023-06-15', 'Tecnología', 'Actividades: \n➢ Escribir código Python basado en especificaciones funcionales y diseño técnico. \n➢ Adherirse a los estándares de arquitectura y aprovechar adecuadamente el código existente. \n➢ Impulsa', 2, '31/5/23'),
(6, 'FL Betances', 'Santo Domingo', 'C. Armando Oscar Pacheco 9-12, Santo Domingo', 2, 1, 'Asistente Administrativa Bilingüe', 4, '- Estudiante de término o graduada de Administración de empresas, contabilidad o carreas a fines.\n- Bilingüe\n- Experiencia en posiciones similares\n- Pensamiento crítico\n- Autonomía \n- Proactiva\n- Aten', 'De ley entre otros adicionales de la empresa.', 'vacantes@flbetances.com', '', '2023-06-15', 'Asistente', 'Responsable de llevar a cabo diferentes tareas administrativas y de oficina (En inglés y español).  como: proporcionar apoyo a nuestros directores y empleados, asistir en las necesidades de la oficina', 2, '31/5/23'),
(7, 'FL Betances', 'Santo Domingo', 'C/Armando Oscar Pacheco # 9, Urb. Fernández, Charles Summer', 3, 3, 'Sr Analista Funcional QA Belingue', 5, 'Ofrezca pruebas de alta calidad para mejorar los procesos de desarrollo de software y prevenir defectos antes de la implementación\nØ Licenciatura en Informática, Ingeniería Informática.\nØ 5  años de e', 'Los de ley', 'vacantes@flbetances.com', '', '2023-06-10', 'Tecnología', '', 2, '31/5/23'),
(8, 'FL Betances', 'Santo Domingo', 'C/Armando Oscar Pacheco # 9, Urb. Fernández, Charles Summer', 3, 3, 'Project Management', 5, 'Las responsabilidades incluyen la coordinación y finalización de proyectos a tiempo dentro del presupuesto y dentro del alcance. Supervisar todos los aspectos de los proyectos. Establezca plazos, asig', 'Los de Ley', 'vacantes@flbetances.com', '', '2023-06-15', 'Tecnología', 'Es un horario hibrido.', 2, '31/5/23'),
(13, 'Inversiones Diamante SRL', 'Gascue', 'Av. Bolivar #173 esq. Rosa Duarte, Edif. Elias I, Local 2F, Gascue', 1, 1, 'Mensajero Cobrador', 2, '- Hacer entrega de las correspondencias que emita la empresa a las diversas instituciones públicas o privadas.\n- Realizar las operaciones bancarias de la empresa\n- Depositar y tramitar documentos en l', '- Beneficios de Ley: Vacaciones, Salario de Navidad, Bonificación\n- Smartphone\n- Gasolina\n- Seguro y TSS\n- Contribución diaria para el almuerzo', 'rrhh@rsuarez.com.do', '', '', 'Mensajero', '', 2, '7/6/23'),
(14, 'LiteHaus', 'Santo Domingo', 'Av Ing Roberto Pastoriza 315, Santo Domingo', 3, 3, 'Vendedor', 4, 'Buscamos a una persona graduada o avanzada en la carrera de arquitectura/ diseño de interiores. Idealmente con experiencia en trabajar en tiendas y ventas. La posición se desempeña en el área comercia', 'Salario: 40k más comisiones', 'isabellaballbuena@gmail.com', '', '', 'Vendedor', 'Sobre nosotros: La tienda se llama LiteHausRD y vendemos iluminación y abanicos.\n\nHorario: Los horarios son de lunes a viernes (9:00AM-6:00PM), y un sábado si otro no (9:00AM-6:00PM).', 2, '7/6/23'),
(15, 'Jagsport', 'Santiago de los caballeros', 'Parque Industrial 16, Zona Franca Especial', 2, 1, 'Administrativo', 4, 'Buscamos una persona responsable con experiencia en gestión y administración.', 'Teléfono móvil', 'trade@veratabacos.com', '', '', 'Administración de empresas', '', 2, '7/6/23'),
(16, 'SHOP BRILLANTES  EIRL', 'SANTO DOMINGO', 'LAS AMERICAS KM 19, SECTOR LA UREÑA', 3, 1, 'VENDEDORES', 2, 'conoce los productos de decoraciones o ferreteros', 'ENTREVISTA SUELDO BASICO   COMISION', 'empleoquen@gmail.com', '(809) 952-3774', '', 'Vendedor', '', 2, '7/6/23'),
(17, 'TECNOLOGIA PORTATIL GBL SRL', 'SANTO DOMINGO', 'ENSANCHE LA FE', 3, 1, 'Supervisor de tienda tecnología', 7, 'Estudiante Universitario (a) de mercadeo, administración y/o carreras afines.\nManejo del Paquete de Office.\nConocimientos de Plataformas y Dispositivos tecnologícos\nPreferiblemente residir en el Distr', 'Beneficios de Ley.\n\nDescuentos en Productos y Servicios.', 'gabriel@portatilshoprd.com', '', '', 'Vendedor', 'Lunes a Viernes 8: 30 a 5:30 pm\n\nSábado 9:00 am - 2:00 pm', 2, '7/6/23'),
(18, 'Ageport', 'Santo Domingo', 'C/ El Recodo No. 02. Edificio Monte Mirador. Bella Vista', 3, 1, 'Asistente de Servicio al Cliente', 4, 'Estudiante de las carreras de Administración de empresas, Negocios Internacionales, Mercadeo o carreras afines.', 'Salario competitivo y buenos beneficios', 'amordan@ageport.com', '829-451-1193', '2023-06-30', 'Negocios', 'Indispensable manejo del idioma inglés', 2, '7/6/23'),
(19, 'Suplegas', 'Santo domingo Norte', 'av. jacobo majluta No.41, Villa Mella', 2, 1, 'Ayudante de Cocina', 2, 'Hombre\nEntre 25-45 años\nCon experiencia previa.\nManipulación e higiene de alimentos\nManejo de porciones de alimentos\nResidir en Santo Domingo Norte o zonas aledañas', 'De Ley', 'reclutamientosuplegas@gmail.com', '', '', 'Ayudante', '', 2, '7/6/23'),
(20, 'Suplegas', 'Santo Domingo Norte', 'Av. Jacobo Majluta No.41, Villa Emlal', 1, 3, 'Lider de Equipo', 5, 'Hombre\nUniversitario\nSupervisar la operación diaria de la Estación\nHabilidad Numérica\nExperiencia mínima de 1 año supervisando personal\nDisponibilidad inmediata\nResidente en Villa Mella\nDisponibilidad', 'Salario: 28,150\nDe Ley', 'reclutamientosuplegas@gmail.com', '', '', 'Supervisor', '', 2, '7/6/23'),
(21, 'Pagina de Empleo Búsqueda Activa', 'Santo Domingo Oeste', 'Km 17 Autopista Duarte', 2, 1, 'Conserje Masculino Los Girasoles', 1, 'Experiencia de 6 meses a 1 años  demostrable en tareas de conserje, Utility, mantenimiento, Jardinería etc., edad mayor a 24 años , hombre, residente en Los girasoles, Pantoja, Ave. Monumental o Ave. ', 'Salario de 22,138.00   Beneficios de ley, oportunidad de crecimiento, Excelente ambiente de trabajo.', 'busquedaactiva123@gmail.com', '1 (829) 295-5534', '2023-06-24', 'Conserje', 'Debe cumplir con los requisitos de experiencia y ubicación', 2, '7/6/23'),
(22, 'Pagina de Empleo Búsqueda Activa', 'Santo Domingo', 'Km 17 Autopista Duarte', 2, 1, 'Auxiliar de Facturación', 4, 'Estudiante de Adm, contabilidad, mercadeo o carreras afines, experiencia de 6 meses, vivir en las proximidades de Pantoja, los Alcarrizos, km 9-24 Aut. duarte, Los Girasoles, Perantuen, Arroyo Manzano', 'Salario de 22,138.00   cobertura de almuerzo 100%, beneficios de ley, buen ambiente de trabajo, oportunidades de desarrollo y crecimiento', 'busquedaactiva123@gmail.com', '1 (829) 295-5534', '2023-07-01', 'Contabilidad', 'Indicar el nombre de la vacante a la que aplica', 2, '7/6/23'),
(23, 'Pagina de Empleo Búsqueda Activa', 'Distrito Nacional', 'Av. Independencia', 2, 1, 'Domestica sin Dormida Av. Independencia', 1, 'Realizar tareas generales de domestica como limpieza, lavar, cocinar etc., es un apartamento de 3 habitaciones.\nDisponibilidad Horario: De Lunes a Viernes  7:30am a 5:00pm \nResidir en las proximidades', 'salario 12,000   3,000 de pasaje , Sin dormida, horario de lunes a viernes', 'busquedaactiva123@gmail.com', '1 (829) 295-5534', '2023-06-17', 'Conserje', 'ver ubicación de la vacante, Indicar el nombre del puesto al que aplica', 2, '7/6/23'),
(24, 'DITEK', 'Haina', 'Zona industrial de Haina', 3, 1, 'Auxiliar de Distribucion', 4, 'Conocimiento en TMS, Bachiller y Ecel', 'Salario e incentivos', 'gabreu@fg.com.do', '8095656671', '2023-06-29', 'Almacen', 'Debe vivir en HAina, RD.  Poseer experiencia en trabajo distribucion.', 2, '7/6/23'),
(25, 'Hipermercados Ole', 'Santo Domingo', 'Boca chica', 3, 1, 'Encargado/a de Producción de Alimentos', 3, 'Minuto 1 año de experiencia en posiciones similares\nDisponibilidad de horario \nLiderazgo \nTrabajo en equipo\nTrabajar bajo presión', 'En entrevista', 'Vacantes@hiperole.con.do', '8094286299', '', 'Chef', 'Favor colocar  posición a la que aplica en el asunto del correo.', 2, '7/6/23');

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
