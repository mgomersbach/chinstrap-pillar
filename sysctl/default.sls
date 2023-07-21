sysctl:
  params:
    # Increase size of file handles and inode cache
    fs.file-max:
      value: {{ (grains.mem_total * 1048576 / 4194304 * 256)|int|abs }}
      config: 02-fs.conf
    # Increase amount of maximum watches for inotify
    fs.inotify.max_user_watches:
      value: {{ (grains.num_cpus * 131072)|int|abs }}
      config: 02-fs.conf
    # Restrict core dumps
    fs.suid_dumpable:
      value: 0
      config: 02-fs.conf
    # eliminate entire class of time-of-check-time-of-use cross-privilege attacks
    fs.protected_hardlinks:
      value: 1
    fs.protected_symlinks:
      value: 1
    # Do less swapping
    vm.swappiness:
      value: 1
      config: 00-vm.conf
    vm.dirty_ratio:
      value: 5
      config: 00-vm.conf
    vm.dirty_background_ratio:
      value: 15
      config: 00-vm.conf
    # New overcommit logic as previous was completely misunderstood
    {% if (grains.mem_total > grains.swap_total) and (grains.swap_total != 0) %}
    vm.overcommit_memory:
      value: 2
      config: 00-vm.conf
    vm.overcommit_ratio:
      value: {{ (100 * (grains.mem_total - grains.swap_total) / grains.mem_total)|int|abs }}
      config: 00-vm.conf
    {% else %}
    vm.overcommit_memory:
      value: 0
      config: 00-vm.conf
    vm.overcommit_ratio:
      value: 0
      config: 00-vm.conf
    {% endif %}
    # Keep at least 0.01 of free RAM space available
    vm.min_free_kbytes:
      value: {{ (grains.mem_total * 1024 * 0.01)|int|abs }}
      config: 00-vm.conf
    # Allow for more PIDs
    kernel.pid_max:
      value: 65536
      config: 01-kernel.conf
    # Controls the maximum size of a message, in bytes
    kernel.msgmnb:
      value: 65536
      config: 01-kernel.conf
    # Controls the default maximum size of a message queue
    kernel.msgmax:
      value: 65536
      config: 01-kernel.conf
    # Set maximum amount of memory allocated to shm to 0.9 of memory
    kernel.shmmax:
      value: {{ (grains.mem_total * 1048576 * 0.9)|int|abs }}
      config: 01-kernel.conf
    kernel.shmall:
      value: {{ (grains.mem_total * 1048576 / 4096)|int|abs }}
      config: 01-kernel.conf
    # Prevent SYN attack, enable SYN cookies (they will kick-in when the max_syn_backlog reached)
    net.ipv4.tcp_syn_retries:
      value: 3
      config: 01-net.conf
    net.ipv4.tcp_synack_retries:
      value: 2
      config: 01-net.conf
    # Disables packet forwarding
    net.ipv4.ip_forward:
      value: 0
      config: 01-net.conf
    net.ipv4.conf.all.forwarding:
      value: 0
      config: 01-net.conf
    net.ipv4.conf.default.forwarding:
      value: 0
      config: 01-net.conf
    net.ipv6.conf.all.forwarding:
      value: 0
      config: 01-net.conf
    net.ipv6.conf.default.forwarding:
      value: 0
      config: 01-net.conf
    # Allow for loopback
    net.ipv4.conf.lo.forwarding:
      value: 1
      config: 01-net.conf
    # Disables IP source routing
    net.ipv4.conf.all.send_redirects:
      value: 0
      config: 01-net.conf
    net.ipv4.conf.default.send_redirects:
      value: 0
      config: 01-net.conf
    net.ipv4.conf.all.accept_source_route:
      value: 0
      config: 01-net.conf
    net.ipv4.conf.default.accept_source_route:
      value: 0
      config: 01-net.conf
    net.ipv6.conf.all.accept_source_route:
      value: 0
      config: 01-net.conf
    net.ipv6.conf.default.accept_source_route:
      value: 0
      config: 01-net.conf
    # Allow for loopback
    net.ipv4.conf.lo.send_redirects:
      value: 1
      config: 01-net.conf
    net.ipv4.conf.lo.accept_source_route:
      value: 1
      config: 01-net.conf
    # Enable IP spoofing protection, turn on source route verification
    net.ipv4.conf.all.rp_filter:
      value: 2
      config: 01-net.conf
    net.ipv4.conf.default.rp_filter:
      value: 1
      config: 01-net.conf
    # Disable for loopback
    net.ipv4.conf.lo.rp_filter:
      value: 0
      config: 01-net.conf
    # Disable ICMP Redirect Acceptance
    net.ipv4.conf.all.accept_redirects:
      value: 0
      config: 01-net.conf
    net.ipv4.conf.default.accept_redirects:
      value: 0
      config: 01-net.conf
    net.ipv4.conf.all.secure_redirects:
      value: 1
      config: 01-net.conf
    net.ipv4.conf.default.secure_redirects:
      value: 1
      config: 01-net.conf
    net.ipv6.conf.all.accept_redirects:
      value: 0
      config: 01-net.conf
    net.ipv6.conf.default.accept_redirects:
      value: 0
      config: 01-net.conf
    # Enable for loopback
    net.ipv4.conf.lo.accept_redirects:
      value: 1
      config: 01-net.conf
    net.ipv4.conf.lo.secure_redirects:
      value: 0
      config: 01-net.conf
    # Enable Log Spoofed Packets, Source Routed Packets, Redirect Packets
    net.ipv4.conf.all.log_martians:
      value: 1
      config: 01-net.conf
    net.ipv4.conf.default.log_martians:
      value: 1
      config: 01-net.conf
    # Disable for loopback
    net.ipv4.conf.lo.log_martians:
      value: 0
      config: 01-net.conf
    # Decrease the time default value for tcp_fin_timeout connection
    net.ipv4.tcp_fin_timeout:
      value: 10
      config: 01-net.conf
    # Decrease the time default value for connections to keep alive
    net.ipv4.tcp_keepalive_time:
      value: 300
      config: 01-net.conf
    net.ipv4.tcp_keepalive_probes:
      value: 3
      config: 01-net.conf
    net.ipv4.tcp_keepalive_intvl:
      value: 3
      config: 01-net.conf
    # Don't relay bootp
    net.ipv4.conf.all.bootp_relay:
      value: 0
      config: 01-net.conf
    # Enable for loopback
    net.ipv4.conf.lo.bootp_relay:
      value: 1
      config: 01-net.conf
    # Don't proxy arp for anyone
    net.ipv4.conf.all.proxy_arp:
      value: 0
      config: 01-net.conf
    # Enable for loopback
    net.ipv4.conf.lo.proxy_arp:
      value: 1
      config: 01-net.conf
    # Turn on SACK
    net.ipv4.tcp_dsack:
      value: 1
      config: 01-net.conf
    net.ipv4.tcp_sack:
      value: 1
      config: 01-net.conf
    net.ipv4.tcp_fack:
      value: 1
      config: 01-net.conf
    # Turn on the tcp_timestamps, accurate timestamp make TCP congestion control algorithms work better
    net.ipv4.tcp_timestamps:
      value: 1
      config: 01-net.conf
    # Enable ignoring broadcasts request
    net.ipv4.icmp_echo_ignore_broadcasts:
      value: 0
      config: 01-net.conf
    # Allowed local port range
    net.ipv4.ip_local_port_range:
      value: "1024 65533"
      config: 01-net.conf
    # Enable a fix for RFC1337 - time-wait assassination hazards in TCP
    net.ipv4.tcp_rfc1337:
      value: 1
      config: 01-net.conf
    # Turn on the tcp_window_scaling
    net.ipv4.tcp_window_scaling:
      value: 1
      config: 01-net.conf
    net.ipv4.tcp_rmem:
      value: "8192 87380 16777216"
      config: 01-net.conf
    net.ipv4.udp_rmem_min:
      value: 16384
      config: 01-net.conf
    net.core.rmem_default:
      value: 131072
      config: 01-net.conf
    net.core.rmem_max:
      value: 16777216
      config: 01-net.conf
    # Increase the write-buffer space allocatable
    net.ipv4.tcp_wmem:
      value: "8192 87380 16777216"
      config: 01-net.conf
    net.ipv4.udp_wmem_min:
      value: 16384
      config: 01-net.conf
    net.core.wmem_default:
      value: 131072
      config: 01-net.conf
    net.core.wmem_max:
      value: 16777216
      config: 01-net.conf
    # Increase number of incoming connections
    net.core.somaxconn:
      value: 32768
      config: 01-net.conf
    # Increase maximum size of the receive queue
    net.core.netdev_max_backlog:
      value: 2000
      config: 01-net.conf
    # Increase the maximum amount of option memory buffers
    net.core.optmem_max:
      value: 16777216
      config: 01-net.conf
    # Increase the tcp-time-wait buckets pool size to prevent simple DOS attacks
    net.ipv4.tcp_max_tw_buckets:
      value: {{ (grains.mem_total * 1048576 / 4194304 * 256 * 2)|round|int|abs }}
      config: 01-net.conf
    # Allow tw_reuse
    net.ipv4.tcp_tw_reuse:
      value: 2
      config: 01-net.conf
    # Limit number of orphans, each orphan can eat up to 16M (max wmem) of unswappable memory
    net.ipv4.tcp_max_orphans:
      value: {{ ((grains.mem_total * 1048576 * 0.1 / 65536) /4)|round|int|abs }}
      config: 01-net.conf
    net.ipv4.tcp_orphan_retries:
      value: 4
      config: 01-net.conf
    # Increase the maximum memory used to reassemble IP fragments
    net.ipv4.ipfrag_low_thresh:
      value: 3145728
      config: 01-net.conf
    net.ipv4.ipfrag_high_thresh:
      value: 8388608
      config: 01-net.conf
    # Increase size of RPC datagram queue length
    net.unix.max_dgram_qlen:
      value: 512
      config: 01-net.conf
    # Don't allow the arp table to become bigger than this
    net.ipv4.neigh.default.gc_thresh3:
      value: 8096
      config: 01-net.conf
    # Tell the gc when to become aggressive with arp table cleaning.
    # Adjust this based on size of the LAN. 1024 is suitable for most /24 networks
    net.ipv4.neigh.default.gc_thresh2:
      value: 4096
      config: 01-net.conf
    # Adjust where the gc will leave arp table alone - set to 32.
    net.ipv4.neigh.default.gc_thresh1:
      value: 32
      config: 01-net.conf
    # Adjust to arp table gc to clean-up more often
    net.ipv4.neigh.default.gc_interval:
      value: 30
      config: 01-net.conf
    # Increase TCP queue length
    net.ipv4.neigh.default.proxy_qlen:
      value: 96
      config: 01-net.conf
    net.ipv4.neigh.default.unres_qlen:
      value: 6
      config: 01-net.conf
    # Enable Explicit Congestion Notification (RFC 3168), disable it if it doesn't work for you
    net.ipv4.tcp_ecn:
      value: 1
      config: 01-net.conf
    net.ipv4.tcp_reordering:
      value: 3
      config: 01-net.conf
    # How many times to retry killing an alive TCP connection
    net.ipv4.tcp_retries2:
      value: 15
      config: 01-net.conf
    net.ipv4.tcp_retries1:
      value: 3
      config: 01-net.conf
    # Avoid falling back to slow start after a connection goes idle
    # keeps our cwnd large with the keep alive connections (kernel > 3.6)
    net.ipv4.tcp_slow_start_after_idle:
      value: 0
      config: 01-net.conf
    # Don't discard metrics
    net.ipv4.tcp_no_metrics_save:
      value: 0
      config: 01-net.conf