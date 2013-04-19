require 'spec_helper'
require 'poller/poller_json'

module Matchers
  module JSON
    describe JSONPathHasValue do
      describe '#matches?' do
        context 'Document has expected simple value for given JSONPath' do
          it 'returns true if given JSONPath holds the expected simple value' do
            jhv = JSONPathHasValue.new('$menu.popup.menuitem[2].value', "Close")
            jhv.matches?(sample_json_string).should be_true
          end
        end

        context 'integration testing' do
          it 'succeeds in fetching JSON result and finds expected value for given path', :type => 'integration' do
            matcher = JSONPathHasValue.new('geoplugin_currencyCode', 'USD')
            poller = Poller::HTTP::HttpPoller.new('http://www.geoplugin.net/json.gp?ip=216.113.168.141', matcher, 5.0, 1.0)
            poller.check.should be_nil
          end
        end

      end
    end
  end
end
