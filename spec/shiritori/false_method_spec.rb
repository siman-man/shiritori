describe "Shiritori test" do
  let(:main){ Shiritori::Main.new }

  describe "FalseClass instance methods" do
    let(:__instance__){ false }

    it { instance_check(:&, %Q(true)) }
    it { instance_check(:^, %Q(true)) }
    it { instance_check(:to_s) }
    it { instance_check(:inspect) }
    it { instance_check(:|, %Q(true)) }
  end
end
