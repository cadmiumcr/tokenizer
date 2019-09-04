require "../../spec_helper"

describe Cadmium::Tokenizer::Aggressive do
  describe "default language" do
    subject = Cadmium::Tokenizer::Aggressive.new(lang: :en)

    it "should tokenize strings" do
      subject.tokenize("these are strings").should eq(["these", "are", "strings"])
    end

    it "should tokenize strings via String#tokenize" do
      "these are strings".tokenize(Cadmium::Tokenizer::Aggressive, lang: :en).should eq(["these", "are", "strings"])
    end

    it "should allow punctuation" do
      subject.tokenize("these are things, no").should eq(["these", "are", "things", "no"])
    end

    it "should swollow final punctuation" do
      subject.tokenize("these are things, no?").should eq(["these", "are", "things", "no"])
    end

    it "should swollow initial punctuation" do
      subject.tokenize(".these are things, no").should eq(["these", "are", "things", "no"])
    end

    it "should swollow duplicate punctuation" do
      subject.tokenize("i shal... pause").should eq(["i", "shal", "pause"])
    end

    it "should return an empty Array(String) when fed with empty string" do
      subject.tokenize("").should eq([] of String)
    end
  end

  describe ":es" do
    subject = Cadmium::Tokenizer::Aggressive.new(lang: :es)

    it "should tokenize strings" do
      subject.tokenize("hola yo me llamo eduardo y esudié ingeniería").should eq(["hola", "yo", "me", "llamo", "eduardo", "y", "esudié", "ingeniería"])
    end

    it "should tokenize strings via String#tokenize" do
      "hola yo me llamo eduardo y esudié ingeniería".tokenize(Cadmium::Tokenizer::Aggressive, lang: :es).should eq(["hola", "yo", "me", "llamo", "eduardo", "y", "esudié", "ingeniería"])
    end
  end

  describe ":fr" do
    subject = Cadmium::Tokenizer::Aggressive.new(lang: :fr)
    text = "Affectueusement surnommé « Gabo » dans toute l'Amérique latine, le Colombien Gabriel Garcia Marquez, prix Nobel de littérature 1982, l'un des plus grands écrivains du XXe siècle, est mort À son domicile de Mexico jeudi 17 avril. Il était âgé de 87 ans. Son Œuvre a été traduite dans toutes les langues ou presque, et vendue à quelque 50 millions d'exemplaires."
    tokenized = ["Affectueusement", "surnommé", "Gabo", "dans", "toute", "l", "Amérique", "latine", "le", "Colombien", "Gabriel", "Garcia", "Marquez", "prix", "Nobel", "de", "littérature", "1982", "l", "un", "des", "plus", "grands", "écrivains", "du", "XXe", "siècle", "est", "mort", "À", "son", "domicile", "de", "Mexico", "jeudi", "17", "avril", "Il", "était", "âgé", "de", "87", "ans", "Son", "Œuvre", "a", "été", "traduite", "dans", "toutes", "les", "langues", "ou", "presque", "et", "vendue", "à", "quelque", "50", "millions", "d", "exemplaires"]

    it "should tokenize strings" do
      subject.tokenize(text).should eq(tokenized)
    end

    it "should tokenize strings via String#tokenize" do
      text.tokenize(Cadmium::Tokenizer::Aggressive, lang: :fr).should eq(tokenized)
    end
  end

  describe ":nl" do
    subject = Cadmium::Tokenizer::Aggressive.new(lang: :nl)

    it "should tokenize strings" do
      subject.tokenize("'s Morgens is het nog erg koud, vertelde de weerman over een van de radio's").should eq(["'s", "Morgens", "is", "het", "nog", "erg", "koud", "vertelde", "de", "weerman", "over", "een", "van", "de", "radio's"])
    end

    it "should tokenize strings via String#tokenize" do
      "'s Morgens is het nog erg koud, vertelde de weerman over een van de radio's".tokenize(Cadmium::Tokenizer::Aggressive, lang: :nl).should eq(["'s", "Morgens", "is", "het", "nog", "erg", "koud", "vertelde", "de", "weerman", "over", "een", "van", "de", "radio's"])
    end
  end

  describe ":pt" do
    subject = Cadmium::Tokenizer::Aggressive.new(lang: :pt)

    it "should tokenize strings" do
      subject.tokenize("isso é coração").should eq(["isso", "é", "coração"])
    end

    it "should tokenize strings via String#tokenize" do
      "isso é coração".tokenize(Cadmium::Tokenizer::Aggressive, lang: :pt).should eq(["isso", "é", "coração"])
    end

    it "should swollow punctuation" do
      subject.tokenize("isso é coração, não").should eq(["isso", "é", "coração", "não"])
    end

    it "should swollow final punctuation" do
      subject.tokenize("isso é coração, não?").should eq(["isso", "é", "coração", "não"])
    end

    it "should swollow initial punctuation" do
      subject.tokenize(".isso é coração, não").should eq(["isso", "é", "coração", "não"])
    end

    it "should swollow duplicate punctuation" do
      subject.tokenize("eu vou... pause").should eq(["eu", "vou", "pause"])
    end
  end
end
