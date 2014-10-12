{%- from 'mesosphere/settings.sls' import mesos with context %}

include:
  - mesosphere

mesos-master-directories:
  file.directory:
    - user: root
    - group: root
    - makedirs: True
    - names:
      - {{ mesos.logs_dir }}
      - {{ mesos.work_dir }}

mesos-master:
  service:
    - running
    - require:
      - pkg: mesos
