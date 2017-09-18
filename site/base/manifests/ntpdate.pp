class base::ntpdate (
  String $server = $base::params::ntp_server
  ) inherits base::params {

  package { 'ntpdate': ensure	=> latest }

  cron { 'ntpdate':
    command	=> "/sbin/ntpdate -u ${server}",
    user	=> 'root',
    hour	=> 2,
    minute	=> fqdn_rand(60),
    require	=> Package['ntpdate'],
  }
}
