FROM alpine

RUN apk update && \
    apk add iproute2 iptables  openssl-dev linux-headers sudo libcap libcap-dev && \
    rm -r /var/cache/apk/*
WORKDIR /
#modify this var, trigger to rebuild image
ENV REFRESH_DATE=2017-12-23
ADD build.sh /tmp/build/
RUN /bin/sh /tmp/build/build.sh
EXPOSE 500/udp 4500/udp
ENTRYPOINT ["ipsec"]
CMD ["start", "--nofork"]
