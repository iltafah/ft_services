FROM alpine:3.12.0
 
COPY ./configuration /tmp

#Install important packages
RUN	apk update 
RUN	echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories 
RUN	apk add nginx php-fpm php-json php7-mysqli telegraf supervisor

#Setup Wordpress
RUN	wget http://wordpress.org/latest.tar.gz 
RUN	tar -xzvf latest.tar.gz 
RUN	rm latest.tar.gz 
RUN	mv /wordpress /var/www/localhost/htdocs/ 
RUN	mv /tmp/wp-config.php  /var/www/localhost/htdocs/wordpress/

#Setup a theme for Wordpress
RUN	unzip /tmp/signify.zip 
RUN	unzip /tmp/signify-dark.zip 
RUN	mv /signify /var/www/localhost/htdocs/wordpress/wp-content/themes/ 
RUN	mv /signify-dark /var/www/localhost/htdocs/wordpress/wp-content/themes/ 
RUN	rm /tmp/signify.zip && rm /tmp/signify-dark.zip

#Setup Nginx
RUN	mkdir -p /run/nginx 
RUN	mv tmp/default.conf etc/nginx/conf.d/

#Setup Telegraf
RUN	mv /tmp/telegraf.conf /etc/telegraf.conf
	
#Setup Supervisor
RUN	mv /tmp/supervisord.conf /etc/ 
RUN	chmod +x /tmp/stop-supervisor.sh

#Start Supervisor and it's child processes specified in it's config file
CMD /usr/bin/supervisord -c /etc/supervisord.conf