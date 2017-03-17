describe "Shiritori test" do
  let(:main){ Shiritori::Main.new }
  let(:__class__){ Symbol }
  let(:__instance__){ :ruby }

  describe "Symbol instance methods" do
    it { instance_check(:<=>, %q(:python)) }
    it { instance_check(:==, %q(:ruby)) }
    it { instance_check(:=~, %q(/.+/)) }
    it { instance_check(:match, %q(/.+/)) }
    it { instance_check(:[], %q(0)) }
    it { instance_check(:slice, %q(0)) }
    it { instance_check(:capitalize) }
    it { instance_check(:casecmp, %q(:python)) }
    it { instance_check(:downcase) }
    it { instance_check(:empty?) }
    it { instance_check(:encoding) }
    it { instance_check(:id2name) }
    it { instance_check(:to_s) }
    it { instance_check(:inspect) }
    it { instance_check(:intern) }
    it { instance_check(:to_sym) }
    it { instance_check(:length) }
    it { instance_check(:size) }
    it { instance_check(:succ) }
    it { instance_check(:next) }
    it { instance_check(:swapcase) }
    it { instance_check(:to_proc) }
    it { instance_check(:upcase) }
  end
end
