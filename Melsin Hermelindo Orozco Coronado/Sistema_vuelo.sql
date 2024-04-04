CREATE DATABASE Sistemas_vuelo;
USE Sistemas_vuelo;

-- Crear la tabla Aeropuerto

CREATE TABLE Aeropuerto (
    AeropuertoID VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(100),
    Ciudad VARCHAR(100),
    Pais VARCHAR(100)
);

-- Crear la tabla Aerolínea
CREATE TABLE aerolinea (
    AerolineaID VARCHAR(100) PRIMARY KEY,
    Contacto VARCHAR(100),
    LugarDeOperaciones VARCHAR(100),
    AnioInicioLabores INT,
    Estado VARCHAR(50),
    CalificacionServicio DECIMAL(3, 2)
);

-- Crear la tabla ModeloAvion
CREATE TABLE ModeloAvion (
    ModeloAvionID INT PRIMARY KEY,
    Capacidad INT
);

-- Crear la tabla ProgramaVuelo
CREATE TABLE ProgramaVuelo (
    ProgramaVueloID VARCHAR(20) PRIMARY KEY,
    DiasSemana VARCHAR(50),
    AeropuertoSalidaID VARCHAR(10),
    AeropuertoLlegadaID VARCHAR(10),
    NombreTripulacion VARCHAR(100),
    FOREIGN KEY (AeropuertoSalidaID) REFERENCES Aeropuerto(AeropuertoID),
    FOREIGN KEY (AeropuertoLlegadaID) REFERENCES Aeropuerto(AeropuertoID)
);

-- Crear la tabla Vuelo
CREATE TABLE Vuelo (
    VueloID VARCHAR(20),
    Fecha DATE,
    PlazasVacias INT,
    ModeloAvionUtilizadoID INT,
    PRIMARY KEY (VueloID, Fecha),
    FOREIGN KEY (VueloID) REFERENCES ProgramaVuelo(ProgramaVueloID),
    FOREIGN KEY (ModeloAvionUtilizadoID) REFERENCES ModeloAvion(ModeloAvionID)
);

-- Crear la tabla EscalaTecnica
CREATE TABLE EscalaTecnica (
    EscalaTecnicaID INT PRIMARY KEY,
    AeropuertoEscalaID VARCHAR(10),
    VueloID VARCHAR(20),
    FOREIGN KEY (AeropuertoEscalaID) REFERENCES Aeropuerto(AeropuertoID),
    FOREIGN KEY (VueloID) REFERENCES ProgramaVuelo(ProgramaVueloID)
);



INSERT INTO Aeropuerto (AeropuertoID, Nombre, Ciudad, Pais) 
VALUES 
('LAX', 'Los Angeles International Airport', 'Los Angeles', 'Estados Unidos'),
('JFK', 'John F. Kennedy International Airport', 'Nueva York', 'Estados Unidos'),
('LHR', 'Heathrow Airport', 'Londres', 'Reino Unido'),
('CDG', 'Charles de Gaulle Airport', 'París', 'Francia'),
('DXB', 'Dubai International Airport', 'Dubai', 'Emiratos Árabes Unidos');

-- Insertar datos en la tabla Aerolinea
INSERT INTO Aerolinea (AerolineaID, Contacto, LugarDeOperaciones, AnioInicioLabores, Estado, CalificacionServicio)
VALUES 
('AA', 'contacto@americanairlines.com', 'Estados Unidos', 1930, 'Funcionando', 4.5),
('BA', 'contacto@britishairways.com', 'Reino Unido', 1974, 'Funcionando', 4.2),
('EK', 'contacto@emirates.com', 'Emiratos Árabes Unidos', 1985, 'Funcionando', 4.8),
('AF', 'contacto@airfrance.com', 'Francia', 1933, 'Funcionando', 4.0),
('DL', 'contacto@delta.com', 'Estados Unidos', 1924, 'Funcionando', 4.3);

-- Insertar datos en la tabla ModeloAvion
INSERT INTO ModeloAvion (ModeloAvionID, Capacidad)
VALUES 
(1, 150),
(2, 300),
(3, 250),
(4, 400),
(5, 200);

-- Insertar datos en la tabla ProgramaVuelo
INSERT INTO ProgramaVuelo (ProgramaVueloID, DiasSemana, AeropuertoSalidaID, AeropuertoLlegadaID, NombreTripulacion)
VALUES 
('AA001', 'Lunes, Miércoles, Viernes', 'LAX', 'JFK', 'Equipo A'),
('BA002', 'Martes, Jueves, Sábado', 'LHR', 'CDG', 'Equipo B'),
('EK003', 'Lunes, Jueves, Domingo', 'DXB', 'LHR', 'Equipo C'),
('AF004', 'Martes, Viernes, Domingo', 'CDG', 'LAX', 'Equipo D'),
('DL005', 'Miércoles, Sábado', 'JFK', 'DXB', 'Equipo E');

