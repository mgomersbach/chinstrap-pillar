firewall:
  filter:
    sshguard:
      policy: ACCEPT
      rules: {}
    INPUT:
      rules:
        01_sshguard:
          protocol: tcp
          dport: 22
          jump: sshguard
