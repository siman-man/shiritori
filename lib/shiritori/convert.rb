class String
  def to_s
    inspect
  end
end

class NilClass
  def to_s
    "nil"
  end
end

class Symbol
  def to_s
    inspect
  end
end