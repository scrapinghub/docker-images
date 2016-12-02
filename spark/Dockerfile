FROM scrapinghub/java:8

WORKDIR /opt/spark
ENV SPARK_HOME=/opt/spark \
    HADOOP_CONF_DIR=/etc/hadoop/conf \
    PYSPARK_PYTHON=/usr/bin/python \
    MESOS_NATIVE_JAVA_LIBRARY=/usr/local/lib/libmesos.so \
    PYTHONPATH=/opt/spark/python:/opt/spark/python/lib/py4j-0.9-src.zip

RUN mkdir -p /opt/spark && \
    curl -sSL -o - http://d3kbcqa49mib13.cloudfront.net/spark-1.6.3-bin-hadoop2.6.tgz \
         | tar xzf - --strip-components=1 -C /opt/spark && \
    apt-get update -qq && \
    apt-get install -y mesos=1.0.1-2.0.93.ubuntu1404 && \
    mkdir -p /etc/hadoop/conf

ADD core-site.xml hdfs-site.xml /etc/hadoop/conf/
ADD spark-env.sh spark-defaults.conf /opt/spark/conf/
