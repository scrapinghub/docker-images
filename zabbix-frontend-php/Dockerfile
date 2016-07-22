FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive

ADD http://repo.zabbix.com/zabbix/3.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.0-1+trusty_all.deb /zabbix-release.deb
RUN dpkg -i /zabbix-release.deb

RUN apt-get update -qq && apt-get install -qy --no-install-recommends zabbix-frontend-php && rm -rf /var/lib/apt/lists/*
RUN ln -sf /etc/zabbix/apache.conf /etc/apache2/conf-enabled/zabbix.conf

ADD php.ini /etc/php5/apache2/conf.d/30-zabbix.ini
ADD apache.conf /etc/apache2/conf-enabled/zabbix-server.conf

ADD run.sh /run.sh
CMD ["/run.sh"]
EXPOSE 80
