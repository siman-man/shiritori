module Shiritori
  module View
    PADDING = 2

    # ColorCode
    RED = 31
    GREEN = 32

    def new_line(num = 0)
      puts "\n" * num
    end

    def welcome_message
      width = 50
      puts "+#{'-' * width}+"
      puts "|#{' ' * width}|"
      puts "|#{'Welcome to the Shiritori!'.center(width)}|"
      puts "|#{' ' * width}|"
      puts "+#{'-' * width}+"
    end

    def failed_message(message)
      puts "\e[#{RED}m#{message}\e[m"
    end

    def input_message
    end

    def show_status(current_chain, current_object, current_class, chain_count)
      new_line
      chain = "#{current_chain.join('.')}"
      chain_size = [chain.size + PADDING, 22].max

      puts "+#{'-' * chain_size}+"
      puts "|#{'Current method chain'.center(chain_size)}|"
      puts "+#{'-' * chain_size}+"
      puts "|#{current_chain.join('.').center(chain_size)}|"
      puts "+#{'-' * chain_size}+"

      cls = "#{current_class}"
      obj = "#{current_object.to_ss}"
      cls_size = ["#{current_class}".size, 13].max + PADDING
      cnt_size = 11 + PADDING
      obj_size = ["#{current_object}".size, 14].max + PADDING

      new_line
      puts "+#{'-' * (cls_size)}+#{'-' * cnt_size}+#{'-' * (obj_size)}+"
      puts "|#{'Current Class'.center(cls_size)}|#{'Chain Count'.center(cnt_size)}|#{'Current Object'.center(obj_size)}|"
      puts "+#{'-' * (cls_size)}+#{'-' * cnt_size}+#{'-' * (obj_size)}+"
      puts "|#{cls.center(cls_size)}|#{chain_count.to_s.center(cnt_size)}|#{obj.center(obj_size)}|"
      puts "+#{'-' * (cls_size)}+#{'-' * cnt_size}+#{'-' * (obj_size)}+"
      new_line
    end

    def show_result
    end
  end
end
