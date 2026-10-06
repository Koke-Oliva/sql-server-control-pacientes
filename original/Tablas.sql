-- Validación si existe, que la elimine
IF  EXISTS (
	SELECT name 
		FROM sys.databases 
		WHERE name = N'Control_Pacientes'
)
DROP DATABASE Control_Pacientes
GO

-- Crea la base de datos
CREATE DATABASE Control_Pacientes
GO

-- Usa la base de datos
USE Control_Pacientes
GO

CREATE TABLE Especialidad
   (ID int PRIMARY KEY NOT NULL,
	Nombre varchar(20) NULL)  
GO

CREATE TABLE Comuna
   (ID int PRIMARY KEY NOT NULL,
	Nombre varchar(20) NULL)  
GO

CREATE TABLE Odontologo 
   (ID int PRIMARY KEY NOT NULL,
    RUN varchar(13) NOT NULL,
    Nombre varchar(50) NOT NULL,
    Apellido varchar(80) NOT NULL,
	Fecha_Nac date NULL,
	ID_Especialidad int NULL,
	Direccion varchar(255) NULL, 
    ID_Comuna int NULL,
	email varchar(120) NULL,
	Telefono varchar(15) NULL,
	CONSTRAINT FK_Odontologo_Especialidad FOREIGN KEY (ID_Especialidad) REFERENCES Especialidad(ID),
	CONSTRAINT FK_Odontologo_Comuna FOREIGN KEY (ID_Comuna) REFERENCES Comuna(ID))  
GO

CREATE TABLE Paciente 
   (ID int PRIMARY KEY NOT NULL,
    RUN varchar(13) NOT NULL,
    Nombre varchar(50) NOT NULL,
    Apellido varchar(80) NOT NULL,
	Fecha_Nac date NULL,
	Direccion varchar(255) NULL, 
    ID_Comuna int NULL,
	email varchar(120) NULL,
	Telefono varchar(15) NULL,
	CONSTRAINT FK_Paciente_Comuna FOREIGN KEY (ID_Comuna) REFERENCES Comuna(ID))  
GO

CREATE TABLE Cita
   (ID int PRIMARY KEY NOT NULL,
	Fecha_Hora datetime NOT NULL,
	ID_Odontologo int NOT NULL,
	ID_Paciente int NOT NULL,
	CONSTRAINT FK_Cita_Odontologo FOREIGN KEY (ID_Odontologo) REFERENCES Odontologo(ID),
	CONSTRAINT FK_Cita_Paciente FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID))  
GO

-- //POBLADO DE TABLAS// --

INSERT Comuna(ID,Nombre)  
	 VALUES (1,'Cerrillos'),
			(2,'Cerro Navia'),
			(3,'Conchalí'),
			(4,'El Bosque'),
			(5,'Estación Central'),
			(6,'Huechuraba'),
			(7,'Independencia'),
			(8,'La Cisterna'),
			(9,'La Florida'),
			(10,'La Granja'),
			(11,'La Pintana'),
			(12,'LaReina'),
			(13,'Las Condes'),
			(14,'Lo Barnechea'),
			(15,'Lo Espejo'),
			(16,'Lo Prado'),
			(17,'Macul'),
			(18,'Maipú'),
			(19,'Ńuńoa'),
			(20,'Padre Hurtado'),
			(21,'Pedro Aguirre Cerda'),
			(22,'Peńalolén'),
			(23,'Pirque'),
			(24,'Providencia'),
			(25,'Pudahuel'),
			(26,'Puente Alto'),
			(27,'Quilicura'),
			(28,'Quinta Normal'),
			(29,'Recoleta'),
			(30,'Renca'),
			(31,'San Bernardo'),
			(32,'San Joaquín'),
			(33,'San José de Maipo'),
			(34,'San Miguel'),
			(35,'San Ramón'),
			(36,'Santiago'),
			(37,'Vitacura');
GO


