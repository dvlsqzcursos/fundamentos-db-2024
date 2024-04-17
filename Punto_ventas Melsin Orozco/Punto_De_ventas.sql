-- MySQL Script generated by MySQL Workbench
-- Wed Apr 17 15:10:40 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BD_PuntoDe_Ventas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BD_PuntoDe_Ventas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BD_PuntoDe_Ventas` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci ;
USE `BD_PuntoDe_Ventas` ;

-- -----------------------------------------------------
-- Table `BD_PuntoDe_Ventas`.`clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_PuntoDe_Ventas`.`clientes` ;

CREATE TABLE IF NOT EXISTS `BD_PuntoDe_Ventas`.`clientes` (
  `idCilentes` INT NOT NULL AUTO_INCREMENT,
  `DPI` VARCHAR(15) NULL,
  `NIT` VARCHAR(10) NULL,
  `Contacto` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCilentes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `BD_PuntoDe_Ventas`.`proveedores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_PuntoDe_Ventas`.`proveedores` ;

CREATE TABLE IF NOT EXISTS `BD_PuntoDe_Ventas`.`proveedores` (
  `idProveedores` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Contacto` VARCHAR(20) NULL,
  `Ubicacion` VARCHAR(100) NULL,
  `Contacto_Representante` INT NULL,
  PRIMARY KEY (`idProveedores`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `BD_PuntoDe_Ventas`.`productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_PuntoDe_Ventas`.`productos` ;

CREATE TABLE IF NOT EXISTS `BD_PuntoDe_Ventas`.`productos` (
  `idProductos` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `Descrpcion` VARCHAR(45) NULL DEFAULT NULL,
  `Codigo_sku` INT NULL DEFAULT NULL,
  `Categoria` VARCHAR(45) NULL DEFAULT NULL,
  `Saldo` VARCHAR(45) NULL DEFAULT NULL,
  `Precio_Compra` DECIMAL(10,0) NULL DEFAULT NULL,
  `Precio_venta` DECIMAL(10,0) NULL DEFAULT NULL,
  `idProveedores` INT NOT NULL,
  PRIMARY KEY (`idProductos`),
  INDEX `fk_Productos_Proveedores1_idx` (`idProveedores` ASC) VISIBLE,
  CONSTRAINT `fk_Productos_Proveedores1`
    FOREIGN KEY (`idProveedores`)
    REFERENCES `BD_PuntoDe_Ventas`.`proveedores` (`idProveedores`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `BD_PuntoDe_Ventas`.`clientes_has_productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_PuntoDe_Ventas`.`clientes_has_productos` ;

CREATE TABLE IF NOT EXISTS `BD_PuntoDe_Ventas`.`clientes_has_productos` (
  `idClientes` INT NOT NULL,
  `idProductos` INT NOT NULL,
  PRIMARY KEY (`idClientes`, `idProductos`),
  INDEX `fk_Cilentes_has_Productos_Productos1_idx` (`idProductos` ASC) VISIBLE,
  INDEX `fk_Cilentes_has_Productos_Cilentes_idx` (`idClientes` ASC) VISIBLE,
  CONSTRAINT `fk_Cilentes_has_Productos_Cilentes`
    FOREIGN KEY (`idClientes`)
    REFERENCES `BD_PuntoDe_Ventas`.`clientes` (`idCilentes`),
  CONSTRAINT `fk_Cilentes_has_Productos_Productos1`
    FOREIGN KEY (`idProductos`)
    REFERENCES `BD_PuntoDe_Ventas`.`productos` (`idProductos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `BD_PuntoDe_Ventas`.`compras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_PuntoDe_Ventas`.`compras` ;

CREATE TABLE IF NOT EXISTS `BD_PuntoDe_Ventas`.`compras` (
  `idCompras` INT NOT NULL AUTO_INCREMENT,
  `Fecha` DATE NULL DEFAULT NULL,
  `Monto_total` DECIMAL(10,2) NULL DEFAULT NULL,
  `idProveedores` INT NOT NULL,
  PRIMARY KEY (`idCompras`),
  INDEX `fk_Compras_Proveedores1_idx` (`idProveedores` ASC) VISIBLE,
  CONSTRAINT `fk_Compras_Proveedores1`
    FOREIGN KEY (`idProveedores`)
    REFERENCES `BD_PuntoDe_Ventas`.`proveedores` (`idProveedores`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `BD_PuntoDe_Ventas`.`empleados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_PuntoDe_Ventas`.`empleados` ;

CREATE TABLE IF NOT EXISTS `BD_PuntoDe_Ventas`.`empleados` (
  `idEmpleados` INT NOT NULL AUTO_INCREMENT,
  `Contraseña` VARCHAR(45) NULL DEFAULT NULL,
  `Nombres` VARCHAR(45) NULL DEFAULT NULL,
  `Apellidos` VARCHAR(45) NULL DEFAULT NULL,
  `DPI` VARCHAR(15) NULL,
  `Fecha_nacimiento` DATE NULL DEFAULT NULL,
  `anio_iniciolabores` DATE NULL DEFAULT NULL,
  `Estado_usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmpleados`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `BD_PuntoDe_Ventas`.`ventas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BD_PuntoDe_Ventas`.`ventas` ;

CREATE TABLE IF NOT EXISTS `BD_PuntoDe_Ventas`.`ventas` (
  `idVentas` INT NOT NULL AUTO_INCREMENT,
  `Fecha` DATE NULL DEFAULT NULL,
  `monto_total` DECIMAL(10,2) NULL DEFAULT NULL,
  `idClientes` INT NOT NULL,
  PRIMARY KEY (`idVentas`),
  INDEX `fk_Ventas_Cilentes1_idx` (`idClientes` ASC) VISIBLE,
  CONSTRAINT `fk_Ventas_Cilentes1`
    FOREIGN KEY (`idClientes`)
    REFERENCES `BD_PuntoDe_Ventas`.`clientes` (`idCilentes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
