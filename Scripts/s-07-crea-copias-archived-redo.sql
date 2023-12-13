-- @Autores       J. Miguel Arroyo Quiroz, Arturo Perez Quintana
-- @Fecha         12/12/2023
-- @Descripcion   Creación de copias adicionales de archived redo logs y control files

whenever sqlerror exit rollback;
connect sys as sysdba;


Prompt Se crean 2 copias adicionales de archived redo logs a la FRA en sus respectivos discos
alter system set log_archive_dest_2='LOCATION=/unam-bda/ProyectoFinal/d06/ARPEPROY' scope=spfile;
alter system set log_archive_dest_3='LOCATION=/unam-bda/ProyectoFinal/d07/ARPEPROY' scope=spfile;

Prompt Reiniciando la instancia
shutdown immediate;
shutdown open;

Prompt Comprobando que se haya habilitado el modo archivelog
archive log list