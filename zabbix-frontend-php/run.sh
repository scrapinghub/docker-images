#!/bin/bash
if [[ $ZABBIX_CONF ]]; then
  ln -sf "$ZABBIX_CONF" /etc/zabbix/web/zabbix.conf.php
fi
. /etc/default/apache2
. /etc/apache2/envvars
/usr/sbin/apache2 -D FOREGROUND
