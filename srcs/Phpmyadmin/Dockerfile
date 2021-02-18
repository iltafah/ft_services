FROM alpine:3.12.0

COPY ./run.bash ./tmp
COPY ./default.conf ./tmp
COPY ./config.inc.php ./tmp
COPY ./supervisord.conf /tmp
COPY ./telegraf.conf /tmp
COPY ./stop-supervisor.sh /tmp

RUN	echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
	apk add nginx telegraf openrc php7-fpm phpmyadmin supervisor && \
	rc-status -s && \
	touch /run/openrc/softlevel && \
	wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz && \
	tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
	rm phpMyAdmin-5.0.2-all-languages.tar.gz && \
	mv phpMyAdmin-5.0.2-all-languages phpmyadmin && \
	mv tmp/default.conf etc/nginx/conf.d && \
	mv phpmyadmin /var/www/localhost/htdocs && \
	mv ./tmp/config.inc.php ./var/www/localhost/htdocs/phpmyadmin/config.inc.php && \
	mkdir /var/www/localhost/htdocs/phpmyadmin/tmp && \
	chmod 777 /var/www/localhost/htdocs/phpmyadmin/tmp && \
	mv /tmp/supervisord.conf /etc && \
	mv /tmp/telegraf.conf /etc/telegraf.conf && \
	mkdir -p /run/nginx && \
	chmod +x /tmp/stop-supervisor.sh

CMD /usr/bin/supervisord -c /etc/supervisord.conf