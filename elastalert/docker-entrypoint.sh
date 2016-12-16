#!/bin/bash
set -xe

# Add elastalert as command by default
if [[ "$1" == -* ]]; then
    set -- elastalert "$@"
fi

# Run as user "elastalert" if the command is "elastalert"
if [ "$1" = 'elastalert' -a "$(id -u)" = '0' ]; then
    set -- gosu elastalert "$@"
fi

exec "$@"
