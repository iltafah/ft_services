#!/bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]; then
    echo "---------SETUP---------"
    /etc/init.d/mariadb setup
    echo "---------CREATE WP DATABASE---------"
    rc-service mariadb start
    echo "CREATE USER 'iltafah'@'%' IDENTIFIED BY '1337';" | mysql -u root
    echo "CREATE DATABASE wordpress;" | mysql -u root
    echo "GRANT ALL PRIVILEGES ON *.* TO 'iltafah'@'%';" | mysql -u root
    echo "FLUSH PRIVILEGES;" | mysql -u root
    mysql -u root wordpress < ./tmp/wordpress.sql
    rc-service mariadb stop
    echo "---------DONE---------"
fi