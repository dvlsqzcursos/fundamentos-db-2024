CREATE database Aereolineas;

USE Aereolineas;

CREATE TABLE Aerolinea (
    id INT PRIMARY KEY,
    nombre VARCHAR(255)
);

CREATE TABLE Aeropuerto (
    id INT PRIMARY KEY,
    nombre VARCHAR(255),
    ciudad VARCHAR(255),
    pais VARCHAR(255)
);

CREATE TABLE TipoAvion (
    id INT PRIMARY KEY,
    nombre VARCHAR(255),
    capacidad_pasajeros INT
);

CREATE TABLE Horario (
    id INT PRIMARY KEY,
    hora_inicio TIME,
    hora_fin TIME,
    dia_semana VARCHAR(10)
);

CREATE TABLE Vuelo (
    id INT PRIMARY KEY,
    id_aerolinea INT,
    id_origen INT,
    id_destino INT,
    id_horario INT,
    fecha DATE,
    FOREIGN KEY (id_aerolinea) REFERENCES Aerolinea(id),
    FOREIGN KEY (id_origen) REFERENCES Aeropuerto(id),
    FOREIGN KEY (id_destino) REFERENCES Aeropuerto(id),
    FOREIGN KEY (id_horario) REFERENCES Horario(id)
);

CREATE TABLE EscalaTecnica (
    id INT PRIMARY KEY,
    numero_orden INT,
    descripcion VARCHAR(255)
);

CREATE TABLE Aeropuerto_Vuelo (
    id_aeropuerto INT,
    id_vuelo INT,
    tipo_operacion ENUM('despegue', 'aterrizaje'),
    FOREIGN KEY (id_aeropuerto) REFERENCES Aeropuerto(id),
    FOREIGN KEY (id_vuelo) REFERENCES Vuelo(id),
    PRIMARY KEY (id_aeropuerto, id_vuelo)
);

CREATE TABLE Aerolinea_TipoAvion (
    id_aerolinea INT,
    id_tipo_avion INT,
    FOREIGN KEY (id_aerolinea) REFERENCES Aerolinea(id),
    FOREIGN KEY (id_tipo_avion) REFERENCES TipoAvion(id),
    PRIMARY KEY (id_aerolinea, id_tipo_avion)
);

CREATE TABLE Escala (
    id_vuelo INT,
    id_escala_tecnica INT,
    FOREIGN KEY (id_vuelo) REFERENCES Vuelo(id),
    FOREIGN KEY (id_escala_tecnica) REFERENCES EscalaTecnica(id),
    PRIMARY KEY (id_vuelo, id_escala_tecnica)
);

-- Ejemplo de datos de prueba:
INSERT INTO Aerolinea (id, nombre) VALUES
(1, 'Aeroméxico'),
(2, 'American Airlines');

INSERT INTO Aeropuerto (id, nombre, ciudad, pais) VALUES
(1, 'Aeropuerto Internacional Benito Juárez', 'Ciudad de México', 'México'),
(2, 'Aeropuerto Internacional de Los Ángeles', 'Los Ángeles', 'Estados Unidos');

INSERT INTO TipoAvion (id, nombre, capacidad_pasajeros) VALUES
(1, 'Boeing 737', 215),
(2, 'Airbus A320', 150);

INSERT INTO Horario (id, hora_inicio, hora_fin, dia_semana) VALUES
(1, '08:00:00', '12:00:00', 'Lunes'),
(2, '13:00:00', '17:00:00', 'Martes');

INSERT INTO Vuelo (id, id_aerolinea, id_origen, id_destino, id_horario, fecha) VALUES
(1, 1, 1, 2, 1, '2024-04-03'),
(2, 2, 2, 1, 2, '2024-04-04');

INSERT INTO EscalaTecnica (id, numero_orden, descripcion) VALUES
(1, 1, 'Repostaje de combustible'),
(2, 2, 'Revisión técnica');

INSERT INTO Aeropuerto_Vuelo (id_aeropuerto, id_vuelo, tipo_operacion) VALUES
(1, 1, 'despegue'),
(2, 1, 'aterrizaje'),
(2, 2, 'despegue'),
(1, 2, 'aterrizaje');

INSERT INTO Aerolinea_TipoAvion (id_aerolinea, id_tipo_avion) VALUES
(1, 1),
(2, 2);

INSERT INTO Escala (id_vuelo, id_escala_tecnica) VALUES
(1, 1),
(1, 2),
(2, 2);