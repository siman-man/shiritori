describe "Shiritori test" do
  let(:main){ Shiritori::Main.new }

  describe "String instance methods" do
    let(:__instance__){ "Ruby" }
    let(:same_object){ "Ruby" }
    let(:object_int){ "100" }
    let(:object_complex){ "3+3i" }
    let(:object_float){ "3.14" }
    let(:object_rational){ "5/11" }
    let(:word){ "Hello" }
    
    it { instance_check("to_s") }
    it { instance_check("inspect") }
    it { instance_check("hash") }
    it { instance_check("<=>", %Q('#{__instance__}')) }
    it { instance_check("==", %Q('#{__instance__}')) }
    it { instance_check("===", %Q('#{__instance__}')) }
    it { instance_check("casecmp", %Q('#{__instance__}')) }
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
    it { instance_check("slice!", %Q(0)) }
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
    it { instance_check("gsub", %Q(/R/, 'P')) }
    it { instance_check("gsub!", %Q(/R/, 'P')) }
    it { instance_check("hex", obj: object_int) }
    it { instance_check("include?", %Q('P')) }
    it { instance_check("intern") }
    it { instance_check("to_sym") }
    it { instance_check("lines") }
    it { instance_check("ljust", %Q(10)) }
    it { instance_check("lstrip") }
    it { instance_check("lstrip!") }
    it { instance_check("oct", obj: object_int) }
    it { instance_check("ord") }
    it { instance_check("partition", %Q('u')) }
    it { instance_check("prepend", %Q('Perl')) }
    it { instance_check("reverse") }
    it { instance_check("reverse!") }
    it { instance_check("rjust", %Q(10)) }
    it { instance_check("rpartition", %Q('u')) }
    it { instance_check("rstrip") }
    it { instance_check("rstrip!") }
    it { instance_check("scan", %Q(/./)) }
    it { instance_check("setbyte", %Q(0, 67)) }
    it { instance_check("split", %Q(//)) }
    it { instance_check("squeeze") }
    it { instance_check("squeeze!") }
    it { instance_check("start_with?", %Q('R')) }
    it { instance_check("strip") }
    it { instance_check("strip!") }
    it { instance_check("sub", %Q(/R/, '')) }
    it { instance_check("sub!", %Q(/v/, '')) }
    it { instance_check("sum") }
    it { instance_check("swapcase") }
    it { instance_check("swapcase!") }
    it { instance_check("to_c", obj: object_complex) }
    it { instance_check("to_f", obj: object_float) }
    it { instance_check("to_i", obj: object_int) }
    it { instance_check("to_r", obj: object_rational) }
    it { instance_check("to_str") }
    it { instance_check("tr", %Q('a-z','A-Z')) }
    it { instance_check("tr!", %Q('0-9','A-Z')) }
    it { instance_check("tr_s", %Q('a-z','A-Z')) }
    it { instance_check("tr_s!", %Q('0-9','A-Z')) }
    it { instance_check("unpack", %Q('a4')) }
    it { instance_check("valid_encoding?") }

    it '#upto method' do
      result = check("upto('Z')","A")
      expect(result.first).to eq :upto
      expect(result.last.to_a).to eq 'A'.upto('Z').to_a
    end

    if RUBY_VERSION >= "2.1.0"
      it { instance_check("scrub") }
      it { instance_check("scrub!") }
    end
  end
end
