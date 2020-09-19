ALTER PROCEDURE USP_Mascota_CRUD
(
@Operacion CHAR(1), 
@MascotaId INT = NULL, 
@Nombre VARCHAR(50) = NULL, 
@Edad INT = NULL, 
@EspecieId INT = NULL
)
AS
BEGIN
	IF(@Operacion = 'C')
	BEGIN
		INSERT INTO Mascota (Nombre,Edad,EspecieId,Estado) VALUES (@Nombre,@Edad,@EspecieId,1)
	END
	IF(@Operacion = 'R')
	BEGIN
		SELECT MAS.MascotaId, MAS.Nombre, MAS.Edad, MAS.EspecieId, ESP.EspecieId, ESP.Descripcion
		FROM Mascota MAS
		INNER JOIN Especie ESP ON MAS.EspecieId = ESP.EspecieId
		WHERE Estado = 1
	END
	IF(@Operacion = 'U')
	BEGIN
		UPDATE Mascota SET Nombre = @Nombre, Edad = @Edad, EspecieId = @EspecieId, Estado = 1
		WHERE MascotaId = @MascotaId
	END
	IF(@Operacion = 'D')
	BEGIN
		UPDATE Mascota SET Estado = 0
		WHERE MascotaId = @MascotaId
	END
	IF(@Operacion = 'F')
	BEGIN
		SELECT MAS.MascotaId, MAS.Nombre, MAS.Edad, MAS.EspecieId, ESP.EspecieId, ESP.Descripcion
		FROM Mascota MAS
		INNER JOIN Especie ESP ON MAS.EspecieId = ESP.EspecieId
		WHERE MascotaId = @MascotaId
	END

END