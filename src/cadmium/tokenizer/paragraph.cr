module Cadmium
  module Tokenizer
    class Paragraph
      # Splits text into an array of paragraphs.
      def tokenize(string : String) : Array(String)
        string.strip.split(/(?:\n[\r\t ]*)+/).map { |p| p.strip }
      end
    end
  end
end
