CREATE DATABASE Ventas
ON
(
NAME = Ventas,
FILENAME = 'D:\Data\Ventas.mdf',
SIZE = 40,
MAXSIZE = 100,
FILEGROWTH = 1
),
(
NAME = Ventas_Sec,
FILENAME = 'D:\Data\Ventas_Sec.ndf',
SIZE = 20,
MAXSIZE = 80,
FILEGROWTH = 2
)
LOG ON
(
NAME = Ventas_log,
FILENAME = 'D:\Data\Ventas_log.ldf',
SIZE = 10,
MAXSIZE = 70,
FILEGROWTH = 5
)
GO

USE Ventas
GO

ALTER DATABASE Ventas
MODIFY Name = bd_ventas


USE master
GO

DROP DATABASE bd_ventas








