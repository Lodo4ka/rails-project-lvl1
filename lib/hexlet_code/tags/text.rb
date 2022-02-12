# frozen_string_literal: true

module HexletCode
  module Tags
    class Text
      attr_reader :tag_name, :attributes, :children

      def initialize(attributes = {})
        @tag_name = 'textarea'
        required_attr = {}
        required_attr[:cols] = attributes[:cols] || 20
        required_attr[:rows] = attributes[:rows] || 40
        @attributes = required_attr.merge(attributes.except(:type, :value))
        @children = attributes[:value]
      end
    end
  end
end
