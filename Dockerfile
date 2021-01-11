FROM debian:buster

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt -y install nginx default-mysql-server php7.3 php7.3-fpm \
wordpress php7.3-mysql php-json php-mbstring \
openssl

ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz phpmyadmin.tar.gz

RUN tar xvzf phpmyadmin.tar.gz && mv phpMyAdmin-5.0.2-all-languages /var/www/html/phpmyadmin
RUN mv /usr/share/wordpress /var/www/html

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 777 /var/www/


COPY ./srcs/default /etc/nginx/sites-available

COPY ./srcs/wp-config.php /var/www/html/wordpress/
COPY ./srcs/sql_config.sql /var/
COPY ./srcs/config.inc.php /var/www/html/phpmyadmin/

COPY ./srcs/acase.crt /etc/ssl/certs/
COPY ./srcs/acase.key /etc/ssl/private/

COPY ./srcs/start_server.sh .
COPY ./srcs/autoindex.sh .

RUN chmod +x start_server.sh
RUN chmod +x autoindex.sh

EXPOSE 80 443

CMD bash start_server.sh