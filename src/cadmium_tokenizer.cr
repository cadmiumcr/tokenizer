require "cadmium_util"
require "./cadmium/tokenizer"

module Cadmium
  include Util
  method_generator({
    aggressive_tokenizer:       Cadmium::Agressive,
    case_tokenizer:             Cadmium::Case,
    pragmatic_tokenizer:        Cadmium::Pragmatic,
    regex_tokenizer:            Cadmium::Regex,
    sentence_tokenizer:         Cadmium::Sentence,
    treebank_word_tokenizer:    Cadmium::TreebankWord,
    whitespace_tokenizer:       Cadmium::Whitespace,
    word_punctuation_tokenizer: Cadmium::WordPunctuation,
    word_tokenizer:             Cadmium::Word,
  })
end
