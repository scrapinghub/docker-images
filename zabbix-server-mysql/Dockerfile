FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

ADD http://repo.zabbix.com/zabbix/3.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.0-1+trusty_all.deb /zabbix-release.deb

RUN dpkg -i /zabbix-release.deb
RUN apt-get update -qq && apt-get install -qy --no-install-recommends zabbix-server-mysql python python-requests

ADD run.sh /run.sh
CMD ["/run.sh"]

EXPOSE 10051
