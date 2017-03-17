describe "Shiritori test" do
  let(:main){ Shiritori::Main.new }
  let(:__class__){ Random }
  let(:__instance__){ Random.new }

  describe "Random singleton methods" do
    it { instance_check(:new, %q(0), obj: __class__) }
  end
end
