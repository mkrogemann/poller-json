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
        path = path[1..-1] if path.start_with?('$') # TODO: check jsonpath syntax and raise error
        path_items = path.split('.')
        child_node = json_hash
        path_items.each do |path_item|
          path_item = path_item.sub('[\'', '').sub('\']', '') if path_item.start_with?('[\'')
          path_item, index = path_item.split('[')
          child_node = child_node.send(:fetch, path_item)
          if index
            index = index[0..-2].to_i
            child_node = child_node.send(:fetch, index)
          end
        end
        child_node
      end
    end
  end
end