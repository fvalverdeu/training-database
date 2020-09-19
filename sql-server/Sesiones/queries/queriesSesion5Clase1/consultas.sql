USE Ventas
GO

SELECT * FROM PRODUCTO
SELECT * FROM CLIENTE

-- Seleccionar los productos cuyo precio es mayor al promedio
-- 1. Obtenemos el promedio
SELECT AVG(PrecioUnitario) AS 'Promedio' FROM PRODUCTO

-- 2. Aplicamos la Sub-Consulta
SELECT * FROM PRODUCTO 
WHERE PrecioUnitario > (SELECT AVG(PrecioUnitario) AS 'Promedio' FROM PRODUCTO)

-- Seleccionar todos los clientes que tengan menos de la edad promedio
-- 1. Obtenemos la edad promedio
SELECT * FROM CLIENTE
SELECT *, DATEDIFF(YEAR,FechaNacimiento,GETDATE()) AS Edad FROM CLIENTE

SELECT AVG(DATEDIFF(YEAR,FechaNacimiento,GETDATE())) FROM CLIENTE

-- 2. Aplicamos la Sub-consulta
SELECT * FROM CLIENTE
WHERE 
DATEDIFF(YEAR,FechaNacimiento,GETDATE())
< (SELECT AVG(DATEDIFF(YEAR,FechaNacimiento,GETDATE())) FROM CLIENTE)

select idcliente,dni,nombre,apellido , datediff(year,fechanacimiento,getdate()) as edad
from cliente
where datediff(year,fechanacimiento,getdate()) < ( select avg(datediff(year,fechanacimiento,getdate())) as edad from cliente )
-- Seleccionar todos los productos cuyo precio sea mayor a todos los precios de los 
-- productos cuya unidad es Botella 1L


-- Seleccionar todos las boletas cuyos productos tienen un precio mayor a 7