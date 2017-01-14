template {
  # Convert ctmpl into cfg.erb
  source = "/etc/haproxy/haproxy.cfg.erb.ctmpl"
  destination = "/etc/haproxy/haproxy.cfg.erb"

  # Use multibinder-haproxy-erb to render cfg.erb into cfg and check config
  command = "/usr/local/bin/multibinder-haproxy-erb /usr/local/sbin/haproxy -c -f /etc/haproxy/haproxy.cfg.erb"
}
