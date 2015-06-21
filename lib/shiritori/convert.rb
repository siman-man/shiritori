class String
  BLANK_PATTERN = /^\s*$/
  
  def blank?
    self.size == 0 or self == BLANK_PATTERN
  end
end

class NilClass
  def to_ss
    'nil'
  end
end

module Kernel
  undef_method :exit
  undef_method :abort
end

class Object
  def to_ss
    inspect
  end
end

BasicObject.class_eval do
  def __binding__
    ::Kernel.binding
  end
end

class BasicObject
  def to_ss
    self
  end

  def respond_to?(name)
    [:==, :equal?, :!, :!=, :instance_eval, :instance_exec, :__send__, :__id__].include?(name)
  end

  def eval(str)
    ::Kernel.eval(str, __binding__)
  end

  alias_method :to_s, :to_ss
end
