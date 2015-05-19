# add and then delete a vcenter

include_recipe 'coprhd_vcenter_test::add'

coprhd_vcenter 'test-vcenter-1' do
  coprhd_user     node['coprhd']['user']
  coprhd_password node['coprhd']['password']
  coprhd_url      node['coprhd']['url']

  action :delete
end