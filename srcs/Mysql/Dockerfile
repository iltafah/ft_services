FROM alpine:3.12.0
 
COPY ./run.bash /tmp
COPY ./supervisord.conf /tmp
COPY ./wordpress.sql /tmp
COPY ./telegraf.conf /tmp


RUN	echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
	apk add mariadb mariadb-client telegraf openrc supervisor && \
	openrc && \
	touch /run/openrc/softlevel && \
	mv /tmp/telegraf.conf /etc/telegraf.conf

	#&& \
    #mv ./tmp/supervisord.conf /etc && \
	#echo "root" | mysql -u root -p wordpress < ./tmp/wordpress.sql
#&& \
	#rc-service mariadb start && \
	#mysqladmin -u root password 1337
	#rc-service mariadb stop
#EXPOSE 3306 
CMD sh tmp/run.bash

#tail -f /dev/null
#Cmd ./usr/bin/supervisord -c ./etc/supervisord.conf
#Cmd sh
#sh tmp/run.bash
