DROP TABLE IF EXISTS Entradas CASCADE;

DROP TABLE IF EXISTS Grupos_Tocan_Conciertos CASCADE;

DROP TABLE IF EXISTS Conciertos CASCADE;

DROP TABLE IF EXISTS Canciones CASCADE;

DROP TABLE IF EXISTS Discos CASCADE;

DROP TABLE IF EXISTS Musicos CASCADE;

DROP TABLE IF EXISTS Grupo CASCADE;

--Creacion de tablas

--Grupo
CREATE TABLE Grupo (
    Codigo_grupo INTEGER PRIMARY KEY,
    Nombre TEXT,
    Genero_musical TEXT,
    Pais TEXT,
    Sitio_web TEXT
);

--Musicos
CREATE TABLE Musicos (
    Codigo_musico INTEGER PRIMARY KEY,
    DNI CHAR(10) UNIQUE,
    Nombre TEXT,
    Direccion TEXT,
    Codigo_Postal INTEGER,
    Ciudad TEXT,
    Provincia TEXT,
    Telefono BIGINT,
    Instrumentos TEXT,
    Codigo_grupo_Grupo INTEGER,
    CONSTRAINT Grupo_fk FOREIGN KEY (Codigo_grupo_Grupo)
        REFERENCES Grupo(Codigo_grupo)
        ON DELETE RESTRICT ON UPDATE RESTRICT
);

--Discos
CREATE TABLE Discos (
    Codigo_disco INTEGER PRIMARY KEY,
    Titulo TEXT,
    Fecha_edicion DATE,
    Genero TEXT,
    Formato TEXT,
    Codigo_grupo_Grupo INTEGER,
    CONSTRAINT Grupo_fk FOREIGN KEY (Codigo_grupo_Grupo)
        REFERENCES Grupo(Codigo_grupo)
        ON DELETE RESTRICT ON UPDATE RESTRICT
);


--Canciones
CREATE TABLE Canciones (
    Codigo_cancion INTEGER PRIMARY KEY,
    Nombre TEXT,
    Compositor TEXT,
    Fecha_grabacion DATE,
    Duracion INTEGER, -- en segundos
    Codigo_disco_Discos INTEGER,
    CONSTRAINT Discos_fk FOREIGN KEY (Codigo_disco_Discos)
        REFERENCES Discos(Codigo_disco)
        ON DELETE RESTRICT ON UPDATE RESTRICT
);


--Conciertos
CREATE TABLE Conciertos (
    Codigo_concierto INTEGER PRIMARY KEY,
    Fecha_realizacion DATE,
    Pais TEXT,
    Ciudad TEXT,
    Recinto TEXT
);


--Grupos_Tocan_Conciertos
CREATE TABLE Grupos_Tocan_Conciertos (
    Codigo_grupo_Grupo INTEGER,
    Codigo_concierto_Conciertos INTEGER,
    PRIMARY KEY (Codigo_grupo_Grupo, Codigo_concierto_Conciertos),
    CONSTRAINT Grupo_fk FOREIGN KEY (Codigo_grupo_Grupo)
        REFERENCES Grupo(Codigo_grupo)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT Conciertos_fk FOREIGN KEY (Codigo_concierto_Conciertos)
        REFERENCES Conciertos(Codigo_concierto)
        ON DELETE RESTRICT ON UPDATE RESTRICT
);

--Entradas
CREATE TABLE Entradas (
    Codigo_entrada INTEGER PRIMARY KEY,
    Localidad TEXT,
    Precio NUMERIC(6,2),
    Usuario TEXT,
    Codigo_concierto_Conciertos INTEGER,
    CONSTRAINT Conciertos_fk FOREIGN KEY (Codigo_concierto_Conciertos)
        REFERENCES Conciertos(Codigo_concierto)
        ON DELETE RESTRICT ON UPDATE RESTRICT
);
