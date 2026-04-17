
EXPLAIN

SELECT COUNT(*)::float /(SELECT COUNT(*) FROM musicos) * 100
FROM musicos
WHERE musicos.codigo_grupo_grupo IN(

    SELECT musicos.codigo_grupo_grupo
    FROM musicos
    GROUP BY musicos.codigo_grupo_grupo
    HAVING COUNT(musicos.codigo_grupo_grupo) > 3

) AND musicos.codigo_grupo_grupo IN(

    SELECT discos.codigo_grupo_grupo
    FROM discos
    WHERE discos.genero = 'rock'
    AND EXISTS(

        SELECT 1
        FROM canciones
        WHERE canciones.duracion > 3
        AND canciones.codigo_disco_discos = discos.codigo_disco

    )

)AND musicos.codigo_grupo_grupo IN (

    SELECT grupos_tocan_conciertos.codigo_grupo_grupo
    FROM grupos_tocan_conciertos
    WHERE EXISTS(

        SELECT 1
        FROM conciertos
        WHERE conciertos.pais = 'España'
        AND conciertos.codigo_concierto = grupos_tocan_conciertos.codigo_concierto_conciertos

    )
    AND EXISTS(

        SELECT 1
        FROM entradas
        WHERE entradas.precio BETWEEN 20 AND 50
        AND grupos_tocan_conciertos.codigo_concierto_conciertos = entradas.codigo_concierto_conciertos

    )


);




