require './convert'

class String
  def to_s
    inspect
  end
end

module Command
  include Convert

  EXIT_PATTERN = /(exit|quit)/.freeze
  METHOD_PATTERN = /[\w|\?|\>|\=|\!|\[|\[|\]]+/

  def command_check(command, object)
    method_name = command.scan(METHOD_PATTERN).first

    case command
    when EXIT_PATTERN
      exit
    else
      begin
        eval("#{[object.to_s, command].join('.')}")
      rescue
        $stdout.puts "Undefined method."
        return false
      end
    end

    method_name.to_sym
  end
end
