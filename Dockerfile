FROM alpine:3.2
MAINTAINER admin@tropicloud.net

ADD . /
RUN /boss/boss.sh build

EXPOSE 80 443
ENTRYPOINT ["boss"]
CMD ["start"]
