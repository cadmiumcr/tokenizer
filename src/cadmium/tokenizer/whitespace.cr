require "./regex"

module Cadmium
  module Tokenizer
    class Whitespace < Regex
      REGEX_PATTERN = /\s+/

      def initialize
        super(REGEX_PATTERN)
      end
    end
  end
end
