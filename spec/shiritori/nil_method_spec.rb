describe "Shiritori test" do
  let(:main){ Shiritori::Main.new }

  describe "NilClass instance methods" do
    let(:__instance__){ nil }

    it { instance_check(:&, %Q(true)) }
    it { instance_check(:^, %Q(true)) }
    it { instance_check(:nil?) }
    it { instance_check(:rationalize) }
    it { instance_check(:to_a) }
    it { instance_check(:to_c) }
    it { instance_check(:to_f) }
    it { instance_check(:to_i) }
    it { instance_check(:to_r) }
    it { instance_check(:to_s) }
    it { instance_check(:|, %Q(true)) }
  end
end
