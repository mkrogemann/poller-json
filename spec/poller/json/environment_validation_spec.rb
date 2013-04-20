require 'spec_helper'
require 'poller/poller_json'

module Poller
  module JSON
  	describe 'Environment Validation' do
  	  it 'can parse JSON?', :type => 'integration' do
  	  	json = ::JSON::parse(sample_json_document)

  	  	json.class.should == Hash
  	  	json['menu']['value'].should == 'File'
  	  	json['menu']['popup']['menuitem'].size.should == 3
  	  end
  	end
  end
end