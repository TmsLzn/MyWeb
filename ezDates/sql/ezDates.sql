DROP TABLE IF EXISTS aficiones;
DROP TABLE IF EXISTS aficionbusqueda;
DROP TABLE IF EXISTS Busquedas;
DROP TABLE IF EXISTS Citas;
DROP TABLE IF EXISTS fotos;
DROP TABLE IF EXISTS ubicaciones;
DROP TABLE IF EXISTS Provincias;
DROP TABLE IF EXISTS Municipios;
DROP TABLE IF EXISTS CodigosPostales;
DROP TABLE IF EXISTS Vinculos;
DROP TABLE IF EXISTS Usuarios;        

CREATE TABLE Usuarios (
	userId INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(30), 
	usuario VARCHAR(30),
	fechaNacimiento DATE ,
	estatura FLOAT ,
	peso FLOAT,
	telefono INT,
	email VARCHAR(70) UNIQUE,
	password LONGTEXT,
	fechaAlta DATE,
	fechaBaja DATE DEFAULT NULL,
	aficion VARCHAR(50),
	genero ENUM('Masculino','Femenino','Otros'),
	colorOjos ENUM('Negros','Castaños','Azules','Verdes','Grises') , 
	colorPelo ENUM('Negro','Castaño','Azul','Rubio','Rojo','Blanco','Gris') ,
	biografia VARCHAR(100) ,
	ubicacion VARCHAR(5) ,
	busquedaId INT NOT NULL,
	PRIMARY KEY (userId),
	CONSTRAINT invalidAge CHECK (YEAR(fechaNacimiento) <=2004),
	CONSTRAINT invalidDate CHECK (fechaBaja >= fechaAlta)
	

);

CREATE TABLE Vinculos(
	vinculoId INT NOT NULL AUTO_INCREMENT,
	userIdEnviado INT,
	userIdRecibido INT,
	estadoSolicitud ENUM('Aceptada','Pendiente','Rechazada'),
	fechaSolicitud DATE,
	revocacion BOOLEAN,
	PRIMARY KEY (vinculoId),
	FOREIGN KEY (userIdEnviado) REFERENCES Usuarios (userId),
	FOREIGN KEY (userIdRecibido) REFERENCES Usuarios (userId),
	CONSTRAINT invalidUser CHECK((userIdEnviado) != userIdRecibido),
	UNIQUE(userIdEnviado,userIdRecibido)

);


CREATE TABLE CodigosPostales (
	codigoPostalId INT NOT NULL AUTO_INCREMENT,
	codigoPostal VARCHAR(5) ,
	provincia VARCHAR(30) ,
	municipio VARCHAR(50) ,
	PRIMARY KEY (codigoPostalId) 
);

CREATE TABLE Municipios(
	municipioId INT NOT NULL AUTO_INCREMENT,
	municipio VARCHAR(50),
	codigoPostalId INT,
	PRIMARY KEY (municipioId),
	FOREIGN KEY (codigoPostalId) REFERENCES CodigosPostales(codigoPostalId) 


);

CREATE TABLE Provincias(
	provinciaId INT NOT NULL AUTO_INCREMENT,
	provincia VARCHAR(50),
	municipioId INT,
	PRIMARY KEY (provinciaId),
	FOREIGN KEY (municipioId) REFERENCES Municipios(municipioId) 
);


CREATE TABLE Ubicaciones (
	ubicacionId INT NOT NULL AUTO_INCREMENT,
	codigoPostalId INT,
	provinciaId INT,
	municipioId INT,
	PRIMARY KEY (ubicacionId),
	FOREIGN KEY (codigoPostalId) REFERENCES CodigosPostales (codigoPostalId),
	FOREIGN KEY (provinciaId) REFERENCES Provincias (provinciaId),
	FOREIGN KEY (municipioId) REFERENCES Municipios (municipioId)
	
);



CREATE TABLE Fotos (
	fotoId INT NOT NULL AUTO_INCREMENT,
	userId INT,
	urlFoto VARCHAR(200) UNIQUE,
	nombreFoto VARCHAR(15),
	descripcionFoto VARCHAR(120),
	PRIMARY KEY (fotoId),
	FOREIGN KEY (userId) REFERENCES Usuarios (userId)

);


CREATE TABLE Citas (
	citasId INT(11) NOT NULL AUTO_INCREMENT,
	vinculoId INT,
	relacion BOOLEAN,
	PRIMARY KEY (citasId),
	FOREIGN KEY (vinculoId) REFERENCES Vinculos (vinculoId)
);


CREATE TABLE Busquedas (
	busquedaId INT NOT NULL AUTO_INCREMENT,
	edadMin INT NOT NULL,
	edadMax INT NOT NULL,
	alturaMin FLOAT NOT NULL,
	alturaMax FLOAT NOT NULL,
	pesoMin FLOAT NOT NULL,
	pesoMax FLOAT NOT NULL,
	genero ENUM('Masculino','Femenino','Otros') NOT NULL,
	colorPelo ENUM('Negro','Castaño','Azul','Rubio','Rojo','Blanco','Gris') NOT NULL,
	colorOjos ENUM('Negros','Castaños','Azules','Verdes','Grises') NOT NULL,
	ubicacionId INT,
	aficion VARCHAR(50),
	userId INT NOT NULL,
	PRIMARY KEY (busquedaId),
	FOREIGN KEY (ubicacionId) REFERENCES Ubicaciones (ubicacionId),
	FOREIGN KEY (userId) REFERENCES Usuarios (userId)

);

CREATE TABLE aficionBusqueda (
	aficionBusquedaId INT,
	aficion VARCHAR(50),
	busquedaId INT,
	PRIMARY KEY (aficionBusquedaId),
	FOREIGN KEY (busquedaId) REFERENCES Busquedas (busquedaId) 
);

CREATE TABLE Aficiones (
	userId INT NOT NULL,
	aficion VARCHAR(50),
	PRIMARY KEY (userId, aficion),
	FOREIGN KEY (userId) REFERENCES usuarios(userId)
);




