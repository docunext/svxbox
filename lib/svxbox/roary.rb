module SvxBox::Roary
  def to_param
    "#{id}-#{name.parameterize}"
  end

end
