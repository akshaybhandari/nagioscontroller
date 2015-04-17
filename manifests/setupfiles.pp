class nagioscontroller::setupfiles {
  file { '/usr/lib/nagios/plugins/check_users':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/nagioscontroller/check_users',
    require => Package['nagios-nrpe-server'],
  }
}
