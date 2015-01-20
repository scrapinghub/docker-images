FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list && \    
    apt-get update -q && \    
    apt-get install -y gmetad ganglia-webfrontend && \
    ln -s /etc/ganglia-webfrontend/apache.conf /etc/apache2/sites-enabled/001-ganglia.conf

# Add the start script
ADD bin/entry entry

# entrypoint is the start script
ENTRYPOINT ["bash", "entry"]

# Default
CMD []
