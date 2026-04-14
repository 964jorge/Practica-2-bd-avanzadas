--Carga de Datos

--Grupo
COPY Grupo (Codigo_grupo, Nombre, Genero_musical, Pais, Sitio_web)
FROM 'D:/Ficheros Bases de Datos/PL2/Musicos/Grupo.csv'
DELIMITER ',';

--Conciertos
COPY Conciertos (Codigo_concierto, Fecha_realizacion, Pais, Ciudad, Recinto)
FROM 'D:/Ficheros Bases de Datos/PL2/Musicos/Conciertos.csv'
DELIMITER ',';

--Musicos
COPY Musicos (Codigo_musico, DNI, Nombre, Direccion, Codigo_Postal, Ciudad, Provincia, Telefono, Instrumentos, Codigo_grupo_Grupo)
FROM 'D:/Ficheros Bases de Datos/PL2/Musicos/Musicos.csv'
DELIMITER ',';

--Discos
COPY Discos (Codigo_disco, Titulo, Fecha_edicion, Genero, Formato, Codigo_grupo_Grupo)
FROM 'D:/Ficheros Bases de Datos/PL2/Musicos/Discos.csv'
DELIMITER ',';

--Canciones
COPY Canciones (Codigo_cancion, Nombre, Compositor, Fecha_grabacion, Duracion, Codigo_disco_Discos)
FROM 'D:/Ficheros Bases de Datos/PL2/Musicos/Canciones.csv'
DELIMITER ',';

--Grupos_Tocan_Conciertos (Relacion Grupos-Conciertos)
COPY Grupos_Tocan_Conciertos (Codigo_grupo_Grupo, Codigo_concierto_Conciertos)
FROM 'D:/Ficheros Bases de Datos/PL2/Musicos/Grupos_Tocan_Conciertos.csv'
DELIMITER ',';

--Entradas
COPY Entradas (Codigo_entrada, Localidad, Precio, Usuario, Codigo_concierto_Conciertos)
FROM 'D:/Ficheros Bases de Datos/PL2/Musicos/Entradas.csv'
DELIMITER ',';

