FROM alpine:3.12.0

COPY ./run.bash /tmp
COPY ./telegraf.conf /tmp
COPY ./supervisord.conf /tmp
COPY ./datasource.yaml /tmp
COPY ./dashboard.yaml /tmp
COPY ./wordpress.json /tmp
COPY ./phpmyadmin.json /tmp
COPY ./mysql.json /tmp
COPY ./influxdb.json /tmp
COPY ./grafana.json /tmp
COPY ./nginx.json /tmp
COPY ./ftps.json /tmp
COPY ./stop-supervisor.sh /tmp

RUN	echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
	apk add wget libc6-compat telegraf supervisor &&\
	wget https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64.tar.gz && \
    tar -zxvf grafana-7.3.7.linux-amd64.tar.gz && \
	mv grafana-7.3.7 grafana && \
	mv /tmp/supervisord.conf /etc && \
	mv /tmp/telegraf.conf /etc/telegraf.conf && \
	mv /tmp/datasource.yaml /grafana/conf/provisioning/datasources/ && \
	mv /tmp/dashboard.yaml /grafana/conf/provisioning/dashboards/ && \
	mkdir /var/lib/grafana/ && mkdir /var/lib/grafana/dashboards && \
	mv /tmp/wordpress.json /var/lib/grafana/dashboards && \
	mv /tmp/phpmyadmin.json /var/lib/grafana/dashboards && \
	mv /tmp/mysql.json /var/lib/grafana/dashboards && \
	mv /tmp/influxdb.json /var/lib/grafana/dashboards && \
	mv /tmp/grafana.json /var/lib/grafana/dashboards && \
	mv /tmp/nginx.json /var/lib/grafana/dashboards && \
	mv /tmp/ftps.json /var/lib/grafana/dashboards && \
	chmod +x /tmp/stop-supervisor.sh

CMD /usr/bin/supervisord -c /etc/supervisord.conf
#sh /tmp/run.bash

#CMD telegraf -config etc/telegraf.conf && ./grafana/bin/grafana-server -homepath /grafana
#sh tmp/run.bash
#echo @edgecommunity http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories && \
#	apk add grafana@edgecommunity
