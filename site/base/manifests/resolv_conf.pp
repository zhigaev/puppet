class base::resolv_conf (
  Array[String] $dns_servers = $base::params::dns_servers
) inherits base::params {

  class { 'resolv_conf':
    nameservers => $dns_servers,
  }
}
