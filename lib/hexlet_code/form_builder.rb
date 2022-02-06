# frozen_string_literal: true

require "hexlet_code/tags.rb"

module HexletCode
  class FormBuilder

    def initialize(entity, url)
      @entity = entity
      @url = url
      @children_tags = []
    end

    def input(attr_name, options = {})
      @entity.public_send(attr_name)
      attr_value = @entity[attr_name]
      type = options[:as]
      tag_instance = (type.nil? ? "HexletCode::Tags::Input" : "HexletCode::Tags::#{type.to_s.capitalize}").constantize
      input = tag_instance.new(attr_name, attr_value).to_html_string
      label = Tags::Label.new(attr_name).to_html_string
      @children_tags << label
      @children_tags << input
    end

    def submit(attr_value = "Save")
      submit_input = Tags::Input.new("commit", attr_value, "submit").to_html_string
      @children_tags << submit_input
    end

    def build
      result_form = Tags::Form.new(@url, @children_tags).to_html_string
      pp "result_form", result_form
      result_form
    end
  end
end
