require 'spec_helper'

describe "Shiritori test" do
  let(:main){ Shiritori::Main.new }

  describe "String instance methods" do
    let(:object){ "Ruby" }
    let(:same_object){ "Ruby" }
    let(:object_int){ "100" }
    let(:word){ "Hello" }
    let(:num){ 100 }

    def check( method, obj = same_object )
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

    it '#index method' do
      expect(check("index('R')")).to eq [:index, object.index('R')]
    end

    it '#rindex method' do
      expect(check("index('R')")).to eq [:index, object.index('R')]
    end

    it '#replace method' do
      expect(check("replace('Python')")).to eq [:replace, object.replace('Python')]
    end

    it '#ascii_only? method' do
      expect(check("ascii_only?")).to eq [:ascii_only?, object.ascii_only?]
    end

    it '#bytes method' do
      expect(check("bytes")).to eq [:bytes, object.bytes]
    end

    it '#capitalize method' do
      expect(check("capitalize")).to eq [:capitalize, object.capitalize]
    end

    it '#capitalize! method' do
      expect(check("capitalize!")).to eq [:capitalize!, object.capitalize!]
    end

    it '#center method' do
      expect(check("center(10)")).to eq [:center, object.center(10)]
    end

    it '#chars method' do
      expect(check("chars")).to eq [:chars, object.chars]
    end

    it '#chomp method' do
      expect(check("chomp")).to eq [:chomp, object.chomp]
    end

    it '#chomp! method' do
      expect(check("chomp!")).to eq [:chomp!, object.chomp!]
    end

    it '#chop method' do
      expect(check("chop")).to eq [:chop, object.chop]
    end

    it '#chop! method' do
      expect(check("chop!")).to eq [:chop!, object.chop!]
    end

    it '#clear method' do
      expect(check("clear")).to eq [:clear, object.clear]
    end

    it '#codepoints method' do
      expect(check("codepoints")).to eq [:codepoints, object.codepoints]
    end

    it '#concat method' do
      expect(check("concat('Python')")).to eq [:concat, object.concat('Python')]
    end

    it '#count method' do
      expect(check("count('R')")).to eq [:count, object.count('R')]
    end

    it '#crypt method' do
      expect(check("crypt('siman')")).to eq [:crypt, object.crypt('siman')]
    end

    it '#delete method' do
      expect(check("delete('R')")).to eq [:delete, object.delete('R')]
    end

    it '#delete! method' do
      expect(check("delete!('R')")).to eq [:delete!, object.delete!('R')]
    end

    it '#downcase method' do
      expect(check("downcase")).to eq [:downcase, object.downcase]
    end

    it '#downcase! method' do
      expect(check("downcase!")).to eq [:downcase!, object.downcase!]
    end

    it '#dump method' do
      expect(check("dump")).to eq [:dump, object.dump]
    end

    it '#slice method' do
      expect(check("slice(0)")).to eq [:slice, object.slice(0)]
    end

    it '#byteslice method' do
      expect(check("byteslice(0)")).to eq [:byteslice, object.byteslice(0)]
    end

    it '#chr method' do
      expect(check("chr")).to eq [:chr, object.chr]
    end

    it '#each_byte method' do
      expect(check("each_byte.to_a")).to eq [:each_byte, object.each_byte.to_a]
    end

    it '#each_char method' do
      expect(check("each_char.to_a")).to eq [:each_char, object.each_char.to_a]
    end

    it '#each_codepoint method' do
      expect(check("each_codepoint.to_a")).to eq [:each_codepoint, object.each_codepoint.to_a]
    end

    it '#each_line method' do
      expect(check("each_line.to_a")).to eq [:each_line, object.each_line.to_a]
    end

    it '#encode method' do
      expect(check("encode(Encoding::UTF_8)")).to eq [:encode, object.encode(Encoding::UTF_8)]
    end

    it '#encode! method' do
      expect(check("encode!(Encoding::UTF_8)")).to eq [:encode!, object.encode!(Encoding::UTF_8)]
    end

    it '#encoding method' do
      expect(check("encoding")).to eq [:encoding, object.encoding]
    end

    it '#end_with? method' do
      expect(check("end_with?('y')")).to eq [:end_with?, object.end_with?('y')]
    end

    it '#eql? method' do
      expect(check("eql?('Python')")).to eq [:eql?, object.eql?('Python')]
    end
  end
end
