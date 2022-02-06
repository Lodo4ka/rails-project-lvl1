# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'
require 'minitest-power_assert'

module FixtureHelper
  def read_fixture_file(file_name)
    File.read(File.expand_path("../test/fixtures/#{file_name}", __dir__))
  end
end
