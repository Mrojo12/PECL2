\pset pager off

SET client_encoding = 'UTF8';

-- BEGIN;

\echo 'Creando el esquema para la BBDD de discos'

\echo 'Creando un esquema temporal'

CREATE SCHEMA IF NOT EXISTS PL2_temp;

\echo 'Creando tablas temporales'

-- Tabla temporal de canciones
CREATE TABLE IF NOT EXISTS PL2_temp.canciones_temp (
    id_disco text,
    titulo_cancion text,
    duracion text
);

-- Tabla temporal de discos
CREATE TABLE IF NOT EXISTS PL2_temp.discos_temp (
    id_disco text,
    nombre_disco text,
    fecha_lanzamiento text,
    id_grupo text,
    nombre_grupo text,
    url_grupo text,
    generos text,
    url_portada text
);

-- Tabla temporal de ediciones
CREATE TABLE IF NOT EXISTS PL2_temp.ediciones_temp (
    id_disco text,
    ano_edicion text,
    pais_edicion text,
    formato text
);

-- Tabla temporal de usuario_desea_disco
CREATE TABLE IF NOT EXISTS PL2_temp.usuario_desea_disco_temp (
    nombre_usuario text,
    titulo_disco text,
    ano_lanzamiento_disco text
);

-- Tabla temporal de usuario_tiene_edición
CREATE TABLE IF NOT EXISTS PL2_temp.usuario_tiene_edición_temp (
    nombre_usuario text,
    titulo_disco text,
    ano_lanzamiento text,
    ano_edicion text,
    pais_edicion text,
    formato text,
    estado text
);

-- Tabla temporal de usuarios
CREATE TABLE IF NOT EXISTS PL2_temp.usuarios_temp (
    nombre_completo text,
    nombre_usuario text,
    email text,
    password text
);

SET search_path='PL2_temp';

\echo 'Cargando datos'

-- Cargamos los datos en las tablas 

\copy PL2_temp.canciones_temp FROM './datos/canciones.csv' WITH (FORMAT csv, HEADER, DELIMITER ';', NULL 'NULL', ENCODING 'UTF-8');

\copy PL2_temp.discos_temp FROM './datos/discos.csv' WITH (FORMAT csv, HEADER, DELIMITER ';', NULL 'NULL', ENCODING 'UTF-8');

\copy PL2_temp.ediciones_temp FROM './datos/ediciones.csv' WITH (FORMAT csv, HEADER, DELIMITER ';', NULL 'NULL', ENCODING 'UTF-8');

\copy PL2_temp.usuario_desea_disco_temp FROM './datos/usuario_desea_disco.csv' WITH (FORMAT csv, HEADER, DELIMITER ';', NULL 'NULL', ENCODING 'UTF-8');

\copy PL2_temp.usuario_tiene_edición_temp FROM './datos/usuario_tiene_edicion.csv' WITH (FORMAT csv, HEADER, DELIMITER ';', NULL 'NULL', ENCODING 'UTF-8');

\copy PL2_temp.usuarios_temp FROM './datos/usuarios.csv' WITH (FORMAT csv, HEADER, DELIMITER ';', NULL 'NULL', ENCODING 'UTF-8');

\echo 'Creando esquema final'

CREATE SCHEMA IF NOT EXISTS PL2_final;

\echo 'Creando tablas finales'

CREATE TABLE IF NOT EXISTS PL2_final.canciones (
    id_disco text,
    titulo_cancion text,
    duracion text
);

CREATE TABLE IF NOT EXISTS PL2_final.discos (
    id_disco text,
    nombre_disco text,
    fecha_lanzamiento text,
    id_grupo text,
    nombre_grupo text,
    url_grupo text,
    generos text,
    url_portada text
);

CREATE TABLE IF NOT EXISTS PL2_final.ediciones (
    id_disco text,
    ano_edicion text,
    pais_edicion text,
    formato text
);

CREATE TABLE IF NOT EXISTS PL2_final.usuario_desea_disco (
    nombre_usuario text,
    titulo_disco text,
    ano_lanzamiento_disco text
);

CREATE TABLE IF NOT EXISTS PL2_final.usuario_tiene_edición (
    nombre_usuario text,
    titulo_disco text,
    ano_lanzamiento text,
    ano_edicion text,
    pais_edicion text,
    formato text,
    estado text
);

CREATE TABLE IF NOT EXISTS PL2_final.usuarios (
    nombre_completo text,
    nombre_usuario text,
    email text,
    password text
);

\echo 'Insertando datos en el esquema final'

/*
INSERT INTO PL2_final.canciones 
    SELECT * 
    FROM PL2_temp.canciones_temp;

INSERT INTO PL2_final.discos
    SELECT * 
    FROM PL2_temp.discos_temp;

INSERT INTO PL2_final.ediciones
    SELECT * 
    FROM PL2_temp.ediciones_temp;

INSERT INTO PL2_final.usuario_desea_disco
    SELECT * 
    FROM PL2_temp.usuario_desea_disco_temp;

INSERT INTO PL2_final.usuario_tiene_edición 
    SELECT * 
    FROM PL2_temp.usuario_tiene_edición_temp;

INSERT INTO PL2_final.usuarios
    SELECT * 
    FROM PL2_temp.usuarios_temp;
*/

\echo Consulta 1: texto de la consulta

\echo Consulta n:

-- ROLLBACK;                       -- importante! permite correr el script multiples veces...

-- Comando de ejecución:
-- \i C:/Users/mario/Desktop/UniversidadClases/SegundoAno/BasesDeDatos/Laboratorio/PL2/plantilla.sql