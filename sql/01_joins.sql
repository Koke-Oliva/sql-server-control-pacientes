/*
    Proyecto: Control de Pacientes con SQL Server
    Archivo: 01_joins.sql

    Versión revisada para portafolio de las Queries 1 a 5.
    La entrega académica original se conserva en original/.
*/

USE Control_Pacientes;
GO

/* Query 1
   Pacientes: RUN, nombre, apellido y comuna.
   Ordenar por comuna y luego por nombre del paciente.
*/
SELECT
    p.RUN,
    p.Nombre,
    p.Apellido,
    co.Nombre AS Comuna
FROM dbo.Paciente AS p
INNER JOIN dbo.Comuna AS co
    ON co.ID = p.ID_Comuna
ORDER BY
    co.Nombre ASC,
    p.Nombre ASC;
GO

/* Query 2
   Odontólogos que no sean de Santiago, incluyendo quienes no tienen comuna.
*/
SELECT
    o.RUN,
    o.Nombre,
    o.Apellido,
    co.Nombre AS Comuna,
    o.Telefono
FROM dbo.Odontologo AS o
LEFT JOIN dbo.Comuna AS co
    ON co.ID = o.ID_Comuna
WHERE co.Nombre <> 'Santiago'
   OR co.Nombre IS NULL
ORDER BY o.Nombre ASC;
GO

/* Query 3
   Cantidad de atenciones por paciente.
   LEFT JOIN garantiza que el patrón también cubra pacientes con cero citas.
*/
SELECT
    p.ID,
    p.Nombre,
    p.Apellido,
    COUNT(c.ID) AS Cantidad_Atenciones
FROM dbo.Paciente AS p
LEFT JOIN dbo.Cita AS c
    ON c.ID_Paciente = p.ID
GROUP BY
    p.ID,
    p.Nombre,
    p.Apellido
ORDER BY Cantidad_Atenciones DESC;
GO

/* Query 4
   Odontólogos con 10 o más atenciones.
*/
SELECT
    o.ID,
    o.Nombre,
    o.Apellido,
    COUNT(c.ID) AS Cantidad_Atenciones
FROM dbo.Odontologo AS o
INNER JOIN dbo.Cita AS c
    ON c.ID_Odontologo = o.ID
GROUP BY
    o.ID,
    o.Nombre,
    o.Apellido
HAVING COUNT(c.ID) >= 10
ORDER BY Cantidad_Atenciones DESC, o.Nombre ASC;
GO

/* Query 5
   Citas agendadas el 28-01-2016.
   Se usa un intervalo semiabierto para conservar la hora y evitar
   convertir la columna Fecha_Hora en el predicado.
*/
SELECT
    p.Nombre AS Nombre_Paciente,
    p.Apellido AS Apellido_Paciente,
    c.Fecha_Hora AS Fecha_Cita,
    o.Nombre AS Nombre_Odontologo,
    o.Apellido AS Apellido_Odontologo
FROM dbo.Cita AS c
INNER JOIN dbo.Paciente AS p
    ON p.ID = c.ID_Paciente
INNER JOIN dbo.Odontologo AS o
    ON o.ID = c.ID_Odontologo
WHERE c.Fecha_Hora >= '20160128'
  AND c.Fecha_Hora <  '20160129'
ORDER BY c.Fecha_Hora ASC;
GO
