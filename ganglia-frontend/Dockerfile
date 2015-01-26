FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list && \
    apt-get update -q && \
    apt-get install -y gmetad ganglia-webfrontend && \
    a2dissite 000-default && \
    sed -r "s/Alias \/ganglia (.*)/Alias \/ \1\//" -i /etc/ganglia-webfrontend/apache.conf && \
    ln -s /etc/ganglia-webfrontend/apache.conf /etc/apache2/sites-available/000-ganglia.conf && \
    a2ensite 000-ganglia

# Add the start script
ADD bin/entry entry

# entrypoint is the start script
ENTRYPOINT ["bash", "entry"]

# Default
CMD []
