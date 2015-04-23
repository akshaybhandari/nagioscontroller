class nagioscontroller::setup {
  file { '/etc/nagios/nrpe.d/nrpe_command.cfg':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['nagios-nrpe-server'],
    require => Package['nagios-nrpe-server'],
  }

  class { 'nagioscontroller::setup::host':
    require => [ File['/etc/nagios/nrpe.cfg'], Package['nagios-nrpe-plugin', 'nagios-nrpe-server'] ],
  } ->
  class { 'nagioscontroller::setup::services': } ->
  class { 'nagioscontroller::setup::files': } ->
  class { 'nagioscontroller::setup::commands': }
}
