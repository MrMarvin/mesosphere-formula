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
  pkg.installed