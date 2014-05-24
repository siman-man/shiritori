require 'pp'
require 'readline'

module Shiritori
  class Main
    attr_reader :current_object, :chain_count
    include SearchMethod
    include View

    RED = 31
    GREEN = 32

    EXIT_PATTERN = /\A(exit|quit)\Z/.freeze
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
      $error_message = nil

      loop do

        command = get_command

        begin 
          @current_object = eval(command.chomp)
          @current_chain << @current_object.to_ss
          @success = true
          break
        rescue Exception => ex
          new_line
          $error_message = "Undefined object error"
          redo
        end
      end

      update
    end

    def success?
      @success
    end

    def get_command(message = "Please input first object > ")
      if Shiritori.env == :development
        print message
        $stdin.gets
      else
        Readline.readline(message, true)
      end
    end

    def run

      loop do
        show_status

        if success?
          puts "\e[#{GREEN}mSuccess!\e[m"
          @success = false
        else
          puts "\e[#{RED}mFailed! : #{$error_message}\e[m"
        end

        new_line

        command = get_command("Please input next method > ")

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
              $error_message = "Already used method."
            end
          end
        rescue Exception => ex
          puts "\e[#{RED}m#{ex.message}\e[m"
        end
      end
    end

    def exec_method_chain(command, object)
      method_name = command.scan(METHOD_PATTERN).first.to_sym
      result = [ method_name ]

      case command
      when EXIT_PATTERN
        return [:exit]
      else
        begin
          Thread.new do
            raise NoMethodError unless object.respond_to?(method_name)

            result << eval("object."+command)
          end.join
        rescue Exception => ex
          $error_message = ex.message
          return false
        end
      end

      result
    end
  end
end
