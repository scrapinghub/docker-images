FROM ubuntu:14.04
RUN apt-get update -q && apt-get install -qy python-pip
RUN pip install elasticsearch-curator==4.3.0
ENTRYPOINT ["/usr/local/bin/curator"]
