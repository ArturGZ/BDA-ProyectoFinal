-- @Autores       J. Miguel Arroyo Quiroz, Arturo Perez Quintana
-- @Fecha         12/12/2023
-- @Descripcion   Creación del diccionario de datos para el Proyecto Final

Prompt Conectando como sys
connect sys as sysdba

@?/rdbms/admin/catalog.sql
@?/rdbms/admin/catproc.sql
@?/rdbms/admin/utlrp.sql

Prompt Ejecutar el siguiente script como system
connect system
@?/sqlplus/admin/pupbld.sql

Prompt Listo!