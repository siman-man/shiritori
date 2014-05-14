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
      @chain_count = 0
      init
      run
    end

    def update
      begin
        @current_class = @current_object.class
      rescue Exception => ex
        @current_class = "Undefined"
      end
      @chain_count += 1
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
        puts "Current Chain Count: #{@chain_count}"
        $stdout.print "Please input next method > "
        method = $stdin.gets.chomp
        method.sub!(/^\./,"")

        if method_symbol = command_check(method, @current_object)
          if @all_method.include?(method_symbol)
            @all_method.delete(method_symbol)
            #@current_object = eval("#{[@current_object.to_s, method].join('.')}")
            @current_object = @current_object.instance_eval{ eval("self."+method) }
            @current_chain << method
            update
          else
            $stdout.puts "Already used method."
          end
        end
      end
    end

    def command_check(command, object)
      method_name = command.scan(METHOD_PATTERN).first.to_sym

      case command
      when EXIT_PATTERN
        exit
      else
        begin
          puts "Exec command #{[object.to_s, command].join('.')}"

          Thread.new do
            raise NoMethodError unless object.respond_to?(method_name)
            object.instance_eval{ eval("self."+command) }
            #eval("#{[object.to_s, command].join('.')}")
          end.join
        rescue Exception => ex
          puts ex.message
          return false
        end
      end

      method_name
    end
  end
end
