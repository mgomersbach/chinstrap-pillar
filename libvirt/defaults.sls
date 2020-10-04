# -*- coding: utf-8 -*-
# vim: ft=yaml
---
libvirt:
  libvirtd:
    listen_tls: 0
    listen_tcp: 0
    tls_port: '16514'
    tcp_port: '16509'
    listen_addr: 0.0.0.0
    unix_sock_group: 'root'
    unix_sock_ro_perms: '0777'
    unix_sock_rw_perms: '0770'
    unix_sock_admin_perms: '0700'
    unix_sock_dir: '/run/libvirt'
    auth_unix_ro: 'none'
    auth_unix_rw: 'none'
    auth_tcp: 'none'
