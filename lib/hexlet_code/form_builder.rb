# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :form

    FORM_METHOD = 'post'
    FORM_DEFAULT_URL = '#'
    FORM_DEFAULT_NAME = 'commit'
    FORM_DEFAULT_TYPE = 'submit'
    INPUT_DEFAULT_TYPE = 'text'

    def initialize(entity, attributes)
      @entity = entity
      default_attrs = {}
      default_attrs[:action] = attributes[:url] || FORM_DEFAULT_URL
      default_attrs[:method] = FORM_METHOD
      @form = { attributes: { **default_attrs, **attributes.except(:url) }, children: [] }
    end

    def input(attr_name, attributes = {})
      attr_value = @entity.public_send(attr_name)
      input_type = attributes[:as] || :input
      type = attributes[:type] || INPUT_DEFAULT_TYPE
      attrib_tag = attributes.except(:as, :type)
      input = { attributes: { name: attr_name, type: type, value: attr_value, **attrib_tag },
                label: true, input_type: input_type, children: nil }
      @form[:children] << input
    end

    def submit(attr_value = 'Save', attributes = {})
      submit_input = { attributes: { name: FORM_DEFAULT_NAME, type: FORM_DEFAULT_TYPE, value: attr_value, **attributes },
                       label: false, input_type: :input, children: nil }
      @form[:children] << submit_input
    end
  end
end
