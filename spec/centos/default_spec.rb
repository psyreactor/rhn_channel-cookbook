# Encoding: utf-8

require_relative '../spec_helper'

describe 'rhn_channel::default' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set[:rhn_channel][:username] = 'user'
      node.set[:rhn_channel][:password] = 'password'
    end.converge('rhn_channel::default')
  end

  it 'install packages required for hardware detect' do
    expect(chef_run).to install_package('dmidecode')
  end

  it 'update packages required for rhn_channel' do
    expect(chef_run).to upgrade_package('rhn-setup')
    expect(chef_run).to upgrade_package('yum-rhn-plugin')
  end

  it 'add chanels to rhel' do
    expect(chef_run).to create_rhn_channel_repository('rhel-x86_64-rhev-agent-6-server')
    expect(chef_run).to create_rhn_channel_repository('rhel-x86_64-server-optional-6')
    expect(chef_run).to create_rhn_channel_repository('rhel-x86_64-server-supplementary-6')
    expect(chef_run).to create_rhn_channel_repository('rhel-x86_64-server-optional-fastrack-6')
  end

end
