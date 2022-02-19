# frozen_string_literal: true

module HexletCode
  module Tags
    class Tag
      attr_reader :tag_name, :attributes, :children

      def initialize(label, children, attributes)
        @tag_name = label
        @children = children
        @attributes = attributes
      end

      def build
        single_tags = %w[br img input]
        strings_attributes = stringify_attributes(@attributes)
        return "<#{@tag_name} #{strings_attributes}>" if single_tags.include? @tag_name

        "<#{@tag_name} #{strings_attributes}>#{yield}</#{@tag_name}>"
      end

      private

      def stringify_attributes(attributes)
        attributes.map do |key, value|
          "#{key}=\"#{value}\"" unless value.nil?
        end.compact.join(' ')
      end
    end
  end
end
