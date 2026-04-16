DROP TABLE IF EXISTS matriculas CASCADE;

DROP TABLE IF EXISTS estudiantes CASCADE;

DROP TABLE IF EXISTS asignaturas CASCADE;

--Tabla estudiantes:
CREATE TABLE estudiantes(
    carnet NUMERIC PRIMARY KEY,
    nombre TEXT,
    apellidos TEXT,
    creditos NUMERIC
);

--Tabla asignaturas:
CREATE TABLE asignaturas(
    codigo NUMERIC PRIMARY KEY,
    nombre TEXT,
    caracter TEXT,
    creditos NUMERIC
);

--Tabla matriculas:
CREATE TABLE matriculas(
    carnet_estu NUMERIC,
    codigo_asig NUMERIC,
    nota NUMERIC,

    PRIMARY KEY (carnet_estu, codigo_asig),

    FOREIGN KEY (carnet_estu)
        REFERENCES estudiantes(carnet)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,

    FOREIGN KEY (codigo_asig)
        REFERENCES asignaturas(codigo)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);


--Carga de datos:

--Estudiantes:
COPY estudiantes (carnet, nombre, apellidos, creditos)
FROM 'C:\Datos Bases Avanzadas\datos_estudiantes.csv'
--FROM 'D:/Ficheros Bases de Datos/PL2/Matriculas/datos_estudiantes.csv'
DELIMITER ',';

--Asignaturas:
COPY asignaturas (codigo, nombre, caracter, creditos)
FROM 'C:\Datos Bases Avanzadas\datos_asignaturas.csv'
--FROM 'D:/Ficheros Bases de Datos/PL2/Matriculas/datos_asignaturas.csv'
DELIMITER ',';

--Matriculas:
COPY matriculas (carnet_estu, codigo_asig, nota)
FROM 'C:\Datos Bases Avanzadas\datos_matriculas.csv'
--FROM 'D:/Ficheros Bases de Datos/PL2/Matriculas/datos_matriculas.csv'
DELIMITER ',';