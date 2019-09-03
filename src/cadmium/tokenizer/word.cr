require "./regex"

module Cadmium
  module Tokenizer
    class Word < Regex
      REGEX_PATTERN = /[^A-Za-zА-Яа-я0-9_]+/

      def initialize
        super(REGEX_PATTERN)
      end
    end
  end
end
