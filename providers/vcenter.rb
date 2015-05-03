#
# Cookbook Name:: vipr
# Provider:: vipr_vcenter
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
  require 'vipruby'

  fqdn_or_ip = new_resource.fqdn_or_ip
  name = new_resource.name
  user_name = new_resource.user_name
  password = new_resource.password
  port = new_resource.port
  tenant = new_resource.tenant
  
  vcenter = vipr.find_vcenter_object(name)
 
  if !vcenter["resource"][0].nil?
    Chef::Log.info "vCenter #{name} already exists - nothing to do"
  else
    vipr.add_vcenter(fqdn_or_ip, name, user_name, password, port, tenant)
    new_resource.updated_by_last_action(true)
  end
end

action :delete do
  require 'vipruby'
  id = new_resource.id
  name = new_resource.name
    
  vcenter = vipr.find_vcenter_object(name)
  if id.nil? && !vcenter["resource"][0].nil?
    id = vcenter["resource"][0]["id"]
  end

  if vcenter["resource"][0].nil?
    Chef::Log.info "vCenter #{name} doesn't exist - nothing to do"
  else
    vipr.delete_vcenter(id)
    new_resource.updated_by_last_action(true)
  end
end
