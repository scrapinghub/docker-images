FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
ENV UPDATED_AT 20160413

WORKDIR /opt/spark
ENV SPARK_HOME=/opt/spark \
    PYSPARK_PYTHON=/usr/bin/python \
    MESOS_NATIVE_JAVA_LIBRARY=/usr/local/lib/libmesos.so \
    HADOOP_CONF_DIR=/etc/hadoop/conf \
    PYTHONPATH=/opt/spark/python:/opt/spark/python/lib/py4j-0.9-src.zip

RUN apt-get update -qq && \
    apt-get install -y curl python apt-transport-https && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 8756C4F765C9AC3CB6B85D62379CE192D401AB61 && \
    echo "deb https://dl.bintray.com/scrapinghub/3rdparty trusty main" > /etc/apt/sources.list.d/scrapinghub.list && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-get update -qq && \
    apt-get install -y oracle-java8-installer oracle-java8-set-default && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

RUN curl -o /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python /tmp/get-pip.py && \
    rm -f /tmp/get-pip.py && \
    pip install -U wheel && \
    pip install ipython

RUN curl -o /tmp/spark-1.6.1-bin-hadoop2.6.tgz http://www.apache.org/dist/spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz && \
    mkdir -p /opt/spark && \
    tar xf /tmp/spark-1.6.1-bin-hadoop2.6.tgz --strip-components=1 -C /opt/spark && \
    rm -f /tmp/spark-1.6.1-bin-hadoop2.6.tgz

RUN apt-get update -qq && \
    apt-get install -y mesos=0.27.2-2.0.15.ubuntu1404 && \
    rm -rf /var/lib/apt/lists

RUN curl -q -o - http://www.eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz \
    | tar xzf - -C /usr/local/ \
    && ln -sf /usr/local/apache-maven-3.3.9/bin/mvn /usr/bin/mvn

COPY spark-defaults.conf /opt/spark/conf/spark-defaults.conf
COPY spark-env.sh /opt/spark/conf/spark-env.sh
