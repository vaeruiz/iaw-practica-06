#!/bin/bash

# Activar depuración
set -x

# Actualizar repositorios
apt update

# Instalar nginx, php-fpm y php-mysql
apt install nginx php-fpm php-mysql -y

# Copiar archivo default
rm -f /etc/nginx/sites-available/default
cp /home/ubuntu/iaw-practica-06/default /etc/nginx/sites-available/

# Cambiar directiva listen de php-fpm
sed -i "s*listen = /run/php/php7.4-fpm.sock*listen = 9000*" /etc/php/7.4/fpm/pool.d/www.conf

# Copiar archivo de configuracion php.ini
rm -f /etc/php/7.4/fpm/php.ini
cp /home/ubuntu/iaw-practica-06/php.ini /etc/php/7.4/fpm/

# Reiniciar servicios
systemctl restart nginx
systemctl restart php7.4-fpm
