# Cadmium::Tokenizer (wip)

This module contains several string tokenizers. Each one has its use cases and some are faster (or way slower) than others.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     cadmium_tokenizer:
       github: cadmiumcr/cadmium_tokenizer
   ```

2. Run `shards install`

## Usage

```crystal
require "cadmium_tokenizer"
```

### Aggressive Tokenizer

The aggressive tokenizer currently has localization available for:

- English (**:en**)
- Spanish (**:es**)
- Persian (**:fa**)
- French (**:fr**)
- Indonesian (**:id**)
- Dutch (**:nl**)
- Norwegian (**:no**)
- Polish (**:pl**)
- Portuguese (**:pt**)
- Russian (**:ru**)
- Serbian (**:sb**)
- Ukranian (**:uk**)
- Bulgarian (**:bg**)
- Swedish (**:sv**)

If no language is included it will default to English.

Use it like so:

```crystal
tokenizer = Cadmium.aggressive_tokenizer.new(lang: :es)
tokenizer.tokenize("hola yo me llamo eduardo y esudié ingeniería")
# => ["hola", "yo", "me", "llamo", "eduardo", "y", "esudié", "ingeniería"]
``` 

### Case Tokenizer

The case tokenizer doesn't rely on Regex and as such should be pretty fast. It should also work on an international basis fairly easily.

```crystal
tokenizer = Cadmium.case_tokenizer.new
tokenizer.tokenize("these are strings")
# => ["these", "are", "strings"]

tokenizer = Cadmium.case_tokenizer.new(preserve_apostrophes: true)
tokenizer.tokenize("Affectueusement surnommé « Gabo » dans toute l'Amérique latine")
# => ["Affectueusement", "surnommé", "Gabo", "dans", "toute", "l", "Amérique", "latine"]
```

### Regex Tokenizer

The whitespace tokenizer, word punctuation tokenizer, and word tokenizer all extend the regex tokenizer. It uses Regex to match on the correct values.

```crystal
tokenizer = Cadmium.word_punctuation_tokenizer.new
tokenizer.tokenize("my dog hasn't any fleas.")
# => ["my", "dog", "hasn", "'", "t", "any", "fleas", "."]
```

### Treebank Word Tokenizer

The treebank tokenizer uses regular expressions to tokenize text as in Penn Treebank. This implementation is a port of the tokenizer sed script written by Robert McIntyre. To read about treebanks you can visit [wikipedia](https://en.wikipedia.org/wiki/Treebank).

```crystal
tokenizer = Cadmium.treebank_word_tokenizer.new
tokenizer.tokenize("If we 'all' can't go. I'll stay home.")
# => ["If", "we", "'all", "'", "ca", "n't", "go.", "I", "'ll", "stay", "home", "."]
```

### Pragmatic Tokenizer

The pragmatic tokenizer is based off of the ruby gem from diasks2 which you can find [here](https://github.com/diasks2/pragmatic_tokenizer). It is a multilengual tokenizer which provides a wide array of options for tokenizing strings. For complete documentation check [here](https://watzon.github.io/cadmium/Cadmium/Tokenizer/Pragmatic.html).

Example is taken directly from the diasks2/pragmatic_tokenizer documentation, with a few modifications. Currently supported languages are:
- English (**:en**)
- Deutsch (**:de**)
- Czech (**:cz**)
- Bulgarian (**:bg**)
- Spanish (**:sp**)
- Portuguese (**:pt**)

```crystal
text = "\"I said, 'what're you? Crazy?'\" said Sandowsky. \"I can't afford to do that.\""

Cadmium.pragmatic_tokenizer.new.tokenize(text)
# => ["\"", "i", "said", ",", "'", "what're", "you", "?", "crazy", "?", "'", "\"", "said", "sandowsky", ".", "\"", "i", "can't", "afford", "to", "do", "that", ".", "\""]
```

The initializer accepts the following options:

```crystal
language:            :en, # the language of the string you are tokenizing
abbreviations:       Set{"a.b", "a"}, # a user-supplied array of abbreviations (downcased with ending period removed)
stop_words:          Set{"is", "the"}, # a user-supplied array of stop words (downcased)
remove_stop_words:   true, # remove stop words
contractions:        { "i'm" => "i am" }, # a user-supplied hash of contractions (key is the contracted form; value is the expanded                                             form - both the key and value should be downcased)
expand_contractions: true, # (i.e. ["isn't"] will change to two tokens ["is", "not"])
filter_languages:    [:en, :de], # process abbreviations, contractions and stop words for this array of languages
punctuation:         :none, # see below for more details
numbers:             :none, # see below for more details
remove_emoji:        true, # remove any emoji tokens
remove_urls:         true, # remove any urls
remove_emails:       true, # remove any emails
remove_domains:      true, # remove any domains
hashtags:            :keep_and_clean, # remove the hastag prefix
mentions:            :keep_and_clean, # remove the @ prefix
clean:               true, # remove some special characters
classic_filter:      true, # removes dots from acronyms and 's from the end of tokens
downcase:            false, # do not downcase tokens
minimum_length:      3, # remove any tokens less than 3 characters
long_word_split:     10 # split tokens longer than 10 characters at hypens or underscores
```

## Contributing

1. Fork it (<https://github.com/cadmiumcr/cadmium_tokenizer/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Chris Watson](https://github.com/cadmiumcr) - creator and maintainer
