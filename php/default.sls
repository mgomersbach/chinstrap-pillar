php:
  version: "7.4"

  fpm:
    config:
      conf:
        opts:
          recurse: True
        settings:
          global:
            pid: /var/run/php-fpm-php7.4.pid
    pools:
      'default.conf':
        enabled: True
        opts:
            replace: False
        settings:
          default:
            user: www-data
            group: www-data
            listen: /var/run/php-fpm7.4.sock
            listen.owner: www-data
            listen.group: www-data
            listen.mode: '0660'
            pm: dynamic
            pm.max_children: 5
            pm.start_servers: 2
            pm.min_spare_servers: 1
            pm.max_spare_servers: 3
            'php_admin_value[memory_limit]': 300M
            'env[HOSTNAME]': $HOSTNAME
            'env[PATH]': '/usr/local/bin:/usr/bin:/bin'
            'env[TMP]': /tmp
            'env[TMPDIR]': /tmp
            'env[TEMP]': /tmp

  cli:
    ini:
      opts:
        replace: True
      settings:
        PHP:
          engine: 'Off'

  xcache:
    ini:
      opts: {}
      settings:
        xcache:
          xcache.size: 90M

  ini:
    defaults:
      PHP:
        cgi.fix_pathinfo: 0
        engine: on
        "short_open_tag": "Off"
        precision: 14
        output_buffering: 4096
        "opcache.enable": 1
        "opcache.enable_cli": 1
        "opcache.interned_strings_buffer": 8
        "opcache.max_accelerated_files": 10000
        "opcache.memory_consumption": 128
        "opcache.save_comments": 1
        "opcache.revalidate_freq": 1
        "zlib.output_compression": "Off"
        implicit_flush: "Off"
        serialize_precision: 17
        disable_functions: [pcntl_alarm,pcntl_fork,pcntl_waitpid,pcntl_wait,pcntl_wifexited,pcntl_wifstopped,pcntl_wifsignaled,pcntl_wifcontinued,pcntl_wexitstatus,pcntl_wtermsig,pcntl_wstopsig,pcntl_signal,pcntl_signal_dispatch,pcntl_get_last_error,pcntl_strerror,pcntl_sigprocmask,pcntl_sigwaitinfo,pcntl_sigtimedwait,pcntl_exec,pcntl_getpriority,pcntl_setpriority]
        "zend.enable_gc": "On"
        expose_php: "Off"
        max_execution_time: 240
        max_input_time: 240
        max_input_vars: 2000
        memory_limit: "256M"
        error_reporting: "E_ALL & ~E_DEPRECATED & ~E_STRICT"
        display_errors: "Off"
        display_startup_errors: "Off"
        log_errors: "On"
        log_errors_max_len: 1024
        ignore_repeated_errors: "Off"
        ignore_repeated_source: "Off"
        report_memleaks: "On"
        track_errors: "Off"
        html_errors: "On"
        variables_order: "GPCS"
        request_order: "GP"
        register_argc_argv: "Off"
        auto_globals_jit: "On"
        post_max_size: "16M"
        default_mimetype: "text/html"
        default_charset: "UTF-8"
        enable_dl: "Off"
        file_uploads: "On"
        upload_max_filesize: "16M"
        max_file_uploads: 20
        allow_url_fopen: "On"
        allow_url_include: "Off"
        default_socket_timeout: 60
      "mail function":
        SMTP: "localhost"
        smtp_port: 25
        "mail.add_x_header": "On"
      SQL:
        "sql.safe_mode": "Off"
      ODBC:
        "odbc.allow_persistent": "On"
        "odbc.check_persistent": "On"
        "odbc.max_persistent": -1
        "odbc.max_links": -1
        "odbc.defaultlrl": 4096
        "odbc.defaultbinmode": 1
      Interbase:
        "ibase.allow_persistent": 1
        "ibase.max_persistent": -1
        "ibase.max_links": -1
        "ibase.timestampformat": "%Y-%m-%d %H:%M:%S"
        "ibase.dateformat": "%Y-%m-%d"
        "ibase.timeformat": "%H:%M:%S"
      MySQLi:
        "mysqli.max_persistent": -1
        "mysqli.allow_persistent": "On"
        "mysqli.max_links": -1
        "mysqli.cache_size": 2000
        "mysqli.default_port": 3306
        "mysqli.reconnect": "Off"
      MySQL:
        "mysql.allow_local_infile": "On"
        "mysql.allow_persistent": "On"
        "mysql.cache_size": 2000
        "mysql.connect_timeout": 60
        "mysql.max_links": "-1"
        "mysql.max_persistent": "-1"
        "mysql.trace_mode": "Off"
      bcmath:
        "bcmath.scale": 0
      Date:
        "date.timezone": "Europe/Amsterdam"
      Session:
        "session.save_handler": "files"
        "session.use_strict_mode": 0
        "session.use_cookies": 1
        "session.use_only_cookies": 1
        "session.name": "PHPSESSID"
        "session.auto_start": 0
        "session.cookie_lifetime": 0
        "session.cookie_path": "/"
        "session.serialize_handler": "php"
        "session.gc_probability": 0
        "session.gc_divisor": 1000
        "session.gc_maxlifetime": 1440
        "session.cache_limiter": "nocache"
        "session.cache_expire": 180
        "session.use_trans_sid": 0
        "session.hash_function": 0
        "session.hash_bits_per_character": 5
        "url_rewriter.tags": '"a=href,area=href,frame=src,input=src,form=fakeentry"'
      Sybase-CT:
        "sybct.allow_persistent": "On"
        "sybct.max_links": "-1"
        "sybct.max_persistent": "-1"
        "sybct.min_client_severity": 10
        "sybct.min_server_severity": 10
      Assertion:
        "zend.assertions": -1
      Tidy:
        "tidy.clean_output": "Off"
      soap:
        "soap.wsdl_cache_enabled": 1
        "soap.wsdl_cache_dir": "/tmp"
        "soap.wsdl_cache_ttl": 86400
        "soap.wsdl_cache_limit": 5
      ldap:
        "ldap.max_links": -1
