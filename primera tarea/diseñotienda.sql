-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema diseño_empresa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema diseño_empresa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `diseño_empresa` DEFAULT CHARACTER SET utf8 ;
USE `diseño_empresa` ;

-- -----------------------------------------------------
-- Table `diseño_empresa`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diseño_empresa`.`proveedores` (
  `id_proveedores` INT NOT NULL,
  `DPI` INT NULL,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` INT NULL,
  `pagina_web` VARCHAR(45) NULL,
  PRIMARY KEY (`id_proveedores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diseño_empresa`.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diseño_empresa`.`direccion` (
  `id_direccion` INT NOT NULL,
  `callle` VARCHAR(45) NULL,
  `numero` VARCHAR(45) NULL,
  `comuna` VARCHAR(45) NULL,
  `ciudad` VARCHAR(45) NULL,
  PRIMARY KEY (`id_direccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diseño_empresa`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diseño_empresa`.`clientes` (
  `id_clientes` INT NOT NULL,
  `DPI` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `telefono` INT NULL,
  `direccion` VARCHAR(45) NULL,
  `direccion_id_direccion` INT NOT NULL,
  PRIMARY KEY (`id_clientes`),
  INDEX `fk_clientes_direccion_idx` (`direccion_id_direccion` ASC) VISIBLE,
  CONSTRAINT `fk_clientes_direccion`
    FOREIGN KEY (`direccion_id_direccion`)
    REFERENCES `diseño_empresa`.`direccion` (`id_direccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diseño_empresa`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diseño_empresa`.`categoria` (
  `id_categoria` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diseño_empresa`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diseño_empresa`.`productos` (
  `id_productos` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `precio_actual` VARCHAR(45) NULL,
  `stock` VARCHAR(45) NULL,
  `nombre_proveedor` VARCHAR(45) NULL,
  `proveedores_id_proveedores` INT NOT NULL,
  `categoria_id_categoria` INT NOT NULL,
  PRIMARY KEY (`id_productos`),
  INDEX `fk_productos_proveedores1_idx` (`proveedores_id_proveedores` ASC) VISIBLE,
  INDEX `fk_productos_categoria1_idx` (`categoria_id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_productos_proveedores1`
    FOREIGN KEY (`proveedores_id_proveedores`)
    REFERENCES `diseño_empresa`.`proveedores` (`id_proveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_categoria1`
    FOREIGN KEY (`categoria_id_categoria`)
    REFERENCES `diseño_empresa`.`categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diseño_empresa`.`proveedores_has_clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diseño_empresa`.`proveedores_has_clientes` (
  `proveedores_id_proveedores` INT NOT NULL,
  `clientes_id_clientes` INT NOT NULL,
  PRIMARY KEY (`proveedores_id_proveedores`, `clientes_id_clientes`),
  INDEX `fk_proveedores_has_clientes_clientes1_idx` (`clientes_id_clientes` ASC) VISIBLE,
  INDEX `fk_proveedores_has_clientes_proveedores1_idx` (`proveedores_id_proveedores` ASC) VISIBLE,
  CONSTRAINT `fk_proveedores_has_clientes_proveedores1`
    FOREIGN KEY (`proveedores_id_proveedores`)
    REFERENCES `diseño_empresa`.`proveedores` (`id_proveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveedores_has_clientes_clientes1`
    FOREIGN KEY (`clientes_id_clientes`)
    REFERENCES `diseño_empresa`.`clientes` (`id_clientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diseño_empresa`.`registro_ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diseño_empresa`.`registro_ventas` (
  `id_registro` INT NOT NULL,
  `cantidad_ventas` VARCHAR(45) NULL,
  `monto_totaLproducto` VARCHAR(45) NULL,
  PRIMARY KEY (`id_registro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diseño_empresa`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diseño_empresa`.`ventas` (
  `id_ventas` INT NOT NULL,
  `fecha` VARCHAR(45) NULL,
  `cliente` VARCHAR(45) NULL,
  `descuento` VARCHAR(45) NULL,
  `monto_final` VARCHAR(45) NULL,
  `registro_ventas_id_registro` INT NOT NULL,
  `clientes_id_clientes` INT NOT NULL,
  PRIMARY KEY (`id_ventas`),
  INDEX `fk_ventas_registro_ventas1_idx` (`registro_ventas_id_registro` ASC) VISIBLE,
  INDEX `fk_ventas_clientes1_idx` (`clientes_id_clientes` ASC) VISIBLE,
  CONSTRAINT `fk_ventas_registro_ventas1`
    FOREIGN KEY (`registro_ventas_id_registro`)
    REFERENCES `diseño_empresa`.`registro_ventas` (`id_registro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_clientes1`
    FOREIGN KEY (`clientes_id_clientes`)
    REFERENCES `diseño_empresa`.`clientes` (`id_clientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
