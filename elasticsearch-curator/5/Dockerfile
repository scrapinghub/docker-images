FROM ubuntu:14.04
RUN apt-get update -q && apt-get install -qy python-pip
RUN pip install elasticsearch-curator==5.1.1
ENTRYPOINT ["/usr/local/bin/curator"]
