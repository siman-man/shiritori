require 'spec_helper'
require 'stringio'

describe "Shiritori test" do
  describe "Game Init" do
    it "Game start init" do
      shiritori = Shiritori::Main.new
      fake_stdin(%w("Ruby" chars)) do
        shiritori.start
      end
      expect(shiritori.current_object).to eq ["R", "u", "b", "y"]
    end
  end

  describe "Example " do
    
    let(:shiritori){ Shiritori::Main.new }
    

    it "test play 1" do
      fake_stdin(%w(3 next to_s *(5) chars first instance_eval{(1..10)} each{|n|n*100} map{|n|n+100} inject(:+) class)) do
        shiritori.start
      end
      expect(shiritori.current_object).to eq Fixnum
    end

    it "test play 2" do
      fake_stdin(%w(BasicObject new __id__ class)) do
        shiritori.start
      end
      expect(shiritori.current_object).to eq Fixnum
    end
  end
end