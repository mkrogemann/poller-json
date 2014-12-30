require 'spec_helper'
require 'poller/poller_json'

module Matchers
  module JSON

    class JSONPathHolder
      include JSONPath
    end

    describe JSONPath do
      describe '#value_on_path' do
        context 'valid json path expression' do
          it 'finds value on path for the dot-notation' do
            json_path_holder = JSONPathHolder.new
            json_hash = ::JSON.parse(sample_json_document)
            json_path_holder.value_on_path(json_hash, '$menu.popup.menuitem[0].value').should == 'New'
          end

          it 'finds value on path for the bracket-notation' do
            json_path_holder = JSONPathHolder.new
            json_hash = ::JSON.parse(sample_json_document)
            json_path_holder.value_on_path(json_hash, "$['menu'].['popup'].['menuitem'][0].['value']").should == 'New'
          end
        end

        context 'invalidd json path expression' do
          it 'raises an ArgumentError for invalid dot-notation' do
            json_path_holder = JSONPathHolder.new
            json_hash = ::JSON.parse(sample_json_document)
            expect {
              json_path_holder.value_on_path(json_hash, '$menu.popup.menuitem[0].value.')
            }.to raise_error ArgumentError, 'Invalid json path: $menu.popup.menuitem[0].value.'
          end

          it 'raises an ArgumentError for invalid bracket-notation' do
            json_path_holder = JSONPathHolder.new
            json_hash = ::JSON.parse(sample_json_document)
            expect {
              json_path_holder.value_on_path(json_hash, "$['menu'].['popup'].['menuitem'][0].['value'].")
            }.to raise_error ArgumentError, "Invalid json path: $['menu'].['popup'].['menuitem'][0].['value']."
          end
        end
      end

      describe '#json_path_valid?' do
        context 'valid dot-notation' do
          it 'returns true for valid json path expression' do
            json_path_holder = JSONPathHolder.new
            expect(json_path_holder.json_path_valid?('$menu.popup.menuitem[0].value')).to be_truthy
            expect(json_path_holder.json_path_valid?('$menu_1.popup.menuitem[0].value')).to be_truthy
          end
        end

        context 'invalid dot-notation' do
          it 'returns false for invalid json path expression' do
            json_path_holder = JSONPathHolder.new
            expect(json_path_holder.json_path_valid?('menu.popup.menuitem[0].value')).to be_falsey
            expect(json_path_holder.json_path_valid?('$menu.popup.menuitem[0].value.')).to be_falsey
          end
        end

        context 'valid bracket-notation' do
          it 'returns true for valid json path expression' do
            json_path_holder = JSONPathHolder.new
            expect(json_path_holder.json_path_valid?("$['menu'].['popup'].['menuitem'][0].['value']")).to be_truthy
            expect(json_path_holder.json_path_valid?("$['menu'].['popup_3'].['menuitem'][0].['value']")).to be_truthy
          end
        end

        context 'invalid bracket-notation' do
          it 'returns false for invalid json path expression' do
            json_path_holder = JSONPathHolder.new
            expect(json_path_holder.json_path_valid?("['menu'].['popup'].['menuitem'][0].['value']")).to be_falsey
            expect(json_path_holder.json_path_valid?("$['menu'].['popup'].['menuitem'][0].['value'].")).to be_falsey
          end
        end
      end
    end
  end
end