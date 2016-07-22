FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq
RUN apt-get install -qy --no-install-recommends openjdk-7-jre-headless

ADD http://repo.zabbix.com/zabbix/3.0/ubuntu/pool/main/z/zabbix/zabbix-java-gateway_3.0.3-1+trusty_all.deb /zabbix-jgateway.deb
RUN dpkg -i /zabbix-jgateway.deb

ADD run.sh /run.sh
CMD ["/run.sh"]

EXPOSE 10052
