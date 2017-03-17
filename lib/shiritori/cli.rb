module Shiritori
  class CLI
    GAME_MODE = [:easy, :normal]

    def start(options)
      mode = (options[:mode])? options[:mode].to_sym : :normal

      if GAME_MODE.include?(mode)
        Main.new.start(mode: mode)
      else
        puts "Mode is not only easy or normal."
      end
    end
  end
end
