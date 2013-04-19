module Matchers
  module JSON
    class JSONPathHasObject < JSONPathHasValue

      def initialize(json_path, value)
        @json_path = json_path
        @value = value.is_a?(Hash) ? value : ::JSON.parse(value)
      end

    end
  end
end