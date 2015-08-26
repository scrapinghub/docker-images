#!/bin/bash
if [[ $ZABBIX_CONF ]]; then
  ln -sf "$ZABBIX_CONF" /etc/zabbix/web/zabbix.conf.php
fi
if [[ $APACHE_CONF ]]; then
  rm -rf /etc/apache2/sites-enabled/*
  ln -sf "$APACHE_CONF" /etc/apache2/sites-enabled/
fi
. /etc/default/apache2
. /etc/apache2/envvars
/usr/sbin/apache2 -D FOREGROUND
