base:
  'eselect:profile:chinstrap*':
    - match: grain
    - ssh.default
    - sysctl.default
    - iptables.default
    - iptables.sshguard
    - postfix.default
    - rsyslog.default
    - genkernel.default
    - gentoo.portage.default
    - packages.toolchain
    - packages.salt
    - packages.base
    - packages.bootloader
    - packages.admin
    - packages.harden
  'G@cpu_flags:rdrand':
    - match : compound
    - rng-tools.default
  'not G@cpu_flags:rdrand':
    - match: compound
    - rng-tools.nohw
  'G@virtual:physical':
    - match : compound
    - packages.devices
    - packages.pm
    - packages.wireless
    - grub.default
  'eselect:profile:chinstrap*server':
    - match : grain
    - sysctl.forward
    - packages.media
    - packages.server
    - packages.dockerhost
    - docker.default
    - php.default
  'G@eselect:profile:chinstrap*server and G@virtual:physical':
    - match : compound
    - packages.libvirthost
  'eselect:profile:chinstrap*buildhelper':
    - match : grain
    - packages.media
    - packages.server
    - packages.dockerhost
    - docker.default
    - php.default
    - packages.buildhelper
  'eselect:profile:chinstrap*desktop':
    - match : grain
    - lightdm.default
    - packages.media
    - packages.desktop
  'eselect:profile:chinstrap*markws':
    - match : grain
    - sysctl.forward
    - lightdm.default
    - gentoo.portage.binmedia
    - packages.media
    - packages.dockerhost
    - packages.server
    - packages.buildhelper
    - packages.desktop
    - packages.gaming
    - packages.workstation
    - docker.default
    - php.default
