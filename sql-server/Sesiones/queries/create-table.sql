USE Ventas
GO

CREATE TABLE Cliente
(
IdCliente INT NOT NULL PRIMARY KEY,
Dni CHAR(8) NOT NULL,
Nombre VARCHAR(30) NOT NULL,
Apellido VARCHAR(30) NOT NULL
)

ALTER TABLE Cliente 
ADD Celular CHAR(9) NULL

ALTER TABLE Cliente 
DROP COLUMN Apellido

DROP TABLE Cliente