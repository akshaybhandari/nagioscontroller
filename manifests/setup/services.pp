class nagioscontroller::setup::services (
  $service_list = ['mysql', 'openvswitch-switch', 'nova-api', 'keystone'],
  $network_list = [],
  $tenant_list = [],
  $router_list = [],
) {
  #OpenStack related checks
  @@nagios_service { "check_neutron_agents_${hostname}":
    check_command       => "check_nrpe_1arg!check_neutron_agents",
    use                 => "generic-service",
    host_name           => "$fqdn",
    service_description => 'check_neutron_agents',
  }
  @@nagios_service { "check_hypervisor_states_${hostname}":
    check_command       => "check_nrpe_1arg!check_hypervisor_states",
    use                 => "generic-service",
    host_name           => "$fqdn",
    service_description => 'check_hypervisor_states',
  }
  each($service_list) |$service| {
    @@nagios_service { "check_service_${service}_${hostname}":
      check_command       => "check_nrpe_1arg!check_service_${service}",
      use                 => "generic-service",
      host_name           => "$fqdn",
      service_description => "check_service_${service}",
    }
  }
  each($network_list) |$network| {
    @@nagios_service { "check_network_${network}_${hostname}":
      check_command       => "check_nrpe_1arg!check_network_${network}",
      use                 => "generic-service",
      host_name           => "$fqdn",
      service_description => "check_network_${network}",
    }
  }
  each($router_list) |$router| {
    @@nagios_service { "check_router_${router}_${hostname}":
      check_command       => "check_nrpe_1arg!check_router_${router}",
      use                 => "generic-service",
      host_name           => "$fqdn",
      service_description => "check_router_${router}",
    }
  }
  each($tenant_list) |$tenant| {
    @@nagios_service { "check_tenant_${tenant}_${hostname}":
      check_command       => "check_nrpe_1arg!check_tenant_${tenant}",
      use                 => "generic-service",
      host_name           => "$fqdn",
      service_description => "check_tenant_${tenant}",
    }
  }
}
