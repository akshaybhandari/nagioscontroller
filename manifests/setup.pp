class nagioscontroller::setup {
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
