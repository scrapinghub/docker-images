FROM ubuntu:14.04
#ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -q && apt-get install -qy squid-deb-proxy
RUN sed -i -e 's#^http_port .*$#http_port 3129#' /etc/squid-deb-proxy/squid-deb-proxy.conf
RUN echo all >/etc/squid-deb-proxy/allowed-networks-src.acl.d/20-vagrant
RUN sed -i -e '/to_archive_mirrors/d' /etc/squid-deb-proxy/squid-deb-proxy.conf
VOLUME /var/cache/squid-deb-proxy
EXPOSE 3129
ADD run.sh /run.sh
CMD ["/run.sh"]
