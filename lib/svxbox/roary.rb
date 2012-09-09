module SvxBox::Roary
  extend ActiveSupport::Concern

  included do
    cattr_accessor :param_suffix
    before_validation :ensure_param_key_has_value, :if => :param_key_attribute?
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

  def to_param
    return self.param_key if param_key_attribute?
    super
  end

  def param_key_attribute?
    self.class.attribute_method?(:param_key)
  end

  private

  def ensure_param_key_has_value
    return unless self.param_key.nil?
    self.param_key = Time.now.to_i.to_s
  end


  #   class Something < ActiveRecord::Base
  #     include SvxBox::Roary
  #     to_param_suffix :name
  #
  #   end
  module ClassMethods
    def updated_at
      last_updated.updated_at
    end

    def last_updated
      order(:updated_at).last
    end

    def to_param_suffix(m)
      # Set the param_suffix class attribute with this method
      raise ArgumentError, "Need a symbol." unless m.is_a? Symbol 
      self.class_eval "alias_method_chain :to_param, :suffix"
      self.param_suffix = m
    end
    
    def per_page
      10
    end

    def paginates_per 
      self.per_page
    end

    def exists?(key)
      return super if !self.attribute_method?(:param_key)
      return true if super 
      where("param_key = ?", key.to_s).exists?
    end

    def find(key)
      return super if !self.attribute_method?(:param_key)
      begin
        where("param_key = ?", key.to_s).first!
      rescue ActiveRecord::RecordNotFound
        super
      end
    end


        


  end
end
