USE Ventas
GO

/*
CONSULTAS 3RA PARTE:
FROM, WHERE, GROUP BY, SELECT, and ORDER BY

CONSULTAS CON FUNCIONES DE MANEJO DE FECHAS
GETDATE()
DAY(FECHA)
MONTH(FECHA)
YEAR(FECHA)
DATEDIFF(PARTE, FECHAINICIO, FECHAFIN)
DATEPARTE(PARTE)
SYSDATETIME(): para devolver la fecha y hora del servidor
SYSDATETIMEOffset(): va a devolver la fecha y hora del servidor, junto con el desplazamiento UTC
GETUTCDATE(): va a devolver la fecha y la hora GMT (hora media de Greenwich)
GETDATE(): va a devolver la fecha y hora del servidor
*/

-- Mostrar la fecha actual
SELECT GETDATE()

-- Mostrar el día actual como un entero
SELECT DAY('2020-06-21') AS 'Día con DAY()'
SELECT DAY(GETDATE()) AS 'Día con GETDATE()'

-- Mostrar el mes actual como un entero
SELECT MONTH(GETDATE())  AS 'Mes con GETDATE()'

-- Mostrar el año actual como un entero
SELECT YEAR(GETDATE())  AS 'Año con GETDATE()'

-- Listar la edad de los clientes
SELECT * FROM CLIENTE
SELECT DATEDIFF(YEAR,FechaNacimiento,GETDATE()) AS EDAD FROM CLIENTE

-- Listar los clientes y en una columna aparte su edad
SELECT *, DATEDIFF(YEAR,FechaNacimiento,GETDATE()) AS Edad FROM CLIENTE




