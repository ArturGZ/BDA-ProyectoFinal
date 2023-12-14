--@Autores       J. Miguel Arroyo Quiroz, Arturo Perez Quintana
--@Fecha         14/12/2023
--@Descripcion   Crea wallet para keystore

-- Importante ejecutar script antes de s-14-crea-tablespaces.sql

whenever sqlerror exit rollback;
connect sys/hola1234! as sysdba;

Prompt Creando keystore
administer key management create keystore '/unam-bda/ProyectoFinal/d10/ARPEPROY' identified by "keystore_pass";

Prompt Para abrir el keystore
administer key management set keystore open identified by "keystore_pass"

Prompt habilitando TDE
alter system set encryption key authenticated by "keystore_pass";

--alter system set encryption key identified by "pass123";

shutdown immediate;
startup;

Prompt consultando resultados
select * from v$encryption_wallet;
select * from v$encryption_keys;