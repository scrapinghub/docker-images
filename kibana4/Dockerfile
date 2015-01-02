FROM dockerfile/java:openjdk-7-jre

ENV KIBANA_VERSION 4.0.0-beta3
ENV ELASTICSEARCH_URL http://node1.dc21.scrapinghub.com:9200

## Install Kibana
RUN wget -q -O - https://download.elasticsearch.org/kibana/kibana/kibana-$KIBANA_VERSION.tar.gz \
    | tar -C /usr/local/ -xzf -

RUN sed -E \
    -e "s|elasticsearch:.+|elasticsearch: \"$ELASTICSEARCH_URL\"|" \
    -i /usr/local/kibana-$KIBANA_VERSION/config/kibana.yml

EXPOSE 5601

CMD /usr/local/kibana-$KIBANA_VERSION/bin/kibana
