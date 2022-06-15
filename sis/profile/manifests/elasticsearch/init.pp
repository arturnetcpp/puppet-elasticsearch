 
class profile::elasticsearch::init (
  $my_version = lookup('elasticsearch::version'),
  $my_restart_on_change = true,
  $my_api_protocol = lookup('elasticsearch::api_protocol'),
  $my_api_host = '192.168.38.252',
  $my_api_port = lookup('elasticsearch::api_timeout'),
  $my_configdir = lookup('elasticsearch::configdir'),
  $my_datadir = lookup('elasticsearch::datadir'),
  $my_jvm_options = lookup('elasticsearch::jvm_options'),
  $my_logdir = lookup('elasticsearch::logdir'),
  $my_service_name = lookup('elasticsearch::service_name'),
  $my_service_provider = lookup('elasticsearch::service_provider'),
  $my_status = lookup('elasticsearch::status'),
  $my_systemd_service_path = lookup('elasticsearch::systemd_service_path'),
) {

  class { 'elastic_stack::repo':
  version => 7,
  }

  file { '/var/lib/elasticsearch/jvm.options':
    ensure => file,
  }

  class { 'elasticsearch':
    version => $my_version,
    restart_on_change => $my_restart_on_change,
    configdir => $my_configdir,
    datadir => $my_datadir,
    logdir => $my_logdir,
    api_protocol => $my_api_protocol,
    api_host => $my_api_host,
    api_port => $my_api_port,
    api_timeout => 15,
    jvm_options => $my_jvm_options,
    service_name => $my_service_name,
    service_provider => $my_service_provider,
    status => $my_status,
    systemd_service_path => $my_systemd_service_path,

 }

  contain elasticsearch::config
      concat { '/var/lib/elasticsearch/elasticsearch.yml':
        ensure => present,
      }

      concat::fragment { 'elasticsearch.yml':
        target  => '/var/lib/elasticsearch/elasticsearch.yml',
        content => file("profile/elasticsearch.yml"),
      }

}
  
