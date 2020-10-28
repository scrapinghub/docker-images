FROM grafana/grafana:7.2.0

# Use root to install
USER root

# Install all available plugins
RUN \
  apk add curl jq && \
  for plugin in $(curl -s https://grafana.net/api/plugins?orderBy=name | jq '.items[] | select(.internal == false) | select(.slug != "grafana-image-renderer") | .slug' | tr -d '"' | sort); \
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
    rm -rf /usr/share/grafana/tools/phantomjs; \
fi

ENV GF_RENDERER_PLUGIN_CHROME_BIN="/usr/bin/chromium-browser"

RUN \
    grafana-cli \
        plugins install grafana-image-renderer; \
fi

# Run as regular user
USER grafana
