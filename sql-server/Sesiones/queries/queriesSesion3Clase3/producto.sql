USE Ventas
GO

DROP TABLE Producto

-- Crear tabla producto
CREATE TABLE Producto
(
Nombre VARCHAR(30) NOT NULL,
Descripcion VARCHAR(50) NULL,
Marca VARCHAR(30)
)

ALTER TABLE PRODUCTO
ADD Codigo CHAR(4) NOT NULL

ALTER TABLE PRODUCTO
ADD IdProducto INT 

ALTER TABLE PRODUCTO
ALTER COLUMN IdProducto INT NOT NULL

SELECT * FROM Producto

DROP TABLE Producto

CREATE TABLE Producto
(
IdProducto INT NOT NULL,
Codigo CHAR(4) NOT NULL,
Nombre VARCHAR(30) NOT NULL,
Descripcion VARCHAR(50) NULL,
Marca VARCHAR(30)
)

-- Insertar valores especificando todas las columnas
INSERT INTO Producto (IdProducto, Codigo, Nombre, Descripcion, Marca)
VALUES (1, 'P001', 'Leche', 'Leche evaporada en tarro', 'Gloria')

-- Insertar valores sin especificar columnas (debe ingresar todos los campos)
INSERT INTO Producto
VALUES (2, 'P002', 'Mermelada', 'Sabor a fresa', 'Gloria')

-- Si el valor de un campo no es requerido, NO DEBEMOS poner espacios en blanco, comillas vacías o ceros.
--NO HACER lo siguiente:
INSERT INTO Producto (IdProducto, Codigo, Nombre, Descripcion, Marca)
VALUES (3, 'P003', 'Mantequilla', '', 'Dorina')

-- En su lugar, debemos usar el valor NULL
-- Insertar valores especificando algunas columnas
INSERT INTO Producto (IdProducto, Codigo, Nombre, Marca)
VALUES (4, 'P004', 'Queso', 'Laive')

INSERT INTO Producto (IdProducto, Codigo, Nombre)
VALUES (5, 'P005', 'Miel')

-- También podemos agregar un valor por defecto. 
-- Agregamos el CONSTRAINT DEFAULT
ALTER TABLE PRODUCTO
ADD DEFAULT 'Cualquier marca'
FOR MARCA

-- Verificamos que haga la inserción y muestre el valor por defecto.
INSERT INTO Producto (IdProducto, Codigo, Nombre)
VALUES (6, 'P006', 'Jamón')

-- El siguiente caso es un error pues tendría 2 productos con el mismo código (P003)
-- Se debe evitar duplicar códigos o identificadores.
INSERT INTO Producto (IdProducto, Codigo, Nombre)
VALUES (7, 'P003', 'Hotdog')

-- Agregamos el CONSTRAINT UNIQUE
-- Fail por el campo de Id = 7, ya que tiene código duplicado.
ALTER TABLE Producto
ADD CONSTRAINT UC_Producto UNIQUE (Codigo); 

-- Hacemos el update de este registro
SELECT * FROM Producto 
WHERE IdProducto = 7

UPDATE Producto SET Codigo = 'P007'
WHERE IdProducto = 7

SELECT * FROM Producto 
WHERE IdProducto = 7

-- Agregamos el CONSTRAINT UNIQUE
ALTER TABLE Producto
ADD CONSTRAINT UC_Producto UNIQUE (Codigo); 
-- Obs: Puede especificarse más campos asociados a este constraint UC_Producto.
-- Irían separados por comas.

-- Fail por el constraint UNIQUE
INSERT INTO Producto (IdProducto, Codigo, Nombre)
VALUES (8, 'P003', 'Pavita')

-- Inserción satisfactoria
INSERT INTO Producto (IdProducto, Codigo, Nombre)
VALUES (8, 'P008', 'Pavita')

-- Agregamos un campo Precio
ALTER TABLE PRODUCTO 
ADD Precio DECIMAL(3,2)

-- El siguiente caso es un error pues no debería existir un precio negativo 
INSERT INTO Producto (IdProducto, Codigo, Nombre, Precio)
VALUES (9, 'P009', 'Ternera',-3)

-- Fail debido a que ya existe un precio que no cumple el constraint
ALTER TABLE PRODUCTO
ADD CONSTRAINT CHK_PRECIO
CHECK(PRECIO > 0)

-- Actualizamos el campo precio de este registro a un valor adecuado
UPDATE Producto SET PRECIO = 2 WHERE IdProducto = 9

-- O podemos eliminar el registro con precio negativo
SELECT * FROM Producto WHERE PRECIO <0
DELETE Producto WHERE PRECIO < 0
SELECT * FROM Producto WHERE PRECIO <0
DELETE Producto WHERE IdProducto = 9

