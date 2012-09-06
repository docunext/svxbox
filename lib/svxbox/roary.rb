module SvxBox::Roary
  extend ActiveSupport::Concern

  included do
    cattr_accessor :param_suffix
    alias_method_chain :to_param, :suffix
  end

  def to_param_with_suffix
    # The aliased to_param method
    if param_suffix && self.respond_to?(param_suffix)
      suffix = self.send(param_suffix).parameterize
      return "#{to_param_without_suffix}-#{suffix}"
    else
      return to_param_without_suffix  
    end
  end

  #   class Something < ActiveRecord::Base
  #     include SvxBox::Roary
  #     to_param_suffix :name
  #
  #   end
  module ClassMethods
    def to_param_suffix(m)
      # Set the param_suffix class attribute with this method
      raise ArgumentError, "Need a symbol." unless m.is_a? Symbol 
      self.param_suffix = m
    end
    
    def per_page
      10
    end
    def paginates_per 
      self.per_page
    end
  end
end
