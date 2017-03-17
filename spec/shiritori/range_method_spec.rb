describe "Shiritori test" do
  let(:main){ Shiritori::Main.new }
  let(:__class__){ Range }
  let(:__instance__){ 1..10 }

  describe "Range singleton methods" do
    it { instance_check(:new, %q(1, 10), obj: __class__) }
  end

  describe "Range instance methods" do
    it { instance_check(:==, %q(1..11)) }
    it { instance_check(:===, %q(5)) }
    it { instance_check(:include?, %q(11)) }
    it { instance_check(:member?, %q(-1)) }
    it { instance_check(:begin) }
    it { instance_check(:first) }
    it { instance_check(:bsearch) }
    it { instance_check(:cover?, %q(11)) }
    it { instance_check(:each) }
    it { instance_check(:end) }
    it { instance_check(:last) }
    it { instance_check(:eql?, %q(1..10)) }
    it { instance_check(:exclude_end?) }
    it { instance_check(:hash) }
    it { instance_check(:inspect) }
    it { instance_check(:max) }
    it { instance_check(:min) }
    it { instance_check(:size) }
    it { instance_check(:step) }
    it { instance_check(:to_s) }    
  end
end
