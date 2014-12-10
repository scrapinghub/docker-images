#!/bin/bash

pidfile=/var/run/zabbix/zabbix_server.pid
piddir=$(dirname $pidfile)

mkdir -p $piddir
chown -R zabbix:zabbix $piddir

/usr/sbin/zabbix_server -c /etc/zabbix/zabbix_server.conf

tail -f /var/log/zabbix/zabbix_server.log --pid=$(cat $pidfile)
