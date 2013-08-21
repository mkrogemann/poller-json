module Matchers
  module JSON
    class JSONPathHasObject
      include JSONPath
      include JSONPathHasThing

      def initialize(json_path, json_object)
        super(json_path, json_object)
      end
    end
  end
end