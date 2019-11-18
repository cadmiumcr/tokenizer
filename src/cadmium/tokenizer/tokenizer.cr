require "./stop_words"
require "./diacritics"

module Cadmium
  module Tokenizer
    abstract class Base
      include StopWords
      include Diacritics

      abstract def tokenize(string : String) : Array(String)

      def trim(arr)
        return arr unless arr[0]?
        if arr[0] == ""
          arr.shift
        end
        return arr unless arr[-1]?
        if arr[-1] == ""
          arr.pop
        end

        arr
      end
    end
  end
end
