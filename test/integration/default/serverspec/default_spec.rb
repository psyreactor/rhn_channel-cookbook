# Encoding: utf-8

require_relative 'spec_helper'

  describe package('dmidecode') do
    it 'is installed' do
      expect(subject).to be_installed
    end
   end