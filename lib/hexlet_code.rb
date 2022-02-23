# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext'
require_relative 'hexlet_code/version'

module HexletCode
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')
  autoload(:FormRenderer, 'hexlet_code/form_renderer.rb')

  def self.form_for(entity, attributes = {})
    required_attr = {}
    required_attr[:url] = attributes[:url] || '#'
    form_attributes = required_attr.merge(attributes.except(:url))
    form_builder = FormBuilder.new(entity, form_attributes)
    yield form_builder if block_given?
    form = form_builder.create_form
    FormRenderer.build_form(form)
  end
end
