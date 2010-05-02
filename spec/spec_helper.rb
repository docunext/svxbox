require File.join(File.dirname(__FILE__), '..', 'lib/svxbox.rb')

require 'test/unit'
require 'shoulda'
require 'matchy'
require 'mocha'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'svxbox'

class Test::Unit::TestCase
  include SvxBox::SupaBali
  include SvxBox::Amazoni
end
