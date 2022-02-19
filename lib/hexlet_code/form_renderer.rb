# frozen_string_literal: true

require 'hexlet_code/tags'
module HexletCode
  class FormRenderer
    class << self
      def create_tags(tag_meta)
        tag_instance = "HexletCode::Tags::#{tag_meta[:input_type].to_s.capitalize}".constantize
        input = tag_instance.new(tag_meta[:attributes])
        label = Tags::Label.new({ for: tag_meta[:attributes][:name] }) if tag_meta[:label]
        [label, input].compact
      end

      def build_form(src_form)
        form = Tags::Form.new(src_form[:attributes], src_form[:children])
        form.build do
          form.children.map do |child|
            tags = create_tags(child)
            tags.map { |tag| tag.build { tag.children } }.join
          end.join
        end
      end
    end
  end
end
