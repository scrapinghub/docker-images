FROM scrapinghub/java:11

WORKDIR /opt/spark
ENV SPARK_HOME=/opt/spark \
    HADOOP_CONF_DIR=/etc/hadoop/conf \
    PYSPARK_PYTHON=/usr/bin/python \
    MESOS_NATIVE_JAVA_LIBRARY=/usr/local/lib/libmesos.so \
    PYTHONPATH=/opt/spark/python:/opt/spark/python/lib/py4j-0.10.9-src.zip

RUN cd /tmp && \
    wget http://apt.zyte.group/zyte/key.asc \
    && apt-key add key.asc \
    && rm -f key.asc \
    && echo 'deb http://apt.zyte.group/zyte trusty main' > /etc/apt/sources.list.d/zyte.list \
    && apt-get update -qq

RUN mkdir -p /opt/spark && \
    curl -sSL -o - https://dlcdn.apache.org/spark/spark-3.1.3/spark-3.1.3-bin-hadoop3.2.tgz \
         | tar xzf - --strip-components=1 -C /opt/spark && \
    apt-get update -qq && \
    mkdir -p /etc/hadoop/conf

# 2022.07.06 The latest zulu-11 could provide the virtual java pkg mesos depends on
RUN apt-get update -qq \
    && apt-get install -y \
    mesos=1.4.3-0.1.20200507155028.ubuntu1804 \
    zulu-11

RUN mkdir -p /etc/hadoop/conf
ADD core-site.xml hdfs-site.xml /etc/hadoop/conf/

ADD spark-env.sh spark-defaults.conf /opt/spark/conf/

# Clean up for docker squash
# See https://github.com/goldmann/docker-squash
# RUN rm -rf \
#     /root/.cache \
#     /root/.npm \
#     /root/.pip \
#     /usr/local/share/doc \
#     /usr/share/doc \
#     /usr/share/man \
#     /usr/share/vim/vim74/doc \
#     /usr/share/vim/vim74/lang \
#     /usr/share/vim/vim74/spell/en* \
#     /usr/share/vim/vim74/tutor \
#     /var/lib/apt/lists/* \
#     /tmp/*
