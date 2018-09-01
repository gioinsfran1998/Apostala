#!/usr/bin/env bash

##################################################################
### Configuraciones de bash para una buena programacion.
##################################################################
set -o errexit	#En el caso de erro que cierre el programa.
set -o nounset	#En el caso que tenga variable sin declarar.
set -o pipefail	#Para obtener el estado de salida de la ultima orden que arrojo un codigo de salida distinto a cero.
#set -o xtrace	#Para depurar encaso que hay errores.

## Modulos externos.
SCREENSHOT="./screenshot.sh"

## Lista de dependencias (Creamos el vector DEPENDENCIA[] para guardar las dependencias necesarios para el funcionamento del scritp).
DEPENDENCIA[0]=scrot	#Una pequena aplicacion para hacer screenshot de la pantalla.
DEPENDENCIA[1]=htop	#Pequenho administrador de tareas en linea de codigo
DEPENDENCIA[2]=nano	#Editor de texto
DEPENDENCIA[3]=vim		#Editor de text
DEPENDENCIA[4]=chrome	#Navegardor chrome
DEPENDENCIA[5]=firefox	#Navegador firefox

##################################################################
### Verificacao de la lista de dependencia en el caso que haya.
##################################################################
echo "1) Verificar las dependencias instalados."

##Variables
CANT_DEP=0	#Cantidad de dependencia - Contador para la lista de las dependencias.
CANT_INST=0	#Cantidad de instalados - Contador para dependencias que no estan instaladas.
LIST_DEP=vacio	#Lista de dependencias - Vector para armacenar dependencias no instaladas.

while [ $CANT_DEP -lt ${#DEPENDENCIA[*]} ]	#Verifica si hay programa para verificacion.
do

	if [ $(which ${DEPENDENCIA[CANT_DEP]}) ]	#Condicion si esta instalado o no.
	then
        	echo -e "${DEPENDENCIA[CANT_DEP]} [\033[0;32mOK\033[0m]"	#Pone OK.
	else
        	echo -e "${DEPENDENCIA[CANT_DEP]} [\033[0;31mNO\033[0m]"	#Pone No.
		LIST_DEP[CANT_INST]=${DEPENDENCIA[CANT_DEP]}	#Agrega la dependencia no instalado al vector.
		CANT_INST=$(( $CANT_INST + 1 ))		#Contador de dependencias no instalados agrega mas uno.
	fi
	CANT_DEP=$(( $CANT_DEP + 1 ))		#Contador de la lista de todos las dependencias agrega mas uno.
done

##################################################################
### Lista de dependencia no instaladas.
##################################################################

if [ "${LIST_DEP[0]}" != "vacio" ]	#Verifica si hay algun programa para LIST_DEP.
then
echo "apt update -y"
echo
	echo Instalar dependencia:
	CANT_DEP=0	#Cera el contador 
	UNICA_VEZ=0
	while [ $CANT_DEP -lt ${#LIST_DEP[*]} ]	#Verifica si hay programa para listar.
	do
		echo -e "apt install ${LIST_DEP[CANT_DEP]} -y"		#Lista el programa.
		CANT_DEP=$(( $CANT_DEP + 1 ))		#Contador de la listas de las dependencias que faltan instalar.
	done
	echo "unica vez es $UNICA_VEZ"
	if [ $UNICA_VEZ -lt 2 ]
	then
		echo hola!
		UNICA_VEZ=$(( $UNICA_VEZ + 1 ))
		exit 0
	else
		exit 0
	fi
fi

##################################################################
### Inicio de ciclo sin fin.
##################################################################
echo
echo "2) Inicio de ciclo."
while [ true ] 
do

## Hace screenshot a cada timpo establecido y copia a la carpeta /tmp.
source "$SCREENSHOT"
done
