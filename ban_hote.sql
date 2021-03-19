-- BAN HOTE
DROP PROCEDURE IF EXISTS ban_hote;
DELIMITER |
CREATE PROCEDURE ban_hote(IN idHo INT)
BEGIN
    DECLARE idT INT;
    DECLARE finished INT DEFAULT 0;
    DECLARE chantierId INT;

    DECLARE cursorChantierHote CURSOR FOR
        SELECT DISTINCT id 
        FROM CHANTIER 
        WHERE idHote = idHo;

    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
            BEGIN
                SELECT 'ERREUR LORS DE L EXECUTION DE LA REQUETE';
                ROLLBACK;
            END;

    SELECT idRole INTO idT 
    FROM UTILISATEUR 
    WHERE id = idHo;

    IF idT = 2 THEN
        SELECT 'ERREUR CE N EST PAS UN HOTE';
    END IF;
    IF idT = 1 THEN
        SELECT 'idT = 1';
        START TRANSACTION;
            DELETE FROM ACTIVITE_HOTE WHERE idHote=idHo;
            SELECT 'APRES ACTIVITE HOTE';
            DELETE FROM WOOFING WHERE idHote=idHo;
            SELECT 'APRES WOOFING';
            OPEN cursorChantierHote;
            loopDeleteHote:LOOP
                FETCH cursorChantierHote INTO chantierId;
                SELECT chantierId;
                IF finished = 1 THEN
                    SELECT finished;
                    SET finished = 0;
                    LEAVE loopDeleteHote;
                END IF;
                SELECT 'AVANT CALL';
                CALL enlever_tous_volontaires_chantier_hote(chantierId);
                SELECT 'APRES STORED PROCEDURE';
                DELETE FROM TYPEACT_CHANTIER WHERE idChantier = chantierId;
                SELECT 'APRES TYPEACT_CHANTIER';

            END LOOP;
            CLOSE cursorChantierHote;
            DELETE FROM CHANTIER WHERE idHote = idHo;
            SELECT 'APRES DELETE CHANTIER';
            UPDATE UTILISATEUR SET ban = 1 WHERE id = idHo;
        COMMIT;
    END IF;
END|
DELIMITER ;