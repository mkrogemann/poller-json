module Matchers
  module JSON
    class JSONPathHasValue
      include JSONPath

      def initialize(json_path, value)
        @json_path = json_path
        @value = value
      end

      def  matches?(document_s)
        json_hash = ::JSON.parse(document_s)
        value_on_path(json_hash, @json_path) == @value
      end
    end
  end
end