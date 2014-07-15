FROM ubuntu:14.04
#ENV DEBIAN_FRONTEND noninteractive
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" \
        >/etc/apt/sources.list.d/docker.list
RUN apt-get update -qq && apt-get install -qy mongodb-org
VOLUME /var/lib/mongodb
EXPOSE 27017
ADD mongod.conf /etc/mongod.conf
ADD run.sh /run.sh
CMD ["/run.sh"]
