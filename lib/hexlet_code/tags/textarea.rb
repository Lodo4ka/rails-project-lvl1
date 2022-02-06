# frozen_string_literal: true

require_relative "./tag"

module HexletCode
  module Tags
    class Text
      def initialize(attr_name, value_attr, type, attributes = {})
        @name = attr_name
        @value = value_attr
        @type = type
        @cols = attributes[:cols] || 20
        @rows = attributes[:rows] || 40
        @attributes = attributes
      end

      def to_html_string
        Tag.build("textarea", cols: @cols, rows: @rows, name: @name, **@attributes) { @value }
      end
    end
  end
end
