-- @Autores       J. Miguel Arroyo Quiroz, Arturo Perez Quintana
-- @Fecha         12/12/2023
-- @Descripcion   Creación de copias adicionales de archived redo logs y control files

whenever sqlerror exit rollback;
connect sys as sysdba;


Prompt Se crean 2 copias adicionales de archived redo logs a la FRA en sus respectivos discos
alter system set log_archive_dest_2='LOCATION=/unam-bda/ProyectoFinal/d06/app/oradata/ARPEPROY/' scope=spfile;
alter system set log_archive_dest_3='LOCATION=/unam-bda/ProyectoFinal/d07/app/oradata/ARPEPROY/' scope=spfile;

Prompt Reiniciando la instancia
shutdown immediate;
shutdown open;

-- Encontrar el control file en la FRA
-- find /unam-bda/ProyectoFinal/d08 -type f -name '*.ctl'  -exec du -h {} +
-- show parameters control_files
-- A partir de la ruta mostrada se crean copias a nivel de SO en los discos correspondientes: d01 y d02
-- Creamos un pfile a partir del spfile y editamos el parámetro control_files para agregar las nuevas rutas

Prompt Comprobando que se haya habilitado el modo archivelog
archive log list

Prompt Mostrando valor de parametro control files
show parameters control_files