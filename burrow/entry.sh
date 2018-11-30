#!/bin/sh

set -e

rm -f /burrow.pid
/usr/bin/Burrow -config-dir /etc/burrow
