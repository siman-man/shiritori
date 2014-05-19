module Shiritori
  class ShiritoriError < Exception
  end

  class UseSameMethodError < ShiritoriError
    def message
      "Can't use same method."
    end
  end
end
