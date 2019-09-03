require "./tokenizer"

module Cadmium
  class Sentence < Tokenizer
    REGEX_PATTERN = /([\"\'\‘\“\'\"\[\(\{\⟨][^\.\?\!]+[\.\?\!][\"\'\’\”\'\"\]\)\}\⟩]|[^\.\?\!]+[\.\?\!])\s?/

    def tokenize(string : String) : Array(String)
      tokens = string.split(REGEX_PATTERN).reject(&.empty?).map(&.strip)
      trim(tokens)
    end
  end
end
