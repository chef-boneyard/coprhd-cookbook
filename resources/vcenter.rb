#
# Cookbook Name:: coprhd
# Resource:: coprhd_vcenter
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

actions :create, :delete

default_action :create

attribute :user_name, kind_of: String, required: true
attribute :password, kind_of: String, required: true
attribute :tenant, kind_of: String, required: false, default: nil
attribute :fqdn_or_ip, kind_of: String, required: true
attribute :name, kind_of: String, name_attribute: true
attribute :id, kind_of: String, required: false
attribute :port, kind_of: Integer, required: false

attribute :coprhd_user, kind_of: String, required: true
attribute :coprhd_password, kind_of: String, required: true
attribute :coprhd_url, kind_of: String, required: true
attribute :verify_cert, kind_of: String, required: false, default: nil

