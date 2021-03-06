class nagioscontroller::setup::files {
  file { "check_hypervisor_states_${hostname}":
    ensure => present,
    path   => '/usr/lib/nagios/plugins/check_hypervisor_states',
    source => 'puppet:///modules/nagioscontroller/check_hypervisor_states',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    require => Package['nagios-nrpe-server'],
  }
  file { "check_network_${hostname}":
    ensure => present,
    path   => '/usr/lib/nagios/plugins/check_network',
    source => 'puppet:///modules/nagioscontroller/check_network',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    require => Package['nagios-nrpe-server'],
  }
  file { "check_neutron_agents_${hostname}":
    ensure => present,
    path   => '/usr/lib/nagios/plugins/check_neutron_agents',
    source => 'puppet:///modules/nagioscontroller/check_neutron_agents',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    require => Package['nagios-nrpe-server'],
  }
  file { "check_router_${hostname}":
    ensure => present,
    path   => '/usr/lib/nagios/plugins/check_router',
    source => 'puppet:///modules/nagioscontroller/check_router',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    require => Package['nagios-nrpe-server'],
  }
  file { "check_tenant_${hostname}":
    ensure => present,
    path   => '/usr/lib/nagios/plugins/check_tenant',
    source => 'puppet:///modules/nagioscontroller/check_tenant',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    require => Package['nagios-nrpe-server'],
  }
}
