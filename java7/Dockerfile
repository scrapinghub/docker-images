FROM ubuntu:12.04
ENV DEBIAN_FRONTEND noninteractive

# Accept oracle license in debconf
ADD java7.debconf /tmp/java7.debconf
# Add webupdate8 apt repo
ADD java7.list /etc/apt/sources.list.d/java7.list
# Add webupdate8 signing key
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7B2C3B0889BF5709A105D03AC2518248EEA14886
RUN apt-get update -qq

RUN cat /tmp/java7.debconf |debconf-set-selections
RUN apt-get install -qy oracle-java7-installer
RUN rm -f /var/cache/oracle-jdk7-installer/jdk*tar.gz
RUN ln -sf java-7-oracle /usr/lib/jvm/default-java
# see the following link for why this is needed:  http://askubuntu.com/questions/21131
RUN apt-get purge -y openjdk-\* icedtea-\* icedtea6-\*
ADD http://www.eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz /usr/local/
# Install maven 3.x
RUN tar xf /usr/local/apache-maven-3.3.9-bin.tar.gz -C /usr/local/ \
    && rm -f /usr/local/apache-maven-3.3.9-bin.tar.gz \
    && ln -sf /usr/local/apache-maven-3.3.9/bin/mvn /usr/bin/mvn