INSERT Especialidad(ID,Nombre)  
	 VALUES (1,'Odontología'),
			(2,'Odontopediatría'),
			(3,'Ortodoncia'),
			(4,'Endodoncia'),
			(5,'Periodoncia'),
			(6,'Cirugía Maxilofacial'),
			(7,'Implantología');
GO


INSERT Odontologo(ID,RUN,Nombre,Apellido,Fecha_Nac,ID_Especialidad,Direccion,ID_Comuna,email,Telefono)  
	 VALUES	(1,'4.824.256-8','Ana','Alvarez','1940-11-5',1,'Los Militares 6543',13,NULL,229485722),
			(4,'7.444.673-4','Irene','Gallardo','1947-1-23',1,NULL,NULL,'igallardo@email.com',224137766),
			(6,'8.132.420-5','Maria','Herrera','1953-7-20',1,'Providencia 678',24,'mherrera@email.com',226589748),
			(7,'8.287.236-2','Mario','Poblete','1954-7-14',1,'Rosario Norte 3456',13,NULL,NULL),
			(5,'7.691.632-K','Javier','Gonzalez','1947-6-20',2,NULL,NULL,NULL,NULL),
			(16,'9.934.176-9','Victor','Yańez','1963-10-19',2,'Chacabuco 245',18,'vyańez@email.com',225989185),
			(9,'8.441.763-9','Mariela','Pujado','1954-10-20',3,'Nataniel Cox 667',36,'mpujado@email.com',229202106),
			(13,'9.434.595-7','Paola','Valenzuela','1958-6-23',3,NULL,NULL,NULL,222506086),
			(2,'7.091.874-4','Nicolás','Díaz','1945-4-18',4,NULL,NULL,NULL,NULL),
			(10,'9.107.963-8','Nancy','Rojas','1956-7-9',4,NULL,NULL,'nrojas@email.com',NULL),
			(3,'7.218.313-K','Gustavo','Encina','1946-12-27',5,'Portugal 645',36,'gencina@email.com',NULL),
			(12,'9.304.721-3','Patricia','Toro','1957-1-11',5,'Alberto Llona 472',18,NULL,NULL),
			(14,'9.441.200-0','Mónica','Varas','1959-8-8',5,'Antonio Varas 876',24,'mvaras@email.com',227838812),
			(8,'8.355.882-K','Alicia','Ponce','1954-7-28',6,NULL,NULL,NULL,222575976),
			(15,'9.819.938-6','Silvia','Velasco','1963-2-10',6,NULL,NULL,'svelasco@email.com',NULL),
			(11,'9.278.913-8','Nelson','Soto','1956-9-1',7,NULL,NULL,'nsoto@email.com',226785413);
GO


