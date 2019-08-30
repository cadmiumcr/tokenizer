module Cadmium
  abstract class Tokenizer
    abstract def tokenize(string : String) : Array(String)

    def trim(arr)
      return arr if arr.size == 1
      if arr[0] == ""
        arr.shift
      end

      if arr[-1] == ""
        arr.pop
      end

      arr
    end
  end
end
