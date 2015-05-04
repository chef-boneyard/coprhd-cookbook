#
# Cookbook Name:: vipr
# Library:: viprutils
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

module ViprUtils

  def vipr
    ensure_vipruby_gem_installed
    begin
      @vipr ||= Vipr.new(new_resource.vipr_url,new_resource.vipr_user,new_resource.vipr_password,new_resource.verify_cert)
    rescue RestClient::Unauthorized
      raise "Unauthorized...please check credentials."
    end
  end

  def ensure_vipruby_gem_installed
    begin
      require 'vipruby'
    rescue LoadError
      Chef::Log.info("Missing gem 'vipruby'...installing now.")
      chef_gem "vipruby" do
        version "0.1.7"
        action :install
      end
      require 'vipruby'
    end
  end
end
