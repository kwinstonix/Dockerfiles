FROM ubuntu:18.04
RUN apt-get update && apt-get install -y wget build-essential libssl1.0-dev
RUN wget http://www.squid-cache.org/Versions/v4/squid-4.4.tar.xz \
    && tar xf squid-*.tar.xz \
    && cd squid*

COPY ./build.sh /tmp
RUN cd squid-* && /bin/bash /tmp/build.sh

# stage 2
FROM ubuntu:18.04
RUN apt-get update && apt-get install -y openssl libssl1.0-dev && rm -rf /var/lib/apt/* && apt-get clean
COPY --from=0 /squid /squid
RUN chown -R nobody /squid
COPY ./run.sh /run.sh

CMD /bin/bash /run.sh
