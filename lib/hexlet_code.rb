# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Tag
    class << self
      def build(tag_name, attributes = {})
        return "<#{tag_name}/>" if attributes.empty?

        single_tags = %w[br img input]
        strings_attributes = stringify_attributes(attributes)
        return "<#{tag_name} #{strings_attributes}/>" if single_tags.include? tag_name

        "<#{tag_name} #{strings_attributes}>#{yield}</#{tag_name}>"
      end

      def stringify_attributes(attributes)
        attributes.map do |key, value|
          "#{key}=\"#{value}\""
        end.join(" ")
      end
    end
  end

  def self.form_for(user, **attrib)
    url = attrib[:url] || "#"
    "<form action=\"#{url}\" method=\"post\"></form>"
  end
end
