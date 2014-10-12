{% set p  = salt['pillar.get']('mesosphere', {}) %}
{% set pc = p.get('config', {}) %}
{% set g  = salt['grains.get']('mesosphere', {}) %}
{% set gc = g.get('config', {}) %}

{%- set mesos = {} %}
{%- do mesos.update( {
  'version' : p.get('version', '0.20.0'),
  'cluster_name' : pc.get('cluster_name', 'MyMesosCluster'),

  'ip'          : gc.get('ip', None),
  'hotname'     : gc.get('hostname', None),
  'logs_dir'    : gc.get('logs_dir', pc.get('logs_dir', '/var/log/mesos')),
  'work_dir'    : gc.get('work_dir', pc.get('work_dir', '/tmp/mesos')),
  'config_dir'  : gc.get('config_dir', pc.get('config_dir', '/etc/mesos')),
  'port'        : gc.get('port', pc.get('port', '5050')),

  'isolation_type'        : gc.get('isolation_type', pc.get('isolation_type', 'posix/cpu,posix/mem')),
  'zookeeper_server_list' : gc.get('zookeeper_server_list', pc.get('zookeeper_server_list', ['localhost:2181'])),
  'zookeeper_path'        : gc.get('zookeeper_path', pc.get('zookeeper_path', 'MyMesosCluster'))
  }) %}
