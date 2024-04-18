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


-- Llenar la tabla de clientes con datos ficticios
INSERT INTO clientes (DPI, NIT, Contacto)
VALUES 
    (12345678903, 1234567, 'Juan Pérez'),
    (23456789034, 2345674, 'María García'),
    (34567892345, 3456795, 'Carlos López'),
    (45678923456, 4123456, 'Ana Martínez'),
    (56789014567, 5123457, 'José Rodríguez'),
    (67890125678, 6734568, 'Laura González'),
    (78901256789, 7856789, 'Luis Fernández'),
    (89012367890, 8767890, 'Rosa Díaz'),
    (90123478901, 9019211, 'Pedro Sánchez'),
    (12311231231, 1231231, 'Carmen Ruiz');


INSERT INTO proveedores (Nombre, Contacto, Ubicacion, Contacto_Representante)
VALUES
('Tech Solutions', 1234567890, '123 Main Street, Cityville, Country', 987654321),
('Food Distributors Inc.', 2345678901, '456 Oak Avenue, Townsville, Country', 876543219),
('Fashion World Ltd.', 3456789012, '789 Maple Drive, Villageton, Country', 765432198),
('Global Electronics', 4567890123, '1010 Pine Road, Metropolis, Country', 654321987),
('Quality Pharmaceuticals', 5678901234, '111 River Street, Hamletown, Country', 543219876),
('Green Energy Co.', 6789012345, '1313 Elm Street, Greensburg, Country', 432198765),
('Home Decorators LLC', 7890123456, '1414 Cedar Lane, Homestead, Country', 321987654),
('Golden Agriculture', 8901234567, '1515 Birch Boulevard, Farmland, Country', 219876543),
('Luxury Cars Ltd.', 9012345678, '1616 Oakwood Avenue, Eliteville, Country', 198765432),
('Health & Wellness Products', 1234567890, '1717 Maple Drive, Wellnesstown, Country', 987654321);




INSERT INTO productos (Nombre, Descrpcion, Codigo_sku, Categoria, Saldo, 
Precio_Compra, Precio_venta, idProveedores)
VALUES 
    ('Camiseta', 'Camiseta de algodón', 12345, 'Ropa', '100', 20, 35, 1),
    ('Pantalón', 'Pantalón de mezclilla', 54321, 'Ropa', '80', 30, 50, 1),
    ('Zapatos', 'Zapatos deportivos', 98765, 'Calzado', '50', 40, 70, 2),
    ('Mesa', 'Mesa de madera', 24680, 'Muebles', '30', 100, 150, 3),
    ('Silla', 'Silla de plástico', 13579, 'Muebles', '40', 50, 80, 3),
    ('Teléfono', 'Teléfono inteligente', 36912, 'Electrónica', '20', 200, 300, 4),
    ('Portátil', 'Computadora portátil', 24680, 'Electrónica', '15', 500, 800, 4),
    ('Mouse', 'Mouse inalámbrico', 12345, 'Electrónica', '30', 10, 20, 5),
    ('Teclado', 'Teclado USB', 54321, 'Electrónica', '25', 15, 25, 5),
    ('Libreta', 'Libreta de notas', 98765, 'Papelería', '50', 5, 10, 6);
    
   
INSERT INTO compras (Fecha, Monto_total, idProveedores)
VALUES 
    ('2024-04-01', 1000.00, 1),
    ('2024-04-02', 1500.50, 2),
    ('2024-04-03', 800.25, 3),
    ('2024-04-04', 2000.75, 1),
    ('2024-04-05', 1200.00, 2),
    ('2024-04-06', 900.80, 3),
    ('2024-04-07', 1750.25, 1),
    ('2024-04-08', 600.50, 2),
    ('2024-04-09', 1350.75, 3),
    ('2024-04-10', 950.20, 1);
    

INSERT INTO empleados (Contraseña, Nombres, Apellidos, DPI, Fecha_nacimiento, anio_iniciolabores, Estado_usuario)
VALUES 
    ('pass123', 'Juan', 'Pérez', '1234567890123', '1990-05-15', '2020-03-10', 'Activo'),
    ('pass456', 'María', 'González', '2345678901234', '1992-08-25', '2019-11-20', 'Activo'),
    ('pass789', 'Pedro', 'Martínez', '3456789012345', '1985-03-08', '2021-01-05', 'Suspendido'),
    ('passabc', 'Laura', 'López', '4567890123456', '1988-11-12', '2018-09-15', 'Activo'),
    ('passdef', 'Ana', 'Rodríguez', '5678901234567', '1995-07-18', '2017-12-30', 'Activo'),
    ('passghi', 'Carlos', 'Sánchez', '6789012345678', '1983-09-30', '2022-02-28', 'Activo'),
    ('passjkl', 'Sofía', 'Hernández', '7890123456789', '1991-12-03', '2023-04-05', 'Activo'),
    ('passmno', 'David', 'Fernández', '8901234567890', '1987-04-21', '2020-07-10', 'Suspendido'),
    ('passpqr', 'Elena', 'Díaz', '9012345678901', '1993-06-14', '2019-08-18', 'Activo'),
    ('passtu', 'Luis', 'Gómez', '1231231231231', '1996-10-27', '2021-10-15', 'Activo');


INSERT INTO ventas (Fecha, monto_total, idClientes)
VALUES 
    ('2024-04-01', 500.00, 1),
    ('2024-04-02', 750.25, 2),
    ('2024-04-03', 300.80, 3),
    ('2024-04-04', 900.50, 4),
    ('2024-04-05', 600.75, 5),
    ('2024-04-06', 450.30, 6),
    ('2024-04-07', 800.20, 7),
    ('2024-04-08', 350.00, 8),
    ('2024-04-09', 675.90, 9),
    ('2024-04-10', 520.60, 10);


SELECT * FROM empleados;
SELECT * FROM productos;
SELECT * FROM clientes;

SELECT COUNT(*) AS cantidad_productos FROM productos WHERE Saldo > 0;
SELECT * FROM productos WHERE Saldo < 5;

SELECT * FROM productos ORDER BY Saldo DESC LIMIT 1;
SELECT * FROM productos ORDER BY Saldo ASC LIMIT 1;

SELECT c.idCilentes, COUNT(v.idVentas) AS total_compras FROM clientes c
JOIN ventas v ON c.idCilentes = v.idClientes GROUP BY c.idCilentes
ORDER BY total_compras DESC LIMIT 1;


SELECT p.idProveedores, COUNT(cp.idProductos) AS total_productos_adquiridos
FROM proveedores p JOIN productos pr ON p.idProveedores = pr.idProveedores
JOIN clientes_has_productos cp ON pr.idProductos = cp.idProductos GROUP BY p.idProveedores
ORDER BY total_productos_adquiridos DESC LIMIT 1;

SELECT SUM(Precio_venta * Saldo) AS valor_total_quetzales FROM productos
WHERE Saldo > 0;
