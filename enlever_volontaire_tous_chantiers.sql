-- SUPPRIME UN VOLONTAIRE DE TOUS LES CHANTIERS
DROP PROCEDURE IF EXISTS enlever_volontaire_tous_chantiers; 
DELIMITER |
CREATE PROCEDURE enlever_volontaire_tous_chantiers(IN idUtilisateur INT)
BEGIN
    DELETE FROM VALIDER 
    WHERE idVolontaire = idUtilisateur; 
END|
DELIMITER ;