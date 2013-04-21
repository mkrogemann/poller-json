# This is by no means an implementation of JSONPath as outlined in
# http://goessner.net/articles/JsonPath/ and implemented in
# https://github.com/joshbuddy/jsonpath.
#
# Instead, the module can handle only a very limited subset of JSONPath and
# operates on a Hash (result of ::JSON.parse(document)). It makes sense in the
# context of poller-json and its current set of features.

module Matchers
  module JSON
    module JSONPath

      def value_on_path(json_hash, path)
        raise ArgumentError, "Invalid json path: #{path}" unless json_path_valid?(path)
        current_node = json_hash # start traversal at document root
        path_items(path).each do |path_item|
          element, index = decompose_path_item(path_item)
          begin
            current_node = fetch(current_node, element, index)
          rescue IndexError
            return nil
          end
        end
        current_node
      end

      def fetch(current_node, element, index)
        current_node = current_node.send(:fetch, element)
        current_node = current_node.send(:fetch, index) if index
        current_node
      end
      private :fetch

      def path_items(path)
        path[1..-1].split('.') # removing the leading '$'
      end
      private :path_items

      # if the path item contains an index (eg 'sample[3]') then the index will be returned
      # if not, second return value will be nil [element,index]
      # TODO: does two things: decide on syntax and decompose
      def decompose_path_item(path_item)
        path_item = path_item.sub('[\'', '').sub('\']', '') if path_item.start_with?('[\'')
        element, index = path_item.split('[')
        index = index[0..-2].to_i if index
        [element, index]
      end
      private :decompose_path_item

      # TODO: the regular expressions below will only catch a few of the possible errors
      def json_path_valid?(path)
        notation = path.include?('[\'') ? :bracket : :dot
        path_regex = /^\$[a-zA-Z0-9_(\[\d\])\.]*[^\.]$/ if notation == :dot
        path_regex = /^\$[a-zA-Z0-9_(\[\d\])\.\']*[^\.]$/ if notation == :bracket
        path_regex.match(path)
      end
    end
  end
end