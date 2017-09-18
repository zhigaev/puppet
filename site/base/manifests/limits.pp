class base::limits (
  Boolean $purge_limits_d_dir = $base::params::purge_limits_d_dir 
  ) inherits base::params {

  class { 'limits':
    purge_limits_d_dir 	=> $purge_limits_d_dir,
  }

  limits::limits{'*/nofile':
    hard 		=> 1048576,
    soft 		=> 1048576,
  }
  limits::limits{'root/nofile': both => 1048576; }
}
