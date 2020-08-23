{% set avgload = grains['num_cpus']|int - 1 %}

portage:
  cflags:
    set: ${COMMON_FLAGS}
  cxxflags:
    set: ${COMMON_FLAGS}
  makeopts:
    set: -j{{ grains['num_cpus'] }} -l{{ avgload }}
  emerge_default_opts:
    set: --jobs={{ grains['num_cpus'] }} --load-average={{ avgload }} --binpkg-changed-deps=y --binpkg-respect-use=y
  features:
    present:
      - parallel-fetch
      - parallel-install
      - buildpkg
  gentoo_mirrors:
    present:
      - 'rsync://gentoo.hexnet.nl/gentoo-portage'
  extra_vars:
    fcflags:
      set: ${COMMON_FLAGS}
    fflags:
      set: ${COMMON_FLAGS}
    cpu_flags_x86:
      set: "{{ grains['cpu_native']['cpuflags']|join(' ') }}"
    cpu_cflags:
      set: "{{ grains['cpu_native']['cflags']|join(' ') }}"
    common_flags:
      set: ${CPU_CFLAGS} -O2 -pipe
    grub_platforms:
      set: efi-64 pc qemu
    use:
      present:
        - ${CPU_FLAGS_X86}
    portdir:
      set: /var/db/repos/gentoo
    distdir:
      set: /var/cache/distfiles
    pkgdir:
      set: /var/cache/binpkgs
