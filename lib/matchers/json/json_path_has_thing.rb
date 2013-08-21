module Matchers
  module JSON
    module JSONPathHasThing

      def initialize(json_path, json_thing)
        @json_path = json_path
        @json_thing = discriminate json_thing
      end

      def matches?(document_s)
        json_doc_hash = ::JSON.parse document_s
        value_on_path(json_doc_hash, @json_path) == @json_thing
      end

      private
      def discriminate(thing)
        return thing if [Array, Hash].include? thing.class
        ::JSON.parse thing
      end
    end
  end
end