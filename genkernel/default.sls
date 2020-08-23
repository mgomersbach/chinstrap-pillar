genkernel:
  config:
    # Should we install to $BOOTDIR?  Default is "no" because genkernel is used in
    # catalyst and stage building.
    - install: 'yes'

    # Run 'make oldconfig' before compiling this kernel?
    - oldconfig: 'no'

    # Run 'make menuconfig' before compiling this kernel?
    - menuconfig: 'no'

    # Run 'make nconfig' (ncurses 'menuconfig') before compiling this kernel?
    - nconfig: 'no'

    # Run 'make clean' before compilation?
    - clean: 'no'

    # Run 'make mrproper' before configuration/compilation?
    - mrproper: 'no'

    # Override the arch detection?
    #- arch_override: "x86"

    # Mount BOOTDIR automatically if it isn't mounted?
    - mountboot: 'yes'

    # Make symlinks in BOOTDIR automatically?
    #- symlink: "no"

    # Save the new configuration in /etc/kernels upon
    # successful compilation
    - save_config: 'yes'

    # Use Color output in Genkernel?
    - usecolor: 'yes'

    # Clear build cache dir
    - clear_cache_dir: 'yes'

    # Clear all tmp files and caches after genkernel has run
    #- postclear: "1"

    # Genkernel uses an independent configuration for MAKEOPTS, and does not source
    # /etc/make.conf . You can override the default setting by uncommenting and
    # tweaking the following line. Default setting is set up by
    # ${GK_SHARE}/${ARCH_OVERRIDE}/config.sh . The recommended value for -j
    # argument is: (number of processors)*(number of cores per processor)+1
    - makeopts: '$(portageq envvar MAKEOPTS)'

    # Add in LVM support from static binaries if they exist on the system, or
    # compile static LVM binaries if static ones do not exist.
    #- lvm: "no"

    # Add in Luks support. Needs sys-fs/cryptsetup with -dynamic installed.
    #- luks: "no"

    # Add in GnuPG support
    - gpg: 'yes'

    # Add in early microcode support
    - microcode: 'no'

    # Include early microcode in generated initramfs.
    # This is enabled by default for upgrade compatability, however is obsoleted by
    # sys-boot/grub-2.02-r1, which supports multiple initramfs in the bootloader.
    - microcode_initramfs: 'no'

    # Add DMRAID support.
    #- dmraid: "no"

    # Add SSH support
    - ssh: 'yes'
    - ssh_host_keys: runtime
    # Include (or suppresses the inclusion of) busybox in the initrd or initramfs.
    # If included, busybox is rebuilt if the cached copy is out of date.
    #- busybox: "yes"

    # Includes mdadm/mdmon binaries in initramfs.
    # Without sys-fs/mdadm[static] installed, this will build a static mdadm.
    - mdadm: 'yes'

    # Specify a custom mdadm.conf.
    # By default the ramdisk will be built *without* an mdadm.conf and will auto-detect
    # arrays during bootup.  Usually, this should not be needed.
    #- mdadm_config: "/etc/mdadm.conf"

    # Add Multipath support.
    #- multipath: "no"

    # Add iSCSI support.
    #- iscsi: "no"

    # Add e2fsprogs support.
    #- e2fsprogs: "no"

    # Add BTRFS support
    - btrfs: 'yes'

    # Enable disklabel support (copies blkid to initrd)
    - disklabel: 'yes'

    # Enable copying of firmware into initramfs
    - firmware: 'no'
    # Specify directory to pull from
    #- firmware_dir: "/lib/firmware"
    # Specify specific firmware files to include. This overrides FIRMWARE_DIR
    #- firmware_files: ""

    # Add new kernel to grub?
    #- bootloader: "grub"

    # Enable splashutils in early space (initrd). Default is "no".
    - splash: 'no'

    # Use this splash theme. If commented out - the "default" name theme is used.
    # Also, SPLASH: "yes" needs to be enabled for this one to one work.
    # This supersedes the "SPLASH_THEME" option of /etc/conf.d/splash (in early space).
    #- splash_theme: "livedvd-12.0"

    # Run "emerge @module-rebuild" automatically when possible and necessary
    # after kernel and modules have been compiled
    - modulerebuild: 'yes'

    # =========Keymap Settings=========
    #
    # Force keymap selection at boot
    #- dokeymapauto: "yes"

    # Disables keymap selection support
    #- keymap: "0"

    # =========Low Level Compile Settings=========
    #
    # GNU Make to use for kernel.  See also the --kernel-make command line option.
    #- kernel_make: "make"

    # Compiler to use for the kernel (e.g. distcc).  See also the --kernel-cc
    # command line option.
    #- kernel_cc: "gcc"

    # Assembler to use for the kernel.  See also the --kernel-as command line
    # option.
    #- kernel_as: "as"

    # Linker to use for the kernel.  See also the --kernel-ld command line option.
    #- kernel_ld: "ld"

    # GNU Make to use for the utilities.  See also the --utils-make command line
    # option.
    #- utils_make: "make"

    # Compiler to use for the utilities (e.g. distcc).  See also the --utils-cc
    # command line option.
    #- utils_cc: "gcc"

    # Assembler to use for the utilities.  See also the --utils-as command line
    # option.
    #- utils_as: "as"

    # Linker to use for the utilities.  See also the --utils-ld command line
    # option.
    #- utils_ld: "ld"

    # =========GENKERNEL LOCATION CONFIGURATION============
    # Variables:
    #   %%ARCH%%  - Final determined architecture
    #   %%CACHE%% - Final determined cache location

    # Set genkernel's temporary work directory.  Default is /var/tmp/genkernel
    #- tmpdir: "/var/tmp/genkernel"

    # Set the boot directory, default is /boot
    #- bootdir: "/boot"

    # Default share directory location
    - gk_share: '${GK_SHARE:-/usr/share/genkernel}'

    # Location of the default cache
    - cache_dir: '/var/cache/genkernel'
    # Location of DISTDIR, where our source tarballs are stored
    - distdir: '${GK_SHARE}/distfiles'
    # Log output file
    - logfile: '/var/log/genkernel.log'
    # Debug Level
    - loglevel: '1'

    # =========COMPILED UTILS CONFIGURATION============
    #
    # Default location of kernel source
    - default_kernel_source: '/usr/src/linux'
    # Default kernel config (only use to override using
    # arch/%%ARCH%%/kernel-config-${VER}.${PAT} !)
    #- default_kernel_config: "${GK_SHARE}/arch/%%ARCH%%/kernel-config"

    # Specifies a user created busybox config
    #- busybox_config: "/path/to/file"
    #- busybox_applets: "[ ash sh mount uname echo cut cat"

    # NOTE: Since genkernel 3.4.41 the version of
    #   busybox, lvm, mdadm, .. have been moved to
    #   /usr/share/genkernel/defaults/software.sh in order to
    #   reduce the merging you have to do during etc-update.
    #   You can still override these settings in here.

    # =========MISC KERNEL CONFIGURATION============
    #
    # Tag the kernel and ramdisk with a name:
    # If not defined the option defaults to
    # 'genkernel'
    #- kname: "genkernel"

    # Append a text to the kernel/initrd's name,
    # usefull to add a unique key like the actual date
    #- kappendname: "-$(date +%Y%m%d-%H%M%S)"

    # This option is only valid if kerncache is
    # defined. If there is a valid kerncache no checks
    # will be made against a kernel source tree
    #- kernel_sources: "0"

    # Build a static (monolithic kernel)
    #- build_static: "1"

    # Make and install kernelz image (PowerPC)
    #- genzimage: "1"

    # File to output a .tar.bz2'd kernel contents
    # of /lib/modules/ and the kernel config
    # NOTE: This is created before the callbacks
    # are run!
    #- kerncache: "/path/to/file"

    # Prefix to kernel module destination, modules
    # will be installed in (prefix)/lib/modules
    # (.conf equivalent of --module-prefix=(dir))
    #- install_mod_path: ""

    # =========MISC INITRD CONFIGURATION============
    #
    # Copy all kernel modules to the ramdisk
    #- allramdiskmodules: "1"

    # Don't copy any modules to the ramdisk
    #- ramdiskmodules: "0"

    # File to output a .tar.bz2'd kernel and ramdisk:
    # No modules outside of the ramdisk will be
    # included...
    #- minkernpackage: "/path/to/file.bz2"

    # File to output a .tar.bz2'd modules after the
    # callbacks have run
    #- modulespackage: "/path/to/file.bz2"

    # Directory structure to include in the initramfs,
    # only available on >=2.6 kernels
    #- initramfs_overlay: ""

    # Build the generated initramfs into the kernel instead of
    # keeping it as a separate file
    - integrated_initramfs: '0'

    # Compress generated initramfs
    - compress_initrd: 'yes'

    # Types of compression: best, xz, lzma, bzip2, gzip, lzop, fastest
    - compress_initrd_type: 'zstd'
    # wrap initramfs using mkimage for u-boot bootloader
    #- wrap_initrd: "no"
    # Create a self-contained env in the initramfs
    #- netboot: "1"
    # =========MISC BOOT CONFIGURATION============
    #
    # Specify a default for real_root=
    #- real_root: "/dev/one/two/gentoo"
