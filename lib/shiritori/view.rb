module Shiritori
  module View
    PADDING = 2

    def new_line(num = 0)
      $stdout.puts "\n"*num
    end

    def show
      new_line
      $stdout.puts "Current method chain: #{@current_chain.join('.')}"

      cls = "#{@current_class}"
      obj = "#{@current_object.inspect}"
      cls_size = ["#{@current_class}".size, 13].max+PADDING
      obj_size = ["#{@current_object.inspect}".size, 14].max+PADDING

      new_line
      $stdout.puts "+#{'-'*(cls_size)}+#{'-'*(obj_size)}+"
      $stdout.puts "|#{"Current Class".center(cls_size)}|#{"Current Object".center(obj_size)}|"
      $stdout.puts "+#{'-'*(cls_size)}+#{'-'*(obj_size)}+"
      $stdout.puts "|#{cls.center(cls_size)}|#{obj.center(obj_size)}|"
      $stdout.puts "+#{'-'*(cls_size)}+#{'-'*(obj_size)}+"
      new_line
    end
  end
end