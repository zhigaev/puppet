class base inherits base::params {
  include base::sudoers
  include colorprompt
  include iptables
  include base::selinux
  include base::resolv_conf
  include base::packages
  include base::mail_delivery
  include base::zabbix_agent
  include base::sysctl
  include base::timezone
  include base::ntpdate
  include base::bash_history
  include base::sshd
  include base::limits
  include base::logwatch

  base::user {'testuser':
    ssh_pub_key		=> 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDpznYy/qmLfkbboSs5KrXmJoaZ5MoRIPuI+j4nRqVVezyfjkV1meQ3eHyNQzk5GAwhZmFyu9B2v/BUyUEing2c1tEPxLySH3wAoBcgbC20eXDiUyYbVCDB7xiC57sw8VvidfCzvpneIo0mfYnTfOiWbskL5M8j28T/f/YE4ZA3lwFvSu1ZhyYagLBYrl/ZCgOSEQRUhYgOM1MshQu+kIB6/Kxz+a3xBXO9GQqfKyZ339dLPFoe0QJrB/8ARuPIOkJuaR4Zr7RcflhB3ofxv2hN6kO4vxqVJLXTBulHjG7NAc0it8DGHwfrv54ZPWQGCOOauELdlognp0zYMeUxUxg1',
    groups		=> ['group1', 'group2'],
  }
}
