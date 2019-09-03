require "./tokenizer"

module Cadmium
  module Tokenizer
    class Sentence < Base
      REGEX_PATTERN = /([\"\'\‘\“\'\"\[\(\{\⟨][^\.\?\!]+[\.\?\!][\"\'\’\”\'\"\]\)\}\⟩]|[^\.\?\!]+[\.\?\!])\s?/

      def tokenize(string : String) : Array(String)
        tokens = string.split(REGEX_PATTERN).reject(&.empty?).map(&.strip)
        trim(tokens)
      end
    end
  end
end
