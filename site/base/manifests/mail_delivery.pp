class base::mail_delivery (
  Array[String] $root_recipients = $base::params::root_recipients,
  String $inet_protocols	 = $base::params::inet_protocols, 
) inherits base::params {

  package { 'postfix': ensure	=> latest }
 
  file {'/etc/postfix/main.cf':
    ensure	=> file,
    content	=> template("${module_name}/postfix/main.cf.erb"),
    require	=> Package['postfix'],
    notify	=> Service['postfix'],
  }

  file {'/etc/aliases':
    ensure	=> file,
    content	=> template("${module_name}/postfix/aliases.erb"),
    require	=> Package['postfix'],
  }
  
  service { 'postfix':
    ensure	=> running,
    enable	=> true,
  } 

  exec {'set_newaliases':
    command 	=> '/bin/newaliases',
    subscribe   => File['/etc/aliases'],
    refreshonly => true,
  }
}
