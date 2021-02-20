FROM alpine:3.12.0

COPY ./configuration /tmp

#Install important packages
RUN	apk update && \
	echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
	apk add vsftpd openssl supervisor telegraf

#Setup FTPS
RUN	mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" && \
	adduser -D iltafah && \
	echo iltafah:1337 | chpasswd && \
	echo "iltafah" | tee -a /etc/vsftpd.userlist

#Setup Telegraf
RUN	mv /tmp/telegraf.conf /etc/telegraf.conf

#Setup Supervisor
RUN	mv /tmp/supervisord.conf /etc && \
	chmod +x /tmp/stop-supervisor.sh

#Start Supervisor and it's child processes specified in it's config file
CMD  /usr/bin/supervisord -c /etc/supervisord.conf