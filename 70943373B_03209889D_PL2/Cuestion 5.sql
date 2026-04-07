EXPLAIN
SELECT e.nombre
FROM estudiantes e
JOIN matriculas m ON e.carnet = m.carnet_estu
WHERE e.creditos = 150 AND m.nota >= 5
GROUP BY e.carnet, e.nombre
HAVING COUNT(m.codigo_asig) >= 3;