# frozen_string_literal: true

module HexletCode
  module Tags
    class Text < Tag
      attr_reader :tag_name, :attributes, :children

      def initialize(attributes = {})
        required_attr = {}
        required_attr[:cols] = attributes[:cols] || 20
        required_attr[:rows] = attributes[:rows] || 40
        text_attributes = required_attr.merge(attributes.except(:type, :value))
        super('textarea', attributes[:value], text_attributes)
      end
    end
  end
end
