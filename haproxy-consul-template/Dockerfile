FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

# Install haproxy
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 505D97A41C61B9CD && \
    apt-get update && \
    apt-get install -y --no-install-recommends haproxy && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i "s/ENABLED=0/ENABLED=1/" /etc/default/haproxy

# Install consul-template
ENV CONSUL_TEMPLATE_SHA256 f3eea6dcb480ba1f82cd14c6a8f7a739dc844ac067a3541cd186eb4f9920e4e3

RUN deps='curl ca-certificates' && \
    apt-get update && apt-get install -y --no-install-recommends $deps && rm -rf /var/lib/apt/lists/* && \
    curl -sSL "https://releases.hashicorp.com/consul-template/0.18.5/consul-template_0.18.5_linux_amd64.tgz" -o consul-template.tar.gz && \
    echo "${CONSUL_TEMPLATE_SHA256}  consul-template.tar.gz" | sha256sum -c && \
    tar -xzf consul-template.tar.gz -C /usr/local/bin --touch && \
    rm consul-template.tar.gz && \
    mkdir -p /etc/consul-template && \
    curl -o /usr/local/bin/filterproxy https://s3.amazonaws.com/scrapinghub-app-splash/filterproxy && \
    chmod 755 /usr/local/bin/filterproxy && \
    apt-get purge -y --auto-remove $deps

# Start script
ADD entry entry
ENTRYPOINT ["bash","entry"]
