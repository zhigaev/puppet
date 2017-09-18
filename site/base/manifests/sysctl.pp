class base::sysctl inherits base::params {
  include augeas

  $base::params::sysctl.each |$key, $value| {
    sysctl { "$key":
      ensure => present,
      value  => "$value",
      target => "$base::params::sysctl_config",
    }
  } 
}
