#!/bin/sh
    rc-service mariadb start
    echo "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';" | mysql -u root
    echo "CREATE DATABASE wordpress;" | mysql -u root
    echo "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';" | mysql -u root
    echo "FLUSH PRIVILEGES;" | mysql -u root
    mysql -u root wordpress < ./tmp/wordpress.sql
    rc-service mariadb stop