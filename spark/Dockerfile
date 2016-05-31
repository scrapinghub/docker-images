FROM scrapinghub/java:8

WORKDIR /opt/spark
ENV SPARK_HOME=/opt/spark \
    PYSPARK_PYTHON=/usr/bin/python \
    MESOS_NATIVE_JAVA_LIBRARY=/usr/local/lib/libmesos.so \
    PYTHONPATH=/opt/spark/python:/opt/spark/python/lib/py4j-0.9-src.zip

RUN mkdir -p /opt/spark && \
    curl -s -o - http://www.apache.org/dist/spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz \
         | tar xzf - --strip-components=1 -C /opt/spark && \
    rm -f /tmp/spark-1.6.1-bin-hadoop2.6.tgz

RUN apt-get update -qq && \
    apt-get install -y mesos=0.27.2-2.0.15.ubuntu1404 && \
    rm -rf /var/lib/apt/lists

COPY spark-env.sh /opt/spark/conf/spark-env.sh
