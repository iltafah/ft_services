FROM alpine:3.12.0
 
COPY ./run.bash ./tmp
COPY supervisord.conf ./tmp
COPY ./wordpress.sql ./tmp 

RUN	apk add mariadb mariadb-client openrc supervisor && \
	rc-status -s && \
	touch /run/openrc/softlevel

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
