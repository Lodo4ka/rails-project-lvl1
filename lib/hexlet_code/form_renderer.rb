# frozen_string_literal: true

module HexletCode
  class FormRenderer

    class << self

      def build_form(form)
        build(form.tag_name, **form.attributes) do
          form.children.map do |child_tag|
            build(child_tag.tag_name, **child_tag.attributes) { child_tag.children }
          end.join
        end
      end

      private

      def build(tag_name, **attributes)
        single_tags = %w[br img input]
        strings_attributes = stringify_attributes(attributes)
        return "<#{tag_name} #{strings_attributes}>" if single_tags.include? tag_name

        "<#{tag_name} #{strings_attributes}>#{yield}</#{tag_name}>"
      end

      def stringify_attributes(attributes)
        attributes.map do |key, value|
          "#{key}=\"#{value}\"" unless value.nil?
        end.compact.join(' ')
      end
    end
  end
end
