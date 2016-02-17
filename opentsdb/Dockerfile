FROM java:7
RUN apt-get update -q && apt-get install -qy gnuplot
RUN wget -qO /opentsdb.deb https://github.com/OpenTSDB/opentsdb/releases/download/v2.2.0/opentsdb-2.2.0_all.deb && \
    dpkg --install /opentsdb.deb && \
    rm /opentsdb.deb && \
    ln -sf /usr/share/opentsdb/bin/tsdb /usr/bin/
CMD ["tsdb", "tsd"]
