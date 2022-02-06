# frozen_string_literal: true

require_relative "./tag"

module HexletCode
  module Tags
    class Text
      def initialize(attr_name, value_attr = nil, cols = 20, rows = 40)
        @name = attr_name
        @value = value_attr
        @cols = cols
        @rows = rows
      end

      def to_html_string
        Tag.build("textarea", cols: @cols, rows: @rows, name: @name) { @value }
      end
    end
  end
end
