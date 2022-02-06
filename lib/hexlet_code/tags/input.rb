# frozen_string_literal: true

require_relative "./tag"

module HexletCode
  module Tags
    class Input
      def initialize(attr_name, attr_value = nil, attr_type = "text")
        @name = attr_name
        @value = attr_value
        @type = attr_type
      end

      def to_html_string
        Tag.build "input", name: @name, type: @type, value: @value
      end
    end
  end
end
