From alpine:3.12.0

Copy ./run.bash ./tmp

Run	echo @edgecommunity http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories && \
	apk add grafana@edgecommunity

Cmd sh tmp/run.bash
