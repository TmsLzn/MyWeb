SET FOREIGN_KEY_CHECKS=0;

TRUNCATE TABLE Usuarios;
TRUNCATE TABLE Vinculos;
TRUNCATE TABLE Fotos;
TRUNCATE TABLE Citas;

SET FOREIGN_KEY_CHECKS=1;

INSERT INTO Usuarios(userId, nombre, usuario, fechaNacimiento, estatura, peso, telefono, email, password, aficion, genero, colorOjos, colorPelo, biografia, provincia, fotoUrl) VALUES
   (1, 'Borja', 'borjitaaa', '2000-01-01', 170, 20, 600123456, 'borjaalba@gmail.com', '1234', 'Deportes', 'Masculino', 'Verdes', 'Castaño', 'biografia', 'Sevilla', 'https://i.imgur.com/qN5vYRk.jpeg'),
   (2, 'Javier', 'javichulo', '2002-09-30', 171, 67, 1234567890, 'javipas@gmail.com', '1234', 'Videojuegos', 'Masculino', 'Azules', 'Castaño', 'Sobreviviendo en la US', 'Sevilla', 'https://i.imgur.com/qN5vYRk.jpeg'),
   (3, 'Antonio', 'ayyyantonio', '2000-01-01', 155, 540, 112233445, 'pedro@gmail.com', '1234', 'Naturaleza', 'Masculino', 'Verdes', 'Castaño', 'biografia', 'Sevilla', 'https://i.imgur.com/qN5vYRk.jpeg'),
   (4, 'Marina', 'LAMARI', '2003-04-02', 165, 80, 1234567890, 'marinauwu@gmail.com', '1234', 'Fotografía', 'Femenino', 'Castaños', 'Rubio', 'Necesito tiempo para salir', 'Sevilla', 'https://i.imgur.com/qN5vYRk.jpeg'),
   (5, 'Sara', 'sarandonga', '2001-11-03', 171, 75, 1234567890, 'saragmz@gmail.com', '1234', 'Animales', 'Femenino', 'Azules', 'Rubio', 'Buscando amigos', 'Sevilla', 'https://i.imgur.com/qN5vYRk.jpeg');

INSERT INTO Vinculos(vinculoId, usernameEnviado, usernameRecibido, estadoSolicitud, fechaSolicitud, revocacion) VALUES
    (1, 'borjitaaa', 'javichulo', 'Pendiente', '2011-03-02', True),
    (2, 'javichulo', 'ayyyantonio', 'Aceptada', '2018-09-10', True),
    (3, 'LAMARI', 'sarandonga', 'Aceptada', '2019-10-12', False),
    (4, 'borjitaaa', 'ayyyantonio', 'Rechazada', '2010-07-08', True);

INSERT INTO Fotos(fotoId, usuario, urlFoto, nombreFoto, descripcionFoto) VALUES
   (1, 'borjitaaa', '/web/images/samoyed.jpg', 'Momo', 'Momaso amarillo'),
   (2, 'borjitaaa', 'https://i.imgur.com/qN5vYRk.jpeg', 'Fotazo', 'Pedazo Nacidades'),
   (3, 'javichulo', 'www.123.com/f3', 'Fotito', 'Con los primos'),
   (4, 'javichulo', 'www.123.com/f4', 'Fotooo', 'En el barrio'),
   (5, 'ayyyantonio', 'www.123.com/f5', 'PedazoFoto', 'Viva Cristo Rey'),
   (6, 'ayyyantonio', 'www.123.com/f6', 'Fot1', 'Aupa Atleti'),
   (7, 'LAMARI', 'www.123.com/f7', 'Fot2', 'Familia'),
   (8, 'LAMARI', 'www.123.com/f8', 'Fot3', 'El brawl'),
   (9, 'sarandonga', 'www.123.com/f9', 'Fot4', 'Con los panas'),
   (10, 'sarandonga', 'www.123.com/f10', 'Fot5', 'FOtito de ayer');

INSERT INTO Citas(citasId, vinculoId, relacion) VALUES
   (1, 1, False),
   (2, 2, True),
   (3, 3, False),
   (4, 4, True);

	
