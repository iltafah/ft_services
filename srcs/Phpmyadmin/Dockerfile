From alpine:3.12.0

Copy ./run.bash ./tmp
Copy ./default.conf ./tmp

Run	apk add nginx openrc php7-fpm phpmyadmin && \
	rc-status -s && \
	touch /run/openrc/softlevel && \
	wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz && \
	tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
	rm phpMyAdmin-5.0.2-all-languages.tar.gz && \
	mv phpMyAdmin-5.0.2-all-languages phpmyadmin && \
	mv tmp/default.conf etc/nginx/conf.d && \
	mv phpmyadmin /var/www/localhost/htdocs

Cmd sh tmp/run.bash