INSERT Paciente(ID,RUN,Nombre,Apellido,Fecha_Nac,Direccion,ID_Comuna,email,Telefono)  
	 VALUES	(1,'4.857.208-8','Francisco','Alvarez','1942-3-18','Echeńique 8625',12,NULL,223226438),
			(2,'6.028.434-9','Carlos','Araya','1942-4-3','El Salto 167',29,'caraya@email.com',225011561),
			(3,'6.324.328-7','Clara','Barraza','1943-9-27',NULL,NULL,'cbarraza@email.com',222543964),
			(4,'16.199.353-0','Jorge','Berríos','1990-1-22','Simón Bolívar 7432',12,'jberríos@email.com',226826874),
			(5,'19.950.982-0','Germán','Carreńo','1996-1-8',NULL,NULL,'gcarreńo@email.com',226801339),
			(6,'19.308.207-1','Pamela','Castro','1995-1-30',NULL,NULL,'pcastro@email.com',228560015),
			(7,'7.008.269-0','Gloria','Cornejo','1944-6-17','Chile Espańa 876',19,NULL,225819412),
			(8,'13.472.018-3','Julio','Gallardo','1983-8-5',NULL,NULL,'jgallardo@email.com',223835647),
			(9,'7.808.919-3','Ivo','Gutiérrez','1948-5-31','Santa Isabel 076',36,'igutierrez@email.com',228119292),
			(10,'16.321.962-3','Rosa','Lira','1991-8-7',NULL,NULL,'rlira@email.com',223485960),
			(11,'14.475.005-3','Carlos','López','1984-6-12','José Zapiola 8678',12,'clópez@email.com',223788925),
			(12,'17.559.399-9','Karina','Morande','1991-9-19',NULL,NULL,'kmorande@email.com',226875109),
			(13,'7.833.272-3','Jorge','Oro','1953-1-26','Campo de Deporte 457',19,'joro@email.com',226301385),
			(14,'14.534.494-5','María','Paz','1988-3-16',NULL,NULL,'mpaz@email.com',223730108),
			(15,'10.729.545-4','Juan','Peńa','1969-4-11',NULL,NULL,'jpena@email.com',227119350),
			(16,'7.977.572-0','Marcela','Perez','1953-1-29','Los Maitenes 574',12,'mperez@email.com',225988150),
			(17,'12.836.186-4','Juan','Pińa','1980-3-9',NULL,NULL,'jpina@email.com',228750990),
			(18,'20.499.764-1','Guillermo','Quiroz','1996-7-3','Los Zapadores 516',29,'gquiroz@email.com',227426067),
			(19,'8.733.113-0','Miguel','Recabarren','1955-3-7',NULL,NULL,NULL,223845473),
			(20,'12.196.260-0','Juan','Riquelme','1973-4-9',NULL,NULL,'jriquelme@email.com',222443020),
			(21,'8.827.579-8','Andrés','Rivera','1955-10-2','Las Palmeras 125',19,NULL,223503779),
			(22,'12.260.835-9','Rolando','Rocco','1978-1-29',NULL,NULL,'rrocco@email.com',226359092),
			(23,'20.798.844-7','Omar','Romero','1999-3-14','El Greco 459',12,'oromero@email.com',228634098),
			(24,'18.486.116-0','Karen','Salinas','1992-12-15',NULL,NULL,'ksalinas@email.com',225317389),
			(25,'6.857.752-7','Edgar','Sanhueza','1944-4-14','Lira 1454',36,'esanhueza@email.com',223329246),
			(26,'14.628.513-8','Matías','Santander','1989-3-4',NULL,NULL,'msantander@email.com',225580432),
			(27,'11.201.692-3','Angélica','Silva','1971-10-2','Ortíz de Rozas 457',29,'asilva@email.com',227902328),
			(28,'11.041.393-5','Estela','Toledo','1969-4-20',NULL,NULL,'etoledo@email.com',224019249),
			(29,'12.549.867-3','Diego','Troncoso','1979-2-28',NULL,NULL,'dtroncoso@email.com',227366524),
			(30,'9.427.032-9','Raul','Trujillo','1957-12-3','Los Leones 789',24,'rtrujillo@email.com',226707558);
GO


