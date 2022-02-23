# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(entity, attributes)
      @entity = entity
      @attributes = attributes
      @tags = []
    end

    def input(attr_name, attributes = {})
      attr_value = @entity.public_send(attr_name)
      type = attributes[:as] || :input
      attrib_tag = attributes.except(:as)
      input = { attributes: { name: attr_name, type: 'text', value: attr_value, **attrib_tag },
                label: true, input_type: type, children: nil }
      @tags << input
    end

    def submit(attr_value = 'Save', attributes = {})
      submit_input = { attributes: { name: 'commit', type: 'submit', value: attr_value, **attributes },
                       label: false, input_type: :input, children: nil }
      @tags << submit_input
    end

    def create_form
      { attributes: { action: @attributes[:url], method: 'post', **@attributes.except(:url) }, children: @tags }
    end
  end
end
