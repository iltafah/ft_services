FROM alpine:3.12.0

COPY ./run.bash /tmp
COPY ./supervisord.conf /tmp
COPY ./telegraf.conf /tmp
COPY ./stop-supervisor.sh /tmp

RUN echo http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories && \
	apk add influxdb telegraf openrc supervisor && \
	mv /tmp/supervisord.conf /etc && \
	openrc && \
	touch /run/openrc/softlevel && \
	mv /tmp/telegraf.conf /etc/telegraf.conf && \
	chmod +x /tmp/stop-supervisor.sh

CMD /usr/bin/supervisord -c /etc/supervisord.conf
