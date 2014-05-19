require 'spec_helper'
require 'stringio'

describe "Shiritori test" do
  let(:shiritori){ Shiritori::Main.new }

  describe "Game Init" do
    it "Game start init" do
      shiritori = Shiritori::Main.new
      fake_stdin(%w("Ruby" chars)) do
        shiritori.start
      end
      expect(shiritori.current_object).to eq ["R", "u", "b", "y"]
    end

    it "Invalid object" do
      fake_stdin(%w(eixt "hello nil)) do
        shiritori.start
      end

      expect(shiritori.chain_count).to eq 0
    end
  end

  describe "Example" do
    it "test play 1" do
      fake_stdin(%w(3 next to_s *(5) chars first instance_eval{(1..10)} each{|n|n*100} map{|n|n+100} inject(:+) class)) do
        shiritori.start
      end
      expect(shiritori.current_object).to eq Fixnum
      expect(shiritori.chain_count).to eq 10
    end

    it "test play 2" do
      fake_stdin(%w(BasicObject new __id__ class)) do
        shiritori.start
      end
      expect(shiritori.current_object).to eq Fixnum
      expect(shiritori.chain_count).to eq 3
    end

    it "test play 3" do
      fake_stdin(%w(BasicObject new !=(Object.new) class)) do
        shiritori.start
      end
      expect(shiritori.current_object).to eq TrueClass
      expect(shiritori.chain_count).to eq 3
    end
  end
end