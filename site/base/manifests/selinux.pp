class base::selinux (
  String $mode = $base::params::selinux_mode
  ) inherits base::params {

  class {'selinux':
    mode	=> "$mode",
  }
}
