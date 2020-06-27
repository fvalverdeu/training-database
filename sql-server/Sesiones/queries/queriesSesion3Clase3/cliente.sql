USE Ventas
GO

/*
RELACIONES ENTRE TABLAS
1. Relación 1 a 1.
2. Relación 1 a muchos.
3. Relación muchos a muchos.
*/

------------------------------------------------------------------------------
-- 1. RELACIÓN 1 A 1: 
-- "1 cliente tiene un solo negocio y 1 negocio sólo pertenece a un cliente"
-- Tener en cuenta que, para este ejemplo, estamos asumiendo lo siguiente:
-- Un cliente sólo puede ser dueño de un negocio.
-------------------------------------------------------------------------------
CREATE TABLE CLIENTE(
idCliente INT IDENTITY(1,1),
nombre VARCHAR(30)
)

INSERT INTO CLIENTE values ('José')
INSERT INTO CLIENTE values ('Fernando')
INSERT INTO CLIENTE values ('Juana')

SELECT * FROM CLIENTE

-- Para representar la relación 1 a 1, la tabla negocio se crea con un campo
-- idCliente como campo identificador (el nombre no necesariamente debe ser igual)
CREATE TABLE NEGOCIO
(
idCliente INT IDENTITY(1,1),
nombre VARCHAR(50) NOT NULL
)

INSERT INTO NEGOCIO VALUES ('La tiendita')
INSERT INTO NEGOCIO VALUES ('Mi market')
INSERT INTO NEGOCIO VALUES ('El casero')

SELECT * FROM NEGOCIO
SELECT * FROM CLIENTE

----------------------------------------------------------------------------------------
-- 2. RELACIÓN DE 1 A MUCHOS: 
-- "1 cliente recibe muchas boletas y una boleta es recibida por un solo cliente"
-----------------------------------------------------------------------------------------
CREATE TABLE BOLETA(
idBoleta INT IDENTITY(1,1),
numero VARCHAR(30),
)

INSERT INTO BOLETA VALUES ('001002020001',1)
INSERT INTO BOLETA VALUES ('001002020002',2)
INSERT INTO BOLETA VALUES ('001002020003',3)
INSERT INTO BOLETA VALUES ('001002020004',1)
INSERT INTO BOLETA VALUES ('001002020005',2)
INSERT INTO BOLETA VALUES ('001002020006',1)

SELECT * FROM CLIENTE
SELECT * FROM BOLETA

-- Para representar la relación de uno a muchos en la tabla Boleta (muchos) se agrega
-- un campo con el indicador de la tabla Cliente (uno).
ALTER TABLE BOLETA ADD idCliente INT 

-- Boleta tiene el campo idCliente con valores NULL
SELECT * FROM BOLETA

-- Actualizamos los valores del campo idCliente:
SELECT * FROM BOLETA --WHERE idBoleta IN (2, 4, 6)

UPDATE BOLETA SET IDCLIENTE = 1 WHERE idBoleta IN (2, 4, 6)
UPDATE BOLETA SET IDCLIENTE = 2 WHERE idBoleta IN (1, 5)
UPDATE BOLETA SET IDCLIENTE = 3 WHERE idBoleta = 3

SELECT * FROM BOLETA --WHERE idBoleta IN (2, 4, 6)

-- Las tablas Cliente y Boleta ya están relacionadas (1 a muchos)

-- Ejemplo: Seleccionar las boletas del cliente 1
SELECT * FROM BOLETA B
INNER JOIN CLIENTE C ON B.IDCLIENTE = C.idCliente
WHERE C.idCliente = 1

-------------------------------------------------------------------------------------------------
-- 3. RELACIÓN DE MUCHOS A MUCHOS
--Creamos la tabla producto
--(Una boleta registra muchos productos y un producto puede estar registrado en muchas boletas.)
--------------------------------------------------------------------------------------------------
CREATE TABLE PRODUCTO
(
idProducto INT IDENTITY(1,1),
codigo CHAR(4) NOT NULL UNIQUE,
nombre VARCHAR(50) NOT NULL,
precio DECIMAL(5,2) 
)

INSERT INTO Producto VALUES('P001', 'Leche',3)
INSERT INTO Producto VALUES('P002', 'Mantequilla',2.5)
INSERT INTO Producto VALUES('P003', 'Jamón',3)

-- Para representar la relación muchos a muchos debemos crear una nueva tabla "Detalle"
-- En esta tabla detalle llamada BOLETA_PRODUCTO, debemos insertar los identificadores de
-- las tablas Boleta y Producto. (No establecer el constraint IDENTITY)
CREATE TABLE BOLETA_PRODUCTO
(
idBoleta INT NOT NULL,
idProducto INT NOT NULL,
cantidad INT,
fecha DATE DEFAULT GETDATE()
)

INSERT INTO BOLETA_PRODUCTO VALUES (1,1,3,'06-06-2020')
INSERT INTO BOLETA_PRODUCTO VALUES (1,2,2,'06-06-2020')
INSERT INTO BOLETA_PRODUCTO VALUES (1,3,1,'06-06-2020')

INSERT INTO BOLETA_PRODUCTO VALUES (2,3,10,'06-06-2020')

INSERT INTO BOLETA_PRODUCTO VALUES (3,1,5,'06-06-2020')
INSERT INTO BOLETA_PRODUCTO VALUES (3,2,4,'06-06-2020')

INSERT INTO BOLETA_PRODUCTO VALUES (4,3,5,'06-06-2020')
INSERT INTO BOLETA_PRODUCTO VALUES (5,2,4,'06-06-2020')
INSERT INTO BOLETA_PRODUCTO VALUES (6,1,6,'06-06-2020')

-- Verificamos que Producto y Boleta ya están relacionadas 
-- de la forma Muchos a Muchos
SELECT * FROM BOLETA_PRODUCTO
SELECT * FROM BOLETA
SELECT * FROM PRODUCTO

/*
 PROTECCIÓN DE LA INTEGRIDAD REFERENCIAL
 Si bien nuestras tablas están relacionadas de forma lógica, 
 estas relaciones no están protegidas de alguna eliminación o update que
 deje registros sin referencias (huérfanos)
*/

-- Veamos el siguiente ejemplo:
-- Eliminamos un cliente de la tabla cliente:
DELETE CLIENTE WHERE idCliente = 1

-- Si verificamos las tablas Cliente y Boleta ahora veremos que en Boleta 
-- hay registros que hacen referencia al registro que hemos borrado de la 
-- tabla Cliente ("registros huérfanos"). 

SELECT * FROM CLIENTE
SELECT * FROM BOLETA

/*
 Esto es un error pues estamos rompiendo la relación entre las tablas.
 Estas relaciones deben permanecer íntegras y los Sistemas Gestores de Bases
 de Datos están hechos para proteger dicha integridad relacional.
 Para esto se usan los constraints PRIMARY KEY y FOREIGN KEY.
 */

DROP TABLE Cliente
CREATE TABLE CLIENTE(
idCliente INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(30)
)

DROP TABLE BOLETA
CREATE TABLE BOLETA(
idBoleta INT IDENTITY(1,1),
numero VARCHAR(30),
idCliente INT FOREIGN KEY REFERENCES CLIENTE
)

-- La siguiente sentencia no será ejecutada
DELETE CLIENTE WHERE idCliente = 1