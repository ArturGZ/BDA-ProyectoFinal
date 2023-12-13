-- @Autores       J. Miguel Arroyo Quiroz, Arturo Perez Quintana
-- @Fecha         12/12/2023
-- @Descripcion   Creación de la base de datos para el proyecto final BDA

Prompt Conectado como usuario SYS
connect sys as sysdba

prompt Iniciando una instancia en modo nomount
startup nomount

whenever sqlerror exit rollback;

Prompt Ejecutando la instrucción Create Database
create database arpeproy
    user sys identified by arpeproy1
    user system identified by arpeproy1
    logfile group 1(
        '',
        '/unam-bda/ProyectoFinal/d01/ARPEPROY/redo01b.log',
        '/unam-bda/ProyectoFinal/d02/ARPEPROY/redo01c.log') size 100m blocksize 512
    group 2 (
        '',
        '/unam-bda/ProyectoFinal/d01/ARPEPROY/redo02b.log',
        '/unam-bda/ProyectoFinal/d02/ARPEPROY/redo02c.log') size 100m blocksize 512
    group 3(
        '',
        '/unam-bda/ProyectoFinal/d01/ARPEPROY/redo03b.log',
        '/unam-bda/ProyectoFinal/d02/ARPEPROY/redo03c.log') size 100m blocksize 512
    maxlogfiles 9
    maxlogs members 3
    maxdatafile 1024
    character set AL32UTF8
    extent management local
    datafile '/unam-bda/ProyectoFinal/d03/ARPEPROY/system01.dbf'
        size 700m reuse autoextend on next 1024k maxsize unlimited
    sysaux datafile '/unam-bda/ProyectoFinal/d03/ARPEPROY/sysaux01.dbf'
        size 550m reuse autoextend on next 1024k maxsize unlimited
    default tablespace users
        datafile '/unam-bda/ProyectoFinal/d04/ARPEPROY/users01.dbf'
        size 500m reuse autoextend on maxsize unlimited
    default temporary tablespace tempts1
        tempfile '/unam-bda/ProyectoFinal/d03/ARPEPROY/temp01.dbf'
        size 20m reuse autoextend on next 640k maxsize unlimited
    undo tablespace undots1
        datafile '/unam-bda/ProyectoFinal/d03/ARPEPROY/undots01.dbf'
        size 200m reuse autoextend on next 512k maxsize unlimited;

Prompt Base de Datos Creada