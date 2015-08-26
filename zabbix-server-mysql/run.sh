#!/bin/bash

PIDFILE=/var/run/zabbix/zabbix_server.pid
PIDDIR=$(dirname $pidfile)
CFGFILE=${CFGFILE:-/etc/zabbix/zabbix_server.conf}

mkdir -p $PIDDIR
chown -R zabbix:zabbix $PIDDIR

/usr/sbin/zabbix_server -c $CFGFILE

sleep 5
tail -f /var/log/zabbix/zabbix_server.log --pid=$(cat $PIDFILE)

# Provide some time in case something needs to be debugged
sleep 30
