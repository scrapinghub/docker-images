FROM ubuntu:14.04
EXPOSE 8500
RUN apt-get update -qq && apt-get -qy install unzip
ADD https://dl.bintray.com/mitchellh/consul/0.4.1_linux_amd64.zip /consul.zip
ADD https://dl.bintray.com/mitchellh/consul/0.4.1_web_ui.zip /consul-ui.zip
RUN unzip -d /usr/local/bin/ /consul.zip &&\
    unzip -d /consul-ui /consul-ui.zip
ENTRYPOINT ["consul"]
VOLUME /consul-data
VOLUME /etc/consul.d
CMD ["agent", "-server", "-ui-dir", "/consul-ui", "-data-dir", "/consul-data", "-bootstrap-expect", "1", "-config-dir", "/etc/consul.d"]
