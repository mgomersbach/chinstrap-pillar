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
    - php.default
  'G@eselect:profile:chinstrap*server and G@virtual:physical':
    - match: compound
    - packages.libvirthost
  'eselect:profile:chinstrap*buildhelper':
    - match: grain
    - packages.server
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
    - packages.server
    - packages.buildhelper
    - packages.desktop
    - packages.gaming
    - packages.workstation
    - php.default
  'G@role:binpkg and G@eselect:profile:chinstrap*':
    - match: compound
    - salt.binpkgs
    - gentoo.portage.genericcflags
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
  'G@role:binpkg and G@eselect:profile:chinstrap*desktop':
    - match: compound
    - binpkgs.media
    - binpkgs.desktop
  'G@role:binpkg and G@eselect:profile:chinstrap*markws':
    - match: compound
    - binpkgs.media
    - binpkgs.server
    - binpkgs.desktop
    - binpkgs.gaming
    - binpkgs.workstation
