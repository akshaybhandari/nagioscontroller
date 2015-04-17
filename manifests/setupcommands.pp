class nagioscontroller::setupcommands (
#  check_users_warning  = '5',
#  check_users_critical = '10',
) {
  file { '/etc/nagios/nagios_command.cfg':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['nagios-nrpe-server'],
    require => Package['nagios-nrpe-server'],
  }
  nagios_command { 'check_users':
    ensure       => present,
    command_line => '/usr/lib/nagios/plugins/check_users -w 5 -c 10',
    require      => File['/etc/nagios/nagios_command.cfg'],
  }
}
