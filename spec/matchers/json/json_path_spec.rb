require 'spec_helper'
require 'poller/poller_json'

module Matchers
  module JSON

    class JSONPathHolder
      include JSONPath
    end

    describe JSONPath do

      describe '#value_on_path' do
        it 'finds value on path for the dot-notation' do
          json_path_holder = JSONPathHolder.new
          json_hash = ::JSON.parse(sample_json_string)
          json_path_holder.value_on_path(json_hash, '$menu.popup.menuitem[0].value').should == 'New'
        end

        it 'finds value on path for the bracket-notation' do
          json_path_holder = JSONPathHolder.new
          json_hash = ::JSON.parse(sample_json_string)
          json_path_holder.value_on_path(json_hash, "$['menu'].['popup'].['menuitem'][0].['value']").should == 'New'
        end
      end
    end
  end
end