-- Insertar datos en la tabla Vuelo
INSERT INTO Vuelo (VueloID, Fecha, PlazasVacias, ModeloAvionUtilizadoID)
VALUES 
('AA001', '2024-04-01', 100, 1),
('AA001', '2024-04-03', 120, 1),
('AA001', '2024-04-05', 130, 1),
('BA002', '2024-04-02', 80, 2),
('BA002', '2024-04-04', 90, 2);

-- Insertar datos en la tabla EscalaTecnica
INSERT INTO EscalaTecnica (EscalaTecnicaID, AeropuertoEscalaID, VueloID)
VALUES 
(1, 'JFK', 'AA001'),
(2, 'CDG', 'BA002'),
(3, 'LAX', 'EK003'),ventas_has_clientes
(4, 'LHR', 'AF004'),
(5, 'DXB', 'DL005');

INSERT INTO ESCALA (N_ESCALA, SUBEN, BAJAN, VUELO_idVUELO, VUELO_PROGRAMA_VUELO_NUMERO_VUELO, VUELO_PROGRAMA_VUELO_AEROPUERTO_CODIGO, VUELO_AVION_ID_AVION)
VALUES 
(1, 'Pasajero 1', 'Pasajero 2', 1, 1, 1, 1),
(2, 'Pasajero 3', 'Pasajero 4', 2, 2, 3, 2),
(3, 'Pasajero 5', 'Pasajero 6', 3, 3, 5, 3),
(4, 'Pasajero 7', 'Pasajero 8', 4, 4, 4, 4),
(5, 'Pasajero 9', 'Pasajero 10', 5, 5, 2, 5);

-- Insertar datos en la tabla VUELO
INSERT INTO VUELO (FECHA, PLAZAS_VACIAS, MODELO_AVION, PROGRAMA_VUELO_NUMERO_VUELO, PROGRAMA_VUELO_AEROPUERTO_CODIGO, AVION_ID_AVION)
VALUES 
('2024-04-01', 100, 'Boeing 737', 1, 1, 1),
('2024-04-02', 120, 'Boeing 737', 1, 1, 1),
('2024-04-03', 130, 'Boeing 737', 1, 1, 1),
('2024-04-04', 80, 'Airbus A380', 2, 3, 2),
('2024-04-05', 90, 'Airbus A380', 2, 3, 2);

-- Insertar datos en la tabla TRIPULACION
INSERT INTO TRIPULACION (NOMBRE_PILOTO, NOMBRE_CO_PILOTO, NOMBRE_AZAFATA1, NOMBRE_AZAFATA2, PROGRAMA_VUELO_NUMERO_VUELO)
VALUES 
('Piloto 1', 'Co-piloto 1', 'Azafata 1', 'Azafata 2', 1),
('Piloto 2', 'Co-piloto 2', 'Azafata 3', 'Azafata 4', 2),
('Piloto 3', 'Co-piloto 3', 'Azafata 5', 'Azafata 6', 3),
('Piloto 4', 'Co-piloto 4', 'Azafata 7', 'Azafata 8', 4),
('Piloto 5', 'Co-piloto 5', 'Azafata 9', 'Azafata 10', 5);


-- Consultas
SELECT * FROM ProgramaVuelo;
SELECT Nombre FROM aerolinea WHERE LugarDeOperaciones = 'España';
SELECT AeropuertoID FROM Aeropuerto WHERE Pais = 'México';
SELECT ModeloAvionID FROM ModeloAvion WHERE Capacidad >= 500;
SELECT ModeloAvionID FROM ModeloAvion WHERE Capacidad < 250;
SELECT * FROM EscalaTecnica WHERE AeropuertoEscalaID = 'Guatemala';
UPDATE Avion
SET Capacidad = CASE
    WHEN Capacidad < 250 THEN 500
    WHEN Capacidad >= 500 THEN 1000
END
WHERE id_AVION IN (
    SELECT AVION_ID_AVION FROM VUELO 
    WHERE PROGRAMA_VUELO_NUMERO_VUELO = 'Iberia'
);
SELECT * FROM TRIPULACION WHERE NOMBRE_PILOTO LIKE '%ar%';