require 'pp'

module Shiritori
  class Main
    attr_reader :current_object, :chain_count
    include SearchMethod
    include View

    RED = 31
    GREEN = 32

    EXIT_PATTERN = /(exit|quit)/.freeze
    METHOD_PATTERN = /[\w|\?|\>|\<|\=|\!|\[|\[|\]|\*|\/|\+|\-|\^|\~|\@|\%|\&|]+/.freeze

    def start(option = [])
      init
      run
    end

    def update(result = nil)
      if result
        @all_method.delete(result.first)
        @current_object = result.last
        @chain_count += 1
      end

      begin
        @current_class = @current_object.class
      rescue Exception => ex
        @current_class = "Undefined"
      end

      @success = true
    end

    def init
      @all_method = get_all_method
      @current_object = nil
      @current_class = Object
      @current_chain = []
      @chain_count = 0
      @success = false

      loop do
        print "Please input first object > "

        begin 
          str = $stdin.gets.chomp
          @current_object = eval(str)
          @current_chain << @current_object.to_ss
          @success = true
          break
        rescue Exception => ex
          new_line
          $stdout.puts "Undefined object error"
          redo
        end
      end

      update
    end

    def success?
      @success
    end

    def run

      loop do
        show_status

        if success?
          puts "\e[#{GREEN}mSuccess!\e[m"
          @success = false
        else
          puts "\e[#{RED}mFailed!\e[m"
        end

        new_line

        print "Please input next method > "      
        command = $stdin.gets

        break if command.nil?
        redo if command.blank?

        command = command.chomp.sub(/^\./,"")

        puts "Exec command #{[@current_object.to_ss, command].join('.')}"

        begin
          if result = exec_method_chain(command, @current_object)
            if @all_method.include?(result.first)
              update(result)
              @current_chain << command
            elsif result.first == :exit
              break
            else
              puts "Already used method."
            end
          end
        rescue Exception => ex
          puts ex.message
        end
      end
    end

    def exec_method_chain(command, object)
      method_name = command.scan(METHOD_PATTERN).first.to_sym
      result = [ method_name ]

      # puts debug
      # puts "Exec command #{[object.to_ss, command].join('.')}"
      # p method_name

      case command
      when EXIT_PATTERN
        return [:exit]
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
