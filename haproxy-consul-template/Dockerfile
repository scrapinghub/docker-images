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
ENV CONSUL_TEMPLATE_MD5 c09d9e77ff079e17b7097af882eab5d6

RUN deps='curl ca-certificates' && \
    apt-get update && apt-get install -y --no-install-recommends $deps && rm -rf /var/lib/apt/lists/* && \
    curl -sSL "https://github.com/hashicorp/consul-template/releases/download/v0.10.0/consul-template_0.10.0_linux_amd64.tar.gz" -o consul-template.tar.gz && \
    echo "${CONSUL_TEMPLATE_MD5}  consul-template.tar.gz" | md5sum -c && \
    tar -xzf consul-template.tar.gz --strip-components=1 -C /usr/local/bin --touch && \
    rm consul-template.tar.gz && \
    mkdir -p /etc/consul-template && \
    apt-get purge -y --auto-remove $deps

RUN curl -o /usr/local/bin/filterproxy https://s3.amazonaws.com/scrapinghub-app-splash/filterproxy

# Start script
ADD entry entry
ENTRYPOINT ["bash", "entry"]
