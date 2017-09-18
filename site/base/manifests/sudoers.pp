class base::sudoers (
  String $sudo_group = $base::params::sudo_group,
  ) inherits base::params {

  class { 'sudo': }

  sudo::conf { "$sudo_group":
    priority => 10,
    content  => "%${sudo_group} ALL=(ALL) NOPASSWD: ALL",
  }
}
