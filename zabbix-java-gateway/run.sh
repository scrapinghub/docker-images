#!/bin/bash
logfile=/var/log/zabbix/zabbix_java_gateway.log
logdir=$(dirname $logfile)
pidfile=/var/run/zabbix/zabbix_java_gateway.pid
piddir=$(dirname $pidfile)
mkdir -p $piddir $logdir
touch $logfile
chown -R zabbix:zabbix $piddir $logfile
/etc/init.d/zabbix-java-gateway start
while [ ! -f $pidfile ]
do
  sleep 1
done
tail -f $logfile --pid=$(cat $pidfile)
