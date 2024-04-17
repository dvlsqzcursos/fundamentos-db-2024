-- lista de todos los usuarios 
SELECT * FROM Bd_punto_de_ventas.empleados;

-- lista de todos los productos 

SELECT * FROM Bd_punto_de_ventas.productos;

-- lista de todos los clientes 
SELECT * FROM Bd_punto_de_ventas.clientes;

-- d.	Mostrar la cantidad de productos registrados en el sistema donde su saldo sea mayor a 0.
SELECT COUNT(*) AS cantidad_productos 
FROM Bd_punto_de_ventas.productos 
WHERE stock > 0;

-- e.	Listar los productos donde su saldo sea menor a 5.

SELECT * 
FROM Bd_punto_de_ventas.productos 
WHERE stock < 5;
-- Mostrar el producto con el stock más alto.


-- Mostrar el producto con el stock mas bajo. 
SELECT * 
FROM Bd_punto_de_ventas.productos 
ORDER BY stock ASC 
LIMIT 1;

-- Mostrar al cliente con más compras.

SELECT c.nombre, COUNT(*) AS total_compras
FROM Bd_punto_de_ventas.clientes c
JOIN Bd_punto_de_ventas.egresos_productos ep ON c.id_clientes = ep.id_clientes
GROUP BY c.nombre
ORDER BY total_compras DESC
LIMIT 1;

-- 	Mostrar al proveedor que más se le ha adquirido productos.
SELECT p.institucion, COUNT(*) AS total_compras
FROM Bd_punto_de_ventas.proveedores p
JOIN Bd_punto_de_ventas.control_ingresos_productos cip ON p.id_proveedores = cip.proveedores_id_proveedores
GROUP BY p.institucion
ORDER BY total_compras DESC
LIMIT 1;

-- 	El valor total en quetzales de todos los productos que tienen stock disponible en bodega 
SELECT SUM(stock * precio_compra) AS valor_total
FROM Bd_punto_de_ventas.productos
WHERE stock > 0;
