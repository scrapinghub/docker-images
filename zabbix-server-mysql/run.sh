#!/bin/bash

PIDDIR=${PIDDIR:-/var/run/zabbix}
PIDFILE=${PIDFILE:-$PIDDIR/zabbix_server.pid}
CFGFILE=${CFGFILE:-/etc/zabbix/zabbix_server.conf}
LOGFILE=${LOGFILE:-/var/log/zabbix/zabbix_server.log}

mkdir -p $PIDDIR
chown -R zabbix:zabbix $PIDDIR

/usr/sbin/zabbix_server -c $CFGFILE

sleep 5
tail -f $LOGFILE --pid=$(cat $PIDFILE)

# Provide some time in case something needs to be debugged
sleep 30
