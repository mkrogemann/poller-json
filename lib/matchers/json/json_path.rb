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
          path_elem, index = decompose_path_item(path_item)

          # current_node = fetch(current_node, path, index)

          begin
            current_node = current_node.send(:fetch, path_elem)
          rescue IndexError
            return nil
          end
          if index
            index = index[0..-2].to_i
            begin
              current_node = current_node.send(:fetch, index)
            rescue IndexError
              return nil
            end
          end


        end
        current_node
      end

      # sanitize & split path
      def path_items(path)
        path = path[1..-1] if path.start_with?('$')
        path_items = path.split('.')
      end
      private :path_items

      # if the pathitem contains an index ('sample[3]') then the index will be returned
      # if not, then only the path_elem will be non-nil
      def decompose_path_item(path_item)
        _path_item = path_item.start_with?('[\'') ? path_item.sub('[\'', '').sub('\']', '') : path_item
        path_elem, index = _path_item.split('[')
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