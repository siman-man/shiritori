module Shiritori
  module SearchMethod
    UNUSE_METHOD = [:exit]

    def get_all_method
      @check_list = {}
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
        scan_method(subclass) if klass != subclass && @check_list[subclass].nil?
      end
    end
  end
end
