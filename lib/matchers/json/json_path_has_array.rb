module Matchers
  module JSON
    class JSONPathHasArray
      include JSONPath

      def initialize(json_path, json_array)
        @json_path = json_path
        @json_array = json_array.is_a?(Array) ? json_array : ::JSON.parse(json_array)
      end

      def matches?(document_s)
        json_hash = ::JSON.parse(document_s)
        value_on_path(json_hash, @json_path) == @json_array
      end
    end
  end
end