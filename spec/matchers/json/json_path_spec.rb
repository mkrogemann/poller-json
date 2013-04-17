require 'spec_helper'
require 'poller/poller_json'

module Matchers
  module JSON

    class JSONPathHolder
      include JSONPath
    end

    describe JSONPath do

      # TODO: extract/share
      def sample_json_string
        <<-EOS
        {"menu": {
          "id": "file",
          "value": "File",
          "popup": {
            "menuitem": [
              {"value": "New", "onclick": "CreateNewDoc()"},
              {"value": "Open", "onclick": "OpenDoc()"},
              {"value": "Close", "onclick": "CloseDoc()"}
            ]
          }
        }}
        EOS
      end

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