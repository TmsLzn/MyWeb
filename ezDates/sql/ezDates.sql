DROP TABLE IF EXISTS Citas;
DROP TABLE IF EXISTS Fotos;
DROP TABLE IF EXISTS Vinculos;
DROP TABLE IF EXISTS Usuarios;

CREATE TABLE Usuarios (
    userId INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30),
    usuario VARCHAR(30) UNIQUE NOT NULL,
    fechaNacimiento DATE,
    estatura FLOAT,
    peso FLOAT,
    telefono INT,
    email VARCHAR(70) UNIQUE,
    contrasena VARCHAR(50),
    aficion VARCHAR(50),
    genero ENUM('Masculino', 'Femenino', 'Otros'),
    colorOjos ENUM('Negros', 'Castaños', 'Azules', 'Verdes', 'Grises'),
    colorPelo ENUM('Negro', 'Castaño', 'Azul', 'Rubio', 'Rojo', 'Blanco', 'Gris'),
    biografia VARCHAR(100),
    provincia VARCHAR(30),
    fotoUrl VARCHAR(200),
    PRIMARY KEY (userId),
    CONSTRAINT invalidAge CHECK (YEAR(fechaNacimiento) <= 2004)
);

CREATE TABLE Vinculos (
    vinculoId INT NOT NULL AUTO_INCREMENT,
    usernameEnviado VARCHAR(30) NOT NULL,
    usernameRecibido VARCHAR(30) NOT NULL,
    estadoSolicitud ENUM('Aceptada', 'Pendiente', 'Rechazada'),
    fechaSolicitud DATE,
    revocacion BOOLEAN,
    PRIMARY KEY (vinculoId),
    FOREIGN KEY (usernameEnviado) REFERENCES Usuarios (usuario),
    FOREIGN KEY (usernameRecibido) REFERENCES Usuarios (usuario),
    CONSTRAINT invalidUser CHECK (usernameEnviado != usernameRecibido),
    UNIQUE (usernameEnviado, usernameRecibido)
);

CREATE TABLE Fotos (
    fotoId INT NOT NULL AUTO_INCREMENT,
    usuario VARCHAR(30) NOT NULL,
    urlFoto VARCHAR(200),
    nombreFoto VARCHAR(15),
    descripcionFoto VARCHAR(120),
    PRIMARY KEY (fotoId),
    FOREIGN KEY (usuario) REFERENCES Usuarios (usuario)
);

CREATE TABLE Citas (
    citasId INT NOT NULL AUTO_INCREMENT,
    vinculoId INT NOT NULL,
    relacion BOOLEAN,
    PRIMARY KEY (citasId),
    FOREIGN KEY (vinculoId) REFERENCES Vinculos (vinculoId)
);
