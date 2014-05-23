
default[:rhn_channel][:channels] = %w(rhel-x86_64-rhev-agent-6-server rhel-x86_64-server-optional-6 rhel-x86_64-server-supplementary-6 rhel-x86_64-server-optional-fastrack-6)

if defined?(node[:rhn][:username]) || defined?(node[:rhn][:password])
  default[:rhn_channel][:username] = node[:rhn][:username]
  default[:rhn_channel][:password] = node[:rhn][:password]
else
  default[:rhn_channel][:username] = 'user'
  default[:rhn_channel][:password] = 'password'
end
