module SvxBox::Immutable
  def readonly?
    persisted? 
  end

  def destroy
    raise ActiveRecord::ReadOnlyRecord 
  end

  def delete
    self.destroy
  end
end
