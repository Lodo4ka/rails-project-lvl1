# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :form

    def initialize(entity, attributes)
      @entity = entity
      @form = { attributes: { action: attributes[:url], method: 'post', **attributes.except(:url) }, children: [] }
    end

    def input(attr_name, attributes = {})
      attr_value = @entity.public_send(attr_name)
      type = attributes[:as] || :input
      attrib_tag = attributes.except(:as)
      input = { attributes: { name: attr_name, type: 'text', value: attr_value, **attrib_tag },
                label: true, input_type: type, children: nil }
      @form[:children] << input
    end

    def submit(attr_value = 'Save', attributes = {})
      submit_input = { attributes: { name: 'commit', type: 'submit', value: attr_value, **attributes },
                       label: false, input_type: :input, children: nil }
      @form[:children] << submit_input
    end
  end
end
