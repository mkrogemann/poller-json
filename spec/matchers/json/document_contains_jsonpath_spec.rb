require 'spec_helper'
require 'poller/poller_json'

module Matchers
  module JSON
    describe DocumentContainsJSONPath do

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

      describe '#matches?' do
        it 'returns true if under a given JSON path we find the expected value' do
          dcv = DocumentContainsJSONPath.new('$menu.popup.menuitem[0].value')
          dcv.matches?(sample_json_string).should be_true
        end
      end

      #TODO: examples for json error and missing elements along path
    end
  end
end
