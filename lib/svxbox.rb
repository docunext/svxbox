require File.dirname(__FILE__) + '/svxbox/lexicali'
require File.dirname(__FILE__) + '/svxbox/amazoni'

module SvxBox
  if defined?(Rails)
    autoload :Immutable, File.dirname(__FILE__) + '/svxbox/immutable' 
    autoload :Roary, File.dirname(__FILE__) + '/svxbox/roary' 
  end
end
