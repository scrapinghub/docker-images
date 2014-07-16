#!/bin/bash
dir=/var/cache/squid-deb-proxy
# workaround shared folders permissions problems on vagrant
if ! (chown proxy $dir && sudo -u proxy touch $dir); then
  uid=$(stat -c %u $dir)
  userdel proxy
  useradd -M -r -s /usr/sbin/nologin -d /bin -u 1000 proxy
  chown -R proxy /var/log/squid-deb-proxy /var/cache/squid-deb-proxy
  echo 'cache_effective_user proxy' >>/etc/squid-deb-proxy/squid-deb-proxy.conf
fi

. /usr/share/squid-deb-proxy/init-common.sh
pre_start
exec /usr/sbin/squid3 -N -f /etc/squid-deb-proxy/squid-deb-proxy.conf
