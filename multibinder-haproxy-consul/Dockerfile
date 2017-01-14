FROM scrapinghub/multibinder-haproxy:latest

RUN deps='curl unzip' && \
    apt-get update && apt-get install -y --no-install-recommends $deps && rm -rf /var/lib/apt/lists/* && \

    curl -sSL "https://releases.hashicorp.com/consul-template/0.16.0/consul-template_0.16.0_linux_amd64.zip" -o /tmp/consul-template.zip && \
    echo "064b0b492bb7ca3663811d297436a4bbf3226de706d2b76adade7021cd22e156  /tmp/consul-template.zip" | sha256sum -c && \

    unzip -DD -o /tmp/consul-template.zip -d /usr/local/bin/ && \

    rm /tmp/consul-template.zip && \

    mkdir -p /etc/consul-template && \
    apt-get purge -y --auto-remove $deps

ENV CONSUL_TEMPLATE_CONFIG=/etc/consul-template

ENV CONSUL_TEMPLATE_CONSUL="localhost:8500"

ENV CONSUL_TEMPLATE_LOGLEVEL="info"

COPY entrypoint.sh /

COPY config/* /etc/consul-template/

ENTRYPOINT ["/entrypoint.sh"]

CMD ["consul-template"]
