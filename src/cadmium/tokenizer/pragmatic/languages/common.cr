module Cadmium
  module Tokenizer
    class Pragmatic < Base
      module Languages
        class Common
          # Single quotes handling
          ALNUM_QUOTE     = /(\w|\D)'(?!')(?=\W|$)/
          QUOTE_WORD      = /(\W|^)'(?=\w)/
          QUOTE_NOT_TWAS1 = /(\W|^)'(?!twas)/i
          QUOTE_NOT_TWAS2 = /(\W|^)‘(?!twas)/i
          PUNCTUATION_MAP = {"。" => "♳", "．" => "♴", "." => "♵", "！" => "♶", "!" => "♷", "?" => "♸", "？" => "♹", "、" => "♺", "¡" => "⚀", "¿" => "⚁", "„" => "⚂", "“" => "⚃", "[" => "⚄", "]" => "⚅", "\"" => "☇", "#" => "☈", "$" => "☉", "%" => "☊", "&" => "☋", "(" => "☌", ")" => "☍", "*" => "☠", "+" => "☢", "," => "☣", ":" => "☤", ";" => "☥", "<" => "☦", "=" => "☧", ">" => "☀", "@" => "☁", "^" => "☂", "_" => "☃", "`" => "☄", "'" => "☮", "{" => "♔", "|" => "♕", "}" => "♖", "~" => "♗", "-" => "♘", "«" => "♙", "»" => "♚", "”" => "⚘", "‘" => "⚭"}
          ABBREVIATIONS   = Set(String).new
          CONTRACTIONS    = {} of String => String

          def initialize
            @@stop_words.add_list
          end

          def self.punctuation_map
            PUNCTUATION_MAP
          end

          def self.contractions
            CONTRACTIONS
          end

          def self.abbreviations
            ABBREVIATIONS
          end

          # This 'special treatment' is actually relevant for many other tests. Alter core regular expressions!
          def self.handle_single_quotes(text)
            # special treatment for "'twas"
            text = text.gsub(QUOTE_NOT_TWAS1, "\\1 " + PUNCTUATION_MAP["'"] + " ")
            text = text.gsub(QUOTE_NOT_TWAS2, "\\1 " + PUNCTUATION_MAP["‘"] + " ")

            text = text.gsub(QUOTE_WORD, " " + PUNCTUATION_MAP["'"])
            text = text.gsub(ALNUM_QUOTE, "\\1 " + PUNCTUATION_MAP["'"] + " ")
            text
          end
        end
      end
    end
  end
end
