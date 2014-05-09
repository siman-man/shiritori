class NilClass
  def to_s
    "nil"
  end
end

module Command
  EXIT_PATTERN = /(exit|quit)/.freeze

  def command_check(command, object)
    case command
    when EXIT_PATTERN
      exit
    else
      begin
        eval("#{[object, command].map(&:to_s).join('.')}")
      rescue
        $stdout.puts "Undefined method."
        return false
      end
    end

    true
  end
end
