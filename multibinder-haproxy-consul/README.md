# multibinder + haproxy + consul-template

## Requirements

* multibinder sock file

* Haproxy erb consul template file (consul template that will be rendered to an erb file which will be turned into a cfg by multibinder-haproxy-erb)

## Usage

    $ docker run -d --name haproxy-ct --net=host \
        # multibinder sock file
        -v /etc/multibinder:/run:rw \
        # bind mount haproxy multibinder consul template file
        -v /path/to/haproxy.cfg.erb.ctmpl:/etc/haproxy/haproxy.cfg.erb.ctmpl:ro \
        # Set consul address
        -e CONSUL_TEMPLATE_CONSUL=127.0.0.1:8500 \
        # Set consul log-level
        -e CONSUL_TEMPLATE_LOGLEVEL="debug" \
        # Use latest
        scrapinghub/multibinder-haproxy-consul
