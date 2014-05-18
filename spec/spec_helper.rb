require 'shiritori'

$LOAD_PATH << File.expand_path('../../lib', __FILE__)

module Helpers
  METHOD_PATTERN = /[\w|\?|\>|\<|\=|\!|\[|\[|\]|\*|\/|\+|\-|\^|\~|\@|\%|\&|]+/

  def fake_stdin(args)
    begin
      $stdin = StringIO.new
      $stdin.puts(args.shift) until args.empty?
      $stdin.rewind
      yield
    ensure
      $stdin = STDIN
    end
  end

  def check( method, obj = same_object )
    main.exec_method_chain( method, obj )
  end

  def instance_check(ope, *args, obj: object)

    tobj = ( obj.respond_to?(:dup) )? obj.dup : obj

    if args.nil?
      expect(check(ope)).to eq [ope.to_sym, eval("#{tobj.inspect}.#{ope}")]
    else
      expect(check("#{ope}(#{args.join(',')})", obj||object)).to eq [ope.scan(METHOD_PATTERN).first.to_sym, eval("#{tobj.inspect}.#{ope}(#{args.join(',')})")]
    end
  end
end
 
RSpec.configure do |conf|
  conf.include(Helpers)
end