CREATE TRIGGER TG_Empleado
ON Empleado
FOR INSERT
AS
PRINT 'Inserción en la Tabla'

SELECT @Nombre = ins.Nombre FROM INSERTED emp;
