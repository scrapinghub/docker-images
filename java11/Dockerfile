FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive \
    JAVA_HOME=/usr/lib/jvm/zulu-11-amd64

# python3 (and set it as default)
RUN apt-get update -qq && \
    apt-get install -qy software-properties-common curl vim && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update -qq && \
    apt-get install -y python3.9 python3.9-dev libpython3.9-dev && \
    curl -s -o /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    apt-get install -y python3.9-distutils && \
    python3.9 /tmp/get-pip.py && rm /tmp/get-pip.py && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.9 3

# Maven
RUN curl -sSL -o - http://www.eu.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz \
    | tar xzf - -C /usr/local/ \
    && ln -sf /usr/local/apache-maven-3.6.3/bin/mvn /usr/bin/mvn

# Zulu Java 11
# https://docs.azul.com/zulu/zuludocs/#ZuluUserGuide/InstallingZulu/InstallOnLinuxUsingAPTRepository.htm
RUN apt-get update -qq && \
    apt-get install -y curl python apt-transport-https && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9 && \
    echo "deb http://repos.azulsystems.com/ubuntu stable main" > /etc/apt/sources.list.d/zulu.list && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-get update -qq && \
    apt-get install -y zulu-11

# Install lein
RUN curl -sSL https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -o /usr/bin/lein && \
    chmod +x /usr/bin/lein && cd /tmp && lein

RUN apt-get update -qq && \
    apt-get install -qy sudo git vim curl wget telnet netcat unzip rlwrap net-tools && \
    apt-get install -qy \
        netbase ca-certificates apt-transport-https \
        build-essential \
        libxml2-dev libssl-dev libxslt1-dev \
        libmysqlclient-dev \
        libevent-dev \
        libffi-dev libssl-dev \
        libpcre3-dev libz-dev

# Clean up for docker squash
# See https://github.com/goldmann/docker-squash
RUN rm -rf \
    /root/.cache \
    /root/.npm \
    /root/.pip \
    /usr/local/share/doc/* \
    /usr/share/doc/* \
    /usr/share/man/man*/* \
    /usr/share/vim/*/doc \
    /usr/share/vim/*/lang \
    /usr/share/vim/*/spell/en* \
    /usr/share/vim/*/tutor \
    /var/lib/apt/lists/* \
    /tmp/*
