require './convert'

class String
  def to_s
    inspect
  end
end

module Command
  include Convert

  EXIT_PATTERN = /(exit|quit)/.freeze

  def command_check(command, object)
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

    true
  end
end
