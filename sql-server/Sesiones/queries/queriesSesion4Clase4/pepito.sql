/*
Comentando
--CREATE DATABASE BDEjemplo
--GO
*/

USE BDEjemplo
GO

CREATE TABLE Producto
(
nombre VARCHAR(50),
precio DECIMAL(6,2),
marca VARCHAR(50)
)

--DROP TABLE Producto

ALTER TABLE Producto 
ADD Fecha Date

SELECT * FROM Producto

INSERT INTO Producto (nombre, precio, marca, fecha) 
VALUES ('mantequilla','12','dorina','09-15-2020')

SELECT * FROM Producto

INSERT INTO Producto (nombre, marca) VALUES ('leche','gloria')

SELECT nombre, marca FROM Producto

SELECT * FROM Producto

UPDATE Producto SET precio = 3

UPDATE Producto SET precio = 12
WHERE nombre = 'mantequilla'

SELECT * FROM Producto

UPDATE Producto SET Fecha = '09-14-2020'
WHERE nombre = 'leche'

SELECT * FROM Producto

DELETE Producto WHERE marca = 'dorina'

SELECT * FROM Producto

ALTER TABLE PRODUCTO ADD codigo CHAR(3)

SELECT * FROM Producto

UPDATE Producto SET CODIGO = 'P02'
WHERE marca <> 'laive'




INSERT INTO Producto VALUES ('leche', '4', 'nestlé', GETDATE(), 'P03')

SELECT * FROM Producto

ALTER TABLE PRODUCTO ADD id INT

CREATE TABLE CLIENTE 
(
id INT PRIMARY KEY IDENTITY(1,1), --Primer parámetro: inicio, 2do Parámetro: incremento
dni CHAR(8) UNIQUE NOT NULL,
nombre VARCHAR(50) NOT NULL,
apellidoPat VARCHAR(50) NOT NULL,
fechaNac DATE,
celular CHAR(9) DEFAULT('Sin celular'),
estado BIT
)

--INSERT INTO CLIENTE VALUES ('44445555', 'Fernando', 'Valverde', '05-27-1984','999988888',1)
INSERT INTO CLIENTE VALUES ('44445556', 'Rosa', 'Taype', '05-20-1984','999988887',1)
INSERT INTO CLIENTE (dni, nombre, apellidoPat, celular) VALUES ('44445557', 'Juan', 'Romero', '98989899')
INSERT INTO CLIENTE VALUES ('44445558', 'Magaly', 'Quispe', '10-01-1990','999988885',1)
INSERT INTO CLIENTE VALUES ('44445559', 'Miguel', 'Toledo', '12-23-1980','999988884',1)
INSERT INTO CLIENTE VALUES ('44445560', 'José', 'Toledo', '12-23-1980','999988884',1)

SELECT * FROM CLIENTE



('1234455','DNI',....)
('RWQRQ-WQ','CE',...)

...
documento VARCHAR(20) UNIQUE NOT NULL,
tipoDocumento CHAR(3) NOT NULL,



