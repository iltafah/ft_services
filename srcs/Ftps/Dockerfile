FROM alpine:3.12.0

COPY ./run.bash /tmp
COPY ./vsftpd.conf /tmp
COPY ./supervisord.conf /tmp
COPY ./telegraf.conf /tmp
COPY ./stop-supervisor.sh /tmp

RUN	echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
	apk add vsftpd openssl openrc supervisor telegraf && \
	rc-status && \
	touch /run/openrc/softlevel && \
	mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" && \
	adduser -D iltafah && \
	echo iltafah:1337 | chpasswd && \
	echo "iltafah" | tee -a /etc/vsftpd.userlist && \
	mv /tmp/supervisord.conf /etc && \
	mv /tmp/telegraf.conf /etc/telegraf.conf && \
	chmod +x /tmp/stop-supervisor.sh

CMD  /usr/bin/supervisord -c /etc/supervisord.conf
#sh
#CMD sh
#sh tmp/run.bash
