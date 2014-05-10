module Shiritori
  module SearchMethod
    def get_all_method
      @check_list = Hash.new(false)
      @method_list = []

      scan_method

      @method_list
    end

    def singleton(klass)
      class << klass; self end 
    end 

    def scan_method(klass = BasicObject)
      @check_list[klass] = true
      ObjectSpace.each_object(singleton(klass)) do |subclass| 
        if klass != subclass
          @method_list |= subclass.public_instance_methods(false)
          @method_list |= subclass.protected_instance_methods(false)
          scan_method(subclass) unless @check_list[subclass]
        end 
      end
    end
  end
end