CREATE INDEX ON canciones(codigo_disco_discos, duracion);

CREATE INDEX ON conciertos(pais, codigo_concierto);

CREATE INDEX ON entradas(codigo_concierto_conciertos, precio);

CREATE INDEX ON grupos_tocan_conciertos(codigo_grupo_grupo, codigo_concierto_conciertos);

VACUUM musicos;

ANALYZE;