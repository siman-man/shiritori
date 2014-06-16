module Shiritori
  class ShiritoriError < Exception
  end

  class UseSameMethodError < ShiritoriError
    def message
      %q(Can't use same method.)
    end
  end

  class UndefinedObjectError < ShiritoriError
    def message
      'Undefined Object'
    end
  end
end
