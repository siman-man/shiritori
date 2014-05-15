require 'spec_helper'

describe "Shiritori test" do
  let(:main){ Shiritori::Main.new }

  describe "Fixnum instance methods" do
    let(:object){ 16 }

    def check( method )
      main.exec_method_chain( method, object )
    end

    it '#to_s method' do
      expect(check("to_s")).to eq [:to_s, object.to_s]
      expect(check("to_s(2)")).to eq [:to_s, object.to_s(2)]
      expect(check("to_s(8)")).to eq [:to_s, object.to_s(8)]
      expect(check("to_s(16)")).to eq [:to_s, object.to_s(16)]
    end

    it '#inspect method' do
      expect(check("inspect")).to eq [:inspect, object.inspect]
    end

    it '#-@ method' do
      expect(check("-@")).to eq [:-@, object.-@]
    end

    it "#+ method" do
      expect(check("+(3)")).to eq [:+, object.+(3)]
    end

    it '#- method' do
      expect(check("-(3)")).to eq [:-, object.-(3)]
    end

    it '#* method' do
      expect(check("*(3)")).to eq [:*, object.*(3)]
    end

    it '#/ method' do
      expect(check("/(3)")).to eq [:/, object./(3)]
    end

    it '#div method' do
      expect(check("div(3)")).to eq [:div, object.div(3)]
    end

    it '#% method' do
      expect(check("%(3)")).to eq [:%, object.%(3)]
    end

    it '#modulo method' do
      expect(check("modulo(3)")).to eq [:modulo, object.modulo(3)]
    end

    it '#divmod method' do
      expect(check("divmod(3)")).to eq [:divmod, object.divmod(3)]
    end

    it '#fdiv method' do
      expect(check("fdiv(3)")).to eq [:fdiv, object.fdiv(3)]
    end

    it '#** method' do
      expect(check("**(7)")).to eq [:**, object.**(7)]
    end

    it '#abs method' do
      expect(check("abs")).to eq [:abs, object.abs]
    end

    it '#magnitude method' do
      expect(check("magnitude")).to eq [:magnitude, object.magnitude]
    end

    it '#== method' do
      expect(check("==(#{object})")).to eq [:==, object.==(object)]
      expect(check("==(#{object-1})")).to eq [:==, object.==(object-1)]
    end

    it '#=== method' do
      expect(check("===(#{object})")).to eq [:===, object.===(object)]
      expect(check("===(#{object-1})")).to eq [:===, object.===(object-1)]
    end

    it '#<=> method' do
      expect(check("<=>(#{object})")).to eq [:<=>, object.<=>(object)]
      expect(check("<=>(#{object+1})")).to eq [:<=>, object.<=>(object+1)]
      expect(check("<=>(#{object-1})")).to eq [:<=>, object.<=>(object-1)]
    end

    it '#> method' do
      expect(check(">(#{object})")).to eq [:>, object.>(object)]
      expect(check(">(#{object-1})")).to eq [:>, object.>(object-1)]
    end

    it '#>= method' do
      expect(check(">=(#{object})")).to eq [:>=, object.>=(object)]
      expect(check(">=(#{object-2})")).to eq [:>=, object.>=(object-2)]
    end

    it '#< method' do
      expect(check("<(#{object})")).to eq [:<, object.<(object)]
      expect(check("<(#{object+1})")).to eq [:<, object.<(object+1)]
    end

    it '#<= method' do
      expect(check("<=(#{object})")).to eq [:<=, object.<=(object)]
      expect(check("<=(#{object+2})")).to eq [:<=, object.<=(object+2)]
    end

    it '#~ method' do
      expect(check("~")).to eq [:~, object.~]
    end

    it '#& method' do
      expect(check("&(-1)")).to eq [:&, object.&(-1)]
    end

    it '#| method' do
      expect(check("|(1)")).to eq [:|, object.|(1)]
    end

    it '#^ method' do
      expect(check("^(-1)")).to eq [:^, object.^(-1)]
    end

    it '#[] method' do
      expect(check("[](0)")).to eq [:[], object.[](0)]
    end

    it '#<< method' do
      expect(check("<<(3)")).to eq [:<<, object.<<(3)]
    end

    it '#>> method' do
      expect(check(">>(3)")).to eq [:>>, object.>>(3)]
    end

    it '#to_f method' do
      expect(check("to_f")).to eq [:to_f, object.to_f]
    end

    it '#size method' do
      expect(check("size")).to eq [:size, object.size]
    end

    it '#bit_length method' do
      expect(check("bit_length")).to eq [:bit_length, object.bit_length]
    end

    it '#zero? method' do
      expect(check("zero?")).to eq [:zero?, object.zero?]
    end

    it '#odd? method' do
      expect(check("odd?")).to eq [:odd?, object.odd?]
    end

    it '#even? method' do
      expect(check("even?")).to eq [:even?, object.even?]
    end

    it '#succ method' do
      expect(check("succ")).to eq [:succ, object.succ]
    end
  end
end
