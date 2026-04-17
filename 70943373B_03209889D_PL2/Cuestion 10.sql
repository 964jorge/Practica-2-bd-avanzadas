CREATE INDEX indice_musicos_grupo ON musicos(codigo_grupo_grupo);
ANALYZE musicos;

CREATE INDEX indice_grupos_concierto ON grupos_tocan_conciertos(codigo_concierto_conciertos);
ANALYZE grupos_tocan_conciertos;

CREATE INDEX indice_conciertos_pais ON conciertos(pais);
ANALYZE conciertos;

CREATE INDEX indice_entradas_precio ON entradas(precio);
ANALYZE entradas;

CREATE INDEX indice_discos_genero ON discos(genero);
ANALYZE discos;

CREATE INDEX indice_canciones_duracion ON canciones(duracion);
ANALYZE canciones;





