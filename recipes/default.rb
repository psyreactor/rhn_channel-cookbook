# Encoding: utf-8
#
# Cookbook Name:: rhn_chennel
# Recipe:: default
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
# Detection of Dell hardware depends on dmidecode

package 'dmidecode' do
  action :install
end

%w(rhn-setup yum-rhn-plugin).each do |pkg|
  package pkg do
    action :upgrade
  end
end

node[:rhn_channel][:channels].each do |repo|
  rhn_channel_repository repo do
    user node[:rhn_channel][:username]
    password node[:rhn_channel][:password]
    action :create
  end
end
