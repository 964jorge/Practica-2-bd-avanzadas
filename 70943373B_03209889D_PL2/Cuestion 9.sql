--Cuestión 9: Realizar una consulta SQL que muestre el porcentaje de músicos que
--realizan conciertos en España teniendo entradas cuyo precio varía entre 20 y 50
--euros, y además tienen discos de género ‘rock’ con alguna canción de más de 3
--minutos, y son grupos de más de 3 componentes. Dibujar el diagrama con el
--resultado del comando EXPLAIN en forma de árbol de álgebra relacional. Explicar la
--información obtenida en el plan de ejecución de postgreSQL. Comparar el árbol
--obtenido por nosotros al traducir la consulta original al álgebra relacional y el que
--obtiene postgreSQL. Comentar las posibles diferencias entre ambos árboles.



SELECT COUNT(*)/(SELECT COUNT(*) FROM musicos) * 100
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




