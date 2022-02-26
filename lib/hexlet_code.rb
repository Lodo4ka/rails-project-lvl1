# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext'
require_relative 'hexlet_code/version'

module HexletCode
  autoload(:FormBuilder, 'hexlet_code/form_builder.rb')
  autoload(:FormRenderer, 'hexlet_code/form_renderer.rb')

  def self.form_for(entity, attributes = {})
    form_builder = FormBuilder.new(entity, attributes)
    yield form_builder if block_given?
    FormRenderer.build_form(form_builder.form)
  end
end
