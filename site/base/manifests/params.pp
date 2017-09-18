class base::params {

  # SElinux mode 
  $selinux_mode 		= 'disabled'

  # Params when define user type
  $allow_ssh_login 		= true
  $create_home_dir 		= true
  $home_dir_perms 		= '0700'
  $ssh_keytype 			= 'ssh-rsa'
  $ssh_default_group 		= 'ssh_access'

  # Sudoers
  $sudo_group			= 'wheel'

  # Nameservers
  $dns_servers			= ['8.8.8.8', '8.8.4.4']

  # Mail recipients for root user
  $root_recipients 		= ['kulago@ya.ru', 'zhigaev@dultonmedia.com']
  $inet_protocols		= 'ipv4'

  # Zabbix agent
  $zabbix_server		= '192.168.1.1'
  $zabbix_pkg_version		= '3.0'

  # Common packages
  $remove_network_manager	= true

  # Sysctl settings
  $sysctl_config		= '/etc/sysctl.d/custom.conf'
  $sysctl 			= { 'fs.file-max'				=> '262144',
				    'vm.swappiness' 				=> '0',
				    'net.core.rmem_max'  			=> '16777216',
				    'net.core.wmem_max'  			=> '16777216',
				    'net.core.rmem_default'  			=> '16777216',
				    'net.core.wmem_default'  			=> '16777216',
				    'net.core.optmem_max'  			=> '40960',
				    'net.ipv4.tcp_rmem'  			=> '4096 87380 16777216',
			  	    'net.ipv4.tcp_wmem'  			=> '4096 65536 16777216',
				    'net.core.netdev_max_backlog'  		=> '65536',
				    'net.ipv4.tcp_max_syn_backlog' 		=> '65536',
				    'net.ipv4.tcp_max_tw_buckets' 		=> '2000000',
				    'net.ipv4.tcp_tw_reuse'  			=> '1',
				    'net.ipv4.tcp_fin_timeout'  		=> '10',
				    'net.ipv4.tcp_slow_start_after_idle' 	=> '0',
				    'net.ipv4.udp_rmem_min'  			=> '8192',
				    'net.ipv4.udp_wmem_min'  			=> '8192',
				    'net.ipv4.conf.all.send_redirects'  	=> '0',
				    'net.ipv4.conf.all.accept_redirects'	=> '0',
				    'net.ipv4.conf.all.accept_source_route'	=> '0',
				    'net.ipv4.conf.all.log_martians'  		=> '1',
				  }

  # Timezone
  $timezone			= 'Europe/Moscow'
 
  # Ntpdate settings
  $ntp_server			= '0.pool.ntp.org'

  # Bash history
  $hh_clientip 			= true
  $hh_terminal 			= true
  $hh_username 			= true
 
  # Limits
  $purge_limits_d_dir		= false

  # Logwatch
  $logwatch_email_to		= ['zhigaev@dultonmedia.com']
  $logwatch_services		= ['sshd']

  # Sshd 
  $sshd_addressfamily		= 'inet'
  $sshd_port			= '22'
  $sshd_allowgroups		= ['ssh_access']
  $sshd_permit_root_login	= 'no'
}
