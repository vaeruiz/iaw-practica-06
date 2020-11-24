# Práctica IAW 6

Esta vez vamos a instalar una pila lamp pero en vez de utilizar Apache como servidor usaremos el servidor Nginx que posee otras características y ha superado a Apache durante lso últimos años. Ahora en vez de tener una pila lamp tendremos una pila lemp.

## Creando la máquina

Hacemos una máquina Ubuntu server con los puertos HTTP (80), HTTPS (443), y MySQL(3306) con los campos de subred 0.0.0.0/0, ::/0. 

## Configurando la máquina

Cuando hayamos creado la máquina y esté en funcionamiento nos conectamos a ella a través de ssh o a través de Visual Studio Code.

Clonamos el repositorio de github de la práctica

>git clone https://github.com/vaeruiz/iaw-practica-06.git

Cuando se haya descargado el directorio movemos el script de instalación al directorio de ubuntu:

>mv iaw-practica-06/lemp.sh /home/ubuntu/

Le añadimos permiso de ejecución:

>sudo chmod +x lemp.sh

Y ejecutamos el scrip

>sudo ./lemp.sh

Al terminar la ejecución del script tendremos nuestro Ubuntu lemp listo.