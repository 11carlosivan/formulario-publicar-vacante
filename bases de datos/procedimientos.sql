DELIMITER $$
CREATE PROCEDURE `sp_add_vacante`(IN `p_nombre_empresa` VARCHAR(100), IN `p_provincia` VARCHAR(100), IN `p_direccion` VARCHAR(100), IN `p_sexo` INT, IN `p_nacionalidad` INT, IN `p_posicion` VARCHAR(100), IN `p_nivel_estudio` INT, IN `p_requisitos` VARCHAR(200), IN `p_beneficios` VARCHAR(200), IN `p_correo` VARCHAR(50), IN `p_telefono` VARCHAR(30), IN `p_fecha` VARCHAR(10), IN `p_categoria` VARCHAR(50), IN `p_comentarios` VARCHAR(200), IN `p_estado` INT, IN `p_fecha_creacion` VARCHAR(30))
INSERT INTO vacantes (Nombre_empresa, Provincia, Direccion, Sexo, Nacionalidad, Posicion_requerida, Nivel_estudio, Requisitos, Beneficios, Correo_electronico_aplicante, Numero_telefono, Fecha_limite, Categoria, Comentario_adicional, Estado, Fecha_creacion)
    VALUES (p_nombre_empresa, p_provincia, p_direccion, p_sexo, p_nacionalidad, p_posicion, p_nivel_estudio, p_requisitos, p_beneficios, p_correo, p_telefono, p_fecha, p_categoria, p_comentarios, p_estado, p_fecha_creacion)$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_change_status_vacante`(IN `p_id` INT)
UPDATE vacantes SET Estado = 2 WHERE Id = p_id$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_delete_vacante`(IN `p_id` INT)
DELETE FROM vacantes WHERE Id = p_id$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_get_vacante_by_id`(IN `p_id` INT)
SELECT vacantes.*, estados.Estado as estado, nacionalidades.Nacionalidad as nacionalidad, niveles_estudios.Nivel_estudio as nivel_estudio, sexos.Sexo as sexo FROM vacantes 
JOIN estados ON estados.Id = vacantes.Estado 
JOIN nacionalidades ON nacionalidades.Id = vacantes.Nacionalidad
JOIN niveles_estudios ON niveles_estudios.Id = vacantes.Nivel_estudio
JOIN sexos ON sexos.Id = vacantes.Sexo
WHERE vacantes.Id = p_id$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_get_vacantes_nuevas`()
SELECT vacantes.*, estados.Estado as estado, nacionalidades.Nacionalidad as nacionalidad, niveles_estudios.Nivel_estudio as nivel_estudio, sexos.Sexo as sexo FROM vacantes 
JOIN estados ON estados.Id = vacantes.Estado 
JOIN nacionalidades ON nacionalidades.Id = vacantes.Nacionalidad
JOIN niveles_estudios ON niveles_estudios.Id = vacantes.Nivel_estudio
JOIN sexos ON sexos.Id = vacantes.Sexo
WHERE vacantes.Estado = 1 ORDER BY Id DESC$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_get_vacantes_publicadas`()
SELECT vacantes.*, estados.Estado as estado, nacionalidades.Nacionalidad as nacionalidad, niveles_estudios.Nivel_estudio as nivel_estudio, sexos.Sexo as sexo FROM vacantes 
JOIN estados ON estados.Id = vacantes.Estado 
JOIN nacionalidades ON nacionalidades.Id = vacantes.Nacionalidad
JOIN niveles_estudios ON niveles_estudios.Id = vacantes.Nivel_estudio
JOIN sexos ON sexos.Id = vacantes.Sexo
WHERE vacantes.Estado = 2 ORDER BY Id DESC$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `sp_reset_auto_increment`()
ALTER TABLE vacantes AUTO_INCREMENT = 1$$
DELIMITER ;
