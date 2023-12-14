--@Autores       J. Miguel Arroyo Quiroz, Arturo Perez Quintana
--@Fecha         13/12/2023
--@Descripcion   Crea los usuarios

whenever sqlerror exit rollback;

Prompt Conectando como sysdba
connect sys/hola1234! as sysdba

Prompt Creando usuarios
declare
    v_count number;
    v_usersubastas varchar2(20) := 'ADMIN_SUBASTAS';
    v_userusuarios varchar2(20) := 'ADMIN_USUARIOS';
begin
    select count(*) into v_count from all_users where username=v_usersubastas;
    if v_count > 0 then
        execute immediate 'drop user' || v_usersubastas || 'cascade;';
    end if;

    select count(*) into v_count from all_users where username=v_userusuarios;
    if v_count > 0 then
        execute immediate 'drop user' || v_userusuarios || 'cascade;';
    end if;
end;
/

Prompt Creando usuario admin_subastas
create user admin_subastas identified by subastas quota unlimited on users_invitados;
grant create session, create table, create sequence, create any index, create procedure, create view, create user to admin_subastas;

Prompt Modificando su tablespace por defecto
alter user admin_subastas default tablespace subastas_tbs;

Prompt Modificando su tablespace temporal
alter user admin_subastas temporary tablespace tempts1;

Prompt Modificando su tablespace undo
alter user admin_subastas undo tablespace undots1;

Prompt Asigando quota en productos_ts
alter user admin_subastas quota unlimited on productos_ts;

Prompt Asigando quota en galeria_productos_ts
alter user admin_subastas quota unlimited on galeria_productos_ts;

Prompt Asigando quota en indices_ts
alter user admin_subastas quota unlimited on indices_ts;


Prompt Creando usuario admin_usuarios
create user admin_usuarios identified by subastas quota unlimited on users_invitados;
grant create session, create table, create sequence, create index, create procedure, create view, create user to admin_usuarios;

Prompt Modificando tablespace por defecto para admin_usuarios
alter user admin_usuarios default tablespace usuarios_tbs;

Prompt Modificando tablespace temporal para admin_usuarios
alter user admin_usuarios temporary tablespace tempts1;

Prompt Modificando tablespace undo para admin_usuarios
alter user admin_usuarios undo tablespace undots1;

Prompt Asigando quota en usuarios_tbs
alter user admin_usuarios quota unlimited on usuarios_tbs;

Prompt Asigando quota en tarjetas_tbs
alter user admin_usuarios quota unlimited on tarjetas_tbs;

Prompt Asigando quota en fotos_usuarios_tbs
alter user admin_usuarios quota unlimited on fotos_usuarios_tbs;

Prompt Asigando quota en ventas_tbs
alter user admin_usuarios quota unlimited on ventas_tbs;

Prompt Asigando quota en indices_ts
alter user admin_usuarios quota unlimited on indices_ts;

Prompt Listo!