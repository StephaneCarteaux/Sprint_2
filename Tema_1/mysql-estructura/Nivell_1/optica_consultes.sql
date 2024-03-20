-- Llista el total de compres d’un client
SELECT c.nom, u.marca, u.color_montura, u.preu FROM client c INNER JOIN client_compra_ullere ccu ON c.id = ccu.client_id INNER JOIN ullere u ON ccu.ullere_id = u.id WHERE c.nom = 'Cliente 1';
    
-- Llista les diferents ulleres que ha venut un empleat durant un any
SELECT e.nom, u.marca, u.color_montura, u.preu, YEAR(ccu.data) AS any FROM ullere u INNER JOIN client_compra_ullere ccu ON ccu.ullere_id = u.id INNER JOIN empleat e ON ccu.empleat_id = e.id WHERE e.nom = 'Empleado 1' AND YEAR(ccu.data) = 2023;

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica
SELECT p.nom, u.marca FROM proveidor p INNER JOIN ullere u ON u.proveidor_id = p.id INNER JOIN client_compra_ullere ccu ON u.id = ccu.ullere_id;