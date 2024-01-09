FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive \
    JAVA_HOME=/usr/lib/jvm/zulu11

# python3 (and set it as default)
RUN apt-get update -qq && \
    apt-get install -qy software-properties-common curl vim && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update -qq && \
    apt-get install -y python3.12 python3.12-dev libpython3.12-dev && \
    curl -s -o /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    apt-get install -y python3.12-distutils && \
    python3.12 /tmp/get-pip.py && rm /tmp/get-pip.py && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.12 3 && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 3

# Maven
RUN curl -k -sSL -o - https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz \
    | tar xzf - -C /usr/local/ \
    && ln -sf /usr/local/apache-maven-3.9.4/bin/mvn /usr/bin/mvn

# Zulu Java 11
# https://docs.azul.com/zulu/zuludocs/#ZuluUserGuide/InstallingZulu/InstallOnLinuxUsingAPTRepository.htm
RUN apt-get update -qq && \
    apt-get install -y curl apt-transport-https && \
    curl -s https://repos.azul.com/azul-repo.key | gpg --dearmor -o /usr/share/keyrings/azul.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/azul.gpg] https://repos.azul.com/zulu/deb stable main" > /etc/apt/sources.list.d/zulu.list && \
    apt-get update -qq && \
    apt-get install -y zulu11-jdk

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
