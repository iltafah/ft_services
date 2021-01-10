From alpine:latest

COPY nginx.conf ./tmp
COPY index.html ./tmp
COPY run.bash ./tmp
COPY run2.bash ./tmp

RUN apk update && \
	apk add nginx && \
	adduser -D -g 'www' www && \
	mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www && \
	mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig && \
	sh tmp/run.bash
#	sh tmp/run2.bash

CMD nginx -g "daemon off;"
