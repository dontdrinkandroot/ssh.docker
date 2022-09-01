FROM alpine:3.16

MAINTAINER Philip Washington Sorst <philip@sorst.net>

COPY entrypoint.sh /usr/bin/

RUN set -xe \
    && apk update --no-cache \
    && apk add --no-cache \
        openssh-client \
        rsync \
    && date > /etc/dockerbuilddate \
    && mkdir -p ~/.ssh \
    && chmod 700 ~/.ssh

ENTRYPOINT ["entrypoint.sh"]
