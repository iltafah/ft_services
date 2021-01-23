From alpine:3.12.0
 
Copy ./run.bash ./tmp

Copy ./default.conf ./tmp

Run	apk add nginx php-fpm php-json php7-mysqli openrc vim && \
	rc-status -s && \
	touch /run/openrc/softlevel && \
	wget http://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm latest.tar.gz && \
	mv tmp/default.conf etc/nginx/conf.d && \
	mv wordpress /var/www/localhost/htdocs

Cmd sh tmp/run.bash
