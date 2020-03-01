firewall:
  enabled: True
  install: True
  strict: True
  ipv6: True
  use_tables: true

  filter:
    DROPLOG:
      position: last
      policy: DROP
      rules:
        00_limitedlog:
          jump: LOG
          log-prefix: "IPTables-LOG: "
        01_drop_after_log:
          jump: DROP
    INPUT:
      policy: DROP
      rules:
        00_allow_established:
          match: conntrack
          ctstate: 'ESTABLISHED,RELATED'
          jump: ACCEPT
        01_allow_ICMP:
          protocol: icmp
          jump: ACCEPT
        01_ignore_dhcp:
          protocol: udp
          match: multiport
          dports: 67,68
          jump: DROP
        01_loopback:
          i: lo
          match: comment
          comment: Allow loopback in
          jump: ACCEPT
        02_ssh:
          protocol: tcp
          dport: 22
          match: conntrack
          ctstate: 'NEW,ESTABLISHED'
          jump: ACCEPT
        99_logging_rule:
          jump: DROPLOG
    FORWARD:
      policy: DROP
      rules:
        00_allow_established:
          match: conntrack
          ctstate: 'ESTABLISHED,RELATED'
          jump: ACCEPT
    OUTPUT:
      policy: ACCEPT
      rules:
        00_allow_established:
          match: conntrack
          ctstate: 'ESTABLISHED,RELATED'
          jump: ACCEPT
        01_track_output_tcp:
          protocol: tcp
          m: conntrack
          ctstate: NEW
          j: ACCEPT
        01_track_output_udp:
          protocol: udp
          m: conntrack
          ctstate: NEW
          j: ACCEPT
        01_loopback:
          o: lo
          match: comment
          comment: Allow loopback out
          jump: ACCEPT
