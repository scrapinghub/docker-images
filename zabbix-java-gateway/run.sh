#!/bin/bash
logfile=/var/log/zabbix/zabbix_java_gateway.log
logdir=$(dirname $logfile)
pidfile=/var/run/zabbix/zabbix_java_gateway.pid
piddir=$(dirname $pidfile)
mkdir -p $piddir $logdir
touch $logfile
chown -R zabbix:zabbix $piddir $logfile
/etc/init.d/zabbix-java-gateway start
sleep 1
tail -f $logfile --pid=$(cat $pidfile)
