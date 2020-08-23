lightdm:
  config:
    seat:
      session-wrapper: '/etc/lightdm/Xsession'
    xdmcpserver:
      enabled: false
    vncserver:
      enabled: false
    users:
      minimum-uid: 1000
      hidden-users: 'nobody nobody4 noaccess'
      hidden-shells: '/bin/false /usr/sbin/nologin'
    greeter:
      gtk:
        background: '/etc/lightdm/background.png'
        theme-name: 'NumixSolarizedDarkGreen'
        icon-theme-name: 'Numix'
        font-name: 'fira-code'
        indicators: '~host;~spacer;~clock;~spacer;~language;~session;~a11y;~power'
