FROM debian:buster

#y == yes && q == silence
# update + upgrade system
# install nginx = serveur web
# install mariabd = mysql
# install curl = pin web for installing wordpress
# install php

RUN apt-get -y update -q \
	&& apt-get -y upgrade -q \
	&& apt-get -y install curl -q \
	&& apt-get -y install nginx -q \
	&& apt-get -y install mariadb-server -q \
	&& apt-get -y install php-fpm php-gd php-mysql php-curl -q

#start service nginx start && service mysql start && service php7.3-fpm start
RUN service mysql start && service php7.3-fpm start && service nginx start

COPY ./srcs/config.inc.php ./srcs/myNginx.conf ./srcs/wp-config.php ./srcs/config.sql ./

COPY ./srcs/start.sh ./

EXPOSE 80 443

ENTRYPOINT ["/bin/bash","./start.sh"]
