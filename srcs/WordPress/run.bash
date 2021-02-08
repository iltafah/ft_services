rc-service php-fpm7 start
nginx -g "daemon off;" && telegraf -config etc/telegraf.conf
#sh
