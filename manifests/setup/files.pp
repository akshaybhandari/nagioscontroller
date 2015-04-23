class nagioscontroller::setup::files {
  file { "check_memory.sh_${hostname}":
    ensure => present,
    path   => '/usr/lib/nagios/plugins/check_memory.sh',
    source => 'puppet:///modules/nagioscontroller/check_memory.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
}
