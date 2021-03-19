-- SUPPRIME UN VOLONTAIRE D'UN CHANTIER CHOISI
DROP PROCEDURE IF EXISTS enlever_volontaire_chantier; 
DELIMITER |
CREATE PROCEDURE enlever_volontaire_chantier(IN idUtilisateur INT, IN idChant INT)
BEGIN
    DELETE FROM VALIDER 
    WHERE idVolontaire = idUtilisateur 
    AND idChantier = idChant;
END|
DELIMITER ;