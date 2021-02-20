FROM alpine:3.12.0

COPY ./configuration /tmp
COPY ./nginx_web_page /tmp

#Install important packages
RUN apk update && \
	echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
	apk add nginx openssl supervisor openssh telegraf

#Setup Nginx
RUN	mkdir -p /run/nginx && \
	openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt && \
	mv /tmp/default.conf /etc/nginx/conf.d/

#Setup Nginx webpage
RUN	mv /tmp/index.html  /var/www/localhost/htdocs/ && \
	mv /tmp/style.css /var/www/localhost/htdocs/ && \
	mv /tmp/vanilla-tilt.js /var/www/localhost/htdocs/ && \
	mv /tmp/images/ /var/www/localhost/htdocs/

#Setup Telegraf
RUN	mv /tmp/telegraf.conf /etc/telegraf.conf

#Setup Ssh
RUN	ssh-keygen -A && \
	adduser -D admin && \
	echo admin:1337 | chpasswd

#Setup Supervisor
RUN	mv /tmp/supervisord.conf /etc && \
	chmod +x /tmp/stop-supervisor.sh

#Start Supervisor and it's child processes specified in it's config file
CMD /usr/bin/supervisord -c /etc/supervisord.conf
