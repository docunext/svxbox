module SvxBox::Roary
  extend ActiveSupport::Concern

  included do
    cattr_reader :param_suffix
    alias_method_chain :to_param, :suffix
  end

  def to_param_with_suffix
    if param_suffix && self.respond_to?(param_suffix)
      suffix = send(param_suffix).parameterize
      return "#{to_param_without_suffix}-#{suffix}"
    else
      return to_param_without_suffix  
    end
  end

  module ClassMethods
    # Set the param_suffix class attribute
    def to_param_suffix(m)
      raise ArgumentError, "Need a symbol." unless m.is_a? Symbol 
      @@param_suffix = m
    end
  end
end
