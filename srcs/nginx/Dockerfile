FROM alpine:3.12.0

COPY ./default.conf /tmp
COPY ./index.html /tmp
COPY ./style.css /tmp
COPY ./supervisord.conf /tmp
COPY ./telegraf.conf /tmp
COPY ./stop-supervisor.sh /tmp
COPY ./images /tmp/images
COPY ./vanilla-tilt.js /tmp

RUN apk update && \
	echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
	apk add nginx openssl supervisor openrc openssh telegraf && \
	openrc && \
	touch /run/openrc/softlevel && \
	mkdir -p /run/nginx && \
	mv /tmp/default.conf /etc/nginx/conf.d/ && \
	mv /tmp/index.html  /var/www/localhost/htdocs && \
	mv /tmp/style.css /var/www/localhost/htdocs && \
	mv /tmp/telegraf.conf /etc/telegraf.conf && \
	mv tmp/images/ var/www/localhost/htdocs/ && \
	mv tmp/vanilla-tilt.js var/www/localhost/htdocs && \
	openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt && \
	mv /tmp/supervisord.conf /etc && \
	adduser -D admin && \
	echo admin:1337 | chpasswd && \
	ssh-keygen -A && \
	chmod +x /tmp/stop-supervisor.sh

CMD /usr/bin/supervisord -c /etc/supervisord.conf
