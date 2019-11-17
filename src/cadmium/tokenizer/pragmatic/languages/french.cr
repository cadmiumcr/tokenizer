require "./common"

module Cadmium
  module Tokenizer
    class Pragmatic < Base
      module Languages
        class French < Common
          ABBREVIATIONS = Set.new(%w[a.c.n a.m al ann apr art auj av b.p boul c.-à-d c.n c.n.s c.p.i c.q.f.d c.s ca cf ch.-l chap co contr dir e.g e.v env etc ex fasc fig fr fém hab i.e ibid id inf l.d lib ll.aa ll.aa.ii ll.aa.rr ll.aa.ss ll.ee ll.mm ll.mm.ii.rr loc.cit ltd masc mm ms n.b n.d n.d.a n.d.l.r n.d.t n.p.a.i n.s n/réf nn.ss p.c.c p.ex p.j p.s pl pp r.-v r.a.s r.i.p r.p s.a s.a.i s.a.r s.a.s s.e s.m s.m.i.r s.s sec sect sing sq sqq ss suiv sup suppl t.s.v.p tél vb vol vs x.o z.i éd]).freeze
          CONTRACTIONS  = {} of String => String
          L_APOSTROPHE  = /l'/i

          def self.handle_single_quotes(text)
            text = text.gsub(L_APOSTROPHE, "\\1 l'" + Common::PUNCTUATION_MAP["'"] + " ")
            text = text.gsub(QUOTE_WORD, " " + Common::PUNCTUATION_MAP["'"])
            text = text.gsub(ALNUM_QUOTE, "\\1 " + Common::PUNCTUATION_MAP["'"] + " ")
            text
          end
        end
      end
    end
  end
end
