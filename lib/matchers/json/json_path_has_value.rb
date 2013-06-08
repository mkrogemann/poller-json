module Matchers
  module JSON
    class JSONPathHasValue
      include JSONPath

      def initialize(json_path, json_value)
        @json_path = json_path
        @json_value = json_value
      end

      def matches?(document_s)
        json_hash = ::JSON.parse(document_s)
        value_on_path(json_hash, @json_path) == @json_value
      end
    end
  end
end