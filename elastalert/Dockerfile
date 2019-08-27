FROM python:3.6

# Add user and group to run process
RUN groupadd -r elastalert && useradd -r -m -g elastalert elastalert

# Install wget
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget && \
    rm -rf /var/lib/apt/lists/*

# grab gosu for easy step-down from root
ENV GOSU_VERSION 1.11
RUN set -x \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true

# Install elastalert
RUN pip install elastalert==0.2.1

# The ElastAlert version pinned before uses elasticsearch==7 which is not
# fully compatible with Elasticsearch 5. `elasticsearch` library should
# match the version of the Elasticsearch cluster when possible.
RUN pip install --force-reinstall 'elasticsearch>=5.0.0,<6.0.0'

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
