FROM alpine:3.12.0

COPY ./configuration /tmp

#Install important packages
RUN	apk update 
RUN	echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories 
RUN	apk add nginx telegraf php7-fpm phpmyadmin supervisor

#Setup Phpmyadmin	
RUN	wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz 
RUN	tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz 
RUN	rm phpMyAdmin-5.0.2-all-languages.tar.gz 
RUN	mv phpMyAdmin-5.0.2-all-languages /var/www/localhost/htdocs/phpmyadmin 
RUN	mv ./tmp/config.inc.php ./var/www/localhost/htdocs/phpmyadmin/config.inc.php 
RUN	mkdir /var/www/localhost/htdocs/phpmyadmin/tmp 
RUN	chmod 777 /var/www/localhost/htdocs/phpmyadmin/tmp

#Setup Nginx
RUN	mkdir -p /run/nginx 
RUN	mv tmp/default.conf etc/nginx/conf.d 

#Setup telegraf
RUN	mv /tmp/telegraf.conf /etc/telegraf.conf

#Setup supervisor
RUN	mv /tmp/supervisord.conf /etc 
RUN	chmod +x /tmp/stop-supervisor.sh

#Start Supervisor and it's child processes specified in it's config file
CMD /usr/bin/supervisord -c /etc/supervisord.conf