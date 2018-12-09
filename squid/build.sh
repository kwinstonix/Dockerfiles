./configure  --prefix=/squid \
--disable-snmp   \
--disable-arch-native \
--disable-dependency-tracking \
--disable-maintainer-mode \
--disable-silent-rules \
--disable-translation \
--disable-esi \
--disable-icap-client \
--disable-eui \
--disable-htcp \
--disable-auth-ntlm \
--disable-auto-locale \
--disable-ipv6 \
--enable-auth-basic=DB,NCSA \
--enable-auth-digest=file \
--enable-cache-digests \
--enable-delay-pools \
--enable-follow-x-forwarded-for \
--enable-inline \
--enable-removal-policies=lru,heap \
--enable-storeio=ufs,aufs \
--enable-url-rewrite-helpers=fake \
--enable-zph-qos \
--with-large-files \
--with-default-user=nobody \
--with-filedescriptors=65536 \
--with-openssl

make && make install
