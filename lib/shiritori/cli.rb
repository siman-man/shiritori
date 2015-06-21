module Shiritori
  class CLI < Thor
    GAME_MODE = [:easy, :normal]

    desc "start", "Start GAME!"
    option :mode
    def start
      mode = (options[:mode])? options[:mode].to_sym : :normal

      if GAME_MODE.include?(mode)
        Main.new.start(mode: mode)
      else
        puts "Mode is not only easy or normal."
      end
    end
  end
end
