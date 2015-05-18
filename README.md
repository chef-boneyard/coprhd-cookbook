ViPR Cookbook
-------------

The ViPR Cookbook is a library cookbook that provides resources to
manage [EMC's ViPR Controller](http://www.emc.com/techpubs/vipr/what_is_vipr-3.htm)

Scope
-----
This cookbook utilizes the [ViPRuby](https://github.com/emccode/Vipruby) gem to interact with EMC ViPR Controllers.

Requirements
------------
- Chef 12.1.0 or higher - preferably ChefDK 0.5.0+

Platform Support
----------------
The following platforms have been tested with Test Kitchen:

```
|----------------+-----|
| ubuntu-14.04   |  X  | 
|----------------+-----|
| centos-7.0     |  X  | 
|----------------+-----|
| centos-6.6     |  X  | 
|----------------+-----|
```

Resources Overview
------------------

### vipr_host

This resource manages the creation and removal of hosts from a ViPR Controller instance.

#### Example
```ruby
vipr_host 'host01' do
  vipr_user     'root'
  vipr_password 'ChangeMe1!'
  vipr_url      '192.168.10.50'

  host_type 'Linux'
  ip_or_dns '192.168.10.333'
  user_name 'host_user'
  password 'host_pass'

  action :create
end
```

#### Parameters

Unless otherwise noted, all parameters default to `nil`

- `host_type` - Type of Host. "Windows", "Linux", or, "HPUX". This is a required string.
- `ip_or_dns` - IP Address or FQDN of host. This is a required string.
- `name` - Arbitrary Name only necesary and identifiable by ViPR. This is a required string.
- `user_name` - User Name to connect to the host. This is a required string.
- `password` - Password for the User Name to connect to the host. This is a required string.
- `port` - Port to connect to the host. This is an optional integer. Defaults will be used if no param is passed.
- `use_ssl` - Whether SSL is used. True or False. Optional Param
- `discoverable` - True or False. Initators and Nodes will be discovered after being added. By default this is true

#### Actions

- `:create` - Adds a host.
- `:delete` - Removes a host.

### vipr_vcenter

This resource manages the creation and removal of VMware vCenter from a ViPR Controller instance.

#### Parameters

Unless otherwise noted, all parameters default to `nil` 

- `fqdn_or_ip` - FQDN or IP Address of the vCenter server to add. This is a required string.
- `name` - Name of the vCenter server. This name is arbitrary and only exists within ViPR. This is a required string.
- `user_name` - User Name that will be used for authenticating against the vCenter Server. This is a required string.
- `password` - Password for the user_name that will be used for authenticating against the vCenter Server. This is a required string.
- `port` - Port of the vCenter server. This is an optional parameter. If no parameter is present, the default port of '443' will be used. If registering to a different tenant than default, set this param to nil
- `tenant` - Specify a tenant_uid where the vCenter will be registered. By default it will be added to the tenant of the current logged in ViPR user. This string is optional.

#### Actions

- `:create` - Adds a vCenter.
- `:delete` - Removes a vCenter host.

License & Authors
-----------------
- Author:: Seth Thomas (<sthomas@chef.io>)

```text
Copyright:: 2009-2015 Chef Software, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
