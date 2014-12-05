#!/bin/bash

pidfile=/var/run/zabbix/zabbix_server.pid
piddir=$(dirname $pidfile)

mkdir -p $piddir
chown -R zabbix:zabbix $piddir

/usr/sbin/zabbix_server -c /etc/zabbix/zabbix_server.conf

trap "pkill -F $pidfile" INT TERM EXIT

tail -f /var/log/zabbix/zabbix_server.log --pid=$(cat $pidfile)
