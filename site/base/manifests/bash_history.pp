class base::bash_history (
  Boolean $clientip	= $base::params::hh_clientip,
  Boolean $terminal	= $base::params::hh_terminal,
  Boolean $username	= $base::params::hh_username,
  ) inherits base::params {

  class { 'bash_history':
    hh_clientip		=> true,
    hh_terminal		=> true,
    hh_username		=> true,
  }
}
