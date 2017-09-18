class base::timezone (
  String $timezone = $base::params::timezone,
  ) inherits base::params {
  class { 'timezone':
    timezone => "$timezone",
  }
}
