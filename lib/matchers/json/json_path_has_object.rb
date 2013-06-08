module Matchers
  module JSON
    class JSONPathHasObject
      include JSONPath

      def initialize(json_path, json_object)
        @json_path = json_path
        @json_object = json_object.is_a?(Hash) ? json_object : ::JSON.parse(json_object)
      end

      def matches?(document_s)
        json_hash = ::JSON.parse(document_s)
        value_on_path(json_hash, @json_path) == @json_object
      end
    end
  end
end