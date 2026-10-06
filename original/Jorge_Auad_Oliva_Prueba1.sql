USE Control_Pacientes
GO

/*JOIN - LEFT JOIN*/
/*Query 1*/

SELECT a.RUN, a.Nombre, a.Apellido, b.Nombre as 'COMUNA'
FROM Paciente  a 
INNER JOIN Comuna b
    ON a.ID_Comuna = b.ID 
ORDER BY COMUNA ASC, a.Nombre ASC
GO

/*Query 2*/

SELECT  a.RUN, a.Nombre, a.Apellido, b.Nombre as 'COMUNA', a.Telefono
FROM Odontologo  a 
LEFT JOIN Comuna b
    ON a.ID_Comuna = b.ID 
WHERE isnull(b.Nombre,'') <> 'Santiago'
ORDER BY  a.Nombre ASC
GO

/*Query 3*/

SELECT B.Nombre, B.Apellido, COUNT(1) AS CANTIDAD_ATENCIONES
FROM Cita A 
INNER JOIN Paciente B 
   ON A.ID_Paciente = B.ID 
GROUP BY  B.Nombre, B.Apellido
ORDER BY CANTIDAD_ATENCIONES DESC
GO

/*Query 4*/

SELECT B.Nombre, B.Apellido, COUNT(1) AS CANTIDAD_ATENCIONES
FROM Cita A 
INNER JOIN Odontologo B 
   ON A.ID_Odontologo = B.ID 
GROUP BY  B.Nombre, B.Apellido
HAVING COUNT(1) >= 10
GO

/*Query 5*/

SELECT B.Nombre AS 'NOMBRE PACIENTE', 
       B.Apellido AS 'APELLIDO PACIENTE', 
       A.Fecha_Hora AS 'FECHA CITA', 
       C.Nombre AS 'NOMBRE ODONTOLOGO', 
       B.Apellido AS 'APELLIDO ODONTOLOGO'
FROM Cita A 
INNER JOIN Paciente B 
     ON A.ID_Paciente = B.ID 
INNER JOIN Odontologo C 
     ON A.ID_Odontologo = C.ID 
WHERE CONVERT(VARCHAR(10),A.Fecha_Hora, 121) = '2016-01-28'
GO

-- Forma 1 Profe (no corre)
SELECT  P.Nombre AS [Nombre Paciente],
        P.Apellido AS [Apellido Paciente],
		C.Fecha_Hora,
		O.Nombre AS [Nombre Odontólogo],
		O.Apellido AS [Apellido Odontólogo]
FROM Cita AS C
JOIN Paciente AS P ON C.ID_Paciente = P.ID
JOIN Odontologo AS O ON C.ID_Odontologo = O.ID
WHERE C.Fecha_Hora BETWEEN '2016-01-28 10:00:00.000' AND '2016-01-28 17:00:00.000'
GO

-- Forma 2 Profe (si corre)
SELECT  P.Nombre AS [Nombre Paciente],
        P.Apellido AS [Apellido Paciente],
		C.Fecha_Hora,
		O.Nombre AS [Nombre Odontólogo],
		O.Apellido AS [Apellido Odontólogo]
FROM Cita AS C
JOIN Paciente AS P ON C.ID_Paciente = P.ID
JOIN Odontologo AS O ON C.ID_Odontologo = O.ID
WHERE DATEPART(DAY, C.Fecha_Hora) = 28
       AND DATEPART(MONTH, C.Fecha_Hora) = 01
	   AND DATEPART(YEAR, C.Fecha_Hora) = 2016
GO


/*SUBCONSULTAS*/
/*Query 6*/

SELECT A.Nombre, 
       A.Apellido, 
       CANTIDAD_ATENCIONES = ISNULL((SELECT COUNT(1) 
	   FROM Cita CI 
	   WHERE A.ID = CI.ID_Paciente ) ,0)
FROM Paciente A
ORDER BY CANTIDAD_ATENCIONES DESC
GO

/*Query 7*/

SELECT A.Nombre, A.Apellido, 
       COMUNA = ISNULL((SELECT Nombre FROM Comuna CO WHERE CO.ID = A.ID_Comuna ),''),
       ESPECIALIDAD = ISNULL((SELECT Nombre 
	   FROM Especialidad ES 
	   WHERE ES.ID = A.ID_Especialidad),'')
FROM Odontologo A  
GO

-- Otra forma
SELECT O.Nombre,
       O.Apellido,
	   (SELECT C.Nombre
        FROM Comuna AS C
		WHERE O.ID_Comuna = C.ID) AS Nombre_Comuna,
	   (SELECT E.Nombre
	    FROM Especialidad AS E
		WHERE O.ID_Especialidad = E.ID) AS Nombre_Especialidad
FROM Odontologo AS O
ORDER BY Nombre_Especialidad
GO

/*VISTAS*/
/*Query 8*/

DROP VIEW IF EXISTS  View_Cita_Completa
GO

CREATE VIEW View_Cita_Completa 
AS
SELECT A.ID, A.Fecha_Hora AS 'FECHA CITA', 
             C.Nombre AS 'NOMBRE ODONTOLOGO', 
             B.Apellido AS 'APELLIDO ODONTOLOGO',
             D.Nombre AS 'ESPECIALIDAD',
             B.Nombre AS 'NOMBRE PACIENTE', 
             B.Apellido AS 'APELLIDO PACIENTE'
FROM Cita A 
INNER JOIN Paciente B ON A.ID_Paciente = B.ID 
INNER JOIN Odontologo C ON A.ID_Odontologo = C.ID 
INNER JOIN Especialidad D ON C.ID_Especialidad = D.ID
GO
 
SELECT * FROM View_Cita_Completa
GO

-- Otra forma (la profe)
CREATE VIEW View_Cita_Completa
AS
SELECT  c.ID AS [ID_Cita],
        c.Fecha_Hora As [Fecha Cita],
		o.Nombre AS [Nombre Dr.],
		o.Apellido AS [Apellido Dr.],
		e.Nombre AS [Especialidad Dr.],
		p.nombre AS [Nombre Paciente],
		p.Apellido AS [Apellido Paciente]
FROM Odontologo AS o
LEFT JOIN Cita AS c
   ON c.ID_Odontologo = o.ID
JOIN Especialidad AS e
   ON o.ID_Especialidad = e.ID
JOIN Paciente AS p
   ON p.ID = c.ID_Paciente
GO

SELECT * FROM View_Cita_Completa
GO
