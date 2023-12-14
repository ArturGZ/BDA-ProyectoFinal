--@Autores       J. Miguel Arroyo Quiroz, Arturo Perez Quintana
--@Fecha         13/12/2023
--@Descripcion   Crea los tablespaces

whenever sqlerror exit rollback;
connect sys/hola1234! as sysdba;

-- Ejecutar primero s-14-0-crea-wallet.sql para habilitar la encriptacion de TS tarjetas

declare
  v_count number;
  v_tablespace1 varchar2(30) := 'SUBASTAS_TABLAS_TBS';
  v_tablespace2 varchar2(30) := 'SUBASTAS_BLOB_TBS';
  v_tablespace3 varchar2(30) := 'SUBASTAS_INDICES_TBS';
  v_tablespace4 varchar2(30) := 'USUARIOS_TABLAS_TBS';
  v_tablespace5 varchar2(30) := 'USUARIOS_BLOB_TBS';
  v_tablespace6 varchar2(30) := 'USUARIOS_INDICES_TBS';
  v_tablespace7 varchar2(30) := 'USUARIOS_TARJETAS_TBS';
  v_tablespace8 varchar2(30) := 'USUARIOS_TEMP_TBS';
begin
  select count(*) into v_count from dba_tablespaces where tablespace_name=v_tablespace1;
  if v_count > 0 then
    execute immediate 'drop tablespace '||v_tablespace1||' including contents and datafiles';
  end if;
  select count(*) into v_count from dba_tablespaces where tablespace_name=v_tablespace2;
  if v_count > 0 then
    execute immediate 'drop tablespace '||v_tablespace2||' including contents and datafiles';
  end if;
  select count(*) into v_count from dba_tablespaces where tablespace_name=v_tablespace3;
  if v_count > 0 then
    execute immediate 'drop tablespace '||v_tablespace3||' including contents and datafiles';
  end if;
  select count(*) into v_count from dba_tablespaces where tablespace_name=v_tablespace4;
  if v_count > 0 then
    execute immediate 'drop tablespace '||v_tablespace4||' including contents and datafiles';
  end if;
  select count(*) into v_count from dba_tablespaces where tablespace_name=v_tablespace5;
  if v_count > 0 then
    execute immediate 'drop tablespace '||v_tablespace5||' including contents and datafiles';
  end if;
  select count(*) into v_count from dba_tablespaces where tablespace_name=v_tablespace6;
  if v_count > 0 then
    execute immediate 'drop tablespace '||v_tablespace6||' including contents and datafiles';
  end if;
  select count(*) into v_count from dba_tablespaces where tablespace_name=v_tablespace7;
  if v_count > 0 then
    execute immediate 'drop tablespace '||v_tablespace7||' including contents and datafiles';
  end if;
  select count(*) into v_count from dba_tablespaces where tablespace_name=v_tablespace8;
  if v_count > 0 then
    execute immediate 'drop tablespace '||v_tablespace8||' including contents and datafiles';
  end if;

end;
/



prompt Creando tablespaces del módulo subastas
prompt Se crea tablespace para tablas
create tablespace subastas_tablas_tbs
  datafile '/unam-bda/ProyectoFinal/d04/ARPEPROY/subastas_tablas.dbf' size 300m
    autoextend off
  extent management local autoallocate
  segment space management auto
  blocksize 8192;

prompt Se crea tablespace para blobs
create bigfile tablespace subastas_blob_tbs
  datafile '/unam-bda/ProyectoFinal/d05/ARPEPROY/subastas_blob.dbf' size 2g
    autoextend off
  extent management local autoallocate
  segment space management auto
  blocksize 8192;

prompt Se crea tablespace para indices
create tablespace subastas_indices_tbs
  datafile '/unam-bda/ProyectoFinal/d04/ARPEPROY/indices_tablas.dbf' size 70m
    autoextend off
  extent management local autoallocate
  segment space management auto
  blocksize 8192;




prompt Creando tablespaces del módulo usuarios
prompt Se crea tablespace para tablas
create tablespace usuarios_tablas_tbs
  datafile '/unam-bda/ProyectoFinal/d04/ARPEPROY/usuarios_tablas.dbf' size 300m
    autoextend off
  extent management local autoallocate
  segment space management auto
  blocksize 8192;

prompt Se crea tablespace para índices
create bigfile tablespace usuarios_blob_tbs
  datafile '/unam-bda/ProyectoFinal/d05/ARPEPROY/usuarios_blob.dbf' size 1g
    autoextend off
  extent management local autoallocate
  segment space management auto
  blocksize 8192;

prompt Se crea tablespace para índices
create tablespace usuarios_indices_tbs
  datafile '/unam-bda/ProyectoFinal/d04/ARPEPROY/usuarios_indices.dbf' size 70m
    autoextend off
  extent management local autoallocate
  segment space management auto
  blocksize 8192;

prompt Se crea tablespace para tarjetas
create tablespace usuarios_tarjetas_tbs
  datafile '/unam-bda/ProyectoFinal/d04/ARPEPROY/usuarios_tarjetas.dbf' size 80m
    autoextend off
  extent management local autoallocate
  segment space management auto
  blocksize 8192;

prompt Se crea tablespace temporal
create temporary tablespace usuarios_temp_tbs
  tempfile '/unam-bda/ProyectoFinal/d03/ARPEPROY/temp1.dbf' size 200m
    reuse autoextend on next 10m maxsize 512m blocksize 8192
  blocksize 8192
  encryption using 'aes256' encrypt;


-- Para activar retention guarantee:
-- alter tablespace usuarios_temp_tbs retention guarantee;