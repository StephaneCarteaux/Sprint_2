-- Base de dades "Tienda"
-- Query 1
SELECT nombre FROM producto;
-- Query 2
SELECT nombre, precio FROM producto;
-- Query 3
SHOW COLUMNS FROM producto;
-- Query 4
SELECT nombre, precio, (precio * 1.09) FROM producto;
-- Query 5
SELECT nombre AS 'nom de "producto"', precio AS 'euros', (precio * 1.09) AS 'dòlars nord-americans ' FROM producto;
-- Query 6
SELECT UPPER(nombre), precio FROM producto;
-- Query 7
SELECT LOWER(nombre), precio FROM producto;
-- Query 8
SELECT nombre, UPPER(LEFT(nombre, 2)) FROM fabricante;
-- Query 9
SELECT nombre, ROUND(precio) FROM producto;
-- Query 10
SELECT nombre, FLOOR(precio) FROM producto;
-- Query 11
SELECT f.codigo FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;
-- Query 12
SELECT DISTINCT f.codigo FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;
-- Query 13
SELECT nombre FROM fabricante ORDER BY nombre ASC;
-- Query 14
SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- Query 15
SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;
-- Query 16
SELECT * FROM fabricante LIMIT 5;
-- Query 17
SELECT * FROM fabricante LIMIT 3, 2;
-- Query 18
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
-- Query 19
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
-- Query 20
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
-- Query 21
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante;
-- Query 22
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante ORDER BY f.nombre ASC;
-- Query 23
SELECT p.codigo, p.nombre, f.codigo, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
-- Query 24
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio ASC LIMIT 1;
-- Query 25
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;
-- Query 26
SELECT * FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';
-- Query 27
SELECT * FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;
-- Query 28
SELECT * FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';
-- Query 29
SELECT * FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
-- Query 30
SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE RIGHT(f.nombre, 1) = 'e';
-- Query 31
SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';
-- Query 32
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;
-- Query 33
SELECT DISTINCT f.codigo, f.nombre FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;
-- Query 34
SELECT f.nombre, p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;
-- Query 35
SELECT f.nombre, p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.nombre IS null;
-- Query 36
SELECT p.nombre FROM producto p WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Lenovo');
-- Query 37
SELECT p.* FROM producto p WHERE p.precio = (SELECT MAX(p.precio) FROM producto p WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Lenovo'));
-- Query 38
SELECT p.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo' ORDER BY p.precio DESC LIMIT 1;
-- Query 39
SELECT p.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Hewlett-Packard' ORDER BY p.precio ASC LIMIT 1;
-- Query 40
SELECT p.* FROM producto p WHERE p.precio >= (SELECT MAX(p.precio) FROM producto p WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Lenovo'));
-- Query 41
SELECT p.* FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' AND p.precio > (SELECT AVG(p.precio) FROM producto p WHERE p.codigo_fabricante = f.codigo);

-- Base de dades "Universidad"
-- Query 1
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
-- Query 2
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
-- Query 3
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
-- Query 4
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND RIGHT(nif, 1) = 'K';
-- Query 5
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
-- Query 6
SELECT per.apellido1, per.apellido2, per.nombre, dep.nombre AS 'departamento' FROM persona per INNER JOIN profesor pro ON per.id = pro.id_profesor INNER JOIN departamento dep ON dep.id = pro.id_departamento ORDER BY per.apellido1 ASC, per.apellido2 ASC, per.nombre ASC;
-- Query 7
SELECT asi.nombre, cur.anyo_inicio, cur.anyo_fin FROM asignatura asi INNER JOIN alumno_se_matricula_asignatura asma ON asi.id = asma.id_asignatura INNER JOIN persona per ON asma.id_alumno = per.id INNER JOIN curso_escolar cur ON asma.id_curso_escolar = cur.id WHERE per.nif = '26902806M';
-- Query 8
SELECT dep.nombre FROM departamento dep INNER JOIN profesor pro ON dep.id = pro.id_departamento INNER JOIN asignatura asi ON pro.id_profesor = asi.id_profesor INNER JOIN grado gra ON gra.id = asi.id_grado GROUP BY dep.nombre;
-- Query 9
SELECT per.nombre, per.apellido1, per.apellido2 FROM persona per INNER JOIN alumno_se_matricula_asignatura asma ON per.id = asma.id_alumno WHERE asma.id_curso_escolar = (SELECT id FROM curso_escolar WHERE anyo_inicio = 2018) GROUP BY per.id;

-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.
-- Query 1
SELECT dep.nombre AS 'departamento', per.apellido1, per.apellido2, per.nombre FROM persona per RIGHT JOIN profesor pro ON per.id = pro.id_profesor LEFT JOIN departamento dep ON pro.id_departamento = dep.id ORDER BY dep.nombre ASC, per.apellido1 ASC, per.apellido2 ASC, per.nombre ASC;
-- Query 2
SELECT per.apellido1, per.apellido2, per.nombre FROM persona per RIGHT JOIN profesor pro ON per.id = pro.id_profesor LEFT JOIN departamento dep ON pro.id_departamento = dep.id WHERE pro.id_departamento IS NULL;
-- Query 3
SELECT dep.nombre FROM departamento dep LEFT JOIN profesor pro ON dep.id = pro.id_departamento WHERE pro.id_departamento IS NULL;
-- Query 4
SELECT per.nombre, per.apellido1, per.apellido2 FROM persona per RIGHT JOIN profesor pro ON per.id = pro.id_profesor LEFT JOIN asignatura asi ON pro.id_profesor = asi.id_profesor WHERE asi.id_profesor IS NULL;
-- Query 5
SELECT asi.nombre FROM asignatura asi LEFT JOIN profesor pro ON asi.id_profesor = pro.id_profesor WHERE asi.id_profesor IS NULL;
-- Query 6
SELECT dep.nombre FROM departamento dep LEFT JOIN profesor pro ON dep.id = pro.id_departamento WHERE pro.id_departamento IS NULL;

-- Consultes resum:
-- Query 1
SELECT COUNT(*) FROM persona WHERE tipo = 'alumno';
-- Query 2
SELECT COUNT(*) FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
-- Query 3
SELECT dep.nombre AS 'departamento', COUNT(pro.id_departamento) AS 'numero de profesor' FROM departamento dep RIGHT JOIN profesor pro ON dep.id = pro.id_departamento GROUP BY dep.nombre ORDER BY COUNT(pro.id_departamento) DESC;
-- Query 4
SELECT dep.nombre AS 'departamento', COUNT(pro.id_departamento) AS 'numero de profesor' FROM departamento dep LEFT JOIN profesor pro ON dep.id = pro.id_departamento GROUP BY dep.nombre;
-- Query 5
SELECT gra.nombre AS 'grados', COUNT(asi.id) AS 'numero asignaturas' FROM grado gra LEFT JOIN asignatura asi ON gra.id = asi.id_grado GROUP BY gra.nombre ORDER BY COUNT(asi.id) DESC;
-- Query 6
SELECT gra.nombre AS 'grados', COUNT(asi.id) AS 'numero asignaturas' FROM grado gra LEFT JOIN asignatura asi ON gra.id = asi.id_grado GROUP BY gra.nombre HAVING COUNT(asi.id) > 40;
-- Query 7
SELECT gra.nombre AS 'grados', asi.tipo, SUM(asi.creditos) AS 'numero creditos' FROM grado gra RIGHT JOIN asignatura asi ON gra.id = asi.id_grado GROUP BY gra.nombre, asi.tipo;
-- Query 8
SELECT cur.anyo_inicio AS 'año inicio', COUNT(asma.id_alumno) AS 'numero alumnos' FROM curso_escolar cur LEFT JOIN alumno_se_matricula_asignatura asma ON cur.id = asma.id_curso_escolar GROUP BY cur.id;
-- Query 9
SELECT pro.id_profesor, per.nombre, per.apellido1, per.apellido2, COUNT(asi.id) AS 'numero asignaturas' FROM profesor pro LEFT JOIN asignatura asi ON pro.id_profesor = asi.id_profesor LEFT JOIN persona per ON pro.id_profesor = per.id GROUP BY pro.id_profesor ORDER BY COUNT(asi.id) DESC;
-- Query 10
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
-- Query 11
SELECT per.nombre, per.apellido1, per.apellido2 FROM persona per RIGHT JOIN profesor pro ON pro.id_profesor = per.id LEFT JOIN asignatura asi ON pro.id_profesor = asi.id_profesor WHERE asi.id IS NULL;