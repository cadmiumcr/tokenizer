require "./common"

module Cadmium
  module Tokenizer
    class Pragmatic < Base
      module Languages
        class Czech < Languages::Common
          ABBREVIATIONS = Set(String).new
          CONTRACTIONS  = {} of String => String
        end
      end
    end
  end
end
