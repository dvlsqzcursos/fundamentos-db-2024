SELECT * FROM aeropuerto;
SELECT Nombre FROM lineaaerea WHERE LugarOperaciones = 'España';
SELECT ID_Aeropuerto FROM aeropuerto WHERE Pais = 'Mexico';
SELECT Modelo FROM modeloavion WHERE Capacidad >= 500;
SELECT Modelo FROM modeloavion WHERE Capacidad < 250;
SELECT * 
FROM EscalaTecnica 
WHERE ID_ProgramaVuelo IN 
    (SELECT ID_ProgramaVuelo 
     FROM ProgramaVuelo 
     WHERE ID_AeropuertoOrigen = 
            (SELECT ID_Aeropuerto 
             FROM Aeropuerto 
             WHERE Ciudad = 'Guatemala'));

     
     SELECT * FROM Tripulacion WHERE NombrePiloto LIKE '%ar%';

