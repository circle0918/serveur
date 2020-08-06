#!/bin/bash

########## creat a place to work and creat a file php to test nginx
mkdir /var/www/yy && touch /var/www/yy/index.php
echo "<?php phpinfo(); ?>" >> /var/www/yy/index.php

########## telecharge wordpress
curl -O https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
mv wordpress /var/www/yy/.
rm latest.tar.gz
mv ./wp-config.php var/www/yy/wordpress

########## telecharge phpmyadmin
curl -O https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz
tar xzvf phpMyAdmin-4.9.5-all-languages.tar.gz 
mv phpMyAdmin-4.9.5-all-languages phpMyAdmin
mv phpMyAdmin /var/www/yy/.
rm phpMyAdmin-4.9.5-all-languages.tar.gz
cp ./config.inc.php /var/www/yy/phpMyAdmin/.

########## mysql config
service mysql restart
mysql -uroot < config.sql

########## nginx config
cp myNginx.conf /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

########### certificat SSL
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/yy.pem -keyout /etc/nginx/ssl/yy.key -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=yy/CN=yy"

########## restart php and nginx
service php7.3-fpm restart
service mysql restart
service nginx restart
bash
