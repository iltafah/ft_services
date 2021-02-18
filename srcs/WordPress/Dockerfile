FROM alpine:3.12.0
 
COPY ./run.bash /tmp
COPY ./default.conf /tmp
COPY ./wp-config.php /tmp
COPY ./signify.zip /tmp
COPY ./signify-dark.zip /tmp
COPY ./telegraf.conf /tmp
COPY ./supervisord.conf /tmp
COPY ./stop-supervisor.sh /tmp

RUN	echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
	apk add nginx php-fpm php-json php7-mysqli openrc telegraf supervisor && \
	openrc && \
	touch /run/openrc/softlevel && \
	wget http://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm latest.tar.gz && \
	mv tmp/default.conf etc/nginx/conf.d && \
	mv wordpress /var/www/localhost/htdocs && \
	mv /tmp/wp-config.php  /var/www/localhost/htdocs/wordpress/ && \
	unzip /tmp/signify.zip && \
	unzip /tmp/signify-dark.zip && \
	mv signify /var/www/localhost/htdocs/wordpress/wp-content/themes && \
	mv signify-dark /var/www/localhost/htdocs/wordpress/wp-content/themes && \
	mv /tmp/supervisord.conf /etc && \
	mv /tmp/telegraf.conf /etc/telegraf.conf && \
	mkdir -p /run/nginx && \
	chmod +x /tmp/stop-supervisor.sh

#CMD sh tmp/run.bash
CMD /usr/bin/supervisord -c /etc/supervisord.conf