# frozen_string_literal: true

module HexletCode
  module Tags
    class Tag
      class << self
        def build(tag_name, **attributes)
          return "<#{tag_name}/>" if attributes.empty?

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
end
