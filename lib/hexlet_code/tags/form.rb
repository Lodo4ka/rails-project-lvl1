# frozen_string_literal: true

require_relative './tag'
module HexletCode
  module Tags
    class Form < Tag
      def initialize(attributes, children)
        super('form', children, attributes)
      end
    end
  end
end
