FROM dockerfile/java:openjdk-7-jre

ENV KIBANA_VERSION 4.0.0-beta3
ENV ELASTICSEARCH_URL http://localhost:9200

## Install Kibana
RUN wget -q -O - https://download.elasticsearch.org/kibana/kibana/kibana-$KIBANA_VERSION.tar.gz \
    | tar -C /usr/local/ -xzf -

EXPOSE 5601

#CMD /usr/local/kibana-$KIBANA_VERSION/bin/kibana
ADD run.sh /run.sh
CMD ["/run.sh"]
