describe "Shiritori test" do
  let(:main){ Shiritori::Main.new }

  describe "Fixnum instance methods" do
    let(:__instance__){ 16 }
    let(:same_object){ 16 }

    it { instance_check(:to_s) }
    it { instance_check(:to_s, %q(2)) }
    it { instance_check(:inspect) }
    it { instance_check(:-@) }
    it { instance_check(:-, %Q(3)) }
    it { instance_check(:*, %Q(3)) }
    it { instance_check(:/, %q(3)) }
    it { instance_check(:div, %q(3)) }
    it { instance_check(:%, %q(3)) }
    it { instance_check(:modulo, %q(3)) }
    it { instance_check(:divmod, %q(3)) }
    it { instance_check(:fdiv, %q(3)) }
    it { instance_check(:**, %q(7)) }
    it { instance_check(:abs) }
    it { instance_check(:magnitude) }
    it { instance_check(:==, %Q(#{__instance__})) }
    it { instance_check(:===, %Q(#{__instance__})) }
    it { instance_check(:<=>, %Q(#{__instance__})) }
    it { instance_check(:>, %Q(#{__instance__})) }
    it { instance_check(:>=, %Q(#{__instance__})) }
    it { instance_check(:<, %Q(#{__instance__})) }
    it { instance_check(:<=, %Q(#{__instance__})) }
    it { instance_check(:~) }
    it { instance_check(:&, %q(-1)) }
    it { instance_check(:|, %q(1)) }
    it { instance_check(:^, %q(-1)) }
    it { instance_check(:[], %q(0)) }
    it { instance_check(:<<, %q(3)) }
    it { instance_check(:>>, %q(3)) }
    it { instance_check(:to_f) }
    it { instance_check(:size) }
    it { instance_check(:zero?) }
    it { instance_check(:odd?) }
    it { instance_check(:even?) }
    it { instance_check(:succ) }
    if RUBY_VERSION >= "2.1.0"
      it { instance_check(:bit_length) }
    end
  end
end
