require File.dirname(__FILE__) + '/spec_helper'

class SvxBoxTest < Test::Unit::TestCase
  context "when starting" do
    should "goback should be callable" do
      result = goback
      result.should == '<input type="button" onclick="history.go(-1);" value="Go Back" />'
    end
  end
end
