# delete a host

vipr_host 'test-host-1' do
  vipr_user 	node['vipr']['user']
  vipr_password node['vipr']['password']
  vipr_url 	node['vipr']['url']

  action :delete
end
