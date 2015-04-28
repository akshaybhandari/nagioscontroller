class nagioscontroller::setup::commands (
  $service_list = ['mysql', 'openvswitch-switch', 'nova-api', 'keystone'],
  $network_list = [],
  $tenant_list = [],
  $router_list = [],
  $openstack_auth_url = undef,
  $openstack_user = undef,
  $openstack_password = undef,
  $openstack_tenant = undef,
  $openstack_neutron_url = undef,
  $openstack_nova_url = undef,
  $os_type = linux,
) {
  #OpenStack related checks
  file_line { "check_hypervisor_states_${hostname}":
    ensure  => present,
    path    => '/etc/nagios/nrpe.d/nrpe_command.cfg',
    line    => "command[check_hypervisor_states]=/usr/lib/nagios/plugins/check_hypervisor_states --auth_url '${openstack_auth_url}' --username ${openstack_user} --tenant ${openstack_tenant} --password ${openstack_password}",
    require => File['/etc/nagios/nrpe.d/nrpe_command.cfg'],
    notify  => Service['nagios-nrpe-server'],
  }
  file_line { "check_neutron_agents_${hostname}":
    ensure  => present,
    path    => '/etc/nagios/nrpe.d/nrpe_command.cfg',
    line    => "command[check_neutron_agents]=/usr/lib/nagios/plugins/check_neutron_agents --auth_url '${openstack_auth_url}' --username ${openstack_user} --tenant ${openstack_tenant} --password ${openstack_password} --neutron_url '${openstack_neutron_url}'",
    require => File['/etc/nagios/nrpe.d/nrpe_command.cfg'],
    notify  => Service['nagios-nrpe-server'],
  }
  each($service_list) |$service| {
    file_line { "check_service_${service}_${hostname}":
      ensure  => present,
      path    => '/etc/nagios/nrpe.d/nrpe_command.cfg',
      line    => "command[check_service_${service}]=/usr/lib/nagios/plugins/check_service.sh -o ${os_type} -s ${service}",
      require => File['/etc/nagios/nrpe.d/nrpe_command.cfg'],
      notify  => Service['nagios-nrpe-server'],
    }
  }
  each($network_list) |$network| {
    file_line { "check_network_${network}_${hostname}":
      ensure  => present,
      path    => '/etc/nagios/nrpe.d/nrpe_command.cfg',
      line    => "command[check_network_${network}]=/usr/lib/nagios/plugins/check_network --auth_url '${openstack_auth_url}' --username ${openstack_user} --tenant ${openstack_tenant} --password ${openstack_password} --network_id ${network}",
      require => File['/etc/nagios/nrpe.d/nrpe_command.cfg'],
      notify  => Service['nagios-nrpe-server'],
    }
  }
  each($router_list) |$router| {
    file_line { "check_router_${router}_${hostname}":
      ensure  => present,
      path    => '/etc/nagios/nrpe.d/nrpe_command.cfg',
      line    => "command[check_router_${router}]=/usr/lib/nagios/plugins/check_router --auth_url '${openstack_auth_url}' --username ${openstack_user} --tenant ${openstack_tenant} --password ${openstack_password} --router_id ${router}",
      require => File['/etc/nagios/nrpe.d/nrpe_command.cfg'],
      notify  => Service['nagios-nrpe-server'],
    }
  }
  each($tenant_list) |$tenant| {
    file_line { "check_tenant_${tenant}_${hostname}":
      ensure  => present,
      path    => '/etc/nagios/nrpe.d/nrpe_command.cfg',
      line    => "command[check_tenant_${tenant}]=/usr/lib/nagios/plugins/check_tenant --auth_url '${openstack_auth_url}' --username ${openstack_user} --tenant ${openstack_tenant} --password ${openstack_password} --tenant_id ${tenant}",
      require => File['/etc/nagios/nrpe.d/nrpe_command.cfg'],
      notify  => Service['nagios-nrpe-server'],
    }
  }
}
