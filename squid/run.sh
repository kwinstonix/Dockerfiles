
[ -z $PASSWD ] && PASSWD='openssl rand -base64 14'
[ -z $PROXY_USER ] && PROXY_USER='openssl rand -hex 8'

mkdir -p /etc/squid
encrypt_pwd=`openssl passwd -apr1 $PASSWD`
echo "$PROXY_USER:$encrypt_pwd" > /etc/squid/htpasswd
chown squid /etc/squid/htpasswd
chmod 600 /etc/squid/htpasswd

echo "user: $PROXY_USER"
echo "passwd: $PASSWD"

exec squid -f /etc/squid/squid.conf -N
