FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

# Install haproxy
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 505D97A41C61B9CD && \
    apt-get update && \
    apt-get install -y --no-install-recommends haproxy unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i "s/ENABLED=0/ENABLED=1/" /etc/default/haproxy

# Install consul-template
ENV CONSUL_TEMPLATE_MD5 e7aee39b7b2dd9e8b63617bf774e50de

RUN deps='curl ca-certificates' && \
    apt-get update && apt-get install -y --no-install-recommends $deps && rm -rf /var/lib/apt/lists/* && \
    curl -sSL "https://releases.hashicorp.com/consul-template/0.10.0/consul-template_0.10.0_linux_amd64.zip" -o consul-template.zip && \
    echo "${CONSUL_TEMPLATE_MD5}  consul-template.zip" | md5sum -c && \
    unzip -d /usr/local/bin consul-template.zip && \
    rm consul-template.zip && \
    mkdir -p /etc/consul-template && \
    curl -o /usr/local/bin/filterproxy https://s3.amazonaws.com/scrapinghub-app-splash/filterproxy && \
    chmod 755 /usr/local/bin/filterproxy && \
    apt-get purge -y --auto-remove $deps

# Start script
ADD entry entry
ENTRYPOINT ["bash", "entry"]
