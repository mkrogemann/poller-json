require 'spec_helper'
require 'poller/poller_json'

module Matchers
  module JSON
    describe JSONPathHasValue do
      describe '#matches?' do
        context 'Document has expected value for given JSONPath' do
          it 'foo' do
            jhv = JSONPathHasValue.new('$menu.popup.menuitem[2]',
              ::JSON.parse("{\"value\": \"Close\", \"onclick\": \"CloseDoc()\"}"))
            jhv.matches?(sample_json_string).should be_true
          end
        end
      end
    end
  end
end
