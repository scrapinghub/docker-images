FROM grafana/grafana:7.2.0

# Use root to install
USER root

# Install all available plugins
RUN \
  apk add curl jq && \
  for plugin in $(curl -s https://grafana.net/api/plugins?orderBy=name | jq '.items[] | select(.internal == false) | .slug' | tr -d '"' | sort); \
      do grafana-cli --pluginsDir "${GF_PATHS_PLUGINS}" plugins install $plugin; \
  done

# Run as regular user
USER grafana
