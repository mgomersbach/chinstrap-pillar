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
        98_limitedlog:
          jump: LOG
          log-prefix: 'IPTables-LOG: '
        99_drop_after_log:
          jump: DROP
    INPUT:
      policy: DROP
      rules:
        00_allow_established:
          match: conntrack
          ctstate: 'ESTABLISHED,RELATED'
          jump: ACCEPT
        00_drop_invalid:
          match: conntrack
          ctstate: INVALID
          jump: REJECT
        00_allow_ICMP:
          protocol: icmp
          jump: ACCEPT
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
        99_drop_invalid:
          match: conntrack
          ctstate: INVALID
          jump: REJECT
    OUTPUT:
      policy: ACCEPT
      rules:
        00_allow_established:
          match: conntrack
          ctstate: 'RELATED,ESTABLISHED'
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
        99_drop_invalid:
          match: conntrack
          ctstate: INVALID
          jump: REJECT