require 'pp'

module Shiritori
  class Main
    include SearchMethod
    include View

    EXIT_PATTERN = /(exit|quit)/.freeze
    METHOD_PATTERN = /[\w|\?|\>|\<|\=|\!|\[|\[|\]|\*|\/|\+|\-|\^|\~]+/.freeze

    def initialize
      @all_method = get_all_method
      @current_object = nil
      @current_class = Object
      @current_chain = []
      init
      run
    end

    def update
      @current_class = @current_object.class
    end

    def init
      $stdout.print "Please input first object > "
      begin 
        str = $stdin.gets.chomp
        @current_object = eval(str)
        @current_chain << @current_object.inspect
      rescue
        new_line
        $stdout.puts "Undefined object error"
      end
      update
    end

    def run
      loop do
        show
        $stdout.print "Please input next method > "
        method = $stdin.gets.chomp
        method.sub!(/^\./,"")

        if method_symbol = command_check(method, @current_object)
          if @all_method.include?(method_symbol)
            @all_method.delete(method_symbol)
            @current_object = eval("#{[@current_object.to_s, method].join('.')}")
            @current_chain << method
            update
          else
            $stdout.puts "Already used method."
          end
        end
      end
    end

    def command_check(command, object)
      method_name = command.scan(METHOD_PATTERN).first

      case command
      when EXIT_PATTERN
        exit
      else
        begin
          $stdout.puts "Exec command #{[object.to_s, command].join('.')}"

          Thread.new do
            eval("$SAFE = 3; #{[object.to_s, command].join('.')}")
          end.join
        rescue => ex
          $stdout.puts ex.message
          return false
        end
      end

      method_name.to_sym
    end
  end
end
