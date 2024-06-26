-- MySQL Script generated by MySQL Workbench
-- Wed Apr  3 12:18:41 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Nombre_Aereopuerto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Nombre_Aereopuerto` (
  `id_codigo` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  `Pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Linea_Aereolinea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Linea_Aereolinea` (
  `idaereolinea` INT NOT NULL,
  `nombre` VARCHAR(20) NOT NULL,
  `contacto` VARCHAR(15) NOT NULL,
  `lugar_operaciones` VARCHAR(45) NOT NULL,
  `anio_inicio_labores` DATE NOT NULL,
  `clas_servicio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idaereolinea`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tripulacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tripulacion` (
  `idTripulacion` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `num_identificacion` VARCHAR(45) NOT NULL,
  `funcion` VARCHAR(45) NOT NULL,
  `fecha_contratacion` DATE NOT NULL,
  PRIMARY KEY (`idTripulacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Programa_vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Programa_vuelo` (
  `idnumero_vuelo` INT NOT NULL,
  `linea_aerea` VARCHAR(45) NOT NULL,
  `nombre_tripulacion` VARCHAR(45) NOT NULL,
  `dias_vuelo` VARCHAR(45) NOT NULL,
  `Tripulacion_idTripulacion` INT NOT NULL,
  `Nombre_Aereopuerto_id_codigo` INT NOT NULL,
  `Nombre_Aereopuerto_id_codigo1` INT NOT NULL,
  `Linea_Aereolinea_idaereolinea` INT NOT NULL,
  PRIMARY KEY (`idnumero_vuelo`, `Tripulacion_idTripulacion`, `Nombre_Aereopuerto_id_codigo`, `Nombre_Aereopuerto_id_codigo1`, `Linea_Aereolinea_idaereolinea`),
  CONSTRAINT `fk_Programa_vuelo_Tripulacion1`
    FOREIGN KEY (`Tripulacion_idTripulacion`)
    REFERENCES `mydb`.`Tripulacion` (`idTripulacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Programa_vuelo_Nombre_Aereopuerto1`
    FOREIGN KEY (`Nombre_Aereopuerto_id_codigo1`)
    REFERENCES `mydb`.`Nombre_Aereopuerto` (`id_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Programa_vuelo_Linea_Aereolinea1`
    FOREIGN KEY (`Linea_Aereolinea_idaereolinea`)
    REFERENCES `mydb`.`Linea_Aereolinea` (`idaereolinea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Programa_vuelo_Tripulacion1_idx` ON `mydb`.`Programa_vuelo` (`Tripulacion_idTripulacion` ASC) VISIBLE;

CREATE INDEX `fk_Programa_vuelo_Nombre_Aereopuerto1_idx` ON `mydb`.`Programa_vuelo` (`Nombre_Aereopuerto_id_codigo1` ASC) VISIBLE;

CREATE INDEX `fk_Programa_vuelo_Linea_Aereolinea1_idx` ON `mydb`.`Programa_vuelo` (`Linea_Aereolinea_idaereolinea` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Modelo_Avion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Modelo_Avion` (
  `idModelo_Avion` INT NOT NULL,
  `Nombre_modelo` VARCHAR(25) NOT NULL,
  `Capacidad_asientos` INT NOT NULL,
  `anio_Fabricacion` DATE NOT NULL,
  PRIMARY KEY (`idModelo_Avion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vuelos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vuelos` (
  `idnumero_vuelo` INT NOT NULL,
  `llegada` VARCHAR(45) NOT NULL,
  `salida` VARCHAR(45) NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` VARCHAR(45) NOT NULL,
  `plazas_vacias` VARCHAR(45) NOT NULL,
  `modelo_avion` VARCHAR(45) NOT NULL,
  `Programa_vuelo_idnumero_vuelo` INT NOT NULL,
  `Programa_vuelo_Tripulacion_idTripulacion` INT NOT NULL,
  `Programa_vuelo_Nombre_Aereopuerto_id_codigo` INT NOT NULL,
  `Modelo_Avion_idModelo_Avion` INT NOT NULL,
  PRIMARY KEY (`idnumero_vuelo`, `Programa_vuelo_idnumero_vuelo`, `Programa_vuelo_Tripulacion_idTripulacion`, `Programa_vuelo_Nombre_Aereopuerto_id_codigo`, `Modelo_Avion_idModelo_Avion`),
  CONSTRAINT `fk_vuelos_Programa_vuelo1`
    FOREIGN KEY (`Programa_vuelo_idnumero_vuelo` , `Programa_vuelo_Tripulacion_idTripulacion` , `Programa_vuelo_Nombre_Aereopuerto_id_codigo`)
    REFERENCES `mydb`.`Programa_vuelo` (`idnumero_vuelo` , `Tripulacion_idTripulacion` , `Nombre_Aereopuerto_id_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vuelos_Modelo_Avion1`
    FOREIGN KEY (`Modelo_Avion_idModelo_Avion`)
    REFERENCES `mydb`.`Modelo_Avion` (`idModelo_Avion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_vuelos_Programa_vuelo1_idx` ON `mydb`.`vuelos` (`Programa_vuelo_idnumero_vuelo` ASC, `Programa_vuelo_Tripulacion_idTripulacion` ASC, `Programa_vuelo_Nombre_Aereopuerto_id_codigo` ASC) VISIBLE;

CREATE INDEX `fk_vuelos_Modelo_Avion1_idx` ON `mydb`.`vuelos` (`Modelo_Avion_idModelo_Avion` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Operacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Operacion` (
  `idOperacion` INT NOT NULL,
  `Tipo_Operacion` VARCHAR(45) NOT NULL,
  `fecha_operacion` DATE NOT NULL,
  `hora_operacion` DECIMAL NOT NULL,
  `Nombre_Aereopuerto_id_codigo` INT NOT NULL,
  PRIMARY KEY (`idOperacion`, `Nombre_Aereopuerto_id_codigo`),
  CONSTRAINT `fk_Operacion_Nombre_Aereopuerto1`
    FOREIGN KEY (`Nombre_Aereopuerto_id_codigo`)
    REFERENCES `mydb`.`Nombre_Aereopuerto` (`id_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Operacion_Nombre_Aereopuerto1_idx` ON `mydb`.`Operacion` (`Nombre_Aereopuerto_id_codigo` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`escala_tecnica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`escala_tecnica` (
  `idescala_tecnica` INT NOT NULL,
  `Numero_Orden` INT NOT NULL,
  PRIMARY KEY (`idescala_tecnica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Programa_vuelo_has_escala_tecnica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Programa_vuelo_has_escala_tecnica` (
  `Programa_vuelo_idnumero_vuelo` INT NOT NULL,
  `Programa_vuelo_Tripulacion_idTripulacion` INT NOT NULL,
  `Programa_vuelo_Nombre_Aereopuerto_id_codigo` INT NOT NULL,
  `escala_tecnica_idescala_tecnica` INT NOT NULL,
  PRIMARY KEY (`Programa_vuelo_idnumero_vuelo`, `Programa_vuelo_Tripulacion_idTripulacion`, `Programa_vuelo_Nombre_Aereopuerto_id_codigo`, `escala_tecnica_idescala_tecnica`),
  CONSTRAINT `fk_Programa_vuelo_has_escala_tecnica_Programa_vuelo1`
    FOREIGN KEY (`Programa_vuelo_idnumero_vuelo` , `Programa_vuelo_Tripulacion_idTripulacion` , `Programa_vuelo_Nombre_Aereopuerto_id_codigo`)
    REFERENCES `mydb`.`Programa_vuelo` (`idnumero_vuelo` , `Tripulacion_idTripulacion` , `Nombre_Aereopuerto_id_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Programa_vuelo_has_escala_tecnica_escala_tecnica1`
    FOREIGN KEY (`escala_tecnica_idescala_tecnica`)
    REFERENCES `mydb`.`escala_tecnica` (`idescala_tecnica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Programa_vuelo_has_escala_tecnica_escala_tecnica1_idx` ON `mydb`.`Programa_vuelo_has_escala_tecnica` (`escala_tecnica_idescala_tecnica` ASC) VISIBLE;

CREATE INDEX `fk_Programa_vuelo_has_escala_tecnica_Programa_vuelo1_idx` ON `mydb`.`Programa_vuelo_has_escala_tecnica` (`Programa_vuelo_idnumero_vuelo` ASC, `Programa_vuelo_Tripulacion_idTripulacion` ASC, `Programa_vuelo_Nombre_Aereopuerto_id_codigo` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Modelo_Avion_has_Nombre_Aereopuerto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Modelo_Avion_has_Nombre_Aereopuerto` (
  `Modelo_Avion_idModelo_Avion` INT NOT NULL,
  `Nombre_Aereopuerto_id_codigo` INT NOT NULL,
  PRIMARY KEY (`Modelo_Avion_idModelo_Avion`, `Nombre_Aereopuerto_id_codigo`),
  CONSTRAINT `fk_Modelo_Avion_has_Nombre_Aereopuerto_Modelo_Avion1`
    FOREIGN KEY (`Modelo_Avion_idModelo_Avion`)
    REFERENCES `mydb`.`Modelo_Avion` (`idModelo_Avion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Modelo_Avion_has_Nombre_Aereopuerto_Nombre_Aereopuerto1`
    FOREIGN KEY (`Nombre_Aereopuerto_id_codigo`)
    REFERENCES `mydb`.`Nombre_Aereopuerto` (`id_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Modelo_Avion_has_Nombre_Aereopuerto_Nombre_Aereopuerto1_idx` ON `mydb`.`Modelo_Avion_has_Nombre_Aereopuerto` (`Nombre_Aereopuerto_id_codigo` ASC) VISIBLE;

CREATE INDEX `fk_Modelo_Avion_has_Nombre_Aereopuerto_Modelo_Avion1_idx` ON `mydb`.`Modelo_Avion_has_Nombre_Aereopuerto` (`Modelo_Avion_idModelo_Avion` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
