module Shiritori
  module SearchMethod
    UNUSE_METHOD = [:exit]

    def get_all_method
      @check_list = Hash.new(false)
      @method_list = []

      scan_method

      @method_list - UNUSE_METHOD
    end

    def singleton(klass)
      class << klass; self end 
    end 

    def scan_method(klass = BasicObject)
      @check_list[klass] = true
      @method_list |= klass.instance_methods

      ObjectSpace.each_object(singleton(klass)) do |subclass| 
        if klass != subclass
          scan_method(subclass) unless @check_list[subclass]
        end 
      end
    end
  end
end