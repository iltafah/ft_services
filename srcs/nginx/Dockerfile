FROM alpine:3.12.0

COPY ./default.conf /tmp
COPY ./index.html /tmp
COPY ./supervisord.conf /tmp
COPY ./telegraf.conf /tmp

RUN apk update && \
	echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
	apk add nginx openssl supervisor openrc openssh telegraf && \
	openrc && \
	touch /run/openrc/softlevel && \
	mkdir -p /run/nginx && \
	mv /tmp/default.conf /etc/nginx/conf.d/ && \
	mv /tmp/index.html  /var/www/localhost/htdocs && \
	mv /tmp/telegraf.conf /etc/telegraf.conf && \
	openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt && \
	mv /tmp/supervisord.conf /etc && \
	adduser -D admin && \
	echo admin:1337 | chpasswd
#############################################################
	#mv tmp/nginx.conf /etc/nginx/nginx.conf && \
	#mkdir /www && \
	#chown -R www:www /var/lib/nginx && \
	#chown -R www:www /www \
	#adduser -D -g 'www' www && \
	#sh tmp/run.bash
	#mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig && \
#	sh tmp/run2.bash

#CMD sh 
#tmp/run.bash
#CMD rc-service sshd start && nginx -g "daemon off;" && telegraf -config etc/telegraf.conf
CMD /usr/bin/supervisord -c /etc/supervisord.conf
