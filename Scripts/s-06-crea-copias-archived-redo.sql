-- @Autores       J. Miguel Arroyo Quiroz, Arturo Perez Quintana
-- @Fecha         12/12/2023
-- @Descripcion   Creación de copias adicionales de archived redo logs

whenever sqlerror exit rollback;
connect sys as sysdba;


Prompt Se configuran 2 copias adicionales a la FRA en sus respectivos discos
alter system set log_archive_dest_2='LOCATION=/unam-bda/ProyectoFinal/d06/app/oradata/ARPEPROY/' scope=spfile;
alter system set log_archive_dest_3='LOCATION=/unam-bda/ProyectoFinal/d07/app/oradata/ARPEPROY/' scope=spfile;


Prompt Deteniendo la instancia
shutdown immediate;


Prompt Abriendo la base en modo archived
startup mount
alter database archivelog;
alter database open;


Prompt Comprobando que se haya habilitado el modo archivelog
archive log list