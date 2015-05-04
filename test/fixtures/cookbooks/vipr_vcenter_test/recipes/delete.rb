# add and then delete a vcenter

include_recipe 'vipr_vcenter_test::add'

vipr_vcenter 'test-vcenter-1' do
  vipr_user     node['vipr']['user']
  vipr_password node['vipr']['password']
  vipr_url      node['vipr']['url']

  action :delete
end