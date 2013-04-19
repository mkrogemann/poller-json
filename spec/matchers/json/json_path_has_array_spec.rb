require 'spec_helper'
require 'poller/poller_json'

module Matchers
  module JSON
    describe JSONPathHasArray do
      describe '#matches?' do
        context 'Document has the expected JSON Array' do

          context 'given as an Array' do
            it 'returns true if given JSONPath holds the expected JSON Array' do
              jha = JSONPathHasArray.new('$menu.popup.menuitem', ::JSON.parse(sample_json_array_string))
              jha.matches?(sample_json_string).should be_true
            end
          end

          context 'given as a String' do
            it 'returns true if given JSONPath holds the expected JSON Array' do
              jha = JSONPathHasArray.new('$menu.popup.menuitem', sample_json_array_string)
              jha.matches?(sample_json_string).should be_true
            end
          end

        end
      end
    end
  end
end
