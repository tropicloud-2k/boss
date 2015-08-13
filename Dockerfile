FROM alpine:3.2
MAINTAINER admin@tropicloud.net

RUN adduser -h /app -s /bin/bash -D ganesh ganesh
ADD . /app
RUN apk --update add bash curl grep jq uwsgi-cgi && \
    chown -R ganesh:ganesh /app

WORKDIR /app
USER ganesh
EXPOSE 8080
CMD uwsgi \
--master \
--pcre-jit \
--threads 5 \
--processes 2 \
--thunder-lock \
--lock-engine ipcsem \
--http-socket :8080 \
--http-socket-modifier1 9 \
--plugin-dir /usr/lib/uwsgi \
--plugins cgi \
--cgi app.sh
