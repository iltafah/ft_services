#!/bin/sh

#rc-service mariadb start
# mysqladmin -u root password 1337
# tail -f /dev/null
#sh

if [ ! -f "/var/lib/mysql/ib_buffer_pool" ]; then
    echo "---------INSTALL---------"
    /etc/init.d/mariadb setup #&> /dev/null
    echo "---------SETUP---------"
    rc-service mariadb start
    echo "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';" | mysql -u root
    echo "CREATE DATABASE wordpress;" | mysql -u root
    echo "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';" | mysql -u root
    echo "FLUSH PRIVILEGES;" | mysql -u root
    mysql -u root wordpress < ./tmp/wordpress.sql
    rc-service mariadb stop
    echo "---------DONE---------"
fi
#sleep 3

# /usr/sbin/supervisord
#tail -f /dev/null
#rc-service mariadb start 
#telegraf -config etc/telegraf.conf