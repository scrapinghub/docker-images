FROM python:2.7

# Add user and group to run process
RUN groupadd -r elastalert && useradd -r -m -g elastalert elastalert

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

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget gcc python-dev unzip python python-pip

# Download and install elastalert
RUN deps='gcc python-dev unzip' && \
    # Install build dependencies
    apt-get update && \
    apt-get install -y --no-install-recommends $deps && \
    rm -rf /var/lib/apt/lists/* && \

    # Download master branch
    wget 'https://github.com/Yelp/elastalert/archive/v0.1.30.zip' && \
    unzip v0.1.30.zip && \

    # Install elastalert
    mv elastalert-0.1.30 /opt/elastalert && \
    pip install -r /opt/elastalert/requirements.txt && \
    python /opt/elastalert/setup.py install && \

    # Cleanup
    apt-get purge -y --auto-remove $deps

ENV PYTHONPATH=/opt/elastalert:$PYTHONPATH

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
