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
  class { 'nagioscontroller::setup::services':
    router_list           => $::nagioscontroller::router_list,
    service_list          => $::nagioscontroller::service_list,
    network_list          => $::nagioscontroller::network_list,
    tenant_list           => $::nagioscontroller::tenant_list,
  } ->
  class { 'nagioscontroller::setup::files': } ->
  class { 'nagioscontroller::setup::commands':
    router_list           => $::nagioscontroller::router_list,
    service_list          => $::nagioscontroller::service_list,
    network_list          => $::nagioscontroller::network_list,
    tenant_list           => $::nagioscontroller::tenant_list,
    openstack_auth_url    => $::nagioscontroller::auth_url,
    openstack_neutron_url => $::nagioscontroller::neutron_url,
    openstack_nova_url    => $::nagioscontroller::nova_url,
    openstack_user        => $::nagioscontroller::username,
    openstack_password    => $::nagioscontroller::password,
    openstack_tenant      => $::nagioscontroller::tenant,
  }
}
