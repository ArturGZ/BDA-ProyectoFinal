--@Autores       J. Miguel Arroyo Quiroz, Arturo Perez Quintana
--@Fecha         12/12/2023
--@Descripcion   Creación de SPFILE para el proyecto a partir del pfile creado.

whenever sqlerror exit rollback;

Prompt conectando como SYS empleando archivo de passwords
connect sys as sysdba

Prompt creando un SPFILE a partir de un PFILE
create spfile from pfile;

Prompt verificando su existencia
--ejecuta un comando del sistema operativo
!ls ${ORACLE_HOME}/dbs/spfilearpeproy.ora

Prompt Listo!

--como ejecutar:
-- en una terminal con usuario admin u ordinario
-- cambiarse al directorio donde se encuentra el script
-- export ORACLE_SID=arpeproy
-- sqlplus /nolog
-- start s-04-crea-spfile-ordinario.sql
