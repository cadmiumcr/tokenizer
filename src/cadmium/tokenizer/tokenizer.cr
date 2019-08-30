module Cadmium
  abstract class Tokenizer
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
