FROM grafana/grafana:8.5.5

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
grafana-image-renderer \
grafana-iot-sitewise-datasource \
grafana-strava-datasource \
grafana-timestream-datasource \
grafana-x-ray-datasource \
marcusolsson-csv-datasource \
oci-logs-datasource \
oci-metrics-datasource \
redis-datasource \
sbueringer-consul-datasource \
vertamedia-clickhouse-datasource \
vertica-grafana-datasource \
"

ENV GF_RENDERER_PLUGIN_CHROME_BIN="/usr/bin/chromium-browser"

RUN \
  for plugin in ${PLUGINS}; do \
      grafana-cli plugins install "${plugin}" | \
        grep '^✔ Downloaded.*successfully' || \
            { echo "failed ${plugin}"; exit 1; }; \
  done

# Run as regular user
USER grafana
