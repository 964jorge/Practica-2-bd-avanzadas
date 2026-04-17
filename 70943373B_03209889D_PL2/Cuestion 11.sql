DROP TABLE IF EXISTS musicosABorrar;

CREATE TEMP TABLE musicosABorrar AS
SELECT codigo_musico
FROM musicos
ORDER BY RANDOM()
LIMIT (SELECT floor(count(*) * 0.3) FROM musicos);

ANALYZE musicosABorrar;
ANALYZE musicos;

DELETE FROM musicos
WHERE codigo_musico IN (
    SELECT musicosABorrar.codigo_musico
    FROM musicosABorrar
);