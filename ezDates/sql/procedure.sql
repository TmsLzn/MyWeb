DELIMITER //
CREATE OR REPLACE PROCEDURE
    finalizarCuenta(user int)
BEGIN
    DECLARE fechaFin DATE;
    SET fechaFin = SYSDATE();
    SET user = (SELECT userId FROM Usuarios WHERE userId = user);
    UPDATE Usuarios SET fechaBaja = fechaFin WHERE userId = user;
  END // 
DELIMITER ;

DELIMITER //
CREATE OR REPLACE PROCEDURE
    pAjustarPerfil(nombreNew VARCHAR(30), fechaNacimientoNew DATE, USER INT)

BEGIN

     SET user = (SELECT userId FROM Usuarios WHERE userId = user);
    UPDATE Usuarios SET nombre=nombreNew WHERE userId = user;
    UPDATE Usuarios SET fechaNacimiento= fechaNacimientoNew WHERE userId = user;



 END //
DELIMITER ;

DELIMITER //
CREATE OR REPLACE PROCEDURE
    crearVinculo(userEnviado INT, userRecibido INT)

BEGIN
    INSERT INTO Vinculos(vinculoId, userIdEnviado, userIdRecibido, estadoSolicitud,
        fechaSolicitud, revocacion)
        VALUES (vinculoId, userEnviado, userRecibido, 'Pendiente',
        SYSDATE(), FALSE);
END //
DELIMITER ;


DELIMITER //
CREATE OR REPLACE PROCEDURE
    gestionarSolicitud(estadoSolicitudNew ENUM('Aceptada','Rechazada'), userRecibidoNew INT)

BEGIN
    UPDATE Vinculos SET estadoSolicitud = estadoSolicitudNew WHERE userIdRecibido = userRecibidoNew;

 END //
DELIMITER ;


DELIMITER //
CREATE OR REPLACE PROCEDURE
    gestionarCitas(vinculo INT)
BEGIN
	DECLARE vinculoId2 INT;
	set vinculoId2= (SELECT  vinculoId FROM Citas WHERE vinculoId=vinculo); 
	if(vinculoId2 = vinculo) then
    INSERT INTO Citas (relacion) VALUES (TRUE) ;
	END if;
 END //
DELIMITER ;