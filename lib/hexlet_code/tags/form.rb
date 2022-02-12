# frozen_string_literal: true

module HexletCode
  module Tags
    class Form
      attr_reader :tag_name, :attributes, :children

      def initialize(url, children)
        @tag_name = 'form'
        @attributes = { action: url, method: 'post' }
        @children = children
      end
    end
  end
end
