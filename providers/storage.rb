#
# Cookbook Name:: coprhd
# Provider:: storage
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


include CoprhdUtils

def whyrun_supported?
  true
end

action :add do
 
  storage_type = new_resource.storage_type
  ip_or_dns = new_resource.ip_or_dns
  name = new_resource.name
  user_name = new_resource.user_name
  password = new_resource.password
  port = new_resource.port
  use_ssl = new_resource.use_ssl

  if coprhd.host_exists?(name) 
    Chef::Log.info("Storage system #{name} already exists - nothing to do")
  else
    coprhd.add_#{storage_type}(name, ip_or_dns, user_name, password, port, use_ssl)
    Chef::Log.info("Added #{host_type} host #{name}")
    new_resource.updated_by_last_action(true)
  end
end
