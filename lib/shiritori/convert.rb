class String
  BLANK_PATTERN = /^[[:space:]]*$/
  
  def blank?
    self.size == 0 or self == BLANK_PATTERN
  end
end

class NilClass
  def __to_s__
    'nil'
  end
end

module Kernel
  undef_method :exit
  undef_method :abort
end

class Object
  def __to_s__
    inspect
  end
end

BasicObject.class_eval do
  def __binding__
    ::Kernel.binding
  end
end

class BasicObject
  def __to_s__
    self
  end

  def respond_to?(name)
    [:==, :equal?, :!, :!=, :instance_eval, :instance_exec, :__send__, :__id__].include?(name)
  end

  def eval(str)
    ::Kernel.eval(str, __binding__)
  end

  alias_method :to_s, :__to_s__
end
