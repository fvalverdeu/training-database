USE Ventas
GO

--INSERT INTO Marca (IDMARCA, CODIGO, NOMBRE)
--VALUES (1, 'M001', 'Gloria')

--INSERT INTO MARCA (IDMARCA, CODIGO, NOMBRE)
--VALUES (2, 'M002', 'San Fernando')

--INSERT INTO MARCA (IDMARCA, CODIGO, NOMBRE)
--VALUES (3, 'M003', 'Laive')

INSERT INTO Producto (IdProducto, Codigo, Descripcion, IdMarca)
VALUES (1, 'P001','Leche en tarro',1)

INSERT INTO Producto (IdProducto, Codigo, Descripcion, IdMarca)
VALUES (2, 'P002','Mermelada de fresa',1)

INSERT INTO Producto (IdProducto, Codigo, Descripcion, IdMarca)
VALUES (3, 'P003','Hot dog',2)

INSERT INTO Producto (IdProducto, Codigo, Descripcion, IdMarca)
VALUES (4, 'P004','Pavita en trozos',2)

INSERT INTO Producto (IdProducto, Codigo, Descripcion, IdMarca)
VALUES (5, 'P005','Leche en tetrapack',3)



SELECT * FROM Marca
SELECT * FROM Producto

SELECT * FROM Producto 
WHERE IdMarca = 3

UPDATE Producto SET Descripcion = 'Hotdog de ternera'
WHERE Codigo = 'P003'

SELECT * FROM Producto
WHERE Codigo = 'P003'

DELETE PRODUCTO
WHERE IdProducto = 4

SELECT * FROM Producto

DELETE Producto

TRUNCATE TABLE PRODUCTO

SELECT * FROM Producto



--DELETE Marca
--WHERE IdMarca = 3

--SELECT * FROM Producto 
--WHERE IdMarca = 3