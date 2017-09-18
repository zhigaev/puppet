class base::sshd (
  String $addressfamily 	= $base::params::sshd_addressfamily,
  String $port			= $base::params::sshd_port,
  Array[String] $allow_groups	= $base::params::sshd_allowgroups,
  String $permit_root_login	= $base::params::sshd_permit_root_login,
  ) inherits base::params {

  class {'::ssh':
    sshd_addressfamily		=> "$addressfamily",
    sshd_config_port		=> "$port",
    sshd_config_allowgroups	=> $allow_groups,
    permit_root_login		=> "$permit_root_login",
  }

  ensure_resource('group', $allow_groups, { 'ensure' => 'present' })
}
