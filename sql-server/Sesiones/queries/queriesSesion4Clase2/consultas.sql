USE Ventas
GO

-- Comando SELECT
SELECT 12 + 3
SELECT GETDATE()

-- Dar un alias al campo devuelto
SELECT GETDATE() AS 'La Fecha Actual'
SELECT GETDATE() AS Fecha
SELECT GETDATE() AS [La Fecha Actual]

-- Mostrar varios campos juntos
SELECT 12+3 AS Suma, GETDATE() AS Fecha

-- Consultas a una BD (Ventas)

-- * Significa obtener todos los campos
SELECT * FROM CLIENTE

-- Obtener algunos campos
SELECT Dni, Nombre FROM CLIENTE
SELECT Nombre, Dni FROM CLIENTE
SELECT Nombre, Nombre, Nombre FROM CLIENTE

-- Usar alias para los campos
SELECT Dni AS 'Documento de identidad', Nombre AS 'Primer nombre' FROM CLIENTE

-- Usar alias para las tablas
SELECT C.Apellido, C.Nombre FROM CLIENTE C

SELECT CLIENTE.IdCliente, Nombre, NumeroBoleta FROM CLIENTE 
INNER JOIN BOLETA ON CLIENTE.IdCliente = BOLETA.IdCliente

SELECT C.IdCliente, C.Nombre, B.NumeroBoleta FROM CLIENTE C
INNER JOIN BOLETA B ON C.IdCliente = B.IdCliente

-- Usar el filtro where

-- Listar los productos de la marca Gloria
SELECT * FROM PRODUCTO
WHERE Marca = 'Gloria'

-- Listar los productos cuya unidad sea Botella 1L
SELECT * FROM PRODUCTO
WHERE Unidad = 'BOTELLA 1L'

-- Listar los productos cuya unidad sea Botella 1L y
-- la marca sea Cocinero
SELECT * FROM PRODUCTO
WHERE Unidad = 'BOTELLA 1L' AND Marca = 'Cocinero'

-- Listar los productos cuya unidad sea Botella 1L o
-- la marca sea Costeño
SELECT * FROM PRODUCTO
WHERE Unidad = 'BOTELLA 1L' OR Marca = 'Costeño'

-- Listar las boletas generadas el mes de junio
SELECT * FROM BOLETA
WHERE FechaEmision >= '2020-06-01'

-- Listar las boletas generadas entre abril y mayo
SELECT * FROM BOLETA
WHERE FechaEmision BETWEEN '2020-04-01' AND '2020-05-31'

-- Modificamos la hora del 31 de mayo
SELECT * FROM BOLETA WHERE IdBoleta = 9

UPDATE BOLETA SET FechaEmision = '2020-05-31 09:30:00' WHERE IdBoleta = 9 --YYYY-mm-dd

SELECT * FROM BOLETA WHERE IdBoleta = 9

-- Listar las boletas generadas entre abril y mayo
SELECT * FROM BOLETA
WHERE FechaEmision BETWEEN '2020-04-01' AND '2020-05-31 23:59:59'


