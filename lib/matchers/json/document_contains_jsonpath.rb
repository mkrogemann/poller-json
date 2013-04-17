module Matchers
  module JSON
    class DocumentContainsJSONPath
      include JSONPath

      def initialize(json_path)
        @json_path = json_path
      end

      def matches?(document_s)
        # TODO: handle JSON parser error
        json_hash = ::JSON.parse(document_s)
        # TODO: handle missing elements along path
        !value_on_path(json_hash, @json_path).nil?
      end
    end
  end
end

