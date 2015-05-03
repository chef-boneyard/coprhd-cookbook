#
# Cookbook Name:: vipr
# Provider:: vipr_host
# Author:: Seth Thomas
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


include ViprUtils

def whyrun_supported?
  true
end

action :create do
 
  host_type = new_resource.host_type
  ip_or_dns = new_resource.ip_or_dns
  name = new_resource.name
  user_name = new_resource.user_name
  password = new_resource.password
  port = new_resource.port
  use_ssl = new_resource.use_ssl
  discoverable = new_resource.discoverable

  if vipr.host_exists?(name) 
    Chef::Log.info("Host #{name} already exists - nothing to do")
  else
    vipr.add_host(host_type, ip_or_dns, name, user_name, password, port, use_ssl, discoverable)
    Chef::Log.info("Added #{host_type} host #{name}")
    new_resource.updated_by_last_action(true)
  end
end

action :delete do
  name = new_resource.name
  host_id = new_resource.host_id
 
  if !vipr.host_exists?(name)
    Chef::Log.info("Host #{name} doesn't exist - nothing to do")
  else
    hosts = vipr.get_all_hosts['host']
    host = hosts.find{|host| host["name"] == name }
	  
    vipr.deactivate_host(host["id"])
    new_resource.updated_by_last_action(true)
  end
end
