FROM alpine:3.12.0
 
COPY ./run.bash ./tmp

COPY ./default.conf ./tmp

COPY ./wp-config.php ./tmp

COPY ./signify.zip ./tmp

COPY ./signify-dark.zip ./tmp

RUN	apk add nginx php-fpm php-json php7-mysqli openrc vim && \
	rc-status -s && \
	touch /run/openrc/softlevel && \
	wget http://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm latest.tar.gz && \
	mv tmp/default.conf etc/nginx/conf.d && \
	mv wordpress /var/www/localhost/htdocs && \
	mv ./tmp/wp-config.php  ./var/www/localhost/htdocs/wordpress/ && \
	unzip ./tmp/signify.zip && \
	unzip ./tmp/signify-dark.zip && \
	mv signify ./var/www/localhost/htdocs/wordpress/wp-content/themes && \
	mv signify-dark ./var/www/localhost/htdocs/wordpress/wp-content/themes


CMD sh tmp/run.bash