# frozen_string_literal: true

module HexletCode
  module Tags
    class Input

      attr_reader :tag_name, :attributes, :children

      def initialize(attributes = {})
        @tag_name = 'input'
        @attributes = attributes
        @children = nil
      end
    end
  end
end
