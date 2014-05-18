require 'spec_helper'

describe "Shiritori test" do
  let(:main){ Shiritori::Main.new }

  describe "TrueClass instance methods" do
    let(:object){ true }

    it { instance_check(:&, %Q(false)) }
    it { instance_check(:^, %Q(false)) }
    it { instance_check(:to_s) }
    it { instance_check(:inspect) }
    it { instance_check(:|, %Q(false)) }
  end
end
