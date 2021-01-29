rc-service php-fpm7 start
mkdir -p /run/nginx
#rc-service nginx start

nginx -g "daemon off;"
tail -f /dev/null
#sh
