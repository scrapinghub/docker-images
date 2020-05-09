FROM scrapinghub/java:8-bionic-zulu

WORKDIR /opt/spark
ENV SPARK_HOME=/opt/spark \
    HADOOP_CONF_DIR=/etc/hadoop/conf \
    PYSPARK_PYTHON=/usr/bin/python \
    MESOS_NATIVE_JAVA_LIBRARY=/usr/local/lib/libmesos.so \
    PYTHONPATH=/opt/spark/python:/opt/spark/python/lib/py4j-0.10.7-src.zip

RUN mkdir -p /opt/spark && \
    curl -sSL -o - https://downloads.apache.org/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz \
         | tar xzf - --strip-components=1 -C /opt/spark

RUN apt-get update -qq && \
    apt-get install -y curl python apt-transport-https && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 8756C4F765C9AC3CB6B85D62379CE192D401AB61 && \
    echo "deb https://dl.bintray.com/scrapinghub/spark bionic main" > /etc/apt/sources.list.d/seafio.list && \
    apt-get update -qq && \
    apt-get install -y  --no-install-recommends mesos=1.4.3-0.1.20200507155028.ubuntu1804

RUN mkdir -p /etc/hadoop/conf
ADD core-site.xml hdfs-site.xml /etc/hadoop/conf/

ADD spark-env.sh spark-defaults.conf /opt/spark/conf/
