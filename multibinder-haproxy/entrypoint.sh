#!/bin/bash
set -xe

# Add haproxy as command by default
if [[ "$1" == -* ]]; then
    set -- haproxy "$@"
fi

# Run as user "haproxy" if the command is "haproxy"
if [ "$1" = 'haproxy' -a "$(id -u)" = '0' ]; then
    set -- gosu haproxy /usr/local/bin/multibinder-haproxy-wrapper /usr/local/sbin/haproxy -Ds -f $HAPROXY_CONFIG -p /var/run/multibinder-haproxy.pid
fi

exec "$@"
