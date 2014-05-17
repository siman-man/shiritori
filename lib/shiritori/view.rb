module Shiritori
  module View
    PADDING = 2

    def new_line(num = 0)
      $stdout.puts "\n"*num
    end

    def show_status
      new_line
      chain = "#{@current_chain.join('.')}"
      chain_size = [chain.size+PADDING, 22].max

      $stdout.puts "+#{'-'*chain_size}+"
      $stdout.puts "|#{"Current method chain".center(chain_size)}|"
      $stdout.puts "+#{'-'*chain_size}+"
      $stdout.puts "|#{@current_chain.join('.').center(chain_size)}|"
      $stdout.puts "+#{'-'*chain_size}+"

      cls = "#{@current_class}"
      obj = "#{@current_object.inspect}"
      cls_size = ["#{@current_class}".size, 13].max+PADDING
      obj_size = ["#{@current_object}".size, 14].max+PADDING

      new_line
      $stdout.puts "+#{'-'*(cls_size)}+#{'-'*(obj_size)}+"
      $stdout.puts "|#{"Current Class".center(cls_size)}|#{"Current Object".center(obj_size)}|"
      $stdout.puts "+#{'-'*(cls_size)}+#{'-'*(obj_size)}+"
      $stdout.puts "|#{cls.center(cls_size)}|#{obj.center(obj_size)}|"
      $stdout.puts "+#{'-'*(cls_size)}+#{'-'*(obj_size)}+"
      new_line
      puts "Current Chain Count: #{@chain_count}"
    end
  end
end