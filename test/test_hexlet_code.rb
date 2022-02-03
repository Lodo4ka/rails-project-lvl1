# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def setup
    @user = User.new name: "rob"
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_generate_simple_form
    form_data_default = HexletCode.form_for @user do |data|
    end
    form_data_url = HexletCode.form_for @user, url: "/users" do |f|
    end
    assert { form_data_default == "<form action=\"#\" method=\"post\"></form>" }
    assert { form_data_url == "<form action=\"/users\" method=\"post\"></form>" }
  end
end
