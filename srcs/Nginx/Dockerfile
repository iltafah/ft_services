FROM alpine:3.12.0

COPY ./configuration /tmp
COPY ./nginx_web_page /tmp

#Install important packages
RUN apk update
RUN	echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories
RUN	apk add nginx openssl supervisor openssh telegraf npm

#Setup Nginx
RUN	mkdir -p /run/nginx
RUN	openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
RUN	mv /tmp/default.conf /etc/nginx/conf.d/

#Setup Nginx webpage
WORKDIR /var/www/localhost/htdocs/
RUN	mv /tmp/index.html  ./
RUN	mv /tmp/style.css ./
RUN	mv /tmp/images/ ./
RUN npm install vanilla-tilt@1.7.0

#Setup Telegraf
WORKDIR /
RUN	mv /tmp/telegraf.conf /etc/telegraf.conf

#Setup Ssh
RUN	ssh-keygen -A
RUN	adduser -D admin
RUN	echo admin:1337 | chpasswd

#Setup Supervisor
RUN	mv /tmp/supervisord.conf /etc
RUN	chmod +x /tmp/stop-supervisor.sh

#Start Supervisor and it's child processes specified in it's config file
CMD /usr/bin/supervisord -c /etc/supervisord.conf
