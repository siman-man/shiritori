module Shiritori
  module SearchMethod
    UNUSE_METHOD = [:exit, :abort]

    def get_all_methods
      ObjectSpace.each_object(Module).map(&:instance_methods).inject(&:|) - UNUSE_METHOD
    end
  end
end
