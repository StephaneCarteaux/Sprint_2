-- Llista quants productes de tipus “Begudes” s'han venut en una determinada localitat
SELECT catp.nom, COUNT(*) 
FROM categoria_producte catp
INNER JOIN producte pro ON catp.id = pro.categoria_producte_id 
INNER JOIN comanda_producte cmdp ON pro.id = cmdp.producte_id 
INNER JOIN comanda cmd ON cmdp.comanda_id = cmd.id
INNER JOIN client c ON cmd.client_id = c.id
WHERE catp.nom = 'begude'
AND c.localitat = 'Madrid';

-- Llista quantes comandes ha efectuat un determinat empleat/da
SELECT e.nom, COUNT(*)
FROM empleat e
INNER JOIN botiga b ON e.botiga_id = b.id
INNER JOIN comanda c ON b.id = c.botiga_id
WHERE e.nom = 'David';