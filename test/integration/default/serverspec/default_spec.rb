# Encoding: utf-8

require_relative 'spec_helper'

describe package('dmidecode') do
  it { should be_installed }
end