-- Ahora sí permite agregar el constraintALTER TABLE producto 
ALTER TABLE producto 
ADD CONSTRAINT CHK_PRECIO
CHECK(PRECIO > 0)

-- Fail pues no cumple el formato del campo PRECIO.
-- PRECIO es de tipo DECIMAL con 3 DÍGITOS, 2 de ellos decimales.
INSERT INTO Producto (IdProducto, Codigo, Nombre, Precio) 
VALUES (9, 'P009', 'Ternera',10) -- Falla porque 10.00 no cumple el formato.

-- Fail, tampoco cumple 
INSERT INTO Producto (IdProducto, Codigo, Nombre, Precio)
VALUES (9, 'P009', 'Ternera',10.3) -- Falla porque 10.30 no cumple el formato.

-- Permite ingresar el valor.
INSERT INTO Producto (IdProducto, Codigo, Nombre, Precio)
VALUES (9, 'P009', 'Ternera',5) -- No falla porque 9.00 sí cumple el formato.

-- Para no tener esos errores podríamos modificar la validación del precio.
-- No podemos modificar el CONSTRAINT creado. Lo borramos y agregamos nuevamente
ALTER TABLE PRODUCTO
DROP CONSTRAINT CHK_PRECIO

ALTER TABLE PRODUCTO
ADD CONSTRAINT CHK_PRECIO
CHECK(PRECIO > 0 AND PRECIO <= 8.00)

-- Fail pues no cumple 
INSERT INTO Producto (IdProducto, Codigo, Nombre, Precio)
VALUES (10, 'P010', 'Ternera',8.80)

-- Permite hacer la inserción.
INSERT INTO Producto (IdProducto, Codigo, Nombre, Precio)
VALUES (10, 'P010', 'Ternera',8.00)

-- Podemos agregar un constraint distinto. 
-- Este validará si la marca se encuentra en la lista.
ALTER TABLE PRODUCTO 
ADD CONSTRAINT CHK_PRODUCTO
CHECK (Marca IN ('Gloria', 'Dorina', 'Laive', 'Cualquier marca'))

-- Fail pues la marca 'Danesa' no está en la lista.
INSERT INTO Producto (IdProducto, Codigo, Nombre, Marca)
VALUES (11, 'P011', 'Ternera', 'Danesa')

-- Ahora ingresemos una marca permitida pero con un IdProducto existente
INSERT INTO Producto (IdProducto, Codigo, Nombre)
VALUES (10, 'P011', 'Ternera')

-- El resultado es erróneo, pues no debería tener productos con el mismo id
-- El objetivo del id es que sea único. 
-- UNIQUE podría ayudar, pero hay un constraint específico para estos casos (enteros)
-- Agregamos el constraint IDENTITY
ALTER TABLE Producto
ADD ProductoId INT IDENTITY(1,1)

ALTER TABLE PRODUCTO
DROP COLUMN IdProducto

-- Cambiar de nombre a una columna existente. 
-- No se recomienda (tendrá que cambiar las referencias a este campo manualmente)
EXEC sp_rename 'dbo.Producto.ProductoId', 'IdProducto', 'COLUMN';

-- Una opción más sencilla hubiese sido:
/*
ALTER TABLE PRODUCTO
DROP COLUMN IdProducto

ALTER TABLE Producto
ADD IdProducto INT IDENTITY(1,1)
*/

-- Verificamos que no acepte la inserción de id duplicados
-- Fail porque ahora ya no se debe indicar el campo IdProducto, por ser IDENTITY auto incremental
INSERT INTO Producto (IdProducto, Codigo, Nombre)
VALUES (11, 'P012', 'Pan de molde')

-- Incrementa el id en 1 y realiza la inserción.
INSERT INTO Producto (Codigo, Nombre)
VALUES ('P012', 'Pan de molde')



SELECT * FROM Producto




--CREATE TABLE MARCA
--(
--IdMarca INT,
--Descripcion VARCHAR(40)
--)

EXEC sys.sp_addextendedproperty   
@name = N'EP_Description',   
@value = N'El precio de un producto debe ser mayor a cero y menor o igual a 8.',   
@level0type = N'SCHEMA', @level0name = 'dbo',  
@level1type = N'TABLE',  @level1name = 'Producto',
@level2type = N'Column', @level2name = 'Precio';  
GO  

SELECT * FROM sys.extended_properties
WHERE major_id = OBJECT_ID('Producto')
--AND minor_id = COLUMNPROPERTY(major_id, 'Precio', 5)

SELECT objname, cast(value as varchar) as value 
FROM fn_listextendedproperty ('EP_Description','schema', 'dbo', 'table', 'Producto', 'column', null);

SELECT * FROM Producto


