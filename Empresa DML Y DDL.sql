CREATE SCHEMA `db_empresa` ;

CREATE TABLE `db_empresa`.`clientes` (
  `id_clientes` INT NOT NULL AUTO_INCREMENT,
  `nit` VARCHAR(9) NULL,
  `nombres` VARCHAR(60) NULL,
  `apellidos` VARCHAR(60) NULL,
  `direccion` VARCHAR(100) NULL,
  `telefono` VARCHAR(8) NULL,
  PRIMARY KEY (`id_clientes`));

ALTER TABLE `db_empresa`.`clientes` 
ADD COLUMN `fecha_nacimiento` DATE NULL AFTER `telefono`;

CREATE TABLE `db_empresa`.`puestos` (
  `id_puestos` SMALLINT NOT NULL AUTO_INCREMENT,
  `puesto` VARCHAR(40) NULL,
  PRIMARY KEY (`id_puestos`));
CREATE TABLE `db_empresa`.`empleados` (
  `id_empleados` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(20) NULL,
  `nombres` VARCHAR(60) NULL,
  `apellidos` VARCHAR(45) NULL,
  `direccion` VARCHAR(100) NULL,
  `telefono` VARCHAR(8) NULL,
  `fecha_nacimiento` DATE NULL,
  `id_puesto` SMALLINT NULL,
  PRIMARY KEY (`id_empleados`),
  INDEX `id_puesto_puesto_empleados_idx` (`id_puesto` ASC) VISIBLE,
  CONSTRAINT `id_puesto_puesto_empleados`
    FOREIGN KEY (`id_puesto`)
    REFERENCES `db_empresa`.`puestos` (`id_puestos`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


/*usuario usr_empresa, contrasena  hola123*/

INSERT INTO `db_empresa`.`clientes` (`nit`, `nombres`, `apellidos`, `direccion`, `telefono`, `fecha_nacimiento`) VALUES ('444', 'armando', 'cardona', 'guatemala', '5555', '1990-01-01');

INSERT INTO `db_empresa`.`clientes` (`nit`, `nombres`, `apellidos`, `direccion`, `telefono`, `fecha_nacimiento`) VALUES ('11234', 'Jose luis', 'Perez Lopez', 'Guatemala', '5555', '2000-10-01');

INSERT INTO `db_empresa`.`puestos` (`id_puestos`, `puesto`) VALUES ('1', 'programador');

INSERT INTO `db_empresa`.`empleados` (`codigo`, `nombres`, `apellidos`, `direccion`, `telefono`, `fecha_nacimiento`, `id_puesto`) VALUES ('E001', 'pedro', 'paz mas', 'guatemala', '5555', '1991-01-01', '1');

INSERT INTO `db_empresa`.`puestos` (`id_puestos`, `puesto`) VALUES ('2', 'Administrador');

SELECT * FROM db_empresa.empleados;

INSERT INTO `db_empresa`.`empleados` (`codigo`, `nombres`, `apellidos`, `direccion`, `telefono`, `fecha_nacimiento`, `id_puesto`) VALUES ('E002', 'julio', 'diaz lopz', 'guatemala', '5555', '1997-01-01', '2');

ALTER TABLE `db_empresa`.`empleados` 
CHANGE COLUMN `id_empleados` `id_empleado` INT NOT NULL AUTO_INCREMENT ;

UPDATE `db_empresa`.`empleados` SET `telefono` = '2222' WHERE (`id_empleado` = '2');

DELETE FROM `db_empresa`.`empleados` WHERE (`id_empleado` = '2');

INSERT INTO `db_empresa`.`empleados` (`codigo`, `nombres`, `apellidos`, `direccion`, `telefono`, `fecha_nacimiento`, `id_puesto`) VALUES ('E002', 'julio', 'guzman', 'guatemala', '222', '1993-01-01', '2');

selectre.id_empleado, e.codigo, e.nombres, e.apellidos, e.direccion, e.telefono, e.fecha_nacimiento,p.puesto
from empleados as e inner join puestos as p on e.id_puesto = p.id_puesto;

SELECT `clientes`.`id_clientes`,
    `clientes`.`nit`,
    `clientes`.`nombres`,
    `clientes`.`apellidos`,
    `clientes`.`direccion`,
    `clientes`.`telefono`,
    `clientes`.`fecha_nacimiento`
FROM `db_empresa`.`clientes`;


SELECT `empleados`.`id_empleado`,
    `empleados`.`codigo`,
    `empleados`.`nombres`,
    `empleados`.`apellidos`,
    `empleados`.`direccion`,
    `empleados`.`telefono`,
    `empleados`.`fecha_nacimiento`,
    `empleados`.`id_puesto`
FROM `db_empresa`.`empleados`;

SELECT `puestos`.`id_puestos`,
    `puestos`.`puesto`
FROM `db_empresa`.`puestos`;


