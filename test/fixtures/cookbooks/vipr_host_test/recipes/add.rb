# add a host

vipr_host 'test-host-1' do
  vipr_user     node['vipr']['user']
  vipr_password node['vipr']['password']
  vipr_url      node['vipr']['url']

  host_type     node['vipr']['host']['type']
  ip_or_dns     node['vipr']['host']['ip_or_dns']
  user_name     node['vipr']['host']['user_name']
  password      node['vipr']['host']['password']

  action :create
end

