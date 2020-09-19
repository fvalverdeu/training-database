USE Ventas
GO

SELECT * FROM CLIENTE

CREATE VIEW Cliente_Edad
AS
select idcliente,dni,nombre,apellido , datediff(year,fechanacimiento,getdate()) as edad
from cliente
where datediff(year,fechanacimiento,getdate()) < ( select avg(datediff(year,fechanacimiento,getdate())) as edad from cliente )

SELECT * FROM Cliente_Edad

