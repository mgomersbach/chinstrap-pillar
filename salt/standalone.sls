salt:
  minion:
    master_type: false
    fileserver_backend:
      - git
    gitfs_remotes:
      - https://github.com/mgomersbach/chinstrap-states.git
      - https://github.com/saltstack-formulas/salt-formula.git
      - https://github.com/mgomersbach/grub-formula.git
      - https://github.com/mgomersbach/genkernel-formula.git
      - https://github.com/mgomersbach/lightdm-formula.git
      - https://github.com/saltstack-formulas/users-formula.git
      - https://github.com/saltstack-formulas/openssh-formula.git
      - https://github.com/saltstack-formulas/nginx-formula.git
      - https://github.com/saltstack-formulas/php-formula.git
      - https://github.com/mgomersbach/rng-tools-formula.git
      - https://github.com/saltstack-formulas/sysctl-formula.git
      - https://github.com/saltstack-formulas/chrony-formula.git
      - https://github.com/saltstack-formulas/postfix-formula.git
      - https://github.com/saltstack-formulas/rsyslog-formula.git
      - https://github.com/saltstack-formulas/timezone-formula.git
      - https://github.com/saltstack-formulas/resolver-formula.git
      - https://github.com/saltstack-formulas/iptables-formula.git

    mine_interval: 60
    file_client: local

salt_formulas:
  git_opts:
    default:
      baseurl: https://github.com/saltstack-formulas
      basedir: /srv/salt/formulas
      update: true
  basedir_opts:
    makedirs: true
    user: root
    group: root
    mode: 755
  list:
    base:
      - chinstrap-states:
        name: 'https://github.com/mgomersbach/chinstrap-states.git'
      - grub-formula:
        name: 'https://github.com/mgomersbach/grub-formula.git'
      - genkernel-formula:
        name: 'https://github.com/mgomersbach/genkernel-formula.git'
      - lightdm-formula:
        name: 'https://github.com/mgomersbach/lightdm-formula.git'
      - rng-tools-formula:
        name: 'https://github.com/mgomersbach/rng-tools-formula.git'
      - salt-formula
      - users-formula
      - openssh-formula
      - nginx-formula
      - php-formula
      - sysctl-formula
      - chrony-formula
      - postfix-formula
      - rsyslog-formula
      - timezone-formula
      - resolver-formula
      - iptables-formula
