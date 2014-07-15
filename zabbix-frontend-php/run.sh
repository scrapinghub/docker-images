#!/bin/bash
. /etc/default/apache2
. /etc/apache2/envvars
/usr/sbin/apache2 -D FOREGROUND
