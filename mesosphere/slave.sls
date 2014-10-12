{%- from 'mesosphere/settings.sls' import mesos with context %}

include:
  - mesosphere

mesos-slave:
  service:
    - running
    - require:
      - pkg: mesos