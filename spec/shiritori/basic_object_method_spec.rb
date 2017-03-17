describe "Shiritori test" do
  let(:main){ Shiritori::Main.new }

  describe "BasicObject instance methods" do
    let(:__instance__){ BasicObject.new }

    it { instance_check(:!) }
    it { instance_check(:!=, %Q(Object.new)) }
    it { instance_check(:==, %Q(Object.new)) }
    it { instance_check(:__id__) }
    it { instance_check(:__send__, %Q(:__id__)) }
    it { instance_check(:instance_eval, %Q('BasicObject')) }
    it { instance_check(:instance_exec, %Q(&->{ Fixnum })) }
  end
end
