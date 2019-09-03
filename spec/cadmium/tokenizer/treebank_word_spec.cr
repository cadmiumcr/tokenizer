require "../../spec_helper"

describe Cadmium::Tokenizer::TreebankWord do
  subject = Cadmium::Tokenizer::TreebankWord.new

  it "should tokenize" do
    tokens = subject.tokenize("If we 'all' can't go. I'll stay home.")
    tokens.should eq(["If", "we", "'all", "'", "ca", "n't", "go.", "I", "'ll", "stay", "home", "."])

    tokens = subject.tokenize("If we 'all' can't go. I'll stay home. If we 'all' can't go. I'll stay home.")
    tokens.should eq(["If", "we", "'all", "'", "ca", "n't", "go.", "I", "'ll", "stay", "home.", "If", "we", "'all", "'", "ca", "n't", "go.", "I", "'ll", "stay", "home", "."])
  end
end
