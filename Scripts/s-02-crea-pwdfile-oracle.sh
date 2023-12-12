# @Autores       J. Miguel Arroyo Quiroz, Arturo Perez Quintana
# @Fecha         12/12/2023
# @Descripcion   Creación de archivo de passwords para el proyecto 

echo "Creando archvivo de passwords para proyecto final"
#Se debe ubicar en ${ORACLE_HOME}/dbs/orapw${ORACLE_SID}

export ORACLE_SID=arpeproy

if [ -f "${ORACLE_HOME}/dbs/orapw${ORACLE_SID}" ]; then
  read -p "El archivo existe, [enter] para sobrescribir, Ctrl+C para cancelar"
fi;

#En caso de no escribir Ctrl+C, el script continua
orapwd \
  FORCE=Y \
  FILE='${ORACLE_HOME}/dbs/orapw${ORACLE_SID}' \
  FORMAT=12.2 \
  SYS=y \
  SYSBACKUP=y \
  SYSMARKET=y 

echo "comprobando la creación del archivo"
ls -l ${ORACLE_HOME}/dbs/orapwarpeproy
