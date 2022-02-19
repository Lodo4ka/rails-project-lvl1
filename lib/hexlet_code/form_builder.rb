# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(entity, url)
      @entity = entity
      @url = url
      @tags = []
    end

    def input(attr_name, options = {})
      attr_value = @entity.public_send(attr_name)
      type = options[:as] || :input
      attrib_tag = options.except(:as)
      input = { attributes: { name: attr_name, type: 'text', value: attr_value, **attrib_tag },
                label: true, input_type: type, children: nil }
      @tags << input
    end

    def submit(attr_value = 'Save')
      submit_input = { attributes: { name: 'commit', type: 'submit', value: attr_value },
                       label: false, input_type: :input, children: nil }
      @tags << submit_input
    end

    def create_form
      { attributes: { action: @url }, children: @tags }
    end
  end
end
