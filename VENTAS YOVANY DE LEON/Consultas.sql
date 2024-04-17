SELECT * FROM mydb.empleados;
ALTER TABLE mydb.empleados MODIFY COLUMN DPI BIGINT;

INSERT INTO mydb.empleados (idEmpleados, Contraseña, Nombres, Apellidos, DPI, Fecha_nacimiento, anio_iniciolabores, Estado_usuario) VALUES
(1, 'contraseña', 'Juan', 'Pérez', 1234567890101, '1990-05-15', '2015-01-01', 'Activo'),
(2, '123456', 'María', 'López', 9876543210101, '1985-09-20', '2018-01-01', 'Inactivo'),
(3, 'abc123', 'Pedro', 'Gómez', 4567891230101, '1992-03-10', '2020-01-01', 'de baja')

