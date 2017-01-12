### multibinder-haproxy

multibinder [1] + haproxy

[1]: https://github.com/github/multibinder

#### Usage

```
# Run multibinder...

# Load volume where multibinder stores its sock file
# Make sure that config location is writable by user haproxy:haproxy (999:999)
docker run -d --name haproxy --net=bridge -v /etc/multibinder:/run:rw -v /root/multibinder-haproxy/haproxy.cfg.erb:/tmp/haproxy.cfg.erb:rw -e HAPROXY_CONFIG=/tmp/haproxy.cfg.erb scrapinghub/multibinder-haproxy

```

#### Notes

* Haproxy (multibinder) process inside the container is not running as root but as the `haproxy` (uid:999, gid:999) user.

* If you want to change the socket name, you can use `MULTIBINDER_SOCK` environment variable to set the socket to use, default value is `/run/multibinder.sock`
