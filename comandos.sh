#!/bin/bash
amarillo="\e[1;33m"
rojo="\e[1;31m"
azul="\e[1;34m"
verde="\e[1;32m"
r="\e[0m"
case $1 in
	"infosis") 
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
	;;
	"buscar")
		UBI=$(pwd)
read -p "Escriba el nombre del archivo a buscar: " n1
read -p "Escriba el nombre de la carpeta: " n2
if ls $n2 | egrep $n1
then
    echo "Su archivo: $n1 se encuentra en $UBI/$n2"
else
    echo "No se encontro el archivo en la ruta $UBI"
fi

     ;;
	"fecha")
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

	;;

	"ayuda" )
	amarillo="\e[1;33m"
rojo="\e[1;31m"
azul="\e[1;34m"
verde="\e[1;32m"
r="\e[0m"
echo -e  "
   __  ___   ____   _  __  __  __        ___    ____        ___    ___  __  __  __  __   ___    ___ 
  /  |/  /  / __/  / |/ / / / / /       / _ \  / __/       / _ |  / _ \ \ \/ / / / / /  / _ \  / _ |
 / /|_/ /  / _/   /    / / /_/ /       / // / / _/        / __ | / // /  \  / / /_/ /  / // / / __ |
/_/  /_/  /___/  /_/|_/  \____/       /____/ /___/       /_/ |_|/____/   /_/  \____/  /____/ /_/ |_|
                                                                                                    "  

    echo -e "\t$amarillo      ___________________________________________________________"
    echo -e "\t$rojo      | COMANDO   |                DESCRIPCIÓN                   |"
        echo -e "\t$verde      |  ayuda    |te muestra esta pantalla de información       |"
        echo -e "\t$azul      |  buscar   |te ayuda a encontrar un archivo en el sistema |"
        echo -e "\t$verde      |  fecha    |te muestra la fecha y hora actual             |"
        echo -e "\t$azul      |  infosis  |te da la informacion basica del sistema       |"
        echo -e "\t$verde      |  creditos |te muestra la informacion del creador         |"
        echo -e "\t$azul      |  salir    |te saca de la prebeshell                      |"


	;;

	"creditos")
	echo "
   ██╗      █████╗     ██████╗ ██████╗ ███████╗██████╗ ███████╗███████╗██╗  ██╗███████╗██╗     ██╗     
   ██║     ██╔══██╗    ██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔════╝██╔════╝██║  ██║██╔════╝██║     ██║     
   ██║     ███████║    ██████╔╝██████╔╝█████╗  ██████╔╝█████╗  ███████╗███████║█████╗  ██║     ██║     
   ██║     ██╔══██║    ██╔═══╝ ██╔══██╗██╔══╝  ██╔══██╗██╔══╝  ╚════██║██╔══██║██╔══╝  ██║     ██║     
   ███████╗██║  ██║    ██║     ██║  ██║███████╗██████╔╝███████╗███████║██║  ██║███████╗███████╗███████╗
   ╚══════╝╚═╝  ╚═╝    ╚═╝     ╚═╝  ╚═╝╚══════╝╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
                                                                                                    "

echo "
██╗   ██╗███╗   ██╗ █████╗ ███╗   ███╗        ██████╗ ██████╗  ██████╗ ████████╗███████╗ ██████╗ ██████╗ 
██║   ██║████╗  ██║██╔══██╗████╗ ████║        ██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██╔════╝██╔═══██╗
██║   ██║██╔██╗ ██║███████║██╔████╔██║        ██████╔╝██████╔╝██║   ██║   ██║   █████╗  ██║     ██║   ██║
██║   ██║██║╚██╗██║██╔══██║██║╚██╔╝██║        ██╔═══╝ ██╔══██╗██║   ██║   ██║   ██╔══╝  ██║     ██║   ██║
╚██████╔╝██║ ╚████║██║  ██║██║ ╚═╝ ██║        ██║     ██║  ██║╚██████╔╝   ██║   ███████╗╚██████╗╚██████╔╝
 ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝        ╚═╝     ╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚══════╝ ╚═════╝ ╚═════╝ 
                                                                                                         "
