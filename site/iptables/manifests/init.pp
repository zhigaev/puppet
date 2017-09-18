class iptables {

  resources { 'firewall':
    purge => true,
  }

  Firewall {
    before  => Class['iptables::post'],
    require => Class['iptables::pre'],
  }

  include iptables::pre
  include iptables::post
  include firewall
}
