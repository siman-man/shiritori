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

class BasicObject
  def inspect
    self
  end 

  def to_s
    self
  end

  def respond_to?(name)
    [:==, :equal?, :!, :!=, :instance_eval, :instance_exec, :__send__, :__id__].include?(name)
  end

  def eval(str)
    instance_eval{ instance_eval(str) }
  end
end