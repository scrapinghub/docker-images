#!/bin/bash
if [[ ! -e /var/lib/mongodb/journal && $ADMIN_SECRET ]]; then
  /usr/bin/mongod --config /etc/mongod.conf &
  pid=$!
  sleep 1
  mongo admin <<!
db.addUser({user: 'admin',
            pwd: '$ADMIN_SECRET',
            roles: ['userAdminAnyDatabase', 'readWriteAnyDatabase',
                    'dbAdminAnyDatabase', 'clusterAdmin']});
!
  kill $pid
  wait $pid
  exit
fi

ulimit -n 64000 64000
ulimit -u 32000 32000
exec /usr/bin/mongod --auth --config /etc/mongod.conf
