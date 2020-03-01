docker:
  python_package: ~
  pkgs:
    - dev-python/docker-py
    - dev-python/pip
  pkg:
    name: app-emulation/docker
    allow_updates: false
    hold: false
    use_upstream_app: true
  pip:
    install_pypi_pip: false
    upgrade: false
  config:
    - DOCKER_OPTS="-s btrfs"
  version: '19.03.4'
