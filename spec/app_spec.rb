require File.dirname(__FILE__) + '/spec_helper'

class SvxBoxTest < Test::Unit::TestCase
  context "MarkupGuppy" do
    should "goback should be callable" do
      result = goback
      result.should == '<input type="button" onclick="history.go(-1);" value="Go Back" />'
    end
  end
  
  context "Amazoni" do
    should "search_aaws should be callable" do
      result = search_aaws('Books','Ruby Programming')
    end
  end
end
