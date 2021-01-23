mv tmp/nginx.conf /etc/nginx/nginx.conf
mv tmp/index.html  /www/index.html
openrc
touch /run/openrc/softlevel
#rc-service nginx start
#sh
#mkdir /run/openrc
#touch /run/openrc/softlevel
#mkdir -p /run/nginx
