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
  'G@cpu_flags:rdrand':
    - match: compound
    - rng-tools.default
  'not G@cpu_flags:rdrand':
    - match: compound
    - rng-tools.nohw
  'G@virtual:physical':
    - match: compound
    - packages.devices
    - packages.pm
    - packages.wireless
    - grub.default
  'eselect:profile:chinstrap*server':
    - match: grain
    - sysctl.forward
    - packages.server
    - packages.dockerhost
    - docker.default
    - php.default
  'G@eselect:profile:chinstrap*server and G@virtual:physical':
    - match: compound
    - packages.libvirthost
  'eselect:profile:chinstrap*buildhelper':
    - match: grain
    - packages.server
    - packages.dockerhost
    - docker.default
    - php.default
    - packages.buildhelper
  'eselect:profile:chinstrap*desktop':
    - match: grain
    - lightdm.default
    - packages.desktop
  'eselect:profile:chinstrap*markws':
    - match: grain
    - sysctl.forward
    - lightdm.default
    - gentoo.portage.binmedia
    - packages.dockerhost
    - packages.server
    - packages.buildhelper
    - packages.desktop
    - packages.gaming
    - packages.workstation
    - docker.default
    - php.default
  'G@role:binpkg and G@eselect:profile:chinstrap*':
    - match: compound
    - salt.binpkgs
    - binpkgs.base
    - binpkgs.bootloader
    - binpkgs.admin
    - binpkgs.harden
    - binpkgs.pm
    - binpkgs.wireless
  'G@role:binpkg and G@eselect:profile:chinstrap*server':
    - match: compound
    - binpkgs.media
    - binpkgs.server
    - binpkgs.dockerhost
  'G@role:binpkg and G@eselect:profile:chinstrap*desktop':
    - match: compound
    - binpkgs.media
    - binpkgs.desktop
  'G@role:binpkg and G@eselect:profile:chinstrap*markws':
    - match: compound
    - binpkgs.media
    - binpkgs.dockerhost
    - binpkgs.server
    - binpkgs.desktop
    - binpkgs.gaming
    - binpkgs.workstation
