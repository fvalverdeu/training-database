DECLARE @Nombre VARCHAR(50)

SET @Nombre = 'o'

--SELECT * FROM EMPLEADO
--WHERE NOMBRE = @Nombre

SELECT * FROM EMPLEADO
WHERE NOMBRE LIKE '%' + @Nombre + '%'

DECLARE @Operacion CHAR(1)

SET @Operacion = 'M'

IF(@Operacion = 'L')
	BEGIN
		SELECT * FROM EMPLEADO
	END
ELSE
	BEGIN
		SELECT * FROM EMPLEADO E INNER JOIN DEPARTAMENTO D ON E.DepartamentoId = D.Id
	END


DECLARE @CONT INT
SET @CONT = 1

WHILE(@CONT < 5)
BEGIN
	SELECT * FROM DEPARTAMENTO WHERE ID = 35
	SET @CONT = @CONT + 1
END

SELECT SUBSTRING('Hola a todos', 6, 10)

CREATE FUNCTION MiFuncion (@Nombre VARCHAR(50))
RETURNS INTEGER
AS
BEGIN
	DECLARE @RESULT INT
	SELECT @RESULT = COUNT(1) FROM EMPLEADO WHERE NOMBRE LIKE '%' + @Nombre + '%'
	RETURN @RESULT
END


CREATE FUNCTION GetDepartamento
(	
	@idDepartamento int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT emp.DepartamentoId
		  ,emp.Nombre
	FROM Empleado emp
	where emp.DepartamentoId=@idDepartamento
)
GO
  select * from GetDepartamento (34)
