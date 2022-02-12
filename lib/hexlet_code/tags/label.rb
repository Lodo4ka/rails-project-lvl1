# frozen_string_literal: true

module HexletCode
  module Tags
    class Label
      attr_reader :tag_name, :attributes, :children

      def initialize(attributes)
        @tag_name = 'label'
        @attributes = attributes
        @children = attributes[:for].capitalize
      end
    end
  end
end
