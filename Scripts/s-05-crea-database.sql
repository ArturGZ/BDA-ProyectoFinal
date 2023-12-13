-- @Autores       J. Miguel Arroyo Quiroz, Arturo Perez Quintana
-- @Fecha         12/12/2023
-- @Descripcion   Creación de la base de datos para el proyecto final BDA

-- ORACLE_SID=arpeproy

Prompt Conectado como usuario SYS
connect sys/hola1234! as sysdba

Prompt Iniciando una instancia en modo nomount
startup nomount

whenever sqlerror exit rollback;

Prompt Ejecutando la instrucción Create Database

create database arpeproy
    user sys identified by arpeproy
    user system identified by arpeproy
    logfile group 1 size 50m blocksize 512,
    group 2 size 50m blocksize 512,
    group 3 size 50m blocksize 512
    maxloghistory 1
    maxlogfiles 9
    maxlogmembers 3
    maxdatafiles 1024
    character set AL32UTF8
    national character set AL16UTF16
    extent management local
    datafile '/unam-bda/ProyectoFinal/d03/ARPEPROY/system01.dbf'
        size 300m reuse autoextend on next 1024k maxsize unlimited
    sysaux datafile '/unam-bda/ProyectoFinal/d03/ARPEPROY/sysaux01.dbf'
        size 250m reuse autoextend on next 1024k maxsize unlimited
    default tablespace users_invitados
        datafile '/unam-bda/ProyectoFinal/d04/ARPEPROY/users01.dbf'
            size 200m reuse autoextend off
    default temporary tablespace tempts1 blocksize 8192
        tempfile '/unam-bda/ProyectoFinal/d03/ARPEPROY/temp01.dbf'
        size 70m reuse autoextend on next 10m maxsize 512m blocksize 8192
    undo tablespace undots1
        datafile '/unam-bda/ProyectoFinal/d03/ARPEPROY/undots01.dbf'
        size 250m reuse autoextend off blocksize 8192;

Prompt Base de Datos Creada!!
