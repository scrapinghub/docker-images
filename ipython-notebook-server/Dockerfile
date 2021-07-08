FROM ubuntu:latest
Maintainer Matt Klich, Mike Risse

# Build: docker build -t docker-ipython-notebook:latest .
# Run:   docker run -d -P docker-ipython-notebook:latest

RUN apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends install --yes \
    git wget build-essential python-dev ipython ipython-notebook python-pip \
    python-numpy python-scipy python-matplotlib python-pandas python-sympy \
    python-nose python-sklearn libsndfile-dev; \
  pip install scikits.audiolab; \
  pip install git+git://github.com/scrapinghub/python-scrapinghub; \
  pip install git+git://github.com/scrapinghub/python-hubstorage;

ADD ./notebook/ /tmp/notebook/

EXPOSE 8080
ADD ./run.sh /run.sh
CMD /run.sh

