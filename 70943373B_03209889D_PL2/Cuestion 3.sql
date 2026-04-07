ANALYZE;

SELECT *
FROM pg_stats
WHERE tablename IN ('estudiantes','asignaturas','matriculas');