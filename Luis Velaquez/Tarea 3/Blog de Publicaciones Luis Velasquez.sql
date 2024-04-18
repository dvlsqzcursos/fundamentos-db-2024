-- MySQL Script generated by MySQL Workbench
-- Wed Apr 10 20:28:20 2024
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
-- Table `mydb`.`Usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Usuarios` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Apellidos` VARCHAR(45) NULL,
  `Correo_elecronico` VARCHAR(45) NULL,
  `Genero` INT NULL,
  `Fecha_de_nacimiento` DATE NULL,
  `usuario` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  `contacto` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Publicaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Publicaciones` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Publicaciones` (
  `id` INT NOT NULL,
  `fecha_de_publicacion` VARCHAR(45) NULL,
  `Titulo` MEDIUMTEXT NULL,
  `Contenido` VARCHAR(45) NULL,
  `id_Usuarios` VARCHAR(45) NULL,
  `Categoria` VARCHAR(45) NULL,
  `Usuarios_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Usuarios_id`),
  INDEX `fk_Publicaciones_Usuarios_idx` (`Usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_Publicaciones_Usuarios`
    FOREIGN KEY (`Usuarios_id`)
    REFERENCES `mydb`.`Usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Categoria` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Categoria` (
  `idCategoria` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `Id_principal` INT NOT NULL,
  `Publicaciones_id` INT NOT NULL,
  `Publicaciones_Usuarios_id` INT NOT NULL,
  PRIMARY KEY (`idCategoria`),
  INDEX `fk_Categoria_Publicaciones1_idx` (`Publicaciones_id` ASC, `Publicaciones_Usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_Categoria_Publicaciones1`
    FOREIGN KEY (`Publicaciones_id` , `Publicaciones_Usuarios_id`)
    REFERENCES `mydb`.`Publicaciones` (`id` , `Usuarios_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comentarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Comentarios` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Comentarios` (
  `idcomentario` INT NOT NULL,
  `Comentario` TEXT(500) NULL,
  `id_Usuario` INT NULL,
  `Fecha` DATE NULL,
  `Usuarios_id` INT NOT NULL,
  `Publicaciones_id` INT NOT NULL,
  `Publicaciones_Usuarios_id` INT NOT NULL,
  PRIMARY KEY (`idcomentario`),
  INDEX `fk_Comentarios_Usuarios1_idx` (`Usuarios_id` ASC) VISIBLE,
  INDEX `fk_Comentarios_Publicaciones1_idx` (`Publicaciones_id` ASC, `Publicaciones_Usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comentarios_Usuarios1`
    FOREIGN KEY (`Usuarios_id`)
    REFERENCES `mydb`.`Usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentarios_Publicaciones1`
    FOREIGN KEY (`Publicaciones_id` , `Publicaciones_Usuarios_id`)
    REFERENCES `mydb`.`Publicaciones` (`id` , `Usuarios_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;