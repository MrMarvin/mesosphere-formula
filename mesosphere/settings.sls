{% set p  = salt['pillar.get']('mesosphere', {}) %}
{% set pc = p.get('config', {}) %}
{% set g  = salt['grains.get']('mesosphere', {}) %}
{% set gc = g.get('config', {}) %}

# these are global - hence pillar-only
{%- set version           = g.get('version', '0.20.0') %}
{%- set cluster_name      = gc.get('cluster_name', 'MyMesosCluster') %}

# ip and hostname is only supported as a grain, because it has to be host-specific
{%- set ip                = gc.get('ip', None) %}
{%- set hotname           = gc.get('hostname', None) %}
{%- set logs_dir          = gc.get('logs_dir', pc.get('logs_dir', '/var/log/mesos')) %}
{%- set work_dir          = gc.get('work_dir', pc.get('work_dir', '/tmp/mesos')) %}
{%- set port              = gc.get('port', pc.get('port', '5050')) %}

{%- set isolation_type    = gc.get('isolation_type', pc.get('isolation_type', 'posix/cpu,posix/mem')) %}

{%- set zookeeper_server_list = gc.get('zookeeper_server_list', pc.get('zookeeper_server_list', [])) %}
{%- set zookeeper_port        = gc.get('zookeeper_port', pc.get('zookeeper_port', 2181)) %}
{%- set zookeeper_path        = gc.get('zookeeper_path', pc.get('zookeeper_path', 'MyMesosCluster')) %}
