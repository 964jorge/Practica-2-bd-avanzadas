EXPLAIN
SELECT a.nombre
FROM asignaturas a
JOIN matriculas m ON a.codigo = m.codigo_asig
JOIN estudiantes e ON e.carnet = m.carnet_estu
WHERE a.creditos = 10
AND m.nota = 7
AND e.creditos = 50;