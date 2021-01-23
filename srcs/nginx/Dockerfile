From alpine:3.12.0

COPY nginx.conf ./tmp
COPY index.html ./tmp
COPY supervisord.conf ./tmp

RUN apk update && \
	apk add nginx supervisor && \
	adduser -D -g 'www' www && \
	mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www \
	&& mkdir -p /run/nginx && \
	mv tmp/nginx.conf /etc/nginx/nginx.conf && \
	mv tmp/index.html  /www/index.html && \
	mv ./tmp/supervisord.conf /etc
#############################################################
	#sh tmp/run.bash
	#mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig && \
#	sh tmp/run2.bash

#CMD sh 
#tmp/run.bash
#CMD nginx -g "daemon off;"
CMD ./usr/bin/supervisord -c ./etc/supervisord.conf
