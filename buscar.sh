#!/bin/bash
UBI=$(pwd)
read -p "Escriba el nombre del archivo a buscar: " n1
read -p "Escriba el nombre de la carpeta: " n2
if ls $n2 | egrep $n1
then 
    echo "Su archivo: $n1 se encuentra en $UBI/$n2"
else 
    echo "No se encontro el archivo en la ruta $UBI"
fi 