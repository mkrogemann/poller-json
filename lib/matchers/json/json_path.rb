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
        raise ArgumentError, "Invalid json path: #{path}" unless validate_json_path(path)
        path = path[1..-1] if path.start_with?('$')
        path_items = path.split('.')
        child_node = json_hash # start traversal at document root
          path_items.each do |path_item|
            path_item = path_item.sub('[\'', '').sub('\']', '') if path_item.start_with?('[\'')
            path_item, index = path_item.split('[')
            begin
              child_node = child_node.send(:fetch, path_item)
            rescue IndexError
              return nil
            end
            if index
              index = index[0..-2].to_i
              begin
                child_node = child_node.send(:fetch, index)
              rescue IndexError
                return nil
              end
            end
          end
        child_node
      end

      # TODO: the regular expressions below will only catch a few of the possible errors
      def validate_json_path(path)
        notation = path.include?('[\'') ? :bracket : :dot
        if notation == :dot
          path_regex = /^\$[a-zA-Z0-9_(\[\d\])\.]*[^\.]$/
        else
          path_regex = /^\$[a-zA-Z0-9_(\[\d\])\.\']*[^\.]$/
        end
        path_regex.match(path)
      end
    end
  end
end