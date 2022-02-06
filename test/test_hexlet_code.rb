# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  include FixtureHelper

  User = Struct.new(:name, :job, keyword_init: true)

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_generate_form_inputs
    user = User.new job: 'hexlet'
    expected = File.new('./test/fixtures/form-submit.html').read.chomp
    actual = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert { expected == actual }
  end
end
