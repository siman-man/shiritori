module Shiritori
  class CLI < Thor
    desc "start", "Start GAME!"
    def start
      Main.new.start
    end
  end
end
