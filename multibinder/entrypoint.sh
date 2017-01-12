#!/bin/bash
set -xe

# Add multibinder as command by default
if [[ "$1" == -* ]]; then
    set -- multibinder "$@"
fi

# Run as user "multibinder" if the command is "multibinder"
if [ "$1" = 'multibinder' -a "$(id -u)" = '0' ]; then
    set -- gosu multibinder multibinder "${MULTIBINDER_SOCK}"
fi

exec "$@"
