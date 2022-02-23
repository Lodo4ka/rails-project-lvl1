# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  include FixtureHelper

  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_generate_form_inputs
    user = User.new job: 'hexlet'
    expected = read_fixture_file('form-submit.html')
    actual = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert { expected == actual }
  end

  def test_generate_form_inputs_with_textarea
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    expected = read_fixture_file('form-submit-textarea.html')
    actual = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end
    assert { expected == actual }
  end

  def test_generate_form_inputs_with_input_class
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    expected = read_fixture_file('forms-submit-class.html')
    actual = HexletCode.form_for user do |f|
      f.input :name, class: 'user-input'
      f.input :job, as: :text, class: 'textarea'
      f.submit
    end
    assert { expected == actual }
  end
end
