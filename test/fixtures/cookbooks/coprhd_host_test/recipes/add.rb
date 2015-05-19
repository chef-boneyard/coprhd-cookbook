# add a host

coprhd_host 'test-host-1' do
  coprhd_user     node['coprhd']['user']
  coprhd_password node['coprhd']['password']
  coprhd_url      node['coprhd']['url']

  host_type     node['coprhd']['host']['type']
  ip_or_dns     node['coprhd']['host']['ip_or_dns']
  user_name     node['coprhd']['host']['user_name']
  password      node['coprhd']['host']['password']

  action :create
end

