module Shiritori
  module SearchMethod
    UNUSE_METHOD = [:exit]

    def get_all_method
      @check_list = {}
      @method_list = scan_methods

      @method_list - UNUSE_METHOD
    end

    def scan_methods(klass = BasicObject)
      klasses = ObjectSpace.each_object(Class).to_a
      klasses |= klasses.map(&:singleton_class)

      klasses.map(&:instance_methods).inject(&:|)
    end
  end
end
