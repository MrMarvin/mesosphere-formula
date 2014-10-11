include:
  - mesosphere

mesos-master:
  service:
    - running
    - require:
      - pkg: mesos