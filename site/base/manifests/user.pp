include stdlib

define base::user (
    Boolean $allow_ssh_login 		= $base::params::allow_ssh_login,
    Boolean $create_home_dir 		= $base::params::create_home_dir,
    String[4] $home_dir_perms		= $base::params::home_dir_perms,
    String $ssh_default_group 		= $base::params::ssh_default_group,
    String $ssh_key_type		= "$base::params::ssh_keytype",
    String $homedir 			= "/home/${title}",
    Optional[String] $ssh_pub_key	= undef,
    Optional[Array[String]] $groups	= undef
  ) {

    if ( $allow_ssh_login ) {
      $user_secondary_groups = "$groups" ? {
        true        => [$ssh_default_group, $groups],
        default     => [$ssh_default_group],
      }
    }
    else {
      $user_secondary_groups = "$groups" ? {
      true        => $groups,
      default     => [''],
    }
  }

  group {"${title}":
    ensure      => present,
  }

  if ( "$create_home_dir" and "$homedir" ) {
    user {"${title}":
      ensure      => present,
      home        => "${homedir}",
      managehome  => true,
      groups      => flatten($user_secondary_groups),
    }

    file {["${homedir}", "${homedir}/.ssh"]:
      ensure      => directory,
      owner       => "${title}",
      group       => "${title}",
      mode        => "${home_dir_perms}",
    }
  }
  else {
    user {"${title}":
      ensure      => present,
      managehome  => false,
      groups      => flatten($user_secondary_groups),
    }
  }

  if ( "$ssh_pub_key" and "$ssh_key_type" ) {
    ssh_authorized_key {"${title}":
      user        => "${title}",
      type        => "${ssh_key_type}",
      key         => "${ssh_pub_key}",
    }
  }
}
