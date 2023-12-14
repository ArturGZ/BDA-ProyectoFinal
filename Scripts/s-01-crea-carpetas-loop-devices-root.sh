# @Autores       J. Miguel Arroyo Quiroz, Arturo Perez Quintana
# @Fecha         11/12/2023
# @Descripcion   Creación de loop devices y carpetas empleadas en el proyecto final de BDA 2024-1

export ORACLE_SID=arpeproy

echo "Creando directorio para disk-images"
#disk-image
if [ -d "/unam-bda/ProyectoFinal/disk-images" ]; then
	echo "Directorio de data files del e-market ya existe"
else
    mkdir -p /unam-bda/ProyectoFinal/disk-images
fi;

echo "Ingresando al directorio creado"
cd /unam-bda/ProyectoFinal/disk-images

echo "Creando archivos binarios"
#diskProy1.img
dd if=/dev/zero of=diskProy1.img bs=100M count=10
#diskProy2.img
dd if=/dev/zero of=diskProy2.img bs=100M count=10

echo "Comprobando su creación"
du -sh diskProy*.img

echo "Creando loop device para cada disk-image"
losetup -fP diskProy1.img
losetup -fP diskProy2.img

echo "Confirmando la creación de los loop devices"
losetup -a

echo "Dando formato ext4 a los nuevos dispositivos"
mkfs.ext4 diskProy1.img
mkfs.ext4 diskProy2.img

echo "Creando los directorios donde los dispositivos serán montados"
echo "Creando el directorio para los redo logs 1"
#Redo Log 1
if [ -d "/unam-bda/ProyectoFinal/d01" ]; then
	echo "Directorio de redo logs 1 ya existe"
else
    mkdir /unam-bda/ProyectoFinal/d01
    cd /unam-bda/ProyectoFinal/d01
    mkdir -p ARPEPROY
    chown -R oracle:oinstall ARPEPROY
    chmod -R 750 ARPEPROY
fi;

echo "Creando el directorio para los redo logs 2"
#Redo Log 2
if [ -d "/unam-bda/ProyectoFinal/d02" ]; then
	echo "Directorio de redo logs 2 ya existe"
else
    mkdir /unam-bda/ProyectoFinal/d02
    cd /unam-bda/ProyectoFinal/d02
    mkdir -p ARPEPROY
    chown -R oracle:oinstall ARPEPROY
    chmod -R 750 ARPEPROY
fi;

#Agregar las siguientes líneas al final del archivo /etc/fstab
#/unam-bda/ProyectoFinal/disk-images/diskProy1.img /unam-bda/ProyectoFinal/d01 auto loop 0 0
#/unam-bda/ProyectoFinal/disk-images/diskProy2.img /unam-bda/ProyectoFinal/d02 auto loop 0 0

echo "Creando el resto de directorios empleados en el proyecto"

echo "Creando el directorio para Data File del Sistema"
#Data Files 1
if [ -d "/unam-bda/ProyectoFinal/d03" ]; then
	echo "Directorio de data files del sistema ya existe"
else
    mkdir /unam-bda/ProyectoFinal/d03
    cd /unam-bda/ProyectoFinal/d03
    mkdir -p ARPEPROY
    chown -R oracle:oinstall ARPEPROY
    chmod -R 750 ARPEPROY
fi;

echo "Creando el directorio para Data File del e-market"
#Data Files 2
if [ -d "/unam-bda/ProyectoFinal/d04" ]; then
	echo "Directorio de data files del e-market ya existe"
else
    mkdir /unam-bda/ProyectoFinal/d04
    cd /unam-bda/ProyectoFinal/d04
    mkdir -p ARPEPROY
    chown -R oracle:oinstall ARPEPROY
    chmod -R 750 ARPEPROY
fi;

echo "Creando el directorio para Data File de elementos tipo blob"
#Data File Elementos Tipo Blob
if [ -d "/unam-bda/ProyectoFinal/d05" ]; then
	echo "Directorio de data files de elementos tipo blob ya existe"
else
    mkdir /unam-bda/ProyectoFinal/d05
    cd /unam-bda/ProyectoFinal/d05
    mkdir -p ARPEPROY
    chown -R oracle:oinstall ARPEPROY
    chmod -R 750 ARPEPROY
fi;

echo "Creando el directorio para Archived Redo Logs 1"
#Archived Redo Log 1
if [ -d "/unam-bda/ProyectoFinal/d06" ]; then
	echo "Directorio de Archived Redo Logs 1 ya existe"
else
    mkdir /unam-bda/ProyectoFinal/d06
    cd /unam-bda/ProyectoFinal/d06
    mkdir -p ARPEPROY
    chown -R oracle:oinstall ARPEPROY
    chmod -R 750 ARPEPROY
fi;

echo "Creando el directorio para Archived Redo Logs 2"
#Archived Redo Log 1
if [ -d "/unam-bda/ProyectoFinal/d07" ]; then
	echo "Directorio de Archived Redo Logs 2 ya existe"
else
    mkdir /unam-bda/ProyectoFinal/d07
    cd /unam-bda/ProyectoFinal/d07
    mkdir -p ARPEPROY
    chown -R oracle:oinstall ARPEPROY
    chmod -R 750 ARPEPROY
fi;

echo "Creando el directorio para la FRA"
#FRA
if [ -d "/unam-bda/ProyectoFinal/d08" ]; then
	echo "Directorio de la FRA ya existe"
else
    mkdir /unam-bda/ProyectoFinal/d08
    cd /unam-bda/ProyectoFinal/d08
    mkdir -p ARPEPROY
    chown -R oracle:oinstall ARPEPROY
    chmod -R 750 ARPEPROY
fi;

echo "Creando el directorio para Backups 1"
#Backups 1
if [ -d "/unam-bda/ProyectoFinal/d09" ]; then
	echo "Directorio de Backups 1 ya existe"
else
    mkdir /unam-bda/ProyectoFinal/d09
    cd /unam-bda/ProyectoFinal/d09
    mkdir -p ARPEPROY/backups
    chown -R oracle:oinstall ARPEPROY
    chmod -R 750 ARPEPROY
fi;

echo "Creando el directorio para Backups 2"
#Backups 2
if [ -d "/unam-bda/ProyectoFinal/d10" ]; then
	echo "Directorio de Backups 2 ya existe"
else
    mkdir /unam-bda/ProyectoFinal/d10
    cd /unam-bda/ProyectoFinal/d10
    mkdir -p ARPEPROY/backups
    chown -R oracle:oinstall ARPEPROY
    chmod -R 750 ARPEPROY
fi;

echo "Mostrando directorios para Proyecto Final"
ls -l /unam-bda/ProyectoFinal/d*