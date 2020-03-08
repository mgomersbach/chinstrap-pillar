sysctl:
  params:
    net.ipv4.ip_forward:
      value: 1
      config: 01-net.conf
    net.ipv4.conf.all.forwarding:
      value: 1
      config: 01-net.conf
    net.ipv4.conf.default.forwarding:
      value: 1
      config: 01-net.conf
    net.ipv6.conf.all.forwarding:
      value: 1
      config: 01-net.conf
    net.ipv6.conf.default.forwarding:
      value: 1
      config: 01-net.conf
