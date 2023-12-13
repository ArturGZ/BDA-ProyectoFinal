#!/bin/bash
# @Autores       J. Miguel Arroyo Quiroz, Arturo Perez Quintana
# @Fecha         12/12/2023
# @Descripcion   Multiplexamos control files

Promt creamos PFILE a partil de SPFILE (respaldo por seguridad)
create pfile='/unam-bda/respaldos/resplado-spfile-archive.txt'
    from spfile;

# Encontrar el control file en la FRA con el comando:
# find /unam-bda/ProyectoFinal/d08 -type f -name '*.ctl'  -exec du -h {} +
# show parameters control_files
# A partir de la ruta mostrada se crean copias a nivel de SO en los discos correspondientes: d01 y d02
# Creamos un pfile a partir del spfile y editamos el parámetro control_files para agregar las nuevas rutas 

#  SUSTITUIR POR EL NOMBRE
Prompt Copiando control file a partir de la copia en la FRA:
cp /unam-bda/ProyectoFinal/d08/ARPEPROY/controlfile/o1_mf_lqlhd62x_.ctl /unam-bda/ProyectoFinal/d01/ARPEPROY/controlf02.ctl
cp /unam-bda/ProyectoFinal/d08/ARPEPROY/controlfile/o1_mf_lqlhd62x_.ctl /unam-bda/ProyectoFinal/d02/ARPEPROY/controlf03.ctl

Prompt Ejecuta en sqlplus comando para agregar copias de control files con las rutas:
Prompt /unam-bda/ProyectoFinal/d01/ARPEPROY/controlf02.ctl
Prompt /unam-bda/ProyectoFinal/d02/ARPEPROY/controlf03.ctl
read - p "Presiona entre para continuar "

Prompt Verificar valor de parametro control files con comando en sqlplus:
Prompt show parameters control_files