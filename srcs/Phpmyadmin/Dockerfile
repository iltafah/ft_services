FROM alpine:3.12.0

COPY ./run.bash ./tmp
COPY ./default.conf ./tmp
COPY ./config.inc.php ./tmp
COPY ./supervisord.conf /tmp
COPY ./telegraf.conf /tmp

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
	mkdir -p /run/nginx
	#chown admin:admin /var/www/localhost/htdocs/phpmyadmin/tmp

	#apk add php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php-mysqli && \
	#mv ./tmp/config.inc.php ./usr/share/webapps/phpmyadmin/config.inc.php && \
CMD /usr/bin/supervisord -c /etc/supervisord.conf
#CMD sh tmp/run.bash
