require 'spec_helper'
require 'poller/poller_json'

module Matchers
  module JSON
    describe JSONPathHasValue do
      describe '#matches?' do
        context 'Document has expected simple value for given JSONPath' do
          it 'returns true if given JSONPath holds the expected simple value' do
            jhv = JSONPathHasValue.new('$menu.popup.menuitem[2].value', "Close")
            jhv.matches?(sample_json_document).should be_true
          end
        end

        context 'integration testing' do
          it 'succeeds in fetching JSON result and finds expected value for given path', :type => 'integration' do
            matcher = JSONPathHasValue.new('$geoplugin_currencyCode', 'USD')
            poller = Poller::HTTP::HttpPoller.new('http://www.geoplugin.net/json.gp?ip=216.113.168.141', matcher, 5.0, 1.0)
            result = poller.check
            result.should be_an_instance_of Array
            result[0].should be_an_instance_of Net::HTTPOK
            result[1].should be_a_kind_of Numeric
          end
        end

      end
    end
  end
end
