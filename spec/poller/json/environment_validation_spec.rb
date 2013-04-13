require 'spec_helper'
require 'poller/poller_json'

module Poller
  module JSON
  	describe 'Environment Validation' do
  	  it 'can parse JSON?', :type => 'integration' do
  	  	json = ::JSON::parse(File.read(File.expand_path(File.join(__FILE__, '../environment_validation.json'))))
  	  	json.class.should == Hash
  	  end
  	end

  end
end