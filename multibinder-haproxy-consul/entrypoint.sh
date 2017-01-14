#!/bin/bash
set -xe

# Add consul-template as command by default
if [[ "$1" == -* ]]; then
    set -- consul-template "$@"
fi

# Run as user "haproxy" if the command is "haproxy"
if [ "$1" = 'consul-template' -a "$(id -u)" = '0' ]; then
    shift
    set -- gosu haproxy /usr/local/bin/consul-template -log-level=$CONSUL_TEMPLATE_LOGLEVEL -consul=$CONSUL_TEMPLATE_CONSUL -config=$CONSUL_TEMPLATE_CONFIG "$@"
fi

exec "$@"
