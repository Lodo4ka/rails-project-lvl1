# frozen_string_literal: true

module HexletCode
  module Tags
    class Label < Tag
      def initialize(attributes)
        super('label', attributes[:for].capitalize, attributes)
      end
    end
  end
end
