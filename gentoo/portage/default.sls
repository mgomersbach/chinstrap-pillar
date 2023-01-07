{% set avgload = grains['num_cpus']|int - 1 %}

portage:
  makeopts:
    set: -j{{ grains['num_cpus'] }} -l{{ avgload }}
  emerge_default_opts:
    set: --jobs={{ grains['num_cpus'] }} --load-average={{ avgload }} --binpkg-changed-deps=y --binpkg-respect-use=y
  features:
    present:
      - parallel-fetch
      - parallel-install
      - buildpkg
  extra_vars:
    grub_platforms:
      set: efi-64 pc qemu
