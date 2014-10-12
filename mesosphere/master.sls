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
      - {{ mesos.config_dir }}/mesos-master/

mesos-master:
  service:
    - running
    - require:
      - pkg: mesos

{%- if mesos['ip'] %}
mesos-slave-ip:
  file.managed:
    - name: {{ mesos.config_dir }}/mesos-master/ip
    - content_grains: mesosphere:config:ip
{%- endif %}

{%- if mesos['hostname'] %}
mesos-slave-hostname:
  file.managed:
    - name: {{ mesos.config_dir }}/mesos-master/hostname
    - content_grains: mesosphere:config:hostname
{%- endif %}