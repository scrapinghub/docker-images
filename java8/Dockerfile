FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && \
    apt-get install -y curl python apt-transport-https && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 8756C4F765C9AC3CB6B85D62379CE192D401AB61 && \
    echo "deb https://dl.bintray.com/scrapinghub/3rdparty trusty main" > /etc/apt/sources.list.d/scrapinghub.list && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-get update -qq && \
    apt-get install -y oracle-java8-installer oracle-java8-set-default && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

RUN curl -q -o - http://www.eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz \
    | tar xzf - -C /usr/local/ \
    && ln -sf /usr/local/apache-maven-3.3.9/bin/mvn /usr/bin/mvn

RUN apt-get update -qq && \
    apt-get install -qy \
        build-essential \
        git \
        libevent-dev \
        libffi-dev \
        libfreetype6-dev \
        libjpeg8-dev \
        libmysqlclient-dev \
        libpcre3-dev \
        libpq-dev \
        libssl-dev \
        libssl-dev \
        libxml2-dev \
        libxslt1-dev \
        libz-dev \
        pkg-config \
        python-dev \
        && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

RUN curl -o /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python /tmp/get-pip.py && \
    rm -rf /tmp/get-pip.py && \
    pip install --no-cache-dir -U wheel && \
    pip install --no-cache-dir requests[security]==2.10.0 && \
    rm -rf ~/.cache/pip
