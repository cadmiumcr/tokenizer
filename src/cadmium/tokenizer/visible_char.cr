module Cadmium
  class VisibleChar < Regex
    REGEX_PATTERN = /\s+|(?<=[\P{Cc}])(?=[\P{Cc}])/

    def initialize
      super(REGEX_PATTERN)
    end
  end
end
