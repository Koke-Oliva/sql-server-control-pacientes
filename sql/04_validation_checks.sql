/*
    Proyecto: Control de Pacientes con SQL Server
    Archivo: 04_validation_checks.sql

    EXTENSIÓN DE PORTAFOLIO
    -----------------------
    Este archivo no forma parte de la Prueba 1 original.
    Se agrega para verificar volumen, duplicados e integridad referencial.
*/

USE Control_Pacientes;
GO

SET NOCOUNT ON;
GO

-- 1. Volumen de las tablas.
SELECT 'Comuna' AS Tabla, COUNT(*) AS Filas, 37 AS Esperadas FROM dbo.Comuna
UNION ALL
SELECT 'Especialidad', COUNT(*), 7 FROM dbo.Especialidad
UNION ALL
SELECT 'Odontologo', COUNT(*), 16 FROM dbo.Odontologo
UNION ALL
SELECT 'Paciente', COUNT(*), 30 FROM dbo.Paciente
UNION ALL
SELECT 'Cita', COUNT(*), 81 FROM dbo.Cita;
GO

-- 2. RUN duplicados en odontólogos: se esperan cero filas.
SELECT o.RUN, COUNT(*) AS Repeticiones
FROM dbo.Odontologo AS o
GROUP BY o.RUN
HAVING COUNT(*) > 1;
GO

-- 3. RUN duplicados en pacientes: se esperan cero filas.
SELECT p.RUN, COUNT(*) AS Repeticiones
FROM dbo.Paciente AS p
GROUP BY p.RUN
HAVING COUNT(*) > 1;
GO

-- 4. Citas con referencias no resueltas: se esperan cero filas.
SELECT c.ID, c.ID_Odontologo, c.ID_Paciente
FROM dbo.Cita AS c
LEFT JOIN dbo.Odontologo AS o ON o.ID = c.ID_Odontologo
LEFT JOIN dbo.Paciente AS p ON p.ID = c.ID_Paciente
WHERE o.ID IS NULL OR p.ID IS NULL;
GO

-- 5. Odontólogos con FK no resolubles: se esperan cero filas.
SELECT o.ID, o.ID_Especialidad, o.ID_Comuna
FROM dbo.Odontologo AS o
LEFT JOIN dbo.Especialidad AS e ON e.ID = o.ID_Especialidad
LEFT JOIN dbo.Comuna AS co ON co.ID = o.ID_Comuna
WHERE (o.ID_Especialidad IS NOT NULL AND e.ID IS NULL)
   OR (o.ID_Comuna IS NOT NULL AND co.ID IS NULL);
GO

-- 6. Pacientes con comuna no resoluble: se esperan cero filas.
SELECT p.ID, p.ID_Comuna
FROM dbo.Paciente AS p
LEFT JOIN dbo.Comuna AS co ON co.ID = p.ID_Comuna
WHERE p.ID_Comuna IS NOT NULL
  AND co.ID IS NULL;
GO
