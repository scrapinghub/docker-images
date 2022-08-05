FROM grafana/grafana:7.3.6

SHELL [ "/usr/bin/env", "bash", "-ueo", "pipefail", "-c"]

# Use root to install
USER root

RUN apk --no-cache upgrade
RUN apk add --quiet --no-cache \
    ca-certificates wget curl jq udev ttf-opensans chromium; \
    update-ca-certificates;

# Install all available plugins
RUN \
  for plugin in $(curl -s https://grafana.net/api/plugins?orderBy=name | \
    jq '.items[] | select(.internal == false) | select(.slug != "grafana-image-renderer" and .slug != "doitintl-bigquery-datasource") | .slug' \
    | tr -d '"' | sort); \
      do \
      echo "${plugin}"; \
      grafana-cli plugins install "${plugin}" || echo "failed ${plugin}"; \
  done

# Install Image Renderer plugin
RUN rm -vrf /usr/share/grafana/tools/phantomjs

ENV GF_RENDERER_PLUGIN_CHROME_BIN="/usr/bin/chromium-browser"

RUN grafana-cli \
        plugins install grafana-image-renderer;

RUN \
  mkdir -p /var/lib/grafana/plugins/doitintl-bigquery-datasource && \
  wget -O /tmp/doitintl-bigquery-datasource.zip https://github.com/doitintl/bigquery-grafana/releases/download/2.0.1/doitintl-bigquery-datasource-2.0.1.zip && \
  unzip /tmp/doitintl-bigquery-datasource.zip -d /var/lib/grafana/plugins/doitintl-bigquery-datasource && \
  rm /tmp/doitintl-bigquery-datasource.zip

# Run as regular user
USER grafana
