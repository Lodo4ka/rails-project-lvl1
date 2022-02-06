# frozen_string_literal: true

require_relative "./tag"

module HexletCode
  module Tags
    class Input
      def initialize(attr_name, attr_value, type, attributes = {})
        @name = attr_name
        @value = attr_value
        @type = type || "text"
        @attributes = attributes
      end

      def to_html_string
        Tag.build "input", name: @name, type: @type, value: @value, **@attributes
      end
    end
  end
end
