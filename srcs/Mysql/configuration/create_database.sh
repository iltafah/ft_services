#!/bin/sh

if [ ! -f "/var/lib/mysql/ib_buffer_pool" ]; then
    echo "---------INSTALL---------"
    /etc/init.d/mariadb setup
    echo "---------SETUP---------"
    rc-service mariadb start
    echo "CREATE USER 'iltafah'@'%' IDENTIFIED BY '1337';" | mysql -u root
    echo "CREATE DATABASE wordpress;" | mysql -u root
    echo "GRANT ALL PRIVILEGES ON *.* TO 'iltafah'@'%';" | mysql -u root
    echo "FLUSH PRIVILEGES;" | mysql -u root
    mysql -u root wordpress < ./tmp/wordpress.sql
    rc-service mariadb stop
    echo "---------DONE---------"
fi
