FROM scrapinghub/java:11

WORKDIR /opt/spark
ENV SPARK_HOME=/opt/spark \
    HADOOP_CONF_DIR=/etc/hadoop/conf \
    PYSPARK_PYTHON=/usr/bin/python \
    MESOS_NATIVE_JAVA_LIBRARY=/usr/local/lib/libmesos.so \
    PYTHONPATH=/opt/spark/python:/opt/spark/python/lib/py4j-0.10.9.3-src.zip

RUN mkdir -p /opt/spark && \
    curl -sSL -o - https://dlcdn.apache.org/spark/spark-3.2.1/spark-3.2.1-bin-hadoop3.2.tgz \
         | tar xzf - --strip-components=1 -C /opt/spark && \
    apt-get update -qq && \
    mkdir -p /etc/hadoop/conf

# RUN apt-get install -y mesos=1.0.1-2.0.93.ubuntu1404

RUN mkdir -p /etc/hadoop/conf
ADD core-site.xml hdfs-site.xml /etc/hadoop/conf/

ADD spark-env.sh spark-defaults.conf /opt/spark/conf/

# Clean up for docker squash
# See https://github.com/goldmann/docker-squash
RUN rm -rf \
    /root/.cache \
    /root/.npm \
    /root/.pip \
    /usr/local/share/doc \
    /usr/share/doc \
    /usr/share/man \
    /usr/share/vim/vim74/doc \
    /usr/share/vim/vim74/lang \
    /usr/share/vim/vim74/spell/en* \
    /usr/share/vim/vim74/tutor \
    /var/lib/apt/lists/* \
    /tmp/*
