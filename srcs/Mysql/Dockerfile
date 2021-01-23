From alpine:3.12.0
 
Copy ./run.bash ./tmp
COPY supervisord.conf ./tmp

Run	apk add mysql mysql-client openrc supervisor && \
	rc-status -s && \
	touch /run/openrc/softlevel && \
	mysql_install_db --user=mysql --datadir=/var/lib/mysql && \
	mv ./tmp/supervisord.conf /etc

Cmd ./usr/bin/supervisord -c ./etc/supervisord.conf
#sh tmp/run.bash
