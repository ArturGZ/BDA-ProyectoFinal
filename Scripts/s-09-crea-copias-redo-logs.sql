--@Autores       J. Miguel Arroyo Quiroz, Arturo Perez Quintana
--@Fecha         13/12/2023
--@Descripcion   Agrega miembros a los grupos de redo logs

whenever sqlerror exit rollback;
connect sys/hola1234! as sysdba;

Prompt Agregando 2 miembros al grupo 1
alter database
    add logfile member '/unam-bda/ProyectoFinal/d01/ARPEPROY/redo01b.log' to group 1;

alter database
    add logfile member '/unam-bda/ProyectoFinal/d02/ARPEPROY/redo01c.log' to group 1;

Prompt Agregando 2 miembros al grupo 2
alter database
    add logfile member '/unam-bda/ProyectoFinal/d01/ARPEPROY/redo02b.log' to group 2;

alter database
    add logfile member '/unam-bda/ProyectoFinal/d02/ARPEPROY/redo02c.log' to group 2;

Prompt Agregando 2 miembros al grupo 3
alter database
    add logfile member '/unam-bda/ProyectoFinal/d01/ARPEPROY/redo03b.log' to group 3;

alter database
    add logfile member '/unam-bda/ProyectoFinal/d01/ARPEPROY/redo03c.log' to group 3;

Prompt Realizando un log switch
alter system switch logfile;

Prompt Realizando un checkpoint
alter system checkpoint;