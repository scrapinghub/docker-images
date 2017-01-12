### multibinder

multibinder [1] is a tiny ruby server that makes writing zero-downtime-reload services simpler. It accepts connections on a UNIX domain socket and binds an arbitrary number of LISTEN sockets given their ip+port combinations. When a bind is requested, the LISTEN socket is sent over the UNIX domain socket using ancillary data. Subsequent identical binds receive the same LISTEN socket.

multibinder runs on its own, separate from the daemons that use the sockets. multibinder can be re-exec itself to take upgrades by sending it a `SIGUSR1` - existing binds will be retained across re-execs.

[1]: https://github.com/github/multibinder

#### Usage

```
# Create directory where multibind will store its socket
mkdir -p /etc/multibinder

# Allow multibinder user in multibinder container to have full access to this directory
chown 999:999 /etc/multibinder

# Run multibinder
docker run -d -v /etc/multibinder:/run:rw -p 80:8080 scrapinghub/multibinder

# Clients should mount volume /etc/multibinder
```

#### Notes

* Multibinder process inside the container is not running as root but as the `multibinder` (uid:999, gid:999) user.

* If you want to change the socket name, you can use `MULTIBINDER_SOCK` environment variable to set the socket to use, default value is `/run/multibinder.sock`
