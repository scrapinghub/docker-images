FROM grafana/grafana:7.3.6

# Use root to install
USER root

RUN \
    apk update && \
    apk add ca-certificates wget && \
    update-ca-certificates

# Install all available plugins
RUN \
  apk add curl jq && \
  for plugin in $(curl -s https://grafana.net/api/plugins?orderBy=name | jq '.items[] | select(.internal == false) | select(.slug != "grafana-image-renderer" and .slug != "doitintl-bigquery-datasource") | .slug' | tr -d '"' | sort); \
      do grafana-cli plugins install $plugin; \
  done

# Install Image Renderer plugin
RUN \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --no-cache  upgrade && \
    apk add --no-cache udev ttf-opensans chromium && \
    rm -rf /tmp/* && \
    rm -rf /usr/share/grafana/tools/phantomjs;

ENV GF_RENDERER_PLUGIN_CHROME_BIN="/usr/bin/chromium-browser"

RUN \
    grafana-cli \
        plugins install grafana-image-renderer;

RUN \
  mkdir -p /var/lib/grafana/plugins/doitintl-bigquery-datasource && \
  wget -O /tmp/doitintl-bigquery-datasource.zip https://github.com/doitintl/bigquery-grafana/releases/download/2.0.1/doitintl-bigquery-datasource-2.0.1.zip && \
  unzip /tmp/doitintl-bigquery-datasource.zip -d /var/lib/grafana/plugins/doitintl-bigquery-datasource && \
  rm /tmp/doitintl-bigquery-datasource.zip

# Run as regular user
USER grafana
