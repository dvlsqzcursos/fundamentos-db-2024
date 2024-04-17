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
-- Table `mydb`.`Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleados` (
  `idEmpleados` INT NOT NULL,
  `Contraseña` VARCHAR(45) NULL,
  `Nombres` VARCHAR(45) NULL,
  `Apellidos` VARCHAR(45) NULL,
  `DPI` INT NULL,
  `Fecha_nacimiento` DATE NULL,
  `anio_iniciolabores` DATE NULL,
  `Estado_usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmpleados`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proveedores` (
  `idProveedores` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Contacto` INT NULL,
  `Ubicacion` VARCHAR(100) NULL,
  `Contacto_Representante` INT NULL,
  PRIMARY KEY (`idProveedores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cilentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cilentes` (
  `idCilentes` INT NOT NULL,
  `DPI` INT NULL,
  `NIT` INT NULL,
  `Contacto` INT NULL,
  PRIMARY KEY (`idCilentes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Productos` (
  `idProductos` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Descrpcion` VARCHAR(45) NULL,
  `Codigo_sku` INT NULL,
  `Categoria` VARCHAR(45) NULL,
  `Saldo` VARCHAR(45) NULL,
  `Precio_Compra` DECIMAL(10) NULL,
  `Precio_venta` DECIMAL(10) NULL,
  `Proveedores_idProveedores` INT NOT NULL,
  PRIMARY KEY (`idProductos`),
  INDEX `fk_Productos_Proveedores1_idx` (`Proveedores_idProveedores` ASC) VISIBLE,
  CONSTRAINT `fk_Productos_Proveedores1`
    FOREIGN KEY (`Proveedores_idProveedores`)
    REFERENCES `mydb`.`Proveedores` (`idProveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cilentes_has_Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cilentes_has_Productos` (
  `Cilentes_idCilentes` INT NOT NULL,
  `Productos_idProductos` INT NOT NULL,
  PRIMARY KEY (`Cilentes_idCilentes`, `Productos_idProductos`),
  INDEX `fk_Cilentes_has_Productos_Productos1_idx` (`Productos_idProductos` ASC) VISIBLE,
  INDEX `fk_Cilentes_has_Productos_Cilentes_idx` (`Cilentes_idCilentes` ASC) VISIBLE,
  CONSTRAINT `fk_Cilentes_has_Productos_Cilentes`
    FOREIGN KEY (`Cilentes_idCilentes`)
    REFERENCES `mydb`.`Cilentes` (`idCilentes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cilentes_has_Productos_Productos1`
    FOREIGN KEY (`Productos_idProductos`)
    REFERENCES `mydb`.`Productos` (`idProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compras` (
  `idCompras` INT NOT NULL,
  `Fecha` DATE NULL,
  `Monto_total` DECIMAL(10,2) NULL,
  `Proveedores_idProveedores` INT NOT NULL,
  PRIMARY KEY (`idCompras`),
  INDEX `fk_Compras_Proveedores1_idx` (`Proveedores_idProveedores` ASC) VISIBLE,
  CONSTRAINT `fk_Compras_Proveedores1`
    FOREIGN KEY (`Proveedores_idProveedores`)
    REFERENCES `mydb`.`Proveedores` (`idProveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ventas` (
  `idVentas` INT NOT NULL,
  `Fecha` DATE NULL,
  `monto_total` DECIMAL(10,2) NULL,
  `Cilentes_idCilentes` INT NOT NULL,
  PRIMARY KEY (`idVentas`),
  INDEX `fk_Ventas_Cilentes1_idx` (`Cilentes_idCilentes` ASC) VISIBLE,
  CONSTRAINT `fk_Ventas_Cilentes1`
    FOREIGN KEY (`Cilentes_idCilentes`)
    REFERENCES `mydb`.`Cilentes` (`idCilentes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
