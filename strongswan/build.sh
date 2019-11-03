#!/bin/sh
set -e
set -x

VERSION=5.8.1

BUILD_DIR='/tmp/build'
INSTALL_DIR='/usr/local'
#create a sub dir, then is convenient to  user docker volume
ETC_DIR='/usr/local/etc/strongswan'
DL_URL="https://download.strongswan.org/strongswan-${VERSION}.tar.gz"
GMP_URL='https://gmplib.org/download/gmp/gmp-6.1.2.tar.xz'
DAEMON_USER=ipsec

cd  $BUILD_DIR
#tmp use, shadow provides useradd tool
apk add build-base wget  shadow

useradd -M -r -s /sbin/nologin $DAEMON_USER

echo "ipsec ALL=(root) NOPASSWD: /sbin/iptables" > /etc/sudoers.d/ipsec

#Build gmp
apk add m4 gmp gmp-dev
# wget -O gmp.tar.xz $GMP_URL && tar xf gmp.tar.xz
# cd gmp*
# ./configure && make -j && make install

wget -O strongswan.tar.gz $DL_URL  &&  tar xf strongswan.tar.gz && rm strongswan.tar.gz
cd strongswan*
./configure  --prefix=$INSTALL_DIR  --sysconfdir=$ETC_DIR \
--enable-openssl  \
--enable-sha3 \
--enable-counters  \
--enable-eap-dynamic  \
--enable-eap-identity  \
--enable-eap-mschapv2  \
--enable-eap-tls  \
--enable-lookip \
--enable-xauth-eap  \
--disable-des \
--disable-fips-prf \
--disable-ikev1 \
--disable-rc2 \
--disable-md5 \
--disable-sha1 \
--with-capabilities=libcap \
--with-user=$DAEMON_USER \
--with-group=$DAEMON_USER

make  -j
make install

#clean up
apk del build-base wget shadow
rm -r /var/cache/apk/*
rm -rf $BUILD_DIR

setcap CAP_NET_ADMIN+ep /usr/local/libexec/ipsec/charon


