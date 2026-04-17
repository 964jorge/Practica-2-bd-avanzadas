EXPLAIN
SELECT COUNT(*)
FROM estudiantes
WHERE creditos < 100;


SELECT MIN(creditos) AS minimo,
       MAX(creditos) AS maximo
FROM estudiantes;