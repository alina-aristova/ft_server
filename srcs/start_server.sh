#!/bin/bash

chmod 777 -R /var/lib/php/*
chmod 775 -R /var/www/html/phpmyadmin

service php7.3-fpm start 
service nginx start
service mysql start
mysql -u root --skip-password < /var/sql_config.sql
bash
sleep infinity

