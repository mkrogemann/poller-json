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
      end
    end
  end
end
