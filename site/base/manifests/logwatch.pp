class base::logwatch (
  Array[String] $email_to = $base::params::logwatch_email_to,
  Array[String] $services = $base::params::logwatch_services,
) inherits base::params {

  class { '::logwatch':
    mail_to   => $email_to,
    service   => $services,
  }
}
