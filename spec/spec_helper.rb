require 'shiritori'
require 'timeout'
require 'ripper'
require 'coveralls'

$LOAD_PATH << File.expand_path('../../lib', __FILE__)
Coveralls.wear!

module Shiritori
  def self.env
    :development
  end
end

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

  def check(method, obj = same_object)
    main.exec_method_chain(method, obj)
  end

  def compare_range(a, b)
    a[1] = a[1].to_a
    b[1] = b[1].to_a
  end

  def instance_check(operation, *args, obj: __instance__)

    begin
      if obj.is_a?(Class)
        test_obj = obj
      else
        test_obj = obj.dup
      end
    rescue Exception => ex
      test_obj = obj
    end

    operation = operation.to_s if operation.is_a?(Symbol)

    command = "#{operation}(#{args.join(',')})"

    __result__ = check(command, obj||__instance__)

    __expect__ = [operation.scan(METHOD_PATTERN).first.to_sym, eval("test_obj."+command) ]

    compare_range(__result__, __expect__) if [Range, Enumerator].include?(__result__.last.class)

    expect(__result__).to eq __expect__
  end
end
 
RSpec.configure do |conf|
  conf.include(Helpers)
end
