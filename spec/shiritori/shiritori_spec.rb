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

  describe 'Timeout' do
    context 'Timeout::Error occur' do
      it 'first object sleep' do
        fake_stdin(%w(sleep)) do
          shiritori.start
        end

        expect(shiritori.current_object).to eq nil
        expect(shiritori.error_count).to eq 0
      end
    end

    context 'Timeout::Error occur' do
      it 'sleep method limit' do
        fake_stdin(%w(3 instance_eval{sleep(3)} to_s nil?)) do
          shiritori.start
        end

        expect(shiritori.current_object).to eq false
        expect(shiritori.chain_count).to eq 2
        expect(shiritori.error_count).to eq 1
      end
    end

    context 'Timeout::Error not occur' do
      it 'sleep method' do
        fake_stdin(%w(3 instance_eval{sleep(0)} to_s)) do
          shiritori.start
        end

        expect(shiritori.current_object).to eq '0'
        expect(shiritori.chain_count).to eq 2
        expect(shiritori.error_count).to eq 0
      end
    end
  end

  describe "Blank Input" do
    it 'should blank' do
      fake_stdin(%W("\n" 3 to_s)) do
        shiritori.start
      end

      expect(shiritori.current_object).to eq '3'
      expect(shiritori.chain_count).to eq 1
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

    it "test play 4" do
      fake_stdin(%w(18446744073709551616 times map collect find{true} gcd(1) succ chr encoding ==(Encoding::UTF_8)
        to_s slice("s") force_encoding(Encoding::CP932) next next! gsub(/u/){BasicObject} chars take(0) reverse 
        reverse! <<("HelloRuby") pack('m') upcase downcase upcase! unpack('m') shift split('') first scan(/./) 
        unshift take_while{false} to_a +([]) join('o') each_line each dup max to_i pred class extend(Module.new) 
        is_a?(Fixnum) ===(false) inspect concat("false") =~(/[a-z]/) &(1) methods flatten pop intern to_proc arity 
        |(1) divmod(0.2) min -(-5) zero? singleton_methods sort sort_by{rand} push("HelloRuby") [](-1) downcase! 
        sub(/r/){binding} swapcase %([]) to_str delete('A-Z') to_f *(1) fdiv(1) /(0.0) -@ abs **(0) round floor ceil 
        freeze odd? object_id to_r eql?(0) method(:class) call superclass new singleton_class __id__ ord even? 
        instance_eval{(1..10)} begin div(1) ^(5) ! nil?)) do

        shiritori.start
      end

      expect(shiritori.current_object).to eq false
      expect(shiritori.error_count).to eq 0
      expect(shiritori.chain_count).to eq 99
    end

    it "text play 5" do
      fake_stdin(%w("hello" send(:exit) to_i)) do
        shiritori.start
      end

      expect(shiritori.current_object).to eq 0
      expect(shiritori.chain_count).to eq 1
    end
  end
end