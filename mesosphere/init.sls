{%- from 'mesosphere/settings.sls' import mesos with context %}

base:
  pkgrepo.managed:
    - humanname: Mesosphere Repo
    - name: "deb http://repos.mesosphere.io/{{ grains['osfullname'].lower() }} {{ grains['oscodename'] }} main"
    - dist: {{ grains['oscodename'] }}
    - file: /etc/apt/sources.list.d/mesosphere.list
    - keyid: E56151BF
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: mesos

mesos:
  pkg.installed:
    - version: {{ mesos.version }}

mesos-zk-file:
  file.managed:
    - name: {{ mesos.config_dir }}/zk
    - source: salt://mesosphere/conf/zk
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
      zookeeper_server_list: {{ mesos.zookeeper_server_list }}
      zookeeper_path: {{ mesos.zookeeper_path }}