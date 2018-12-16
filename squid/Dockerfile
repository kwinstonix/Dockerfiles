from alpine:latest
RUN apk update && apk add squid openssl && rm -rf /var/cache/*
COPY ./run.sh /run.sh
CMD /bin/sh /run.sh
