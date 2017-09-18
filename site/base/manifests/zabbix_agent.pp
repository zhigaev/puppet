class base::zabbix_agent (
  String $server 		= $base::params::zabbix_server,
  String $version		= $base::params::zabbix_pkg_version,
  ) inherits base::params {

  class {'zabbix::agent':
    server 		 => "$server",
    zabbix_version       => "$version",
    manage_repo          => true,
    zabbix_package_state => 'latest',
  }

  firewall { '100 allow external access to zabbix agent':
    dport  => 10050,
    proto  => tcp,
    action => accept,
  }
}
