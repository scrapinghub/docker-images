scrapinghub/ganglia-frontend
#########################

Run the container with the default values (uses as config /etc/ganglia/gmetad.conf):

    docker run -p 0.0.0.0:80:80 scrapinghub/ganglia-frontend

To set a custom gmetad.conf file via the bind mount option:

    docker run -v /my/path/to/conf:/etc/ganglia scrapinghub/ganglia-frontend

To set a custom gmetad.conf file via environment variable:

    docker run -e DEFAULT_CONFIG_FILE=/mnt/gmetad.conf scrapinghub/ganglia-frontend

To set a custom gmetad.conf file via `--config` argument:

    docker run scrapinghub/ganglia-frontend --config /mnt/gmetad.conf

> Note: Environment variable overrides default config file value, the `--config` argument overrides all other values.
