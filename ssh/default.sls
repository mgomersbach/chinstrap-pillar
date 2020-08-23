sshd_config:
  ConfigBanner: |
    # This is the default ssh config coming from Chinstrap
  Port: 22
  Protocol: 2
  HostKey:
    - /etc/ssh/ssh_host_rsa_key
    - /etc/ssh/ssh_host_dsa_key
    - /etc/ssh/ssh_host_ecdsa_key
    - /etc/ssh/ssh_host_ed25519_key
  SyslogFacility: AUTH
  LogLevel: INFO
  ClientAliveInterval: 0
  ClientAliveCountMax: 10
  LoginGraceTime: 120
  PermitRootLogin: 'no'
  PasswordAuthentication: 'no'
  StrictModes: 'yes'
  MaxAuthTries: 6
  MaxSessions: 10
  PubkeyAuthentication: 'yes'
  IgnoreRhosts: 'yes'
  HostbasedAuthentication: 'no'
  PermitEmptyPasswords: 'no'
  ChallengeResponseAuthentication: 'no'
  AuthenticationMethods: 'publickey'
  AuthorizedKeysFile: '%h/.ssh/authorized_keys'
  X11Forwarding: 'no'
  X11DisplayOffset: 10
  PrintMotd: 'yes'
  PrintLastLog: 'yes'
  TCPKeepAlive: 'yes'
  Subsystem: 'sftp /usr/lib64/misc/sftp-server'
  AcceptEnv: 'LANG LC_*'
  UsePAM: 'yes'
