require 'spec_helper'
require 'poller/poller_json'

module Matchers
  module JSON
    describe DocumentContainsJSONPath do

      describe '#matches?' do
        context 'document valid and json path exists' do
          it 'returns true if under a given JSON path we find the expected value' do
            dcj = DocumentContainsJSONPath.new('$menu.popup.menuitem[0].value')
            dcj.matches?(sample_json_document).should be_true
          end
        end

        context 'invalid document' do
          it 'raises a ::JSON::ParserError for invalid JSON' do
            dcj = DocumentContainsJSONPath.new('$menu.popup.menuitem[0].value')
            invalid_json = sample_json_document[0..-3]
            expect {
              dcj.matches?(invalid_json)
            }.to raise_error ::JSON::ParserError
          end
        end

        context 'json path does not exist in document' do
          it 'returns false if path does not exist in JSON' do
            broken_path = '$menu.popdown.menuitem[0].value'
            dcj = DocumentContainsJSONPath.new(broken_path)
            dcj.matches?(sample_json_document).should be_false
          end

          it 'returns false if JSON array contains fewer itmes than expected' do
            invalid_index = '$menu.popup.menuitem[10].value'
            dcj = DocumentContainsJSONPath.new(invalid_index)
            dcj.matches?(sample_json_document).should be_false
          end
        end

        context 'integration testing' do
          it 'succeeds in fetching JSON result and finds expected path', :type => 'integration' do
            matcher = DocumentContainsJSONPath.new('$geoplugin_countryName')
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
