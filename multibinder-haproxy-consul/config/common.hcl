wait = "1s:10s"

exec {
  # Run multibinder haproxy wrapper as child process
  command = "/usr/local/bin/multibinder-haproxy-wrapper /usr/local/sbin/haproxy -Ds -f /etc/haproxy/haproxy.cfg.erb -p /var/run/multibinder-haproxy.pid"
  
  # Tell multibinder haproxy wrapper to reload haproxy config
  reload_signal = "SIGUSR2"

  # Gracefully shutdown multibinder haproxy wrapper
  kill_signal = "SIGTERM"
}
