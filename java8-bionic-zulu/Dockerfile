FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive \
    JAVA_HOME=/usr/lib/jvm/zulu-8-amd64

# Zulu Java 8
# https://docs.azul.com/zulu/zuludocs/#ZuluUserGuide/InstallingZulu/InstallOnLinuxUsingAPTRepository.htm
RUN apt-get update -qq && \
    apt-get install -y curl python apt-transport-https gnupg2 && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9 && \
    echo "deb http://repos.azulsystems.com/ubuntu stable main" > /etc/apt/sources.list.d/zulu.list && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-get update -qq && \
    apt-get install -y zulu-8

# Maven
RUN curl -sSL -o - http://www.eu.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz \
    | tar xzf - -C /usr/local/ \
    && ln -sf /usr/local/apache-maven-3.6.3/bin/mvn /usr/bin/mvn

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
    pip install --no-cache-dir requests[security]==2.23.0 && \
    rm -rf ~/.cache/pip

RUN apt-get update -qq && \
    apt-get install -qy software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update -qq && \
    apt-get install -qy python3.8-dev && \
    cp -a /usr/bin/python3.8 /usr/bin/python3 && \
    cp -a /usr/local/bin/pip /tmp/pip2 && \
    curl -s -o /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python3.8 /tmp/get-pip.py && \
    cp -a /usr/local/bin/pip /usr/local/bin/pip3 && \
    cp -a /tmp/pip2 /usr/local/bin/pip && \
    cp -a /tmp/pip2 /usr/local/bin/pip2 && \
    rm -f /tmp/get-pip.py /tmp/pip2 && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives && \
    pip3 install pipenv
