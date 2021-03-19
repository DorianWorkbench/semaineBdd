-- PERMET D'ENLEVER TOUS LES VOLONTAIRE D'UN CHANTIER
DROP PROCEDURE IF EXISTS enlever_tous_volontaires_chantier_hote; 
DELIMITER |
CREATE PROCEDURE enlever_tous_volontaires_chantier_hote(IN idChant INT)


BEGIN
    SELECT 'idChant enlever_tous_volontaires_chantier_hote';
    SELECT idChant;
    
    DELETE FROM VALIDER 
    WHERE idChantier = idChant;
END|
DELIMITER ;