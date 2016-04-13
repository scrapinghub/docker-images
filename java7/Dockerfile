FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive

# Setup Java
# ==========

# Add webupdate8 apt repo & signing key
ADD ./java7.list /etc/apt/sources.list.d/java7.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7B2C3B0889BF5709A105D03AC2518248EEA14886

# Accept oracle license in debconf
ADD ./java7.debconf /tmp/java7.debconf
RUN cat /tmp/java7.debconf |debconf-set-selections

# Install Oracle Java7
RUN apt-get update -qq \
    && apt-get install -qy oracle-java7-installer \
    && rm -f /var/cache/oracle-jdk7-installer/jdk*tar.gz \
    && ln -sf java-7-oracle /usr/lib/jvm/default-java \
    && apt-get purge -y openjdk-\* icedtea-\* icedtea6-\* \
    && rm -rf /var/lib/apt/lists

# Install maven 3.x
RUN wget -qO- http://www.eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz \
    | tar xzf - -C /usr/local/ \
    && ln -sf /usr/local/apache-maven-3.3.9/bin/mvn /usr/bin/mvn
