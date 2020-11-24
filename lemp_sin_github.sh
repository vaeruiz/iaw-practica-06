#!/bin/bash

# Activar depuración
set -x

# Actualizar repositorios
apt update

# Instalar nginx, php-fpm y php-mysql
apt install nginx php-fpm php-mysql -y

# Añadir valor index.php al archivo default
sed -i "s/index.html/index.php index.html/" /etc/nginx/sites-available/default

# Activamos el bloque location
sed -i "s*#location ~ \.php$ {*location ~ \.php$ {*" /etc/nginx/sites-available/default
sed -i "s*#	include snippets/fastcgi-php.conf;*include snippets/fastcgi-php.conf;*" /etc/nginx/sites-available/default
sed -i "s*#	fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;*fastcgi_pass 127.0.0.1:9000;*" /etc/nginx/sites-available/default

# Cambiar directiva listen de php-fpm
sed -i "s*listen = /run/php/php7.4-fpm.sock*listen = 9000*" /etc/php/7.4/fpm/pool.d/www.conf

# Cambiar directiva cgi.fix del archivo php.ini
sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.4/fpm/php.ini

# Reiniciar servicios
systemctl restart nginx
systemctl restart php7.4-fpm