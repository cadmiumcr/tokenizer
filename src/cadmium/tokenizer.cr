require "./tokenizer/*"

module Cadmium
  module StringExtension
    def tokenize(tokenizer = Cadmium::WordPunctuationTokenizer, *args, **kwargs)
      tokenizer = tokenizer.new(*args, **kwargs)
      tokenizer.tokenize(self)
    end
  end
end

# :nodoc:
class String
  include Cadmium::StringExtension
end

# :nodoc:
class Array(T)
  def delete_if(&block)
    items_to_delete = [] of T
    each do |i|
      items_to_delete << i if yield(i)
    end
    items_to_delete.each do |i|
      delete(i)
    end
    self
  end

  def keep_if(&block)
    items_to_keep = [] of T
    each do |i|
      items_to_keep << i if yield(i)
    end
    clear
    concat(items_to_keep)
    self
  end
end
