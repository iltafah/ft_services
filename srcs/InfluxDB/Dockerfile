From alpine:3.12.0

Copy ./run.bash ./tmp
COPY supervisord.conf ./tmp

Run apk add influxdb openrc supervisor && \
	mv ./tmp/supervisord.conf /etc && \
	openrc && \
	touch /run/openrc/softlevel

Cmd ./usr/bin/supervisord -c ./etc/supervisord.conf
