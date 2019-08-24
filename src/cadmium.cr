require "cadmium"
require "./cadmium/tokenizer"

module Cadmium
  method_generator({
    aggressive_tokenizer:       Cadmium::AggressiveTokenizer,
    case_tokenizer:             Cadmium::CaseTokenizer,
    pragmatic_tokenizer:        Cadmium::PragmaticTokenizer,
    regex_tokenizer:            Cadmium::RegexTokenizer,
    sentence_tokenizer:         Cadmium::SentenceTokenizer,
    treebank_word_tokenizer:    Cadmium::TreebankWordTokenizer,
    whitespace_tokenizer:       Cadmium::WhitespaceTokenizer,
    word_punctuation_tokenizer: Cadmium::WordPunctuationTokenizer,
    word_tokenizer:             Cadmium::WordTokenizer
  })
end
