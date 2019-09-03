require "./regex"

module Cadmium
  module Tokenizer
    class WordPunctuation < Regex
      REGEX_PATTERN = /(\w+|[а-я0-9_]+|\.|\!|\'|\"")/i

      def initialize
        super(REGEX_PATTERN)
      end
    end
  end
end
