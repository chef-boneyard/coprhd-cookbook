# delete a host

coprhd_host 'test-host-1' do
  coprhd_user 	   node['coprhd']['user']
  coprhd_password  node['coprhd']['password']
  coprhd_url 	   node['coprhd']['url']

  action :delete
end
