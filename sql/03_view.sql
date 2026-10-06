/*
    Proyecto: Control de Pacientes con SQL Server
    Archivo: 03_view.sql

    Versión revisada para portafolio de la Query 8.
*/

USE Control_Pacientes;
GO

DROP VIEW IF EXISTS dbo.View_Cita_Completa;
GO

CREATE VIEW dbo.View_Cita_Completa
AS
SELECT
    c.ID AS ID_Cita,
    c.Fecha_Hora AS Fecha_Cita,
    o.Nombre AS Nombre_Odontologo,
    o.Apellido AS Apellido_Odontologo,
    e.Nombre AS Especialidad_Odontologo,
    p.Nombre AS Nombre_Paciente,
    p.Apellido AS Apellido_Paciente
FROM dbo.Cita AS c
INNER JOIN dbo.Odontologo AS o
    ON o.ID = c.ID_Odontologo
INNER JOIN dbo.Especialidad AS e
    ON e.ID = o.ID_Especialidad
INNER JOIN dbo.Paciente AS p
    ON p.ID = c.ID_Paciente;
GO

SELECT *
FROM dbo.View_Cita_Completa
ORDER BY Fecha_Cita ASC, ID_Cita ASC;
GO
