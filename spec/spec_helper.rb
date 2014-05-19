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

  def compare_range( a, b )
    a[1] = a[1].to_a
    b[1] = b[1].to_a
  end

  def instance_check(ope, *args, obj: __instance__)

    begin
      test_obj = obj.dup
    rescue Exception => ex
      test_obj = obj
    end

    ope = ope.to_s if ope.is_a?(Symbol)

    command = "#{ope}(#{args.join(',')})"
    #puts "self."+command

    __self__ = check(command, obj||__instance__)
    other = [ope.scan(METHOD_PATTERN).first.to_sym, test_obj.instance_eval{ eval("self."+command) } ]
    
    compare_range(__self__, other) if [Range, Enumerator].include?(__self__.last.class)

    expect(__self__).to eq other
  end
end
 
RSpec.configure do |conf|
  conf.include(Helpers)
end