# add a vcenter

vipr_vcenter 'test-vcenter-1' do
  vipr_user     node['vipr']['user']
  vipr_password node['vipr']['password']
  vipr_url      node['vipr']['url']

  user_name     node['vipr']['vcenter']['user_name']
  password      node['vipr']['vcenter']['password']
  fqdn_or_ip    node['vipr']['vcenter']['fqdn_or_ip']

  action :create
end
