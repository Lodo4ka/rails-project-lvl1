# frozen_string_literal: true

require_relative "./tag"

module HexletCode
  module Tags
    class Form
      def initialize(url, children)
        @url = url
        @children = children
      end

      def to_html_string
        Tag.build("form", action: @url, method: "post") { @children.join("\n    ") }
      end
    end
  end
end
