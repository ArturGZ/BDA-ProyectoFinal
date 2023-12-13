--@Autor:	Miguel Arroyo
--@Fecha:	13/12/2023
--@Descripción:	Configuración necesaria para conectar en modo compartido y pool de conexiones

whenever sqlerror exit rollback;

Prompt Conectando como sysdba
connect sys as sysdba

Prompt Creando copia de seguridad del spfile
create pfile='/home/oracle/backups/pfilearpeproy-respaldo2-conexiones.ora' from spfile;

Prompt Configurando el dominio de la base de datos
alter system set db_domain='fi.unam' scope=spfile;

Prompt Configurando instancia en modo compartido
alter system set shared_servers=4 scope=spfile;
alter system set dispatchers='(dispatchers=4)(protocol=tcp)' scope=spfile;

Prompt Actualizando configuración del listener
alter system register;

Prompt Iniciando un nuevo connection pool
exec dbms_connection_pool.start_pool();

Prompt Configurando connection pool
exec dbms_connection_pool.alter_param ('','MAXSIZE','50');
exec dbms_connection_pool.alter_param ('','MINSIZE','32');

Prompt Configurando otros parametros del connection pool
exec dbms_connection_pool.alter_param ('','INACTIVITY_TIMEOUT','1800');
exec dbms_connection_pool.alter_param ('','MAX_THINK_TIME','1800');

Prompt Actualizando configuración del listener
alter system register;