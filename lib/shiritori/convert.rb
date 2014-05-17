class String
  BLANK_PATTERN = /\A\s*\z/
  
  def blank?
    BLANK_PATTERN === self
  end
end

class NilClass
  def to_ss
    "nil"
  end
end

class Object
  def to_ss
    inspect
  end
end

class BasicObject
  def inspect
    self
  end 

  def to_ss
    self
  end

  def respond_to?(name)
    [:==, :equal?, :!, :!=, :instance_eval, :instance_exec, :__send__, :__id__].include?(name)
  end

  def eval(str)
    instance_eval{ instance_eval(str) }
  end
end