FROM scrapinghub/java:8-bionic-zulu
RUN apt-get update -q && apt-get install -qy gnuplot
RUN curl -sSL -o /opentsdb.deb https://github.com/OpenTSDB/opentsdb/releases/download/v2.4.0/opentsdb-2.4.0_all.deb && \
    dpkg --install /opentsdb.deb && \
    rm /opentsdb.deb && \
    ln -sf /usr/share/opentsdb/bin/tsdb /usr/bin/
CMD ["tsdb", "tsd"]
