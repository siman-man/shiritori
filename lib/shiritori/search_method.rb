module Shiritori
  module SearchMethod
    UNUSE_METHOD = [:exit]

    def get_all_method
      @check_list = {}
      @method_list = get_all_methods

      @method_list - UNUSE_METHOD
    end

    def get_all_methods
      ObjectSpace.each_object(Module).map(&:instance_methods).inject(&:|)
    end
  end
end
