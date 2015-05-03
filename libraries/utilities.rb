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

require 'vipruby'

module ViprUtils

  def vipr
    @vipr ||= Vipr.new(new_resource.vipr_url,new_resource.vipr_user,new_resource.vipr_password,new_resource.verify_cert)
  end

end
