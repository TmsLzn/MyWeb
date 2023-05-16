
DELIMITER //
CREATE OR REPLACE TRIGGER RN_1_04_MaximoFotosI
BEFORE INSERT ON fotos
FOR EACH ROW 
BEGIN 
   DECLARE contador INT;
   SET contador = (SELECT COUNT(*) FROM fotos WHERE userId=NEW.userId);

   IF ( contador >= 4) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pueden tener mas de 5 Fotos';
   END IF;
END //
DELIMITER ;

DELIMITER //
CREATE OR REPLACE TRIGGER RN_1_04_MaximoFotosU
AFTER UPDATE ON fotos
FOR EACH ROW 
BEGIN 
   DECLARE contador INT;
   SET contador = (SELECT COUNT(*) FROM fotos WHERE userId=NEW.userId);

   IF ( contador >= 4) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pueden tener mas de 5 Fotos';
   END IF;
END //
DELIMITER ;
DELIMITER //
CREATE OR REPLACE TRIGGER RN_1_04_MaximoSolicitudesI
BEFORE INSERT ON vinculos
FOR EACH ROW 
BEGIN 
   DECLARE contador INT;
   SET contador = (SELECT COUNT(*) FROM vinculos WHERE userIdEnviado=NEW.userIdEnviado AND fechaSolicitud=NEW.fechaSolicitud );

   IF ( contador >= 4) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pueden tener mas de 5 Fotos';
   END IF;
END //
DELIMITER ;
-- revisar^
DELIMITER //
CREATE OR REPLACE TRIGGER RN_1_04_MaximoSolicitudesI
BEFORE INSERT ON vinculos
FOR EACH ROW 
BEGIN    

   IF ( NEW.estadoSolicitud= 'Rechazada' AND NEW.revocacion=FALSE ) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pueden tener mas de 5 Fotos';
   END IF;
END //
DELIMITER ;
DELIMITER //
CREATE OR REPLACE TRIGGER RN_4_02_CitasSinRelacion
BEFORE INSERT ON citas
FOR EACH ROW 
BEGIN 
   DECLARE contador INT;
   SET contador = (SELECT COUNT(*) FROM citas WHERE citasId=NEW.citasId AND vinculoId=NEW.vinculoId);
   IF ( contador >= 4 AND new.relacion=FALSE) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede tener mas de 5 citas sin relacion';
   END IF;
END //
DELIMITER ;
