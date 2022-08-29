ARG GRAFANA_VERSION
FROM "grafana/grafana:${GRAFANA_VERSION}"

SHELL [ "/usr/bin/env", "bash", "-ueo", "pipefail", "-c"]

# Use root to install
USER root

RUN apk --no-cache upgrade
RUN apk add --quiet --no-cache \
    ca-certificates wget curl jq udev ttf-opensans chromium; \
    update-ca-certificates;


# list of existing plugins
# https://grafana.net/api/plugins?orderBy=name
ENV PLUGINS="\
alexanderzobnin-zabbix-app \
grafana-azure-data-explorer-datasource \
grafana-bigquery-datasource \
grafana-github-datasource \
grafana-googlesheets-datasource \
grafana-iot-sitewise-datasource \
grafana-strava-datasource \
grafana-timestream-datasource \
grafana-x-ray-datasource \
marcusolsson-csv-datasource \
oci-logs-datasource \
oci-metrics-datasource \
redis-datasource \
vertamedia-clickhouse-datasource \
vertica-grafana-datasource \
"

RUN \
  for plugin in ${PLUGINS}; do \
      grafana-cli plugins install "${plugin}" | \
        grep '^✔ Downloaded.*successfully' || \
            { echo "failed ${plugin}"; exit 1; }; \
  done

# workaround https://github.com/sbueringer/grafana-consul-datasource/issues/29
RUN grafana-cli \
        --pluginUrl https://github.com/sbueringer/grafana-consul-datasource/releases/download/v0.2.1/sbueringer-consul-datasource-0.2.1.zip \
        plugins install sbueringer-consul-datasource

# picking upstream Grafana Image Renderer because it can be installed without chromium
ENV GF_PLUGIN_RENDERING_CHROME_BIN="/usr/bin/chromium-browser"
RUN grafana-cli \
        --pluginUrl https://github.com/grafana/grafana-image-renderer/releases/latest/download/plugin-linux-x64-glibc-no-chromium.zip \
        plugins install grafana-image-renderer

# Run as regular user
USER grafana
