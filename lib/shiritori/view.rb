module Shiritori
  module View
    PADDING = 2

    def new_line(num = 0)
      puts "\n"*num
    end

    def welcome_message
    end

    def input_message
    end

    def show_status
      new_line
      chain = "#{@current_chain.join('.')}"
      chain_size = [chain.size+PADDING, 22].max

      puts "+#{'-'*chain_size}+"
      puts "|#{"Current method chain".center(chain_size)}|"
      puts "+#{'-'*chain_size}+"
      puts "|#{@current_chain.join('.').center(chain_size)}|"
      puts "+#{'-'*chain_size}+"

      cls = "#{@current_class}"
      obj = "#{@current_object.to_ss}"
      cls_size = ["#{@current_class}".size, 13].max+PADDING
      obj_size = ["#{@current_object}".size, 14].max+PADDING

      new_line
      puts "+#{'-'*(cls_size)}+#{'-'*(obj_size)}+"
      puts "|#{"Current Class".center(cls_size)}|#{"Current Object".center(obj_size)}|"
      puts "+#{'-'*(cls_size)}+#{'-'*(obj_size)}+"
      puts "|#{cls.center(cls_size)}|#{obj.center(obj_size)}|"
      puts "+#{'-'*(cls_size)}+#{'-'*(obj_size)}+"
      new_line
      puts "Current Chain Count: #{@chain_count}"
    end
  end
end