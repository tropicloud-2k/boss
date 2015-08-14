
# BUILD
# ---------------------------------------------------------------------------------

boss_build() {

	echo "http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
	echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

	apk --update add bash bash-completion curl grep jq nano nginx uwsgi-cgi s6

	rm -rf /var/cache/apk/*
	rm -rf /var/lib/apt/lists/*

	mkdir -p /tmp/nginx/client-body
	sed -i 's|#!/bin/sh|#!/bin/bash|g' /boss/boss.sh

	ln -sf /boss/boss.sh /usr/bin/boss
	chmod +x /usr/bin/boss
}
