#!/bin/bash
#sudo apt install hwinfo
# Este comando muestra la RAM, la arquitectura del sistema y la versión del SO
trap '' 2 && trap "" TSTP #evita la salida con ctrl+C y ctrl+Z

printf "\n*******INFORMACIÓN DEL SISTEMA******\n";
printf "\n------------Memoria RAM-------------\n";
#se instalo hwinfo para saber toda la información del hardware
#la bandera de se filtra la información para solo desplegar información específica
#se usa grep para encontrar la palabra clave
#con cut se corta el texto para desplegar el dato necesario
echo "                $(hwinfo --memory | grep "Memory Size" | cut -c16-)";
printf "\n------Arquitectura del Sistema------\n";
echo "                $(hwinfo --arch | grep "Arch" | cut -c 7-12)";
printf "\n-----------Versión del SO-----------\n";
echo "                $(hwinfo | more | grep "kernel version" | cut -c18-)";