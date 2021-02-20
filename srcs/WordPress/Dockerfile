FROM alpine:3.12.0
 
COPY ./configuration /tmp

#Install important packages
RUN	apk update && \
	echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
	apk add nginx php-fpm php-json php7-mysqli telegraf supervisor

#Setup Wordpress
RUN	wget http://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm latest.tar.gz && \
	mv /wordpress /var/www/localhost/htdocs/ && \
	mv /tmp/wp-config.php  /var/www/localhost/htdocs/wordpress/

#Setup a theme for Wordpress
RUN	unzip /tmp/signify.zip && \
	unzip /tmp/signify-dark.zip && \
	mv /signify /var/www/localhost/htdocs/wordpress/wp-content/themes/ && \
	mv /signify-dark /var/www/localhost/htdocs/wordpress/wp-content/themes/ && \
	rm /tmp/signify.zip && rm /tmp/signify-dark.zip

#Setup Nginx
RUN	mkdir -p /run/nginx && \
	mv tmp/default.conf etc/nginx/conf.d/

#Setup Telegraf
RUN	mv /tmp/telegraf.conf /etc/telegraf.conf
	
#Setup Supervisor
RUN	mv /tmp/supervisord.conf /etc/ && \
	chmod +x /tmp/stop-supervisor.sh

#Start Supervisor and it's child processes specified in it's config file
CMD /usr/bin/supervisord -c /etc/supervisord.conf