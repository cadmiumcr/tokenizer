require "./regex"

module Cadmium
  class Whitespace < Regex
    REGEX_PATTERN = /\s+/

    def initialize
      super(REGEX_PATTERN)
    end
  end
end
