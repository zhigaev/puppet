class base::packages (
  Boolean $remove_network_manager  = $base::params::remove_network_manager, 
  ) inherits base::params {
  package { 
   ['epel-release',
    'htop',
    'atop',
    'net-tools',
    'bind-utils',
    'tmux',
    'screen',
    'strace',
    'rsync',
    'traceroute',
    'cronie',
    'vim-enhanced',
    'sysstat',
    'yum-cron',
    'yum-utils',
    'curl',
    'wget',
    'mutt',
    'iftop',
    'nethogs',
    'lynx',
    'telnet',
    'ftp',
    'tcpdump',
    'pciutils',
    'bash-completion',
    'unzip',
    'mc']:
    ensure	=> latest,
  }

  if "$remove_network_manager" {
    package {
     ['NetworkManager-wifi',
      'NetworkManager-team',
      'NetworkManager-tui',
      'NetworkManager',
      'NetworkManager-libnm',
      'firewalld']:
      ensure	=> absent,
    }
  }
}
