#!/bin/bash

trap "" 2 20
trap "" SIGTSTP  #anula Ctrl + C   y  Ctrl + Z
clear

fails=3
while [ $fails != 0 ]; do         #salir o equivocarse 3 vece
    base=$PWD
    echo -e -n "\033[32m User: \033[00m" 
    read usar  
    echo -e -n "\033[32m Password: \033[00m"
    read -s pswd        # -s oculta el input del usuario
    if [ "$usar" == "salir" ]; then 
        exit 1 
    fi

    linea=`sudo -S grep -r $usar /etc/shadow`

    if [ ${linea} > 1 ]; then 

        IFS='$' read -r -a array <<< "$linea"  

        index="\$${array[1]}\$${array[2]}"
        hash=`python -c 'import crypt; import sys; print crypt.crypt( sys.argv[1] , sys.argv[2])' $pswd $index`

        match=`echo "$linea" | grep -c "$hash"`            

        if [ "$match" -eq 1 ]; then
            clear
            echo -e "\033[34m 
            ██████╗ ██╗███████╗███╗   ██╗██╗   ██╗███████╗███╗   ██╗██╗██████╗  ██████╗ 
            ██╔══██╗██║██╔════╝████╗  ██║██║   ██║██╔════╝████╗  ██║██║██╔══██╗██╔═══██╗
            ██████╔╝██║█████╗  ██╔██╗ ██║██║   ██║█████╗  ██╔██╗ ██║██║██║  ██║██║██╗██║
            ██╔══██╗██║██╔══╝  ██║╚██╗██║╚██╗ ██╔╝██╔══╝  ██║╚██╗██║██║██║  ██║██║██║██║
            ██████╔╝██║███████╗██║ ╚████║ ╚████╔╝ ███████╗██║ ╚████║██║██████╔╝╚█║████╔╝
            ╚═════╝ ╚═╝╚══════╝╚═╝  ╚═══╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝╚═╝╚═════╝  ╚╝╚═══╝ 
             \n                                                               
            $(./comandos.sh ayuda)
            
            \n"
            
            while [ 1 ];do                                  #Comandos a ingresar
                printf "\033[01;34mPrebeShell@$usar: $PWD \033[01;33m" 
                read  command
                current=$PWD
                cd $base
                case "$command" in
                    'ayuda')        ./comandos.sh ayuda          ;;
                    'infosis')      ./comandos.sh infosis $pswd  ;;
                    'fecha')        ./comandos.sh fecha          ;;
                    'buscar')        ./comandos.sh buscar          ;;
                    'ahorcado')      ./comandos.sh ahorcado      ;;
                    'creditos')      ./comandos.sh creditos      ;;
                    'salir')        exit 1                       ;;
                    *)              cd $current; $command        ;;
                esac
                cd $current
            done
        else
            echo -e "\n\033[31m Contrasena incorrecta te quedan $(($fails-1)) intentos \033[00m"
            let fails--
        fi
    else
        echo -e "\033[31m No encuentro ese usuario \033[00m"
        let fails--
    fi
done