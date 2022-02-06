# frozen_string_literal: true

require_relative "./tag"

module HexletCode
  module Tags
    class Label
      def initialize(attr_name)
        @name = attr_name
      end

      def to_html_string
        Tag.build("label", for: @name) { @name.capitalize }
      end
    end
  end
end
