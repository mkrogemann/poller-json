module Matchers
  module JSON
    class JSONPathHasArray < JSONPathHasValue

      def initialize(json_path, value)
        @json_path = json_path
        @value = value.is_a?(Array) ? value : ::JSON.parse(value)
      end

    end
  end
end