require 'spec_helper'

describe "Shiritori test" do
  let(:main){ Shiritori::Main.new }

  describe "String instance methods" do
    let(:object){ "Ruby" }
    let(:object_int){ "100" }
    let(:word){ "Hello" }
    let(:num){ 100 }

    def check( method, obj = object )
      main.exec_method_chain( method, obj )
    end

    it '#to_s method' do
      expect(check("to_s")).to eq [:to_s, object.to_s]
    end

    it '#inspect method' do
      expect(check("inspect")).to eq [:inspect, object.inspect]
    end

    it '#<=> method' do
      expect(check("<=>('#{object}')")).to eq [:<=>, object.<=>(object)]
    end

    it '#== method' do
      expect(check("==('#{object}')")).to eq [:==, object.==(object)]
    end

    it '#=== method' do
      expect(check("===('#{object}')")).to eq [:===, object.===(object)]
    end

    it '#eql? method' do
      expect(check("eql?('#{object}')")).to eq [:eql?, object.eql?(object)]
    end

    it '#hash method' do
      expect(check("hash")).to eq [:hash, object.hash]
    end

    it '#casecmp method' do
      expect(check("casecmp('#{object}')")).to eq [:casecmp, object.casecmp(object)]
    end

    it "#+ method" do
      expect(check("+('#{word}')")).to eq [:+, object.+(word)]
    end

    it '#* method' do
      expect(check("*(3)")).to eq [:*, object.*(3)]
    end

    it '#% method' do
      expect(check("%(3)")).to eq [:%, object.%(3)]
    end

    it '#[] method' do
      expect(check("[](0)")).to eq [:[], object.[](0)]
    end

    it '#[]= method' do
      expect(check("[]=(0, 'P')")).to eq [:[]=, object.[]=(0, 'P')]
    end

    it '#insert method' do
      expect(check("insert(0, 'Perl')")).to eq [:insert, object.insert(0, 'Perl')]
    end

    it '#length method' do
      expect(check("length")).to eq [:length, object.length]
    end

    it '#size method' do
      expect(check("size")).to eq [:size, object.size]
    end

    it '#bytesize method' do
      expect(check("bytesize")).to eq [:bytesize, object.bytesize]
    end

    it '#empty? method' do
      expect(check("empty?")).to eq [:empty?, object.empty?]
    end

    it '#=~ method' do
      expect(check("=~(/R/)")).to eq [:=~, object.=~(/R/)]
    end

    it '#match method' do
      expect(check("match(/R/)")).to eq [:match, object.match(/R/)]
    end

    it '#succ method' do
      expect(check("succ")).to eq [:succ, object.succ]
    end

    it '#succ! method' do
      expect(check("succ!")).to eq [:succ!, object.succ!]
    end

    it '#next method' do
      expect(check("next")).to eq [:next, object.next]
    end

    it '#next! method' do
      expect(check("next!")).to eq [:next!, object.next!]
    end

    it '#upto method' do
      result = check("upto('Z')","A")
      expect(result.first).to eq :upto
      expect(result.last.to_a).to eq 'A'.upto('Z').to_a
    end
  end
end
