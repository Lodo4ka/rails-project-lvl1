# frozen_string_literal: true

module HexletCode
  module Tags
    class Input < Tag
      def initialize(attributes = {})
        super('input', nil, attributes)
      end
    end
  end
end
