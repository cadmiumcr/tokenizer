# CADMIUM TOKENIZER

**Largest shard** - multilingual string tokenization with pragmatic tokenizer.

## OVERVIEW

Multiple tokenizer implementations: simple (word, whitespace, regex-based) and complex (Pragmatic - multi-language, highly configurable).

## STRUCTURE

```
src/cadmium/tokenizer/
├── tokenizer.cr          # Base class
├── pragmatic.cr          # Main class (370 lines, most complex)
├── pragmatic/
│   ├── languages/        # Language-specific rules (en, de, es, pt, cz, bg)
│   ├── regex.cr          # 100+ regex patterns
│   ├── pre_processor.cr  # Input normalization
│   └── post_processor.cr # Token cleanup
├── aggressive.cr         # Simple locale-aware tokenizer
├── sentence.cr           # Sentence boundary detection
├── treebank_word.cr      # Penn Treebank style
├── diacritics.cr         # Unicode normalization (large mapping table)
└── data/stopwords/       # 57 stopword lists by language
```

## WHERE TO LOOK

| Task | File | Notes |
|------|------|-------|
| Add language support | `pragmatic/languages/` | Copy `english.cr`, adjust rules |
| Fix tokenization bug | `pragmatic.cr` | Check `post_process_tokens` method |
| Add stopwords | `data/stopwords/<lang>.txt` | One word per line |
| Regex patterns | `pragmatic/regex.cr` | Named constants for all patterns |

## KEY CLASSES

| Class | Purpose |
|-------|---------|
| `Pragmatic` | Feature-rich, configurable (punctuation, numbers, contractions, etc) |
| `Aggressive` | Simple, fast, locale-aware word splitting |
| `Sentence` | Sentence boundary detection |
| `TreebankWord` | Penn Treebank tokenization |
| `Word`, `Whitespace` | Basic regex-based |

## CONVENTIONS

- All tokenizers inherit from `Cadmium::Tokenizer::Base`
- Entry: `src/cadmium_tokenizer.cr` → requires `./cadmium/tokenizer`
- String extension: `"text".tokenize(Cadmium::Tokenizer::Pragmatic)`
- Stopwords loaded lazily via `@@loaded_stop_words` class var

## ANTI-PATTERNS

| Pattern | Why Forbidden |
|---------|---------------|
| Hardcoding language rules in `pragmatic.cr` | Put in `pragmatic/languages/<lang>.cr` |
| Adding regex inline | Add to `pragmatic/regex.cr` with descriptive name |
| Modifying `diacritics.cr` mapping table manually | Auto-generated from Unicode data |

## PRAGMATIC OPTIONS

```crystal
Pragmatic.new(
  language: :en,              # 6 languages supported
  punctuation: :none,         # :all, :semi, :none, :only
  numbers: :none,             # :all, :semi, :none, :only
  expand_contractions: true,  # "isn't" → ["is", "not"]
  remove_stop_words: true,
  remove_emoji: true,
  downcase: true,
  minimum_length: 3,
  long_word_split: 10         # Split at hyphen/underscore
)
```
