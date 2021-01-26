FROM ubuntu:18.04
RUN apt-get update -q && apt-get install -qy python-pip
RUN pip install elasticsearch-curator==5.8.3
ENTRYPOINT ["/usr/local/bin/curator"]
