#/bin/bash

## Lista de dependencias
P[0]=scrot
P[1]=htop
P[2]=nano
P[3]=vi
P[4]=vi

## Verificacao de la lista de dependencia en el caso que haya
echo "1) Verificar programas instalados."
contador0=0
contador1=0
instalar=vacio
while [ "x${P[contador0]}" != "x" ]
do

	if [ $(which ${P[contador0]}) ]
	then
        	echo -e "${P[contador0]} [\033[0;32mOK\033[0m]"
	else
        	echo -e "${P[contador0]} [\033[0;31mNO\033[0m]"
		instalar[contador1]=${P[contador0]}
		contador1=$(( $contador1 + 1 ))
	fi
	contador0=$(( $contador0 + 1 ))
done


## Lista de programas no instalados
if [ "${instalar[0]}" != "vacio" ]
then
	echo
	echo Los programas que no estan instalados son:
	contador0=0
	while [ "x${instalar[contador0]}" != "x" ]
	do
		echo ${instalar[contador0]}
		contador0=$(( $contador0 + 1 ))
	done
fi
#echo ${P[contador]}


# scrot --thumb 50 -z 'name.png' -e 'mv $f /tmp/'
