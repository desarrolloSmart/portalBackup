#!/bin/bash
# -*- ENCODING: UTF-8 -*-
clear
echo "Iniciando shell"
fecha=$(date '+%Y-%m-%d')
read -p "Cliente:" client

directorio="$HOME/Documents/Ears/$client/backup/"
client=$(echo $client | tr "[:upper:]" "[:lower:]")

if [ -d $directorio ];
then
	echo "Entrando"
	contador=1
	cd $directorio
	if [ -d $fecha/ ];
	then
		echo "existe";
		contador=$(($(ls -1 $directorio$fecha | wc -l)+$contador))
	else
		mkdir $fecha
		echo "se creo la carpeta: $fecha"
	fi

	#ssh -q root@192.168.3.79  [[ -d /opt/glassfish4/glassfish/domains/domain1/applications/smarttmtsuite-ear-$client* ]] && echo 'existe directorio';
	if [ $(ssh root@192.168.3.79 ls -1 /opt/glassfish4/glassfish/domains/domain1/applications/smarttmtsuite-ear-$client*/ | wc -l) > 1 ]
	then
		echo "iniciando copia..."
		nombarch=smarttmtsuite-ear-$client-$fecha-c$contador
		dire=$directorio$fecha/$nombarch

		scp -r root@192.168.3.79:/opt/glassfish4/glassfish/domains/domain1/applications/smarttmtsuite-ear-$client* $dire
		cd $dire
		rm -rf smarttmtsuite-web-1.0-SNAPSHOT_war smarttmtsuite-entity-ejb-1.0-SNAPSHOT_jar smarttmtsuite-ejb-1.0-SNAPSHOT_jar
		zip -rm $nombarch.ear *

		echo "copiado correctamente"
	else
		echo "No existe ear para el cliente $client en el servidor"
	fi
else
	echo "no existe carpeta backup"
fi

echo "shell terminado."

exit