echo "
    ╦ ╦╔═╗╔═╗╦ ╦╔═╗  ╔═╗╔═╗╦═╗  ╔═╗╔═╗╔╦╗╦═╗╦╔═╗╦╔═  ╔═╗╔═╗╦═╗╔╗╔╔═╗╔╗╔╔╦╗╔═╗╔═╗  ╔═╗╦═╗╔═╗╔═╗╔╦╗╔═╗  
    ╠═╣║╣ ║  ╠═╣║ ║  ╠═╝║ ║╠╦╝  ╠═╝╠═╣ ║ ╠╦╝║║  ╠╩╗  ╠╣ ║╣ ╠╦╝║║║╠═╣║║║ ║║║╣ ╔═╝  ╠═╣╠╦╝╔═╝╠═╣ ║ ║╣   
    ╩ ╩╚═╝╚═╝╩ ╩╚═╝  ╩  ╚═╝╩╚═  ╩  ╩ ╩ ╩ ╩╚═╩╚═╝╩ ╩  ╚  ╚═╝╩╚═╝╚╝╩ ╩╝╚╝═╩╝╚═╝╚═╝  ╩ ╩╩╚═╚═╝╩ ╩ ╩ ╚═╝  "

	;;
	"ahorcado")
 	# Este juego lee una palabra al azar de algúna de las listas .dat de temas seleccionables 

#Inicializamos las variables y arreglos a necesitar
declare -a palabra
declare -a palabra_img
declare -a alpha_img
i=0
fallo=0
bien=0
alpha=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "ñ" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z")
char=0

#Esta función permite seleccionar la lista según el tema elegido y lee la lista de palabras de los archivos .dat
#y los coloca en el arreglo palabra******
function lee_dat
{
echo "Lista de temas"
PS3="Selecciona el tema: "
select opt in Dias Numeros Nombres;
do
    case $opt in
        Dias)
            exec 3<&0
            exec 0< lista1.dat
            while read LINEA
            do

            palabra[i]=$LINEA
            i=`expr $i + 1`
            done
            exec 0<&3
            break;;
        Numeros)
            exec 3<&0
            exec 0< lista2.dat
            while read LINEA
            do

            palabra[i]=$LINEA
            i=`expr $i + 1`
            done
            exec 0<&3
            break;;
        Nombres)
             exec 3<&0
            exec 0< lista3.dat
            while read LINEA
            do

            palabra[i]=$LINEA
            i=`expr $i + 1`
            done
            exec 0<&3
            break;;
        *)
            echo "No es una opción" ;;
    esac
done
return $lee_dat
}

