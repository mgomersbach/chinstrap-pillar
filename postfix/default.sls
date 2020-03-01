postfix:
  manage_master_config: True
  master_config:
    enable_submission: False

  enable_service: True

  config:
    smtpd_banner: $myhostname ESMTP $mail_name
    biff: 'no'
    append_dot_mydomain: 'no'
    readme_directory: 'no'
    myhostname: {{ grains['fqdn'] }}
    mydestination: $myhostname, localhost.$mydomain, localhost
    mynetworks: 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
    mailbox_size_limit: 0
    recipient_delimiter: +
    inet_interfaces: localhost
    alias_maps: hash:/etc/mail/aliases
    alias_database: hash:/etc/mail/aliases

  aliases:
    content: |
        mailer-daemon:postmaster
        postmaster:root
        bin:root
        daemon:root
        adm:root
        lp:root
        sync:root
        shutdown:root
        halt:root
        mail:root
        news:root
        uucp:root
        operator:root
        games:root
        gopher:root
        ftp:root
        nobody:root
        radiusd:root
        nut:root
        dbus:root
        vcsa:root
        canna:root
        wnn:root
        rpm:root
        nscd:root
        pcap:root
        apache:root
        webalizer:root
        dovecot:root
        fax:root
        quagga:root
        radvd:root
        pvm:root
        amanda:root
        privoxy:root
        ident:root
        named:root
        xfs:root
        gdm:root
        mailnull:root
        postgres:root
        sshd:root
        smmsp:root
        postfix:root
        netdump:root
        ldap:root
        squid:root
        ntp:root
        mysql:root
        desktop:root
        rpcuser:root
        rpc:root
        nfsnobody:root
        ingres:root
        system:root
        toor:root
        manager:root
        dumper:root
        abuse:root
        newsadm:news
        newsadmin:news
        usenet:news
        ftpadm:ftp
        ftpadmin:ftp
        ftp-adm:ftp
        ftp-admin:ftp
        www:webmaster
        webmaster:root
        noc:root
        security:root
        hostmaster:root
        info:postmaster
        marketing:postmaster
        sales:postmaster
        support:postmaster
        monit:root
