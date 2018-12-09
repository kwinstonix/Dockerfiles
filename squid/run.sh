
[ -z $PASSWD ] && PASSWD='some_password'
[ -z $PROXY_USER ] && PROXY_USER='proxy_user'

mkdir -p /etc/squid
encrypt_pwd=`openssl passwd -apr1 $PASSWD`
echo "$PROXY_USER:$encrypt_pwd" > /etc/squid/htpasswd
chown nobody /etc/squid/htpasswd
chmod 600 /etc/squid/htpasswd

echo "user: $PROXY_USER"
echo "passwd: $PASSWD"

exec /squid/sbin/squid -f /etc/squid/squid.conf -N
