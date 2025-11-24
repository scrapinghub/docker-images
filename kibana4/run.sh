#!/bin/sh

sed -E \
    -e "s|elasticsearch:.+|elasticsearch: \"$ELASTICSEARCH_URL\"|" \
    -i /usr/local/kibana-$KIBANA_VERSION/config/kibana.yml

/usr/local/kibana-$KIBANA_VERSION/bin/kibana
