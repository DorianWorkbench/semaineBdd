DROP PROCEDURE IF EXISTS generateDatas;

DELIMITER |
CREATE PROCEDURE generateDatas()
BEGIN
    -- ITERATEUR;
    DECLARE x INT;
    DECLARE y INT;
    DECLARE z INT;
    DECLARE zx INT;
    DECLARE zy INT;

    DECLARE stockId INT;
    DECLARE volontaireId INT;
    DECLARE hoteId INT;
    DECLARE volontaireNoteId INT;
    DECLARE finished INT DEFAULT 0;

    DECLARE cursorUserID CURSOR FOR 
        SELECT id 
        FROM UTILISATEUR 
        WHERE idRole = 1;
    
    DECLARE cursorUserVolontaire CURSOR FOR 
        SELECT id 
        FROM UTILISATEUR 
        WHERE idRole = 2;

    -- Pas obligatoire, on pourrait utiliser 'cursorUserID' 
    DECLARE cursorActiviteHote CURSOR FOR
        SELECT idUtilisateur
        FROM HOTE;

    DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET  finished = 1;

    INSERT INTO ACTIVITE(libelle) 
    VALUES('Apiculteur'),
    ('Charpentier'),
    ('Berger'),
    ('Musicien');
    
    INSERT INTO TYPE_ACTIVITE(libelle) 
    VALUES('Charpente'),
    ('Maconnerie'),
    ('Chef equipe');

    INSERT INTO ROLE(libelle) 
    VALUES ('HOTE'), 
    ('VOLONTAIRE');

    SET x = 0;

    label: LOOP
        IF x >= 50 THEN
         INSERT INTO UTILISATEUR(ndc, mdp, nom, prenom, idRole, ban) 
            VALUES(CONCAT('test', x), 
                CONCAT('test', x), 
                CONCAT('nomTest', x), 
                CONCAT('prenomTest', x),
                2,
                0
            );
            SET x = x+1;
        END IF;

        IF x < 50 THEN
            INSERT INTO UTILISATEUR(ndc, mdp, nom, prenom, idRole, ban) 
            VALUES(CONCAT('test', x), 
                CONCAT('test', x), 
                CONCAT('nomTest', x), 
                CONCAT('prenomTest', x),
                1,
                0
            );

            SET x = x+1;
        END IF;

        IF x >= 100 THEN
            \! echo 'Ajout Utilisateur DONE';
            LEAVE label;
        END IF;
    END LOOP;

    SET y = 0;
    OPEN cursorUserID;
    
    hoteLoop:LOOP
        FETCH cursorUserID INTO stockId;
        IF finished = 1 THEN
            \! echo 'hoteLoop DONE';

            SET finished = 0;
            LEAVE hoteLoop;
        END IF;
        
        IF y = 100 THEN
            LEAVE hoteLoop;
        END IF;

        INSERT INTO HOTE (idUtilisateur, adresse, libelle)
        VALUE (stockId, 
            CONCAT('testAddr', y), 
            CONCAT('testLibelle', y)
            );

        SET y = y+1;
    END LOOP hoteLoop;
    CLOSE cursorUserID;

   

    INSERT INTO CHANTIER(libelle, capacite, date_Debut, date_Fin, idHote) VALUES
    (
        'Faire une maison',
        35,
        '2021-08-01 09:30:00',
        '2021-08-30 17:30:00',
        1

    ),
    (
        'Faire un grenier',
        25,
        '2021-06-01 06:30:00',
        '2021-08-30 16:30:00',
        2
    );
    
    SET z = 0;
    OPEN cursorUserVolontaire;
    
    validLoop:LOOP
        FETCH cursorUserVolontaire INTO volontaireId;

        IF finished = 1 THEN
            \! echo 'validLoop DONE';
            SELECT 'finished = 1';
            SET finished = 0;
            LEAVE validLoop;
        END IF;
        IF z <= 25 THEN
            SELECT 'z <= 25';

            INSERT INTO VALIDER (idVolontaire, idChantier, idHote, etat) 
            VALUES (
                        volontaireId,
                        1,
                        1,
                        null
                    );
                    SET z = z+1;
        END IF;
        IF z > 25 THEN
            SELECT 'z > 25';
            INSERT INTO VALIDER (idVolontaire, idChantier, idHote, etat) 
            VALUES (
                        volontaireId,
                        2,
                        2,
                        null
                    );
            SET z = z+1;
        END IF;
    END LOOP;
    CLOSE cursorUserVolontaire;

    INSERT INTO TYPEACT_CHANTIER(idChantier, idTypeActivite) VALUES
    (1, 1),(1,2),(1,3),(2,1),(2,3);

    INSERT INTO WOOFING (idVolontaire, idHote, date_arrivee, date_depart)
    VALUES 
    (51, 1, '2021-07-31 18:30:00', '2021-09-01 08:00:00'),
    (52, 1, '2021-07-31 18:30:00', '2021-08-30 17:00:00'),
    (53, 1, '2021-07-31 18:30:00', '2021-08-30 17:30:00'),
    (54, 2, '2021-07-31 18:30:00', '2021-09-01 08:00:00'),
    (55, 2, '2021-07-31 18:30:00', '2021-08-30 17:00:00');

    
    SET zx = 1;
    OPEN cursorActiviteHote;

    loopActiviteHote:LOOP
        FETCH cursorActiviteHote INTO hoteId;
        
        IF finished = 1 THEN
            SELECT 'finished = 1';
            \! echo 'loopActiviteHote DONE';
            SET finished = 0;
            LEAVE loopActiviteHote;
        END IF;

        IF zx <= 25 THEN
            SELECT 'loopActiviteHote zx <= 25';
            INSERT INTO ACTIVITE_HOTE(idHote, idActivite)
            VALUES 
            (hoteId, 1),
            (hoteId, 2),
            (hoteId, 3);
        END IF;

        IF zx > 25 AND zx <=40 THEN
            SELECT zx;
            SELECT 'loopActiviteHote zx <= 40';

            INSERT INTO ACTIVITE_HOTE(idHote, idActivite)
            VALUES 
            (hoteId, 2),
            (hoteId, 3);
        END IF;

        IF zx>40 THEN
            SELECT 'loopActiviteHote zx > 40';
            INSERT INTO ACTIVITE_HOTE(idHote, idActivite)
            VALUES 
            (hoteId, 3),
            (hoteId, 4);
        END IF;
        
        SET zx = zx + 1;
    END LOOP;

    SET zy = 0;

    OPEN cursorUserVolontaire;

    loopNiveau:LOOP
        FETCH cursorUserVolontaire INTO volontaireNoteId;

        IF finished = 1 THEN
            \! echo 'loopNiveau DONE';

            SET finished = 0;
            LEAVE loopNiveau;
        END IF;

        IF zy <= 20 THEN
            INSERT INTO NIVEAU (idUtilisateur, idTypeActivite, note)
            VALUES 
            (volontaireNoteId, 1, 4.5),
            (volontaireNoteId, 2, 3.4),
            (volontaireNoteId, 3, 1);
        END IF;
        
        IF zy > 20 AND zy <= 40 THEN 
            INSERT INTO NIVEAU (idUtilisateur, idTypeActivite, note)
            VALUES 
            (volontaireNoteId, 1, 3),
            (volontaireNoteId, 2, 5);
        END IF;

        SET zy = zy + 1;
    END LOOP;
    CLOSE cursorActiviteHote;
END|
DELIMITER ;