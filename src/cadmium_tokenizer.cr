require "cadmium_util"
require "./cadmium/tokenizer"

module Cadmium
  include Util
  method_generator({
    aggressive_tokenizer:       Cadmium::Tokenizer::Aggressive,
    case_tokenizer:             Cadmium::Tokenizer::Case,
    pragmatic_tokenizer:        Cadmium::Tokenizer::Pragmatic,
    regex_tokenizer:            Cadmium::Tokenizer::Regex,
    sentence_tokenizer:         Cadmium::Tokenizer::Sentence,
    treebank_word_tokenizer:    Cadmium::Tokenizer::TreebankWord,
    whitespace_tokenizer:       Cadmium::Tokenizer::Whitespace,
    word_punctuation_tokenizer: Cadmium::Tokenizer::WordPunctuation,
    word_tokenizer:             Cadmium::Tokenizer::Word,
  })
end
