require 'pp'
require 'readline'

module Shiritori
  class Main
    attr_reader :current_object, :chain_count, :error_count, :mode, :used_method_list
    include SearchMethod
    include View

    # ColorCode
    RED = 31
    GREEN = 32

    EXIT_PATTERN = /\A(exit|quit)\Z/.freeze
    HELP_PATTERN = /\A(help|h)\Z/.freeze
    METHOD_PATTERN = /[\w|\?|\>|\<|\=|\!|\[|\[|\]|\*|\/|\+|\-|\^|\~|\@|\%|\&|]+/.freeze

    # timelimit is 1 second
    TIME_LIMIT = 1

    def start(mode: :normal)
      welcome_message

      begin
        init(mode)
        run
      rescue Exception => ex
        puts ex.message
      ensure
        show_result
      end
    end

    def update(action: nil, object: nil)
      if action
        @all_method.delete(action)
        @used_method_list << action
        @current_object = object
        @chain_count += 1
      end

      begin
        @current_class = current_object.class
      rescue NoMethodError => ex
        @current_class = 'Undefined'
      end

      show_status(@current_chain, @current_object, @current_class, @chain_count)
      @success = true
    end

    def init(mode)
      @all_method = get_all_methods
      @current_class = Object
      @current_chain = []
      @used_method_list = []
      @chain_count = 0
      @error_count = 0
      @success = false
      @mode = mode

      require 'timeout'
      require 'ripper'

      loop do
        command = get_command
        redo if command.empty?

        begin
          Thread.new do
            Timeout.timeout(TIME_LIMIT) do
              @current_object = eval(command.chomp)
            end
          end.join

          @current_chain << @current_object.to_ss
          @success = true
          break
        rescue Exception => ex
          $error_message = ex.message
          puts "\e[#{RED}m#{$error_message}\e[m"
          redo
        end
      end

      update
    end

    def check_success
      if @success
        puts "\e[#{GREEN}mSuccess!\e[m"
        @success = false
      else
        puts "\e[#{RED}mFailed! : #{$error_message}\e[m"
      end

      new_line
    end

    def get_command(message = 'Please input first object > ')
      if Shiritori.env == :development
        print message
        $stdin.gets
      else
        Readline.readline(message, true)
      end
    end

    def run
      loop do
        command = get_command('Please input next method > ')

        break if command.nil? 
        redo if command.blank?

        command = command.chomp.sub(/^\./, '')

        begin
          begin 
            object = Marshal.load(Marshal.dump(current_object))
          rescue Exception => ex
            object = current_object
          end

          result = try_method_chain(command, object)
          
          redo unless result

          action = result.first
          object = result.last

          if action == :help
            help_me(current_object)
            redo
          elsif action == :exit
            break
          elsif @all_method.include?(action)
            puts "Exec command #{[@current_object.to_ss, command].join('.')}"
            @current_chain << command
            update(action: action, object: object)
          elsif used_method_list[action]
            $error_message = "#{action} is already used."
            raise Shiritori::UseSameMethodError
          end
        rescue Exception => ex
          @error_count += 1
          puts "\e[#{RED}m#{ex.message}\e[m"
        end

        check_success
      end
    end

    def try_method_chain(command, object)
      method_name = command.scan(METHOD_PATTERN).first.to_sym
      result = [method_name]

      case command
      when EXIT_PATTERN
        return [:exit]
      when HELP_PATTERN
        return [:help]
      else
        begin
          Thread.new do
            raise NoMethodError unless object.respond_to?(method_name)

            Timeout.timeout(TIME_LIMIT) do
              result << eval('object.' + command)
            end
          end.join
        rescue Exception => ex
          @error_count += 1
          $error_message = ex.message
          failed_message("Exec command #{[@current_object.to_ss, command].join('.')}")
          failed_message("Failed! : #{$error_message}")
          return false
        end
      end

      result
    end

    private
    def help_me(current_object)
      can_use_methods = current_object.methods - used_method_list

      new_line

      if mode == :easy
        puts "You can use methods: #{can_use_methods.sample(5).inspect}"
      else
        puts "\e[#{RED}mOh.. Sory, help command is only exist easy mode.\e[m"
      end

      new_line
    end
  end
end
