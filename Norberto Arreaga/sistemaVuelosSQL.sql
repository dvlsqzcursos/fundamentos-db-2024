-- MySQL Script generated by MySQL Workbench
-- Wed Apr  3 12:06:27 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sistemavuelos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sistemavuelos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sistemavuelos` DEFAULT CHARACTER SET utf8 ;
USE `sistemavuelos` ;

-- -----------------------------------------------------
-- Table `sistemavuelos`.`Aeropuerto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemavuelos`.`Aeropuerto` (
  `idAeropuerto` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(9) NULL,
  `nombre` VARCHAR(30) NULL,
  `ciudad` VARCHAR(30) NULL,
  `pais` VARCHAR(30) NULL,
  PRIMARY KEY (`idAeropuerto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemavuelos`.`Aerolinea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemavuelos`.`Aerolinea` (
  `idAerolinea` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NULL,
  `contacto` VARCHAR(30) NULL,
  `lugarOperaciones` VARCHAR(30) NULL,
  `anioInicioLabores` YEAR(4) NULL,
  `estado` VARCHAR(12) NULL,
  `calificacionServicio` VARCHAR(10) NULL,
  PRIMARY KEY (`idAerolinea`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemavuelos`.`ModeloAvion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemavuelos`.`ModeloAvion` (
  `idModeloAvion` INT NOT NULL AUTO_INCREMENT,
  `nombreModelo` VARCHAR(45) NULL,
  `capacidadAsientos` INT NULL,
  `anioFabricacion` YEAR(4) NULL,
  PRIMARY KEY (`idModeloAvion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemavuelos`.`ProgramaVuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemavuelos`.`ProgramaVuelo` (
  `idProgramaVuelo` INT NOT NULL AUTO_INCREMENT,
  `numeroVuelo` VARCHAR(10) NULL,
  `diasSemana` VARCHAR(30) NULL,
  `aeropuertoOrigen` INT NULL,
  `aeropuertoDestino` INT NULL,
  `Aeropuerto_idAeropuerto` INT NOT NULL,
  `Aerolinea_idAerolinea` INT NOT NULL,
  PRIMARY KEY (`idProgramaVuelo`, `Aeropuerto_idAeropuerto`, `Aerolinea_idAerolinea`),
  INDEX `fk_ProgramaVuelo_Aeropuerto1_idx` (`Aeropuerto_idAeropuerto` ASC) VISIBLE,
  INDEX `fk_ProgramaVuelo_Aerolinea1_idx` (`Aerolinea_idAerolinea` ASC) VISIBLE,
  CONSTRAINT `fk_ProgramaVuelo_Aeropuerto1`
    FOREIGN KEY (`Aeropuerto_idAeropuerto`)
    REFERENCES `sistemavuelos`.`Aeropuerto` (`idAeropuerto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProgramaVuelo_Aerolinea1`
    FOREIGN KEY (`Aerolinea_idAerolinea`)
    REFERENCES `sistemavuelos`.`Aerolinea` (`idAerolinea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemavuelos`.`Vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemavuelos`.`Vuelo` (
  `idVuelo` INT NOT NULL AUTO_INCREMENT,
  `fechaVuelo` DATE NULL,
  `plazasVacias` INT NULL,
  `ModeloAvion_idModeloAvion` INT NOT NULL,
  `ProgramaVuelo_idProgramaVuelo` INT NOT NULL,
  `ProgramaVuelo_Aeropuerto_idAeropuerto` INT NOT NULL,
  `ProgramaVuelo_Aerolinea_idAerolinea` INT NOT NULL,
  PRIMARY KEY (`idVuelo`, `ModeloAvion_idModeloAvion`, `ProgramaVuelo_idProgramaVuelo`, `ProgramaVuelo_Aeropuerto_idAeropuerto`, `ProgramaVuelo_Aerolinea_idAerolinea`),
  INDEX `fk_Vuelo_ModeloAvion1_idx` (`ModeloAvion_idModeloAvion` ASC) VISIBLE,
  INDEX `fk_Vuelo_ProgramaVuelo1_idx` (`ProgramaVuelo_idProgramaVuelo` ASC, `ProgramaVuelo_Aeropuerto_idAeropuerto` ASC, `ProgramaVuelo_Aerolinea_idAerolinea` ASC) VISIBLE,
  CONSTRAINT `fk_Vuelo_ModeloAvion1`
    FOREIGN KEY (`ModeloAvion_idModeloAvion`)
    REFERENCES `sistemavuelos`.`ModeloAvion` (`idModeloAvion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vuelo_ProgramaVuelo1`
    FOREIGN KEY (`ProgramaVuelo_idProgramaVuelo` , `ProgramaVuelo_Aeropuerto_idAeropuerto` , `ProgramaVuelo_Aerolinea_idAerolinea`)
    REFERENCES `sistemavuelos`.`ProgramaVuelo` (`idProgramaVuelo` , `Aeropuerto_idAeropuerto` , `Aerolinea_idAerolinea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemavuelos`.`EscalaTecnica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemavuelos`.`EscalaTecnica` (
  `idEscalaTecnica` INT NOT NULL AUTO_INCREMENT,
  `numeroOrden` INT NULL,
  PRIMARY KEY (`idEscalaTecnica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemavuelos`.`Tripulacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemavuelos`.`Tripulacion` (
  `idTripulacion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NULL,
  `apellido` VARCHAR(30) NULL,
  `numeroIdentifiacion` VARCHAR(15) NULL,
  `funcion` VARCHAR(25) NULL,
  `fechaContratacion` DATE NULL,
  `ProgramaVuelo_idProgramaVuelo` INT NOT NULL,
  `ProgramaVuelo_Aeropuerto_idAeropuerto` INT NOT NULL,
  `ProgramaVuelo_Aerolinea_idAerolinea` INT NOT NULL,
  PRIMARY KEY (`idTripulacion`, `ProgramaVuelo_idProgramaVuelo`, `ProgramaVuelo_Aeropuerto_idAeropuerto`, `ProgramaVuelo_Aerolinea_idAerolinea`),
  INDEX `fk_Tripulacion_ProgramaVuelo1_idx` (`ProgramaVuelo_idProgramaVuelo` ASC, `ProgramaVuelo_Aeropuerto_idAeropuerto` ASC, `ProgramaVuelo_Aerolinea_idAerolinea` ASC) VISIBLE,
  CONSTRAINT `fk_Tripulacion_ProgramaVuelo1`
    FOREIGN KEY (`ProgramaVuelo_idProgramaVuelo` , `ProgramaVuelo_Aeropuerto_idAeropuerto` , `ProgramaVuelo_Aerolinea_idAerolinea`)
    REFERENCES `sistemavuelos`.`ProgramaVuelo` (`idProgramaVuelo` , `Aeropuerto_idAeropuerto` , `Aerolinea_idAerolinea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemavuelos`.`Operacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemavuelos`.`Operacion` (
  `idOperacion` INT NOT NULL AUTO_INCREMENT,
  `tipoOperacion` VARCHAR(45) NULL,
  `fechaHoraOperacion` DATETIME(6) NULL,
  `Aeropuerto_idAeropuerto` INT NOT NULL,
  PRIMARY KEY (`idOperacion`, `Aeropuerto_idAeropuerto`),
  INDEX `fk_Operacion_Aeropuerto1_idx` (`Aeropuerto_idAeropuerto` ASC) VISIBLE,
  CONSTRAINT `fk_Operacion_Aeropuerto1`
    FOREIGN KEY (`Aeropuerto_idAeropuerto`)
    REFERENCES `sistemavuelos`.`Aeropuerto` (`idAeropuerto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemavuelos`.`ModelosDisponibles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemavuelos`.`ModelosDisponibles` (
  `ModeloAvion_idModeloAvion` INT NOT NULL,
  `Aeropuerto_idAeropuerto` INT NOT NULL,
  PRIMARY KEY (`ModeloAvion_idModeloAvion`, `Aeropuerto_idAeropuerto`),
  INDEX `fk_ModeloAvion_has_Aeropuerto_Aeropuerto1_idx` (`Aeropuerto_idAeropuerto` ASC) VISIBLE,
  INDEX `fk_ModeloAvion_has_Aeropuerto_ModeloAvion_idx` (`ModeloAvion_idModeloAvion` ASC) VISIBLE,
  CONSTRAINT `fk_ModeloAvion_has_Aeropuerto_ModeloAvion`
    FOREIGN KEY (`ModeloAvion_idModeloAvion`)
    REFERENCES `sistemavuelos`.`ModeloAvion` (`idModeloAvion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ModeloAvion_has_Aeropuerto_Aeropuerto1`
    FOREIGN KEY (`Aeropuerto_idAeropuerto`)
    REFERENCES `sistemavuelos`.`Aeropuerto` (`idAeropuerto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemavuelos`.`ProgramaVueloEscalaTecnica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemavuelos`.`ProgramaVueloEscalaTecnica` (
  `ProgramaVuelo_idProgramaVuelo` INT NOT NULL,
  `ProgramaVuelo_Aeropuerto_idAeropuerto` INT NOT NULL,
  `ProgramaVuelo_Aerolinea_idAerolinea` INT NOT NULL,
  `EscalaTecnica_idEscalaTecnica` INT NOT NULL,
  PRIMARY KEY (`ProgramaVuelo_idProgramaVuelo`, `ProgramaVuelo_Aeropuerto_idAeropuerto`, `ProgramaVuelo_Aerolinea_idAerolinea`, `EscalaTecnica_idEscalaTecnica`),
  INDEX `fk_ProgramaVuelo_has_EscalaTecnica_EscalaTecnica1_idx` (`EscalaTecnica_idEscalaTecnica` ASC) VISIBLE,
  INDEX `fk_ProgramaVuelo_has_EscalaTecnica_ProgramaVuelo1_idx` (`ProgramaVuelo_idProgramaVuelo` ASC, `ProgramaVuelo_Aeropuerto_idAeropuerto` ASC, `ProgramaVuelo_Aerolinea_idAerolinea` ASC) VISIBLE,
  CONSTRAINT `fk_ProgramaVuelo_has_EscalaTecnica_ProgramaVuelo1`
    FOREIGN KEY (`ProgramaVuelo_idProgramaVuelo` , `ProgramaVuelo_Aeropuerto_idAeropuerto` , `ProgramaVuelo_Aerolinea_idAerolinea`)
    REFERENCES `sistemavuelos`.`ProgramaVuelo` (`idProgramaVuelo` , `Aeropuerto_idAeropuerto` , `Aerolinea_idAerolinea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProgramaVuelo_has_EscalaTecnica_EscalaTecnica1`
    FOREIGN KEY (`EscalaTecnica_idEscalaTecnica`)
    REFERENCES `sistemavuelos`.`EscalaTecnica` (`idEscalaTecnica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
USE sistemaVuelos;
-- INSERTAR REGISTROS EN LA TABLA AEROPUERTO
INSERT INTO Aeropuerto (codigo, nombre, ciudad, pais) VALUES ('GUA', 'La Aurora', 'Ciudad de Guatemala', 'Guatemala');
INSERT INTO Aeropuerto (codigo, nombre, ciudad, pais) VALUES ('MAD', 'Adolfo Suarez', 'Madrid', 'España');
INSERT INTO Aeropuerto (codigo, nombre, ciudad, pais) VALUES ('LAX', 'Los Angeles', 'Los Angeles', 'Estados Unidos');
INSERT INTO Aeropuerto (codigo, nombre, ciudad, pais) VALUES ('JFK', 'John F. Kennedy', 'Nueva York', 'Estados Unidos');
INSERT INTO Aeropuerto (codigo, nombre, ciudad, pais) VALUES ('LHR', 'heathrow', 'Londres', 'Reino Unido');
-- INSERTAR REGISTROS EN LA TABLA AEROLINEA
-- EN 'ESTADO' SOLO EXISTEN 3 ESTADOS; FUNCIONANDO, CANCELADO Y SUSPENDIDO
INSERT INTO Aerolinea (nombre, contacto, lugarOperaciones, anioInicioLabores, estado, calificacionServicio) VALUES ('Iberia', 'contacto@iberia.com', 'España', 1927, 'Funcionando', '8.5' );
INSERT INTO Aerolinea (nombre, contacto, lugarOperaciones, anioInicioLabores, estado, calificacionServicio) VALUES ('Avianca', 'contacto@avianca.com', 'Colombia', 1919, 'Funcionando', '6.5');
INSERT INTO Aerolinea (nombre, contacto, lugarOperaciones, anioInicioLabores, estado, calificacionServicio) VALUES ('Delta', 'contacto@delta.com', 'Estados Unidos', 1924, 'Funcionando', '9.5');
INSERT INTO Aerolinea (nombre, contacto, lugarOperaciones, anioInicioLabores, estado, calificacionServicio) VALUES ('United', 'contacto@united.com', 'Estados Unidos', 1931, 'Funcionando', '9.2');
INSERT INTO Aerolinea (nombre, contacto, lugarOperaciones, anioInicioLabores, estado, calificacionServicio) VALUES ('British Airways', 'contacto@ba.com', 'Reino Unido', 1974, 'Funcionando', '7.8');
-- INSERTAR REGISTROS EN LA TABLA MODELO DE AVION
INSERT INTO ModeloAvion (nombreModelo, capacidadAsientos, anioFabricacion) VALUES ('AirbusA320', 150, 1998);
INSERT INTO ModeloAvion (nombreModelo, capacidadAsientos, anioFabricacion) VALUES ('Boeing 737', 180, 1995);
INSERT INTO ModeloAvion (nombreModelo, capacidadAsientos, anioFabricacion) VALUES ('Boeing 777', 350, 2005);
INSERT INTO ModeloAvion (nombreModelo, capacidadAsientos, anioFabricacion) VALUES ('Airbus A380', 550, 2007);
INSERT INTO ModeloAvion (nombreModelo, capacidadAsientos, anioFabricacion) VALUES ('Boeing 747', 416, 1970);
-- INSERTAR REGISTROS EN LA TABLA PROGRAMA DE VUELO
INSERT INTO ProgramaVuelo (numeroVuelo, diasSemana, aeropuertoOrigen, aeropuertoDestino, Aeropuerto_idAeropuerto, Aerolinea_idAerolinea) VALUES ('IB555', 'Lunes, Juves', 1, 2, 1, 1);
INSERT INTO ProgramaVuelo (numeroVuelo, diasSemana, aeropuertoOrigen, aeropuertoDestino, Aeropuerto_idAeropuerto, Aerolinea_idAerolinea) VALUES ('AV123', 'Martes, Viernes', 2, 3, 2, 2);
INSERT INTO ProgramaVuelo (numeroVuelo, diasSemana, aeropuertoOrigen, aeropuertoDestino, Aeropuerto_idAeropuerto, Aerolinea_idAerolinea) VALUES ('DL789', 'Miercoles, Sabado', 3, 1, 3, 3);
INSERT INTO ProgramaVuelo (numeroVuelo, diasSemana, aeropuertoOrigen, aeropuertoDestino, Aeropuerto_idAeropuerto, Aerolinea_idAerolinea) VALUES ('UA456', 'Domingo', 4, 5, 4, 4);
INSERT INTO ProgramaVuelo (numeroVuelo, diasSemana, aeropuertoOrigen, aeropuertoDestino, Aeropuerto_idAeropuerto, Aerolinea_idAerolinea) VALUES ('BA987', 'Lunes, Miercoles', 5, 6, 4, 4);
-- INSERTAR REGISTROS EN LA TABLA TRIPULACION
INSERT INTO Tripulacion (nombre, apellido, numeroIdentifiacion, funcion, fechaContratacion, ProgramaVuelo_idProgramaVuelo, ProgramaVuelo_Aeropuerto_idAeropuerto, ProgramaVuelo_Aerolinea_idAerolinea) VALUES ('Juan', 'Pérez', '1234567890', 'Piloto', '2020-01-01', 1, 1, 1);
INSERT INTO Tripulacion (nombre, apellido, numeroIdentifiacion, funcion, fechaContratacion, ProgramaVuelo_idProgramaVuelo, ProgramaVuelo_Aeropuerto_idAeropuerto, ProgramaVuelo_Aerolinea_idAerolinea) VALUES ('María', 'González', '2345678901', 'Copiloto', '2020-02-01', 1, 1, 1);
INSERT INTO Tripulacion (nombre, apellido, numeroIdentifiacion, funcion, fechaContratacion, ProgramaVuelo_idProgramaVuelo, ProgramaVuelo_Aeropuerto_idAeropuerto, ProgramaVuelo_Aerolinea_idAerolinea) VALUES ('Ana', 'Martínez', '3456789012', 'Azafata', '2020-03-01', 1, 1, 1);
INSERT INTO Tripulacion (nombre, apellido, numeroIdentifiacion, funcion, fechaContratacion, ProgramaVuelo_idProgramaVuelo, ProgramaVuelo_Aeropuerto_idAeropuerto, ProgramaVuelo_Aerolinea_idAerolinea) VALUES ('Carlos', 'López', '4567890123', 'Piloto', '2019-12-01', 2, 2, 2);
INSERT INTO Tripulacion (nombre, apellido, numeroIdentifiacion, funcion, fechaContratacion, ProgramaVuelo_idProgramaVuelo, ProgramaVuelo_Aeropuerto_idAeropuerto, ProgramaVuelo_Aerolinea_idAerolinea) VALUES ('Elena', 'Hernández', '6789012345', 'Azafata', '2020-02-15', 2, 2, 2);
-- INSERTAR REGISTROS EN LA TABLA VUELO
INSERT INTO Vuelo (fechaVuelo, plazasVacias, ModeloAvion_idModeloAvion, ProgramaVuelo_idProgramaVuelo, ProgramaVuelo_Aeropuerto_idAeropuerto, ProgramaVuelo_Aerolinea_idAerolinea) VALUES ('2024-03-31', 20, 1, 1, 1, 1);
INSERT INTO Vuelo (fechaVuelo, plazasVacias, ModeloAvion_idModeloAvion, ProgramaVuelo_idProgramaVuelo, ProgramaVuelo_Aeropuerto_idAeropuerto, ProgramaVuelo_Aerolinea_idAerolinea) VALUES ('2024-04-01', 15, 2, 2, 2, 2);
INSERT INTO Vuelo (fechaVuelo, plazasVacias, ModeloAvion_idModeloAvion, ProgramaVuelo_idProgramaVuelo, ProgramaVuelo_Aeropuerto_idAeropuerto, ProgramaVuelo_Aerolinea_idAerolinea) VALUES ('2024-04-02', 30, 3, 3, 3, 3);
INSERT INTO Vuelo (fechaVuelo, plazasVacias, ModeloAvion_idModeloAvion, ProgramaVuelo_idProgramaVuelo, ProgramaVuelo_Aeropuerto_idAeropuerto, ProgramaVuelo_Aerolinea_idAerolinea) VALUES ('2024-04-03', 10, 4, 4, 4, 4);
INSERT INTO Vuelo (fechaVuelo, plazasVacias, ModeloAvion_idModeloAvion, ProgramaVuelo_idProgramaVuelo, ProgramaVuelo_Aeropuerto_idAeropuerto, ProgramaVuelo_Aerolinea_idAerolinea) VALUES ('2024-04-04', 25, 3, 2, 2, 2);
-- INSERTAR REGISTROS EN LA TABLA ESCALA TECNICA
INSERT INTO EscalaTecnica (numeroOrden) VALUES (1);
INSERT INTO EscalaTecnica (numeroOrden) VALUES (1);
INSERT INTO EscalaTecnica (numeroOrden) VALUES (1);
INSERT INTO EscalaTecnica (numeroOrden) VALUES (1);
INSERT INTO EscalaTecnica (numeroOrden) VALUES (1);
-- REGISTROS EN LA TABLA MODELOS DISPONIBLES
INSERT INTO ModelosDisponibles (ModeloAvion_idModeloAvion, Aeropuerto_idAeropuerto) VALUES (1,1);
INSERT INTO ModelosDisponibles (ModeloAvion_idModeloAvion, Aeropuerto_idAeropuerto) VALUES (2,2);
INSERT INTO ModelosDisponibles (ModeloAvion_idModeloAvion, Aeropuerto_idAeropuerto) VALUES (3,3);
INSERT INTO ModelosDisponibles (ModeloAvion_idModeloAvion, Aeropuerto_idAeropuerto) VALUES (4,4);
INSERT INTO ModelosDisponibles (ModeloAvion_idModeloAvion, Aeropuerto_idAeropuerto) VALUES (5,5);
-- REGISTROS EN LA TABLA OPERACION
INSERT INTO operacion (tipoOperacion, fechaHoraOperacion, Aeropuerto_idAeropuerto) VALUES ('Manteniemitno', '2024-04-05 08:00:00', 1);
INSERT INTO operacion (tipoOperacion, fechaHoraOperacion, Aeropuerto_idAeropuerto) VALUES ('Reabastecimiento', '2024-04-06 10:30:00', 2);
INSERT INTO operacion (tipoOperacion, fechaHoraOperacion, Aeropuerto_idAeropuerto) VALUES ('Manteniemitno', '2024-04-07 12:45:00', 3);
INSERT INTO operacion (tipoOperacion, fechaHoraOperacion, Aeropuerto_idAeropuerto) VALUES ('Manteniemitno', '2024-04-08 09:15:00', 4);
INSERT INTO operacion (tipoOperacion, fechaHoraOperacion, Aeropuerto_idAeropuerto) VALUES ('Manteniemitno', '2024-04-09 11:00:00', 5);
-- REGISTROS EN LA TABLA PROGRAMA VUELOS EN ESCALA TECNICA
INSERT INTO ProgramaVueloEscalaTecnica (ProgramaVuelo_idProgramaVuelo, ProgramaVuelo_Aeropuerto_idAeropuerto, ProgramaVuelo_Aerolinea_idAerolinea, EscalaTecnica_idEscalaTecnica) VALUES (1,1,1,1);
INSERT INTO ProgramaVueloEscalaTecnica (ProgramaVuelo_idProgramaVuelo, ProgramaVuelo_Aeropuerto_idAeropuerto, ProgramaVuelo_Aerolinea_idAerolinea, EscalaTecnica_idEscalaTecnica) VALUES (2,2,2,2);
INSERT INTO ProgramaVueloEscalaTecnica (ProgramaVuelo_idProgramaVuelo, ProgramaVuelo_Aeropuerto_idAeropuerto, ProgramaVuelo_Aerolinea_idAerolinea, EscalaTecnica_idEscalaTecnica) VALUES (3,3,3,3);
INSERT INTO ProgramaVueloEscalaTecnica (ProgramaVuelo_idProgramaVuelo, ProgramaVuelo_Aeropuerto_idAeropuerto, ProgramaVuelo_Aerolinea_idAerolinea, EscalaTecnica_idEscalaTecnica) VALUES (4,4,4,4);
INSERT INTO ProgramaVueloEscalaTecnica (ProgramaVuelo_idProgramaVuelo, ProgramaVuelo_Aeropuerto_idAeropuerto, ProgramaVuelo_Aerolinea_idAerolinea, EscalaTecnica_idEscalaTecnica) VALUES (2,2,2,5);

-- Todas las columnas de la de programa de vuelos.
SELECT * FROM ProgramaVuelo;

-- Columna nombre de las aerolíneas que su país sea España.
SELECT nombre FROM Aerolinea WHERE lugarOperaciones = 'España';

-- Columna código de los aeropuertos que su país sea México.
SELECT codigo FROM Aeropuerto WHERE pais = 'Mexico';

-- Columna modelo de los aviones que su capacidad sea igual o superior a 500.
SELECT nombreModelo FROM ModeloAvion WHERE capacidadAsientos >= 500;
 
 -- Columna modelo de los aviones que su capacidad sea menor a 250.
SELECT nombreModelo FROM ModeloAvion WHERE capacidadAsientos < 250;

-- Todas las columnas de las escalas de los vuelos que tengan paso por Guatemala
SELECT * FROM ProgramaVueloEscalaTecnica WHERE ProgramaVuelo_Aeropuerto_idAeropuerto = (SELECT idAeropuerto FROM Aeropuerto WHERE pais = 'Guatemala');

-- Todas las columnas de la tabla de tripulación donde el nombre de los pilotos contenga la silaba ‘ar’.
SELECT *
FROM Tripulacion
WHERE funcion = 'piloto' AND (nombre LIKE '%ar%' OR apellido LIKE '%ar%');

-- Actualizar la cantidad de plazas de los aviones de Iberia que actualmente sean menores de 250 a 500 y 500 a 1000.
UPDATE ModeloAvion
SET capacidadAsientos = 
    CASE
        WHEN capacidadAsientos < 250 THEN 500
        WHEN capacidadAsientos = 500 THEN 1000
    END
WHERE nombreModelo IN (
    SELECT ModeloAvion.nombreModelo 
    FROM ModeloAvion
    JOIN Vuelo ON ModeloAvion.idModeloAvion = Vuelo.ModeloAvion_idModeloAvion
    JOIN ProgramaVuelo pv ON Vuelo.ProgramaVuelo_idProgramaVuelo = ProgramaVuelo.idProgramaVuelo
    JOIN Aerolinea ON ProgramaVuelo.Aerolinea_idAerolinea = Aerolinea.idAerolinea
    WHERE Aerolinea.nombre = 'Iberia'
);