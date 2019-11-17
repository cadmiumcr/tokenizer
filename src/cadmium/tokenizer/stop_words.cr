module Cadmium
  module Tokenizer
    module StopWords
      DATA_DIR = "#{__DIR__}/data/stopwords/"
      # a list of commonly used words that have little meaning and can be excluded
      # from analysis.
      @@loaded_stop_words = Hash(Symbol, Set(String)).new

      def add_stopwords_list(language : Symbol)
        @@loaded_stop_words[language] = File.read(DATA_DIR + language.to_s + ".txt").split("\n").to_set
      end
    end
  end
end
