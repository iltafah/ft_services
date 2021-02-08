FROM alpine:3.12.0

COPY ./run.bash /tmp
COPY ./telegraf.conf /tmp
COPY ./supervisord.conf /tmp

RUN	echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
	apk add wget libc6-compat telegraf supervisor &&\
	wget https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64.tar.gz && \
    tar -zxvf grafana-7.3.7.linux-amd64.tar.gz && \
	mv grafana-7.3.7 grafana && \
	mv /tmp/supervisord.conf /etc && \
	mv /tmp/telegraf.conf /etc/telegraf.conf

CMD /usr/bin/supervisord -c /etc/supervisord.conf


#CMD telegraf -config etc/telegraf.conf && ./grafana/bin/grafana-server -homepath /grafana
#sh tmp/run.bash
#echo @edgecommunity http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories && \
#	apk add grafana@edgecommunity
