#!/bin/bash

#Este comando imprime la hora y saluda al usuario activo

FECHA=$(date +%a:%x)
HORA=$(date +%H)
HORAS=$(date +%X)

if [[ $HORA -eq 12 ]];
then 
    echo "Hola $USER, buenos días,la hora es $HORAS y la fecha es $FECHA";
else
    echo "Hola $USER, buenas tardes, la hora es $HORAS la fecha es $FECHA";
fi