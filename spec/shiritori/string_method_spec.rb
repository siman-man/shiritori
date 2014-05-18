require 'spec_helper'

describe "Shiritori test" do
  let(:main){ Shiritori::Main.new }

  describe "String instance methods" do
    let(:object){ "Ruby" }
    let(:same_object){ "Ruby" }
    let(:object_int){ "100" }
    let(:word){ "Hello" }
    let(:num){ 100 }

    
    it { instance_check("to_s") }
    it { instance_check("inspect") }
    it { instance_check("hash") }
    it { instance_check("<=>", %Q('#{object}')) }
    it { instance_check("==", %Q('#{object}')) }
    it { instance_check("===", %Q('#{object}')) }
    it { instance_check("casecmp", %Q('#{object}')) }
    it { instance_check("+", %Q('#{word}')) }
    it { instance_check("*", %Q(3)) }
    it { instance_check("%", %Q(3)) }
    it { instance_check("[]", %Q(0)) }
    it { instance_check("[]=", 0, %Q('P')) }
    it { instance_check("insert", 0, %Q('Perl')) }
    it { instance_check("length") }
    it { instance_check("size") }
    it { instance_check("bytesize") }
    it { instance_check("empty?") }
    it { instance_check("=~", %Q(/R/)) }
    it { instance_check("match", %Q(/R/)) }
    it { instance_check("succ") }
    it { instance_check("succ!") }
    it { instance_check("next") }
    it { instance_check("next!") }
    it { instance_check("index", %Q('R')) }
    it { instance_check("rindex", %Q('R')) }
    it { instance_check("replace", %Q('Python')) }
    it { instance_check("ascii_only?") }
    it { instance_check("bytes") }
    it { instance_check("capitalize") }
    it { instance_check("capitalize!") }
    it { instance_check("center", %Q(10)) }
    it { instance_check("chars") }
    it { instance_check("chomp") }
    it { instance_check("chomp!") }
    it { instance_check("chop") }
    it { instance_check("chop!") }
    it { instance_check("clear") }
    it { instance_check("codepoints") }
    it { instance_check("concat", %Q('Python')) }
    it { instance_check("count", %Q('R')) }
    it { instance_check("crypt", %Q('siman')) }
    it { instance_check("delete", %Q('R')) }
    it { instance_check("delete!", %Q('R')) }
    it { instance_check("downcase") }
    it { instance_check("downcase!") }
    it { instance_check("dump") }
    it { instance_check("slice", %Q(0)) }
    it { instance_check("byteslice", %Q(0)) }
    it { instance_check("chr") }
    it { instance_check("each_byte.to_a") }
    it { instance_check("each_char.to_a") }
    it { instance_check("each_codepoint.to_a") }
    it { instance_check("each_line.to_a") }
    it { instance_check("encode", %Q(Encoding::UTF_8)) }
    it { instance_check("encode!", %Q(Encoding::UTF_8)) }
    it { instance_check("encoding") }
    it { instance_check("end_with?", %Q('y')) }
    it { instance_check("eql?", %Q('Python')) }
    it { instance_check("force_encoding", %Q('UTF-8')) }
    it { instance_check("getbyte", %Q(0)) }
    it { instance_check("gsub", %Q(/R/), %Q('P')) }
    it { instance_check("gsub!", %Q(/R/), %Q('P')) }
    it { instance_check("hex", obj: object_int) }

    it '#upto method' do
      result = check("upto('Z')","A")
      expect(result.first).to eq :upto
      expect(result.last.to_a).to eq 'A'.upto('Z').to_a
    end

    it '#include? method' do
      expect(check("include?('P')")).to eq [:include?, object.include?('P')]
    end

    it '#intern method' do
      expect(check("intern")).to eq [:intern, object.intern]
    end

    it '#to_sym method' do
      expect(check("to_sym")).to eq [:to_sym, object.to_sym]
    end

    it '#lines method' do
      expect(check("lines")).to eq [:lines, object.lines]
    end
  end
end
