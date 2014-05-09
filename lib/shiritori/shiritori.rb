require './search_method'
require './command'
require './convert'

class Shiritori
  include SearchMethod
  include Command
  include Convert

  def initialize
    @all_method = get_all_method
    @current_object = Object.new
    @current_class = Object
    @current_chain = []
    init
    run
  end

  def show
    $stdout.puts "Current method chain: #{@current_chain.join('.')}"
    $stdout.puts "Current class: #{@current_class}"
    $stdout.puts "Current object: #{@current_object.inspect}"
  end

  def update
    @current_class = @current_object.class
  end

  def init
    loop do
      $stdout.print "Please input first object > "
      begin 
        str = gets.chomp
        @current_object = eval(str)
        @current_chain << @current_object.inspect
        break
      rescue
        $stdout.puts "Undefined object error"
      end
    end
    update
  end

  def run
    loop do
      show
      $stdout.print "Input next method > "
      method = gets.chomp
      method.sub!(/^\./,"")

      if command_check(method, @current_object)
        @current_object = eval("#{[@current_object.to_s, method].join('.')}")
        @current_chain << method
        update
      end
    end
  end

  def can_use?(method)
  end
end

Shiritori.new
