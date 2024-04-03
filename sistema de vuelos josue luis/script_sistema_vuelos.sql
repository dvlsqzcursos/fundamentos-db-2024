-- Crear la base de datos 'mydb'
CREATE DATABASE IF NOT EXISTS mydb;
USE mydb;

-- Crear la tabla Aeropuerto
CREATE TABLE IF NOT EXISTS Aeropuerto (
    ID_Aeropuerto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Ciudad VARCHAR(100),
    Pais VARCHAR(100)
);

-- Insertar datos en Aeropuerto
INSERT INTO Aeropuerto (Nombre, Ciudad, Pais)
VALUES 
('Aeropuerto Internacional Benito Juárez', 'Ciudad de México', 'México'),
('Aeropuerto Internacional de Cancún', 'Cancún', 'México'),
('Aeropuerto Internacional Adolfo Suárez Madrid-Barajas', 'Madrid', 'España'),
('Aeropuerto Internacional El Dorado', 'Bogotá', 'Colombia'),
('Aeropuerto Internacional John F. Kennedy', 'Nueva York', 'Estados Unidos');

-- Crear la tabla LineaAerea
CREATE TABLE IF NOT EXISTS LineaAerea (
    ID_LineaAerea INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Contacto VARCHAR(100),
    LugarOperaciones VARCHAR(100),
    AnioInicioLabores INT,
    Estado ENUM('funcionando', 'suspendida', 'cancelada'),
    CalificacionServicio DECIMAL(3, 1)
);

-- Insertar datos en LineaAerea
INSERT INTO LineaAerea (Nombre, Contacto, LugarOperaciones, AnioInicioLabores, Estado, CalificacionServicio)
VALUES 
('Iberia', 'contacto@iberia.com', 'España', 1927, 'funcionando', 4.2),
('Aeroméxico', 'contacto@aeromexico.com', 'México', 1934, 'funcionando', 4.5),
('American Airlines', 'contacto@aa.com', 'Estados Unidos', 1930, 'funcionando', 4.1),
('Air France', 'contacto@airfrance.com', 'Francia', 1933, 'funcionando', 4.3),
('Avianca', 'contacto@avianca.com', 'Colombia', 1919, 'funcionando', 4.4);

-- Crear la tabla ModeloAvion
CREATE TABLE IF NOT EXISTS ModeloAvion (
    ID_Modelo INT AUTO_INCREMENT PRIMARY KEY,
    Modelo VARCHAR(50),
    Capacidad INT
);

-- Insertar datos en ModeloAvion
INSERT INTO ModeloAvion (Modelo, Capacidad)
VALUES 
('Boeing 737', 189),
('Airbus A320', 180),
('Boeing 787', 330),
('Airbus A350', 325),
('Boeing 777', 396);

-- Crear la tabla ProgramaVuelo
CREATE TABLE IF NOT EXISTS ProgramaVuelo (
    ID_ProgramaVuelo INT AUTO_INCREMENT PRIMARY KEY,
    NumeroVuelo VARCHAR(20),
    DiasSemana VARCHAR(50),
    ID_LineaAerea INT,
    ID_AeropuertoOrigen INT,
    ID_AeropuertoDestino INT,
    FOREIGN KEY (ID_LineaAerea) REFERENCES LineaAerea(ID_LineaAerea),
    FOREIGN KEY (ID_AeropuertoOrigen) REFERENCES Aeropuerto(ID_Aeropuerto),
    FOREIGN KEY (ID_AeropuertoDestino) REFERENCES Aeropuerto(ID_Aeropuerto)
);

-- Insertar datos en ProgramaVuelo
INSERT INTO ProgramaVuelo (NumeroVuelo, DiasSemana, ID_LineaAerea, ID_AeropuertoOrigen, ID_AeropuertoDestino)
VALUES 
('IB1001', 'Lunes, Miércoles, Viernes', 1, 1, 3),
('AM2001', 'Martes, Jueves, Sábado', 2, 1, 2),
('AA3001', 'Lunes, Miércoles, Viernes', 3, 1, 5),
('AF4001', 'Martes, Jueves, Sábado', 4, 2, 3),
('AV5001', 'Lunes, Miércoles, Viernes', 5, 3, 4);

-- Crear la tabla Vuelo
CREATE TABLE IF NOT EXISTS Vuelo (
    ID_Vuelo INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    PlazasVacias INT,
    ID_ProgramaVuelo INT,
    FOREIGN KEY (ID_ProgramaVuelo) REFERENCES ProgramaVuelo(ID_ProgramaVuelo)
);

-- Insertar datos en Vuelo
INSERT INTO Vuelo (Fecha, PlazasVacias, ID_ProgramaVuelo)
VALUES 
('2024-04-01', 50, 1),
('2024-04-02', 30, 2),
('2024-04-03', 20, 3),
('2024-04-04', 40, 4),
('2024-04-05', 10, 5);

-- Crear la tabla Tripulacion
CREATE TABLE IF NOT EXISTS Tripulacion (
    ID_Tripulacion INT AUTO_INCREMENT PRIMARY KEY,
    NombrePiloto VARCHAR(100),
    NombreCopiloto VARCHAR(100),
    NombreAzafata1 VARCHAR(100),
    NombreAzafata2 VARCHAR(100),
    ID_ProgramaVuelo INT,
    FOREIGN KEY (ID_ProgramaVuelo) REFERENCES ProgramaVuelo(ID_ProgramaVuelo)
);

-- Insertar datos en Tripulacion
INSERT INTO Tripulacion (NombrePiloto, NombreCopiloto, NombreAzafata1, NombreAzafata2, ID_ProgramaVuelo)
VALUES 
('Juan Pérez', 'Luis Gómez', 'María Rodríguez', 'Laura García', 1),
('Carlos Martínez', 'Ana López', 'Sofía Díaz', 'Elena Vargas', 2),
('Javier Fernández', 'Pedro Sánchez', 'Marta Ruiz', 'Carmen Jiménez', 3),
('Diego Herrera', 'Andrea Ramírez', 'Lucía Torres', 'Patricia Soto', 4),
('Raul Gutiérrez', 'Daniel Muñoz', 'Silvia Moreno', 'Beatriz Castillo', 5);

-- Crear la tabla EscalaTecnica
CREATE TABLE IF NOT EXISTS EscalaTecnica (
    ID_EscalaTecnica INT AUTO_INCREMENT PRIMARY KEY,
    NumeroOrden INT,
    ID_ProgramaVuelo INT,
    FOREIGN KEY (ID_ProgramaVuelo) REFERENCES ProgramaVuelo(ID_ProgramaVuelo)
);

-- Insertar datos en EscalaTecnica
INSERT INTO EscalaTecnica (NumeroOrden, ID_ProgramaVuelo)
VALUES 
(1, 1),
(2, 1),
(1, 2),
(1, 4),
(1, 5);
