FROM alpine:3.12.0

COPY ./configuration /tmp
COPY ./dashboards ./tmp

#Install important packages
RUN	apk update && \
	echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
	apk add wget libc6-compat telegraf supervisor

#Setup Grafana
RUN	wget https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64.tar.gz && \
    tar -zxvf grafana-7.3.7.linux-amd64.tar.gz && \
	mv grafana-7.3.7 grafana && \
	sed -i "s|admin_user = admin|admin_user = iltafah|g" /grafana/conf/defaults.ini && \
	sed -i "s|admin_password = admin|admin_password = 1337|g" /grafana/conf/defaults.ini

#Setup Grafana dashboards
RUN	mkdir /var/lib/grafana/ && mkdir /var/lib/grafana/dashboards/ && \
	mv /tmp/datasource.yaml /grafana/conf/provisioning/datasources/ && \
	mv /tmp/dashboard.yaml /grafana/conf/provisioning/dashboards/ && \
	mv /tmp/*.json /var/lib/grafana/dashboards/
	#mv /tmp/wordpress.json /var/lib/grafana/dashboards && \
	#mv /tmp/phpmyadmin.json /var/lib/grafana/dashboards && \
	#mv /tmp/mysql.json /var/lib/grafana/dashboards && \
	#mv /tmp/influxdb.json /var/lib/grafana/dashboards && \
	#mv /tmp/grafana.json /var/lib/grafana/dashboards && \
	#mv /tmp/nginx.json /var/lib/grafana/dashboards && \
	#mv /tmp/ftps.json /var/lib/grafana/dashboards && \

#Setup Telegraf
RUN	mv /tmp/telegraf.conf /etc/telegraf.conf

#Setup Supervisor
RUN	mv /tmp/supervisord.conf /etc && \
	chmod +x /tmp/stop-supervisor.sh

#Start Supervisor and it's child processes specified in it's config file
CMD /usr/bin/supervisord -c /etc/supervisord.conf