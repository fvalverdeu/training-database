USE master
GO

--SELECT * FROM sys.master_files
--WHERE name LIKE '%bd_ejemplo%'

SELECT * FROM sys.master_files
WHERE name LIKE 'Ventas%'

--Note que el campo size es la suma del tamaño del archivo principal y el de registro.
--Si no se especifica tamaño máximo, max-size es igual a -1
