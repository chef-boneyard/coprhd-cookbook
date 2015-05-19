# add a vcenter

coprhd_vcenter 'test-vcenter-1' do
  coprhd_user     node['coprhd']['user']
  coprhd_password node['coprhd']['password']
  coprhd_url      node['coprhd']['url']

  user_name     node['coprhd']['vcenter']['user_name']
  password      node['coprhd']['vcenter']['password']
  fqdn_or_ip    node['coprhd']['vcenter']['fqdn_or_ip']

  action :create
end
