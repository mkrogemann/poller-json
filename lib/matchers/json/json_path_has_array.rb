module Matchers
  module JSON
    class JSONPathHasArray
      include JSONPath
      include JSONPathHasThing

      def initialize(json_path, json_array)
        super(json_path, json_array)
      end
    end
  end
end