portage:
  cflags:
    set: -march=amdfam10 -mtune=generic -pipe -O2 -mmmx -msse -msse2 -msse3 -mcx16 -msahf -mpopcnt -mfxsr -fstack-protector-strong -frecord-gcc-switches
  extra_vars:
    cpu_flags_x86:
      set: 3dnow 3dnowext aes avx avx2 f16c fma3 mmx mmxext pclmul popcnt sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3