INSERT Cita(ID,Fecha_Hora,ID_Odontologo,ID_Paciente)
	 VALUES	(1,'20160128 10:00:00 AM',1,30),
			(2,'20160128 10:30:00 AM',3,6),
			(3,'20160128 11:00:00 AM',3,26),
			(4,'20160128 11:30:00 AM',4,3),
			(5,'20160128 12:00:00 PM',7,16),
			(6,'20160128 12:30:00 PM',10,8),
			(7,'20160128 01:00:00 PM',3,22),
			(8,'20160128 01:30:00 PM',11,1),
			(9,'20160128 02:00:00 PM',11,24),
			(10,'20160128 02:30:00 PM',4,28),
			(11,'20160128 03:00:00 PM',7,4),
			(12,'20160128 03:30:00 PM',7,17),
			(13,'20160128 04:00:00 PM',11,20),
			(14,'20160128 04:30:00 PM',3,29),
			(15,'20160128 05:00:00 PM',9,4),
			(16,'20160129 10:00:00 AM',10,28),
			(17,'20160129 10:30:00 AM',10,28),
			(18,'20160129 11:00:00 AM',10,1),
			(19,'20160129 11:30:00 AM',10,25),
			(20,'20160129 12:00:00 PM',4,20),
			(21,'20160129 12:30:00 PM',4,12),
			(22,'20160129 01:00:00 PM',5,1),
			(23,'20160129 01:30:00 PM',7,4),
			(24,'20160129 02:00:00 PM',8,12),
			(25,'20160129 02:30:00 PM',9,23),
			(26,'20160129 03:00:00 PM',10,28),
			(27,'20160129 03:30:00 PM',1,30),
			(28,'20160129 04:00:00 PM',7,26),
			(29,'20160129 04:30:00 PM',7,29),
			(30,'20160129 05:00:00 PM',7,29),
			(31,'20160201 10:00:00 AM',4,8),
			(32,'20160201 10:30:00 AM',1,24),
			(33,'20160201 11:00:00 AM',1,5),
			(34,'20160201 11:30:00 AM',11,19),
			(35,'20160201 12:00:00 PM',1,14),
			(36,'20160201 12:30:00 PM',7,12),
			(37,'20160201 01:00:00 PM',8,30),
			(38,'20160201 01:30:00 PM',11,27),
			(39,'20160201 02:00:00 PM',4,30),
			(40,'20160201 02:30:00 PM',1,10),
			(41,'20160201 03:00:00 PM',1,18),
			(42,'20160201 03:30:00 PM',1,22),
			(43,'20160201 04:00:00 PM',4,12),
			(44,'20160201 04:30:00 PM',9,13),
			(45,'20160201 05:00:00 PM',7,1),
			(46,'20160202 10:00:00 AM',3,3),
			(47,'20160202 10:30:00 AM',4,13),
			(48,'20160202 11:00:00 AM',7,9),
			(49,'20160202 11:30:00 AM',8,7),
			(50,'20160202 12:00:00 PM',10,21),
			(51,'20160202 12:30:00 PM',10,17),
			(52,'20160202 01:00:00 PM',7,19),
			(53,'20160202 01:30:00 PM',3,23),
			(54,'20160202 02:00:00 PM',8,29),
			(55,'20160202 02:30:00 PM',9,18),
			(56,'20160202 03:00:00 PM',7,18),
			(57,'20160202 03:30:00 PM',1,24),
			(58,'20160202 04:00:00 PM',4,9),
			(59,'20160202 04:30:00 PM',8,15),
			(60,'20160202 05:00:00 PM',11,15),
			(61,'20160203 10:00:00 AM',7,8),
			(62,'20160203 10:30:00 AM',1,20),
			(63,'20160203 11:00:00 AM',2,2),
			(64,'20160203 11:30:00 AM',4,7),
			(65,'20160203 12:00:00 PM',7,18),
			(66,'20160203 12:30:00 PM',8,21),
			(67,'20160203 01:00:00 PM',10,27),
			(68,'20160203 01:30:00 PM',4,14),
			(69,'20160203 02:00:00 PM',2,24),
			(70,'20160203 02:30:00 PM',2,13),
			(71,'20160203 03:00:00 PM',4,11),
			(72,'20160203 03:30:00 PM',4,10),
			(73,'20160203 04:00:00 PM',4,13),
			(74,'20160203 04:30:00 PM',11,13),
			(75,'20160203 05:00:00 PM',1,11),
			(76,'20160204 10:00:00 AM',1,26),
			(77,'20160204 10:30:00 AM',2,24),
			(78,'20160204 11:00:00 AM',3,18),
			(79,'20160204 11:30:00 AM',4,1),
			(80,'20160204 12:00:00 PM',10,14),
			(81,'20160204 12:30:00 PM',7,30);
GO