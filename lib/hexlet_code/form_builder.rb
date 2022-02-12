# frozen_string_literal: true

require 'hexlet_code/tags'

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
      type = options[:as] || :input
      attrib_tag = options.except(:as)
      tag_instance = "HexletCode::Tags::#{type.to_s.capitalize}".constantize
      input = tag_instance.new({ name: attr_name, type: 'text', value: attr_value, **attrib_tag })
      label = Tags::Label.new({ for: attr_name })
      @children_tags << label
      @children_tags << input
    end

    def submit(attr_value = 'Save')
      submit_input = Tags::Input.new({ name: 'commit', type: 'submit', value: attr_value })
      @children_tags << submit_input
    end

    def create_form
      Tags::Form.new(@url, @children_tags)
    end
  end
end
