-- MySQL Script generated by MySQL Workbench
-- Wed Apr 17 13:16:09 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sistemaBlog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sistemaBlog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sistemaBlog` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci ;
USE `sistemaBlog` ;

-- -----------------------------------------------------
-- Table `sistemaBlog`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaBlog`.`Usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `correo_electronico` VARCHAR(45) NULL,
  `genero` INT NULL,
  `fecha_nac` DATE NULL,
  `usuario` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `contacto` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `correo_electronico_UNIQUE` (`correo_electronico` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemaBlog`.`Publicaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaBlog`.`Publicaciones` (
  `id_publicaciones` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `descripcion` MEDIUMTEXT NULL,
  `contenido` MEDIUMTEXT NULL,
  `titulo` VARCHAR(45) NULL,
  `Usuarios_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_publicaciones`, `Usuarios_id_usuario`),
  INDEX `fk_Publicaciones_Usuarios_idx` (`Usuarios_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Publicaciones_Usuarios`
    FOREIGN KEY (`Usuarios_id_usuario`)
    REFERENCES `sistemaBlog`.`Usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemaBlog`.`Categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaBlog`.`Categorias` (
  `id_categorias` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `id_principal` INT NOT NULL,
  `tipo` INT NULL,
  `Publicaciones_id_publicaciones` INT NOT NULL,
  `Publicaciones_Usuarios_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_categorias`, `Publicaciones_id_publicaciones`, `Publicaciones_Usuarios_id_usuario`),
  INDEX `fk_Categorias_Publicaciones1_idx` (`Publicaciones_id_publicaciones` ASC, `Publicaciones_Usuarios_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Categorias_Publicaciones1`
    FOREIGN KEY (`Publicaciones_id_publicaciones` , `Publicaciones_Usuarios_id_usuario`)
    REFERENCES `sistemaBlog`.`Publicaciones` (`id_publicaciones` , `Usuarios_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemaBlog`.`Comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaBlog`.`Comentarios` (
  `id_comentarios` INT NOT NULL AUTO_INCREMENT,
  `comentario` TEXT(500) NULL,
  `fecha` DATE NULL,
  `Usuarios_id_usuario` INT NOT NULL,
  `Publicaciones_id_publicaciones` INT NOT NULL,
  `Publicaciones_Usuarios_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_comentarios`, `Usuarios_id_usuario`, `Publicaciones_id_publicaciones`, `Publicaciones_Usuarios_id_usuario`),
  INDEX `fk_Comentarios_Usuarios1_idx` (`Usuarios_id_usuario` ASC) VISIBLE,
  INDEX `fk_Comentarios_Publicaciones1_idx` (`Publicaciones_id_publicaciones` ASC, `Publicaciones_Usuarios_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Comentarios_Usuarios1`
    FOREIGN KEY (`Usuarios_id_usuario`)
    REFERENCES `sistemaBlog`.`Usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentarios_Publicaciones1`
    FOREIGN KEY (`Publicaciones_id_publicaciones` , `Publicaciones_Usuarios_id_usuario`)
    REFERENCES `sistemaBlog`.`Publicaciones` (`id_publicaciones` , `Usuarios_id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
USE sistemaBlog;

-- Ingresar 15 Usuarios
INSERT INTO Usuarios (nombre, apellidos, correo_electronico, genero, fecha_nac, usuario, password, contacto) 
VALUES
('Juan', 'Pérez', 'juan@gmail.com', '1', '1990-05-15', 'juanito', '15Juan@', '5565-1234'),
('María', 'González', 'maria@hotmail.com', '2', '1988-08-25', 'maria1', '123Maria#', '5555-5678'),
('Luis', 'Martínez', 'luis@gmail.com', '1', '1995-02-10', 'luisito', '34Luis1995', '5455-9876'),
('Ana', 'Rodríguez', 'ana@gmail.com', '2', '1992-11-20', 'anita', '748anita', '5535-4321'),
('Carlos', 'Hernández', 'carlos@gmail.com', '1', '1987-04-30', 'carlitos', '800Carlitos8', '5155-8765'),
('Sofía', 'López', 'sofia@yahoo.com', '2', '1998-10-05', 'sofi', 'Sofi98', '5155-6543'),
('Pedro', 'Díaz', 'pedro@hotmail.com', '1', '1993-07-12', 'pedrito', 'Pedrito8987', '5155-3456'),
('Laura', 'Sánchez', 'laura@gmail.com', '2', '1996-12-28', 'lau', 'Sanchez98Lau', '5255-7890'),
('Miguel', 'Pérez', 'miguel@yahoo.com', '1', '1991-03-17', 'mike', 'mike91Pe', '5535-2109'),
('Paula', 'Martínez', 'paula@yahoo.com', '2', '1989-06-22', 'pau', '10PauMa', '5554-1098'),
('Jorge', 'Gómez', 'jorge@gmail.com', '1', '1997-09-08', 'jorgito', '989Jorge_g', '5555-9876'),
('Elena', 'Hernández', 'elena@gmail.com', '2', '1994-01-03', 'elenita', 'Elena1994', '5455-5678'),
('Daniel', 'González', 'daniel@hotmail.com', '1', '1990-08-15', 'dani', 'GonzalezD98', '4555-8765'),
('Carolina', 'Díaz', 'carolina@hotmail.com', '2', '1985-11-20', 'caro', '989CarDiaz', '3555-2345'),
('Pablo', 'García', 'pablo@hotmail.com', '1', '1984-02-28', 'pablito', 'GarciaP123', '4555-6543');

-- Ingresar 30 Publicaciones
INSERT INTO Publicaciones (fecha, descripcion, contenido, titulo, Usuarios_id_usuario) 
VALUES
('2024-04-17', 'Descubre cómo mejorar tu productividad diaria con estos simples consejos.', 'Contenido de la publicación 1', '10 consejos para mejorar', 1),
('2024-04-18', 'Explora las mejores recetas saludables para mantener un estilo de vida equilibrado.', 'Contenido de la publicación 2', 'Cómo mantener una vida saludable', 2),
('2024-04-19', 'Planifica tus próximas vacaciones y descubre los destinos más emocionantes para visitar este año.', 'Contenido de la publicación 3', 'Descubre destinos para viajar en 2024', 3),
('2024-04-20', 'Aprende cómo mantener una alimentación balanceada y cuidar tu salud con estos simples consejos.', 'Contenido de la publicación 4', 'Consejos para alimentación balanceada', 4),
('2024-04-21', 'Descubre ideas creativas y económicas para decorar cada rincón de tu hogar.', 'Contenido de la publicación 5', 'Ideas creativas para tu hogar', 5),
('2024-04-22', 'Encuentra la motivación necesaria para superar cualquier obstáculo y alcanzar tus metas personales.', 'Contenido de la publicación 6', 'Cómo mantenerse motivado', 6),
('2024-04-23', 'Evita los errores más comunes al emprender un nuevo negocio y asegura tu éxito desde el principio.', 'Contenido de la publicación 7', 'Errores comunes al comenzar un negocio', 7),
('2024-04-24', 'Descubre los secretos para una vida más saludable y activa con estos simples hábitos.', 'Contenido de la publicación 8', 'Claves para una vida saludable', 8),
('2024-04-25', 'Explora las últimas tendencias en moda y estilo para lucir siempre a la última.', 'Contenido de la publicación 9', 'Tendencias de moda para este año', 9),
('2024-04-26', 'Aprende a organizar tu tiempo de forma eficiente y maximiza tu productividad en el trabajo y en casa.', 'Contenido de la publicación 10', 'Cómo organizar tu tiempo', 10),
('2024-04-27', 'Descubre los mejores consejos para cuidar y fortalecer tu salud mental en tu día a día.', 'Contenido de la publicación 11', 'Consejos para cuidar tu salud mental', 11),
('2024-04-28', 'Conoce las claves para una comunicación efectiva y mejora tus relaciones personales y profesionales.', 'Contenido de la publicación 12', 'Cómo mejorar tu comunicación', 12),
('2024-04-29', 'Aprende a cocinar platos deliciosos y sorprende a tus invitados con recetas únicas y originales.', 'Contenido de la publicación 13', 'Recetas gourmet para impresionar', 13),
('2024-04-30', 'Descubre los beneficios del ejercicio físico y encuentra la rutina de entrenamiento perfecta para ti.', 'Contenido de la publicación 14', 'Cómo empezar un plan de entrenamiento', 14),
('2024-05-01', 'Explora las claves para una crianza respetuosa y fomenta el desarrollo saludable de tus hijos.', 'Contenido de la publicación 15', 'Cómo ser un padre respetuoso', 15),
('2024-05-02', 'Descubre cómo mejorar tu productividad diaria con estos simples consejos.', 'Contenido de la publicación 16', '10 consejos para mejorar', 1),
('2024-05-03', 'Explora las mejores recetas saludables para mantener un estilo de vida equilibrado.', 'Contenido de la publicación 17', 'Cómo mantener una vida saludable', 2),
('2024-05-04', 'Planifica tus próximas vacaciones y descubre los destinos más emocionantes para visitar este año.', 'Contenido de la publicación 18', 'Descubre destinos para viajar en 2024', 3),
('2024-05-05', 'Aprende cómo mantener una alimentación balanceada y cuidar tu salud con estos simples consejos.', 'Contenido de la publicación 19', 'Consejos para una alimentación', 4),
('2024-05-06', 'Descubre ideas creativas y económicas para decorar cada rincón de tu hogar.', 'Contenido de la publicación 20', 'Ideas creativas para tu hogar', 5),
('2024-05-07', 'Encuentra la motivación necesaria para superar cualquier obstáculo y alcanzar tus metas personales.', 'Contenido de la publicación 21', 'Cómo mantenerse motivado en tiempos', 6),
('2024-05-08', 'Evita los errores más comunes al emprender un nuevo negocio y asegura tu éxito desde el principio.', 'Contenido de la publicación 22', 'Errores comunes en un nuevo negocio', 7),
('2024-05-09', 'Descubre los secretos para una vida más saludable y activa con estos simples hábitos.', 'Contenido de la publicación 23', 'Claves para una vida saludable', 8),
('2024-05-10', 'Explora las últimas tendencias en moda y estilo para lucir siempre a la última.', 'Contenido de la publicación 24', 'Tendencias de moda para este año', 9),
('2024-05-11', 'Aprende a organizar tu tiempo de forma eficiente y maximiza tu productividad en el trabajo y en casa.', 'Contenido de la publicación 25', 'Cómo organizar tu tiempo', 10),
('2024-05-12', 'Descubre los mejores consejos para cuidar y fortalecer tu salud mental en tu día a día.', 'Contenido de la publicación 26', 'Consejos para cuidar tu salud mental', 11),
('2024-05-13', 'Conoce las claves para una comunicación efectiva y mejora tus relaciones personales y profesionales.', 'Contenido de la publicación 27', 'Cómo mejorar tu comunicación interpersonal', 12),
('2024-05-14', 'Aprende a cocinar platos deliciosos y sorprende a tus invitados con recetas únicas y originales.', 'Contenido de la publicación 28', 'Recetas gourmet para impresionar', 13),
('2024-05-15', 'Descubre los beneficios del ejercicio físico y encuentra la rutina de entrenamiento perfecta para ti.', 'Contenido de la publicación 29', 'Cómo empezar un plan de entrenamiento', 14),
('2024-05-16', 'Explora las claves para una crianza respetuosa y fomenta el desarrollo saludable de tus hijos.', 'Contenido de la publicación 30', 'Cómo ser un padre respetuoso', 15);



-- Ingresar 15 Categorias
INSERT INTO Categorias (nombre, id_principal, tipo, Publicaciones_id_publicaciones, Publicaciones_Usuarios_id_usuario) 
VALUES
('Salud', 0, 0, 1, 1),
('Cocina', 0, 0, 2, 2),
('Viajes', 0, 0, 3, 3),
('Negocios', 0, 0, 4, 4),
('Decoración', 0, 0, 5, 5),
('Recetas', 2, 1, 6, 6),
('Europa', 3, 1, 3, 3),
('Finanzas', 0, 0, 7, 7),
('Moda', 0, 0, 9, 9),
('Productividad', 1, 1, 10, 10),
('América', 3, 1, 11, 11),
('Tecnología', 0, 0, 12, 12),
('Literatura', 0, 0, 13, 13),
('Salud Mental', 1, 1, 14, 14),
('Asia', 3, 1, 15, 15);

-- Ingresar (n > 5) cantidad de comentarios
INSERT INTO Comentarios (comentario, fecha, Usuarios_id_usuario, Publicaciones_id_publicaciones, Publicaciones_Usuarios_id_usuario)
VALUES
('Este artículo es genial, gracias por compartirlo.', '2024-04-17', 1, 1, 1),
('Interesante punto de vista. Estoy de acuerdo con lo que se dice aquí.', '2024-04-18', 2, 2, 2),
('Gracias por la información, ha sido muy útil para mí.', '2024-04-19', 3, 3, 3),
('Excelente contenido, definitivamente lo compartiré con mis amigos.', '2024-04-20', 4, 4, 4),
('Me ha encantado este artículo, muchas gracias por escribirlo.', '2024-04-21', 5, 5, 5);

-- CONSULTAS
-- Select a las publicaciones de 2 sub categorias
SELECT Publicaciones.*
FROM Publicaciones
JOIN Categorias ON Publicaciones.id_publicaciones = Categorias.Publicaciones_id_publicaciones
WHERE Categorias.tipo = 1 AND Categorias.id_principal = 2;

SELECT Publicaciones.*
FROM Publicaciones
JOIN Categorias ON Publicaciones.id_publicaciones = Categorias.Publicaciones_id_publicaciones
WHERE Categorias.tipo = 1 AND Categorias.id_principal = 0;
-- Select a todas las publicaciones del usuario con id: 8, 10 y 12
SELECT * FROM Publicaciones WHERE Usuarios_id_usuario IN (8, 10, 12);

-- Select con inner join entre publicaciones y usuarios
SELECT Publicaciones. *, Usuarios.nombre, Usuarios.apellidos FROM Publicaciones INNER JOIN Usuarios ON Publicaciones.Usuarios_id_usuario = Usuarios.id_usuario;

-- Select con left join entre publicaciones y usuarios
SELECT Publicaciones.*, Usuarios.nombre, Usuarios.apellidos FROM Publicaciones LEFT JOIN Usuarios ON Publicaciones.Usuarios_id_usuario = Usuarios.id_usuario;

-- Select con right join entre publicaciones y usuarios
SELECT Publicaciones.*, Usuarios.nombre, Usuarios.apellidos FROM Publicaciones RIGHT JOIN Usuarios ON Publicaciones.Usuarios_id_usuario = Usuarios.id_usuario;

-- Select con inner join entre publicaciones y comentarios
SELECT Publicaciones.*, Comentarios.comentario FROM Publicaciones INNER JOIN Comentarios ON Publicaciones.id_publicaciones = Comentarios.Publicaciones_id_publicaciones;

-- Select con left join entre publicaciones y comentarios
SELECT Publicaciones.*, Comentarios.comentario FROM Publicaciones LEFT JOIN Comentarios ON Publicaciones.id_publicaciones = Comentarios.Publicaciones_id_publicaciones;

-- Select con right join entre publicaciones y comentarios
SELECT Publicaciones.*, Comentarios.comentario FROM Publicaciones RIGHT JOIN Comentarios ON Publicaciones.id_publicaciones = Comentarios.Publicaciones_id_publicaciones;

-- Script de UPDATE a Publicaciones > 5 (Titulo o contenido/descripcion)
UPDATE Publicaciones SET titulo = 'Actualizando Titulo' WHERE id_publicaciones = 1;
UPDATE Publicaciones SET titulo = 'Actualizando Segundo Titulo' WHERE id_publicaciones = 2;
UPDATE Publicaciones SET contenido = 'Actualizando el contenido' WHERE id_publicaciones = 4;
UPDATE Publicaciones SET contenido = 'Actualizando un segundo contenido' WHERE id_publicaciones = 8;
UPDATE Publicaciones SET descripcion = 'Actualizando la descripcion' WHERE id_publicaciones = 14;


