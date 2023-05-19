
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE Usuarios;
TRUNCATE Vinculos;
TRUNCATE CodigosPostales;
TRUNCATE Municipios;
TRUNCATE Provincias;
TRUNCATE Ubicaciones;
TRUNCATE Fotos;
TRUNCATE Citas;
TRUNCATE Busquedas;
TRUNCATE aficionBusqueda;
TRUNCATE Aficiones;

SET FOREIGN_KEY_CHECKS=1;


INSERT INTO Usuarios(userId ,nombre , usuario, fechaNacimiento ,estatura,peso, telefono, email ,password ,fechaAlta ,fechaBaja , aficion, genero ,colorOjos ,colorPelo ,biografia,ubicacion,busquedaId) VALUES
   (1, 'Borja', 'borjitaaa', '2000-01-01', 170,20, 600123456, 'borjaalba@gmail.com','1234','2000-05-06',NULL,'Deportes','Masculino','Verdes','Castaño','biografia','41012',1),
   (2, 'Javier', 'javichulo','2002-09-30', 171,67, 1234567890, 'javipas@gmail.com','1234','2019-02-07',NULL,'Videojuegos','Masculino','Azules','Castaño','Sobreviviendo en la US','41013',2),
   (3, 'Antonio','ayyyantonio','2000-01-01', 155,540, 00112233445,'pedro@gmail.com','1234','2000-01-02',NULL,'Naturaleza','Masculino','Verdes','Castaño','biografia','41100',3),
   (4, 'Marina', 'LAMARI', '2003-04-02', 165,80,1234567890, 'marinauwu@gmail.com','1234','2020-03-04',NULL,'Fotografía','Femenino','Castaños','Rubio','Necesito tiempo para salir','21010',4),
   (5, 'Sara','sarandonga','2001-11-03', 171,75, 1234567890, 'saragmz@gmail.com','1234','2021-05-05',NULL,'Animales','Femenino','Azules','Rubio','Buscando amigos','21005',5);
   
   
INSERT INTO Vinculos(vinculoId, userIdEnviado, userIdRecibido, estadoSolicitud, fechaSolicitud, revocacion) VALUES
	(1, 1, 2, 'Pendiente', '2011-03-02',True),
	(2, 2, 3, 'Aceptada', '2018-09-10',True),
	(3, 4, 5, 'Aceptada', '2019-10-12',False),
	(4, 1, 3, 'Rechazada', '2010-07-08',TRUE);

INSERT INTO CodigosPostales(codigoPostalId, codigopostal) VALUES 
  	(1,'41012'), 
	(2, '21005'), 
	(3, '18015'),
	(4, '23156');
  
INSERT INTO Municipios(municipioId, municipio, codigoPostalId) VALUES
	(1, 'Camas', 1),
	(2, 'Trigueros', 2),
	(3, 'Chiclana', 3),
	(4, 'Guadix', 4);

INSERT INTO Provincias(provinciaId, provincia, municipioId) VALUES
	(1, 'Sevilla', 1),
	(2, 'Huelva', 2),
	(3, 'Cádiz', 3),
	(4, 'Granada', 4);

INSERT INTO Ubicaciones(ubicacionId, codigoPostalId, municipioId, provinciaId) VALUES
	(1, 1, 1, 1),
	(2, 2, 2, 2),
	(3, 3, 3, 3),
	(4, 4, 4, 4);

INSERT INTO  Fotos(fotoId ,userId ,urlFoto,nombreFoto,descripcionFoto) VALUES
   (1,1,'/web/images/samoyed.jpg', 'Momo','Momaso amarillo'),
   (2,1,'https://i.imgur.com/qN5vYRk.jpeg', 'Fotazo','Pedazo Nacidades'),
   (3,2,'www.123.com/f3', 'Fotito','Con los primos'),
   (4,2,'www.123.com/f4', 'Fotooo','En el barrio'),
   (5,3,'www.123.com/f5', 'PedazoFoto','Viva Cristo Rey'),
   (6,3,'www.123.com/f6', 'Fot1','Aupa Atleti'),
   (7,4,'www.123.com/f7', 'Fot2','Familia'),
   (8,4,'www.123.com/f8', 'Fot3','El brawl'),
   (9,5,'www.123.com/f9', 'Fot4','Con los panas'),
   (10,5,'www.123.com/f10', 'Fot5','FOtito de ayer');
	
INSERT INTO Citas(citasId, vinculoId, relacion) VALUES
	(1,1, False),
	(2,2, True),
	(3,3,False),
	(4,4, TRUE);
	

INSERT INTO Busquedas(busquedaId, edadMin,edadMax,alturaMin,alturaMax,pesoMin, pesoMax,genero,colorPelo,colorOjos, ubicacionId,aficion, userId) VALUES 
    (1,18,30,155,175,50,80,'Masculino', 'Negro','Negros', '1', 'Naturaleza', 1),
	(2,18,25,165,190,65, 100,'Femenino', 'Negro','Verdes', '2','Videojuegos',2), 
	(3,18,24,160,175,65, 75,'Femenino', 'Negro','Grises', '3','Fotografia', 3),
	(4,18,29,150,180,70,90,'Masculino', 'Rubio','Azules','2','Animales',4),
	(5,18,35,170,210,65,110,'Masculino', 'Azul','Verdes','1', 'Deporetes', 5);


INSERT INTO aficionBusqueda(aficionBusquedaId, aficion, busquedaId) VALUES
	(1, 'Naturaleza', 1),
	(2, 'Videojuegos', 2),
	(3, 'Fotografia', 3),
	(4, 'Animales', 4),
	(5, 'Deportes', 5);

INSERT INTO Aficiones(userId, aficion) VALUES
	(1, 'Deportes y Videojuegos'),
	(2, 'Naturaleza'),
	(3, 'Cocina'),
	(4, 'Animales'),
	(5, 'Deportes y Videojuegos');
