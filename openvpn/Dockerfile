from alpine

RUN apk add --no-cache openvpn
COPY up.sh /etc/openvpn/up.sh
RUN chmod +x /etc/openvpn/up.sh

ENTRYPOINT ["/usr/sbin/openvpn"]
CMD ["--config", "/etc/openvpn/server.conf"]
