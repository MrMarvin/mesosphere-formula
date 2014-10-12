{%- from 'mesosphere/settings.sls' import mesos with context %}

include:
  - mesosphere

mesos-slave:
  service:
    - running
    - require:
      - pkg: mesos

{%- if mesos['ip'] %}
mesos-slave-ip:
  file.managed:
    - name: {{ mesos.config_dir }}/mesos-slave/ip
    - content_grains: mesosphere:config:ip
{%- endif %}

{%- if mesos['hostname'] %}
mesos-master-hostname:
  file.managed:
    - name: {{ mesos.config_dir }}/mesos-slave/hostname
    - content_grains: mesosphere:config:hostname
{%- endif %}