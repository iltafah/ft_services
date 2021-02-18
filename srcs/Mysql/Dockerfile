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

CMD sh tmp/run.bash