#!/bin/bash
# @Autores       J. Miguel Arroyo Quiroz, Arturo Perez Quintana
# @Fecha         12/12/2023
# @Descripcion   Crea archivo de parámetros PFILE habilitando FRA y modo Archived

echo "Creando archivo de parámetros"
export ORACLE_SID=arpeproy
pfile=$ORACLE_HOME/bds/init${ORACLE_SID}.ora

if [ -f "${pfile}" ]; then
    read -p "El archivo ${pfile} ya existe,, [Enter] para sobreescribir"
fi;

echo \
"db_name='${ORACLE_SID}'
memory_target = 2024M
db_recovery_file_dest_size = 2252M
db_recovery_file_dest = /unam-bda/ProyectoFinal/d08
db_flashback_retention_target = 60
log_archive_max_processes = 4
log_archive_format = arch_%t_%s_%r.arc
log_archive_trace = 12
log_archive_dest_1= 'LOCATION = USE_DB_RECOVERY_FILE_DEST MANDATORY'
log_archive_min_succeed_dest = 1
" > $pfile

echo "Listo!"
echo "Comprobando la existencia y contenido del PFILE"
echo ""
cat $pfile