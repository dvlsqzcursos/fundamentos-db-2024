-- MySQL Script generated by MySQL Workbench
-- Tue Apr  2 21:33:14 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clientes` (
  `idClientes` INT NOT NULL,
  `DPI` INT(13) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `idDirecciones` INT NOT NULL,
  `Telefono 1` INT NOT NULL,
  `Telefono 2` INT NOT NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proveedores` (
  `idProveedores` INT NOT NULL AUTO_INCREMENT,
  `DPI` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Direccion` TEXT NOT NULL,
  `Ciudad` TEXT NOT NULL,
  `Telefono` INT NULL,
  `Pagina wew` TEXT NOT NULL,
  PRIMARY KEY (`idProveedores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Productos` (
  `idProductos` INT NOT NULL AUTO_INCREMENT,
  `Nombre del producto` VARCHAR(45) NOT NULL,
  `Precio Actual` INT NOT NULL,
  `Stock` INT NOT NULL,
  `Nombre del proveedor` VARCHAR(45) NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  `idProveedores` INT NOT NULL,
  PRIMARY KEY (`idProductos`),
  INDEX `idProveedores_idx` (`idProveedores` ASC) VISIBLE,
  CONSTRAINT `idProveedores`
    FOREIGN KEY (`idProveedores`)
    REFERENCES `mydb`.`Proveedores` (`idProveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Categoria` (
  `idCategoria` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  `idProductos` INT NOT NULL,
  PRIMARY KEY (`idCategoria`),
  INDEX `idProductos_idx` (`idProductos` ASC) VISIBLE,
  CONSTRAINT `idProductos`
    FOREIGN KEY (`idProductos`)
    REFERENCES `mydb`.`Productos` (`idProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ventas` (
  `idVentas` INT NOT NULL,
  `Fecha` DATE NOT NULL,
  `idCliente` INT NOT NULL,
  `Cantidad` INT NOT NULL,
  `Descuento` DECIMAL NOT NULL,
  `Total` DECIMAL NOT NULL,
  `idProducto` INT NOT NULL,
  PRIMARY KEY (`idVentas`),
  INDEX `idCliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `idProducto_idx` (`idProducto` ASC) VISIBLE,
  CONSTRAINT `idCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `mydb`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProducto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `mydb`.`Productos` (`idProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Direcciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Direcciones` (
  `idDirecciones` INT NOT NULL AUTO_INCREMENT,
  `Calle` VARCHAR(25) NOT NULL,
  `Numero` VARCHAR(25) NOT NULL,
  `Zona` VARCHAR(25) NOT NULL,
  `Municipio` VARCHAR(25) NOT NULL,
  `Departamento` VARCHAR(25) NOT NULL,
  `Pais` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idDirecciones`),
  CONSTRAINT `idDirecciones`
    FOREIGN KEY (`idDirecciones`)
    REFERENCES `mydb`.`Clientes` (`idDirecciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;