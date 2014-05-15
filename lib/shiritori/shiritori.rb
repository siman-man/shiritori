require 'pp'

module Shiritori
  class Main
    include SearchMethod
    include View

    EXIT_PATTERN = /(exit|quit)/.freeze
    METHOD_PATTERN = /[\w|\?|\>|\<|\=|\!|\[|\[|\]|\*|\/|\+|\-|\^|\~|\@|\%|\&|]+/.freeze

    class << self
      def start
        self.new.instance_eval do
          init
          run
        end
      end
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
      @all_method = get_all_method
      @current_object = nil
      @current_class = Object
      @current_chain = []
      @chain_count = 0

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

        puts "Exec command #{[@current_object.to_ss, method].join('.')}"

        if result = exec_method_chain(method, @current_object)
          if @all_method.include?(result.first)
            @all_method.delete(result.first)
            @current_object = result.last
            @current_chain << method
            update
          else
            $stdout.puts "Already used method."
          end
        end
      end
    end

    def exec_method_chain(command, object)
      command.sub!(/^\./,"")
      method_name = command.scan(METHOD_PATTERN).first.to_sym
      result = [ method_name ]

      case command
      when EXIT_PATTERN
        exit
      else
        begin
          Thread.new do
            raise NoMethodError unless object.respond_to?(method_name)
            result << object.instance_eval{ eval("self."+command) }
          end.join
        rescue Exception => ex
          puts ex.message
          return false
        end
      end

      result
    end
  end
end
