require 'spec_helper'
require 'poller/poller_json'

module Matchers
  module JSON
    describe JSONPathHasObject do
      describe '#matches?' do
        context 'Document has the expected JSON Object' do
          context 'given as a Hash' do
            it 'returns true if given JSONPath holds the expected JSON Object' do
              jho = JSONPathHasObject.new('$menu.popup.menuitem[2]', ::JSON.parse(sample_json_object))
              expect(jho.matches?(sample_json_document)).to be_truthy
            end
          end

          context 'given as a String' do
            it 'returns true if given JSONPath holds the expected JSON Object' do
              jho = JSONPathHasObject.new('$menu.popup.menuitem[2]', sample_json_object)
              expect(jho.matches?(sample_json_document)).to be_truthy
            end
          end
        end
      end
    end
  end
end
