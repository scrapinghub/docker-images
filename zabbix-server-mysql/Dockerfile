FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive
ADD http://repo.zabbix.com/zabbix/2.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_2.2-1+trusty_all.deb /zabbix-release.deb
RUN dpkg -i /zabbix-release.deb
RUN apt-get update -qq
RUN apt-get install -qy --no-install-recommends zabbix-server-mysql
ADD run.sh /run.sh
CMD ["/run.sh"]
