#
# Cookbook Name:: rhn_chennel
# provider:: repository
#
# Copyright 2014, Mariani Lucas
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

use_inline_resources if defined?(use_inline_resources)

def whyrun_supported?
  true
end

action :create  do

  execute "rhn_channel#{new_resource.repo}" do
    command "rhn-channel --add --channel=#{new_resource.repo} -u #{new_resource.user} -p #{new_resource.password}"
    only_if "rhn-channel -L --channel=#{new_resource.repo} -u #{new_resource.user} -p #{new_resource.password} | grep -P '^#{new_resource.repo}([ \t]|$)'"
    notifies :run, "execute[yum-makecache-#{new_resource.repo}]", :immediately
  end

  execute "yum-makecache-#{new_resource.repo}" do
    command "yum -q makecache --disablerepo=* --enablerepo=#{new_resource.repo}"
    action :nothing
  end

end

action :delete do

  execute "rhn_channel#{new_resource.repo}" do
    command "rhn-channel --remove --channel=#{new_resource.repo} -u #{new_resource.user} -p #{new_resource.password}"
    only_if "rhn-channel -l --channel=#{new_resource.repo} -u #{new_resource.user} -p #{new_resource.password} | grep -P '^#{new_resource.repo}([ \t]|$)'"
    notifies :run, "execute[yum clean #{new_resource.repo}]", :immediately
  end
end

alias_method :action_add, :action_create
alias_method :action_remove, :action_delete