#Esta función selecciona de manera aleatoria una palabra del arreglo palabra
function lee_p {
	p_indice=$RANDOM

	while [ $p_indice -ge $i ]
	do
		p_indice=$RANDOM
	done
	a=0
	while [ $a -lt ${#palabra[${p_indice}]} ]
	do
		palabra_img[$a]=0
		a=`expr $a + 1`
	done
}

#Esta función pide una letra al usuario y revisa si es valida, luego si es correcta y luego si es incorrecta
function adivina
{
	j=0
	bien=0
	echo -n "Pulsa una letra: "
	read adivina
	char=$adivina
	if [ ${#adivina} -eq "1" ]
	then
	
		adivina=`echo $adivina | tr "[:upper:]" "[:lower:]"`
		while [ $j -lt ${#palabra[${p_indice}]} ]
		do
			if [ "$adivina" == "${palabra[${p_indice}]:$j:1}" ]
			then
				palabra_img[${j}]=1
				bien=1
			fi
			j=`expr $j + 1`
		done
	fi
	r=0
	num_let=0
	while [ ! $r == ${#palabra[${p_indice}]} ]
	do
		num_let=`expr $num_let + ${palabra_img[$r]}`
		r=`expr $r + 1`
	done
}

#las siguientes funciones despliegan la figura del ahorcado
function ahorcado 
{
clear
echo "          __________"
echo "         |         |"
echo "         |         |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "      _____________|_____"
echo "                           "
}
function ahorcado_cab 
{
clear
echo "          __________"
echo "         |         |"
echo "         |         |"
echo "       _/_\_       |"
echo "        |_|        |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "      _____________|_____"
echo "                           "
}
function ahorcado_cue {
clear
echo "          __________"
echo "         |         |"
echo "         |         |"
echo "       _/_\_       |"
echo "        |_|        |"
echo "         |         |"
echo "         |         |"
echo "         |         |"
echo "         |         |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "      _____________|_____"
echo "                           "
}
function ahorcado_bra1 {
clear
echo "          __________"
echo "         |         |"
echo "         |         |"
echo "       _/_\_       |"
echo "        |_|        |"
echo "         |         |"
echo "      ---|         |"
echo "         |         |"
echo "         |         |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "      _____________|_____"
echo "                           "
}
function ahorcado_bra2 {
clear
echo "          __________"
echo "         |         |"
echo "         |         |"
echo "       _/_\_       |"
echo "        |_|        |"
echo "         |         |"
echo "      ---|---      |"
echo "         |         |"
echo "         |         |"
echo "                   |"
echo "                   |"
echo "                   |"
echo "      _____________|_____"
echo "                           "
}
function ahorcado_pie1 {
clear
echo "          __________"
echo "         |         |"
echo "         |         |"
echo "       _/_\_       |"
echo "        |_|        |"
echo "         |         |"
echo "      ---|---      |"
echo "         |         |"
echo "         |         |"
echo "        /          |"
echo "       /           |"
echo "                   |"
echo "      _____________|_____"
echo "                           "
}
function ahorcado_pie2 {
clear
echo "          __________"
echo "         |         |"
echo "         |         |"
echo "       _/_\_       |"
echo "        |_|        |"
echo "         |         |"
echo "      ---|---      |"
echo "         |         |"
echo "         |         |"
echo "        / \        |"
echo "       /   \       |"
echo "                   |"
echo "      _____________|_____"
echo "                           "
}

#esta función imprime el baner ganador
function ganaste {
echo "
 ██████╗  █████╗ ███╗   ██╗ █████╗ ███████╗████████╗███████╗       ██╗ 
██╔════╝ ██╔══██╗████╗  ██║██╔══██╗██╔════╝╚══██╔══╝██╔════╝    ██╗╚██╗
██║  ███╗███████║██╔██╗ ██║███████║███████╗   ██║   █████╗      ╚═╝ ██║
██║   ██║██╔══██║██║╚██╗██║██╔══██║╚════██║   ██║   ██╔══╝      ██╗ ██║
╚██████╔╝██║  ██║██║ ╚████║██║  ██║███████║   ██║   ███████╗    ╚═╝██╔╝
 ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝       ╚═╝   "
}

#esta función imprime el baner de perdedor
function perdiste {
echo "
██████╗ ███████╗██████╗ ██████╗ ██╗███████╗████████╗███████╗        ██╗
██╔══██╗██╔════╝██╔══██╗██╔══██╗██║██╔════╝╚══██╔══╝██╔════╝    ██╗██╔╝
██████╔╝█████╗  ██████╔╝██║  ██║██║███████╗   ██║   █████╗      ╚═╝██║ 
██╔═══╝ ██╔══╝  ██╔══██╗██║  ██║██║╚════██║   ██║   ██╔══╝      ██╗██║ 
██║     ███████╗██║  ██║██████╔╝██║███████║   ██║   ███████╗    ╚═╝╚██╗
╚═╝     ╚══════╝╚═╝  ╚═╝╚═════╝ ╚═╝╚══════╝   ╚═╝   ╚══════╝        ╚═╝"
echo "La palabra era ${palabra[$p_indice]}"
}


#La función imprime la letra correcta que da el usuario y sustituye el guión por la letra
function imp_pal {
	echo -ne "\n PALABRA: "
	t=0
	while [ ! $t == ${#palabra[${p_indice}]} ]
	do
			if [ ${palabra_img[${t}]} == "1" ]
			then
				echo -n "${palabra[${p_indice}]:$t:1}"
			else
				echo -n "-"
			fi
			t=`expr $t + 1`
	done
	echo -e "\n\n"
}


#*********DESPLIEGUE DEL PROGRAMA***************

lee_dat;
fin_juego=0
fallo=0
bien=0
while [ "$fin_juego" == "0" ]
do

	a=0
	while [ ! "$a" == "26" ]
	do
		alpha_img[$a]=0
		a=`expr $a + 1`
	done

	palabra_img=0
	alpha_img=0	
	fallo=0
	bien=0
	lee_p;
	a=0
	ahorcado;
	imp_pal;

        #revisa las condiciones de ganar/perder y actualiza o no la figura del ahorcado
	while [[ ! "${num_let}" == "${#palabra[${p_indice}]}" && ! "$fallo" == "6" ]]
	do
		adivina;
	
		if [ $bien == "0" ]
		then 
			fallo=`expr $fallo + 1`
		fi	
	
		if [ $fallo == "0" ]
		then
			ahorcado;
		elif [ $fallo == "1" ]
		then
			ahorcado_cab;
		elif [ $fallo == "2" ]
		then
			ahorcado_cue;
		elif [ $fallo == "3" ]
		then
			ahorcado_bra1;
		elif [ $fallo == "4" ]
		then
			ahorcado_bra2;
		elif [ $fallo == "5" ]
		then
			ahorcado_pie1;
		elif [ $fallo == "6" ]
		then
			ahorcado_pie2;
		fi
		
		imp_pal;
		
	done

	if [ "${num_let}" == "${#palabra[${p_indice}]}" ]
	then
	clear
	ganaste;
	fin_juego=1
	fi
	if [ $fallo == "6" ]
	then
	perdiste;
	fin_juego=1
	fi
#Reinicia o no el juego el juego y permite cambiar de lista
	if [ "$fin_juego" == "1" ] 
	then
		echo -e "\n\n ¿Juegas de nuevo? (s/n)"
		read respuesta
		if [ "$respuesta" == "s" ]
		then
			lee_dat
            fin_juego=0
		fi
		clear
	fi
done
exit 0
 	;;

esac
