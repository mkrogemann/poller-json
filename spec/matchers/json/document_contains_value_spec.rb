require 'spec_helper'
require 'poller/poller_json'

module Matchers
  module JSON
    describe DocumentContainsValue do

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

      # TODO: handle json parsing errors
      describe '#matches?' do
        it 'returns true if under a given JSON path we find the expected value' do
          dcv = DocumentContainsValue.new('$menu.popup.menuitem[0].value', 'New')
          dcv.matches?(sample_json_string).should be_true
        end
      end
    end
  end
end
