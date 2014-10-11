include:
  - mesosphere

mesos-slave:
  service:
    - running
    - require:
      - pkg: mesos