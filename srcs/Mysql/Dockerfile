FROM alpine:3.12.0
 
COPY ./configuration /tmp

#Install important packages
RUN	apk update 
RUN	echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories 
RUN	apk add mariadb mariadb-client telegraf openrc supervisor

#Setup Mysql
RUN	openrc 
RUN	touch /run/openrc/softlevel 
RUN	sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf 
RUN	chmod +x /tmp/create_database.sh

#Setup Telegraf
RUN	mv /tmp/telegraf.conf /etc/telegraf.conf

#Setup Supervisor
RUN	mv /tmp/supervisord.conf /etc 
RUN	chmod +x /tmp/stop-supervisor.sh

#Create database && Start Supervisor and it's child processes specified in it's config file
CMD /tmp/create_database.sh && /usr/bin/supervisord -c /etc/supervisord.conf