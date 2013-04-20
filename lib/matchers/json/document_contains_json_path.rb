module Matchers
  module JSON
    class DocumentContainsJSONPath
      include JSONPath

      def initialize(json_path)
        @json_path = json_path
      end

      # @param document_s [String] - the document given as String
      # Exceptions caught by JSON Parser will be thrown up the stack
      # ::JSON::ParserError in the case of invalid JSON
      def matches?(document_s)
        json_hash = ::JSON.parse(document_s)
        !value_on_path(json_hash, @json_path).nil?
      end
    end
  end
end

