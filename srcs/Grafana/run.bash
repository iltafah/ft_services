#/grafana/bin/grafana-server -homepath /grafana

#mv /tmp/grafana.db /grafana/data/grafana.db
/usr/bin/supervisord -c /etc/supervisord.conf


#telegraf -config etc/telegraf.conf && ./grafana/bin/grafana-server -homepath /grafana
#sh
