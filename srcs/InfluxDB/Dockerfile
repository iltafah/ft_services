FROM alpine:3.12.0

COPY ./configuration /tmp

#Install important packages
RUN apk update 
RUN	echo http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories 
RUN	apk add influxdb telegraf supervisor
	
#Setup Telegraf
RUN	mv /tmp/telegraf.conf /etc/telegraf.conf

#Setup Supervisor
RUN	mv /tmp/supervisord.conf /etc 
RUN	chmod +x /tmp/stop-supervisor.sh

#Start Supervisor and it's child processes specified in it's config file
CMD /usr/bin/supervisord -c /etc/supervisord.conf
