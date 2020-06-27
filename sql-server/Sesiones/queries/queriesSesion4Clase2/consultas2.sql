USE Ventas
GO

/*
CONSULTAS 2DA PARTE:
FROM, WHERE, GROUP BY, SELECT, and ORDER BY
  1    2        3         4           5
SELECT dni, FechaNacimiento FROM CLIENTE
WHERE Nombre = 'Camila'

CONSULTAS ORDENANDO REGISTROS 
*/

-- Listar los clientes ordenando por nombre de forma ascendente
SELECT Nombre FROM CLIENTE

SELECT * FROM CLIENTE
ORDER BY Nombre ASC

-- OBS: Por defecto se ordenará de forma ascendente
SELECT * FROM CLIENTE
ORDER BY Nombre

-- Listar los clientes ordenando de forma descendente según el nombre
SELECT * FROM CLIENTE
ORDER BY Nombre DESC

-- Listar los clientes ordenando de forma descendente según el id
SELECT * FROM CLIENTE 
ORDER BY IdCliente DESC

-- Listar los clientes ordenando de forma descendente según la fecha de nacimiento
SELECT * FROM CLIENTE 
ORDER BY FechaNacimiento DESC

-- Listar los productos ordenando ascendentemente según la descripción
SELECT * FROM PRODUCTO 
ORDER BY Descripcion ASC

-- Listar los productos ordenando ascendentemente según la descripción y la marca
SELECT * FROM PRODUCTO 
ORDER BY Descripcion ASC, MARCA ASC

-- Listar los productos ordenando ascendentemente según la descripción y 
-- descendentemente según la marca
SELECT * FROM PRODUCTO 
ORDER BY Descripcion ASC, MARCA DESC

-- Listar los productos ordenando descendentemente según la descripción
SELECT * FROM PRODUCTO 
ORDER BY Descripcion DESC

-- Listar los productos ordenando descendentemente según la descripción y la marca
SELECT * FROM PRODUCTO 
ORDER BY Descripcion DESC, MARCA DESC

-- Listar los productos ordenando descendentemente según la descripción y ascendentemente según la marca
SELECT * FROM PRODUCTO 
ORDER BY Descripcion DESC, MARCA ASC

/*
CONSULTAS CON PREDICADO
*/

-- ALL selecciona todos los campos
SELECT ALL * FROM CLIENTE
SELECT * FROM CLIENTE

-- TOP devuelve un determinado número de registros
SELECT * FROM BOLETA
SELECT TOP 5 * FROM BOLETA
SELECT TOP(5) * FROM BOLETA
--SELECT TOP 100 * FROM BOLETA
-- Listar los primeros 5 productos ordenados ascendentemente de acuerdo a la descripción.
SELECT TOP 5 * FROM PRODUCTO

SELECT TOP 5 * FROM PRODUCTO
ORDER BY Descripcion ASC

-- Seleccionar el 25% de los registros de la tabla producto 
-- ordenada ascendentemente de acuerdo a la descripción.
SELECT TOP 25 PERCENT * FROM PRODUCTO
ORDER BY Descripcion ASC

-- Seleccionar el 50% de los registros de la tabla producto
-- ordenada descendentemente de acuerde a la marca
SELECT TOP 50 PERCENT * FROM PRODUCTO 
ORDER BY Marca DESC

-- DISTINCT devuelve los valores del campo listado omitiendo los 
-- registros cuyos valores del campo estén duplicados.
SELECT Unidad FROM PRODUCTO

-- Listar todas las unidades de la tabla producto. (Sin repetición)
SELECT DISTINCT Unidad FROM PRODUCTO

-- DISTINCTROW devuelve los registros diferentes sin importar los campos seleccionados






