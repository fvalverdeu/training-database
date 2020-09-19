ALTER PROCEDURE USP_Especie_CRUD
(
@Operacion CHAR(1), 
@EspecieId INT = NULL, 
@Descripcion VARCHAR(50) = NULL
)
AS
BEGIN
	IF(@Operacion = 'C')
	BEGIN
		INSERT INTO Especie(Descripcion) VALUES (@Descripcion)
	END
	IF(@Operacion = 'R')
	BEGIN
		SELECT ESP.EspecieId, ESP.Descripcion
		FROM Especie ESP 
	END
	IF(@Operacion = 'U')
	BEGIN
		UPDATE Especie SET Descripcion = @Descripcion
		WHERE EspecieId = @EspecieId
	END
	IF(@Operacion = 'D')
	BEGIN
		DELETE Especie 
		WHERE EspecieId = @EspecieId
	END
	IF(@Operacion = 'F')
	BEGIN
		SELECT ESP.EspecieId, ESP.Descripcion
		FROM Especie ESP 
		WHERE EspecieId = @EspecieId
	END

END