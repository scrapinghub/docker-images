FROM haproxy:1.7

ENV DEBIAN_FRONTEND noninteractive

# Add user and group to run process
RUN groupadd -r haproxy && useradd -r -m -g haproxy haproxy

RUN apt-get update -qq && \
    apt-get install -y wget ruby --no-install-recommends && rm -rf /var/lib/apt/lists/*

# grab gosu for easy step-down from root
ENV GOSU_VERSION 1.7
RUN set -x \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true

RUN gem install multibinder -v 0.0.4

ENV MULTIBINDER_SOCK=/run/multibinder.sock

ENV HAPROXY_CONFIG=/etc/haproxy/site.cfg.erb

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["haproxy"]
