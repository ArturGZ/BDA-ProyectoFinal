--@Autores       J. Miguel Arroyo Quiroz, Arturo Perez Quintana
--@Fecha         13/12/2023
--@Descripcion   Crea los tablespaces
whenever sqlerror exit rollback;
connect sys/hola1234! as sysdba;

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
    execute immediate 'drop tablespace '||v_tablespace1||' including contents and datafiles;';
  end if;
  select count(*) into v_count from dba_tablespaces where tablespace_name=v_tablespace2;
  if v_count > 0 then
    execute immediate 'drop tablespace '||v_tablespace2||' including contents and datafiles;';
  end if;
  select count(*) into v_count from dba_tablespaces where tablespace_name=v_tablespace3;
  if v_count > 0 then
    execute immediate 'drop tablespace '||v_tablespace3||' including contents and datafiles;';
  end if;
  select count(*) into v_count from dba_tablespaces where tablespace_name=v_tablespace4;
  if v_count > 0 then
    execute immediate 'drop tablespace '||v_tablespace4||' including contents and datafiles;';
  end if;
  select count(*) into v_count from dba_tablespaces where tablespace_name=v_tablespace5;
  if v_count > 0 then
    execute immediate 'drop tablespace '||v_tablespace5||' including contents and datafiles;';
  end if;
  select count(*) into v_count from dba_tablespaces where tablespace_name=v_tablespace6;
  if v_count > 0 then
    execute immediate 'drop tablespace '||v_tablespace6||' including contents and datafiles;';
  end if;
  select count(*) into v_count from dba_tablespaces where tablespace_name=v_tablespace7;
  if v_count > 0 then
    execute immediate 'drop tablespace '||v_tablespace7||' including contents and datafiles;';
  end if;
  select count(*) into v_count from dba_tablespaces where tablespace_name=v_tablespace8;
  if v_count > 0 then
    execute immediate 'drop tablespace '||v_tablespace8||' including contents and datafiles;';
  end if;

end;
/



prompt Creando tablespaces del MÓDULO 1 - USUARIOS
prompt Se crea tablespace para índices
create tablespace usuarios_indices
  datafile '/unam-bda/proyecto/m1/d01/app/oracle/oradata/PROYBDA3/u_indices.dbf' size 40m
    autoextend off
  extent management local autoallocate
  segment space management auto
  blocksize 8192;


prompt Se crea tablespace para blobs
create bigfile tablespace usuarios_blobs
  datafile '/unam-bda/proyecto/m1/d04/app/oracle/oradata/PROYBDA3/u_blobs.dbf' size 1g
    autoextend off
  extent management local autoallocate
  segment space management auto
  blocksize 8192;


prompt Creando tablespaces del MÓDULO 2 - PRESTAMOS
prompt Se crea tablespace para índices
create tablespace prestamos_indices
  datafile '/unam-bda/proyecto/m2/d01/app/oracle/oradata/PROYBDA3/p_indices.dbf' size 70m
    autoextend off
  extent management local autoallocate
  segment space management auto
  blocksize 8192;

prompt Se crea tablespace para tablas y datos de los registros
create tablespace prestamos_tablas
  datafile 
    '/unam-bda/proyecto/m2/d02/app/oracle/oradata/PROYBDA3/p_tablas.dbf' size 150m autoextend off,
    '/unam-bda/proyecto/m2/d03/app/oracle/oradata/PROYBDA3/p_tablas.dbf' size 150m autoextend off
  extent management local autoallocate
  segment space management auto
  blocksize 8192;

prompt Se crea tablespace para blobs
create bigfile tablespace prestamos_blobs
  datafile '/unam-bda/proyecto/m2/d04/app/oracle/oradata/PROYBDA3/p_blobs.dbf' size 1536m
    autoextend off
  extent management local autoallocate
  segment space management auto
  blocksize 8192;
  
prompt Creando temporary tablespace
create temporary tablespace prestamos_temp
  tempfile '/unam-bda/proyecto/m2/d01/app/oracle/oradata/PROYBDA3/p_temp.dbf' size 90m
    reuse
    autoextend on next 10m maxsize 140m
  blocksize 8192;