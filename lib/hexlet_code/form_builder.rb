# frozen_string_literal: true

module HexletCode
  class FormBuilder
    autoload :Tags, "hexlet_code/tags.rb"

    def initialize(entity, url)
      @entity = entity
      @url = url
      @children_tags = []
    end

    def input(attr_name, options = {})
      @entity.public_send(attr_name)
      attr_value = @entity[attr_name]
      type = options[:as]
      tag_instance = type.nil? ? Tags::Input : "HexletCode::Tags::#{type.to_s.capitalize}".constantize
      input = tag_instance.new(attr_name, attr_value).to_html_string
      label = Tags::Label.new(attr_name).to_html_string
      @children_tags << label
      @children_tags << input
    end

    def submit
      submit_input = Tags::Input.new("commit", "Save", "submit").to_html_string
      @children_tags << submit_input
    end

    def build
      Tags::Form.new(@url, @children_tags).to_html_string
    end
  end
end
