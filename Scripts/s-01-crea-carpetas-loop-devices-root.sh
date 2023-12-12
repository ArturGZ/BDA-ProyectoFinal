# @Autores       J. Miguel Arroyo Quiroz, Arturo Perez Quintana
# @Fecha         11/12/2023
# @Descripcion   Creación de loop devices y carpetas empleadas en el proyecto final de BDA 2024-1

echo "Creando directorio para disk-images"
mkdir /unam-bda/ProyectoFinal
mkdir /unam-bda/ProyectoFinal/disk-images

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
#Redo Log 1
mkdir /unam-bda/ProyectoFinal/d01
#Redo Log 2
mkdir /unam-bda/ProyectoFinal/d02

#Agregar las siguientes líneas al final del archivo /etc/fstab
#/unam-bda/ProyectoFinal/disk-images/diskProy1.img /unam-bda/ProyectoFinal/d01 auto loop 0 0
#/unam-bda/ProyectoFinal/disk-images/diskProy2.img /unam-bda/ProyectoFinal/d02 auto loop 0 0

echo "Creando el resto de directorios empleados en el proyecto"
#Data Files 1
mkdir /unam-bda/ProyectoFinal/d03
#Data Files 2
mkdir /unam-bda/ProyectoFinal/d04
#Data File Elementos Tipo Blob
mkdir /unam-bda/ProyectoFinal/d05
#Archived Redo Log 1
mkdir /unam-bda/ProyectoFinal/d06
#Archived Redo Log 2
mkdir /unam-bda/ProyectoFinal/d07
#FRA
mkdir /unam-bda/ProyectoFinal/d08
#Backups 1
mkdir /unam-bda/ProyectoFinal/d09
#Backups 2
mkdir /unam-bda/ProyectoFinal/d10