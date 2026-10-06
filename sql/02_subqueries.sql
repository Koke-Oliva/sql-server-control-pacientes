/*
    Proyecto: Control de Pacientes con SQL Server
    Archivo: 02_subqueries.sql

    Versión revisada para portafolio de las Queries 6 y 7.
*/

USE Control_Pacientes;
GO

/* Query 6
   Cantidad de atenciones de cada paciente mediante subconsulta correlacionada.
*/
SELECT
    p.Nombre,
    p.Apellido,
    (
        SELECT COUNT(*)
        FROM dbo.Cita AS c
        WHERE c.ID_Paciente = p.ID
    ) AS Cantidad_Atenciones
FROM dbo.Paciente AS p
ORDER BY Cantidad_Atenciones DESC;
GO

/* Query 7
   Odontólogos con comuna y especialidad obtenidas mediante subconsultas.
*/
SELECT
    o.Nombre,
    o.Apellido,
    (
        SELECT co.Nombre
        FROM dbo.Comuna AS co
        WHERE co.ID = o.ID_Comuna
    ) AS Comuna,
    (
        SELECT e.Nombre
        FROM dbo.Especialidad AS e
        WHERE e.ID = o.ID_Especialidad
    ) AS Especialidad
FROM dbo.Odontologo AS o
ORDER BY Especialidad ASC, o.Nombre ASC;
GO
