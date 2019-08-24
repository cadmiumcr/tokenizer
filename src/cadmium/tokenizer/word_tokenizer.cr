require "./regex_tokenizer"

module Cadmium
  class WordTokenizer < RegexTokenizer
    REGEX_PATTERN = /[^A-Za-zА-Яа-я0-9_]+/

    def initialize
      super(REGEX_PATTERN)
    end
  end
end
