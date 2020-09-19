SELECT * FROM Empleado

SELECT * FROM DEPARTAMENTO

SELECT * FROM EMPLEADO E INNER JOIN DEPARTAMENTO D ON E.DepartamentoId = D.Id

SELECT * FROM Empleado E LEFT JOIN Departamento D ON E.DepartamentoId = D.Id

SELECT * FROM Empleado E RIGHT JOIN Departamento D ON E.DepartamentoId = D.Id

SELECT * FROM Empleado E LEFT JOIN Departamento D ON E.DepartamentoId = D.Id
WHERE E.DepartamentoId IS NULL
