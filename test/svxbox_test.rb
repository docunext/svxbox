require File.dirname(__FILE__) + '/spec_helper'

class SvxBoxTest < Test::Unit::TestCase
  context "MarkupGuppy" do
    setup do
      @huh = "ok"
    end
    should "goback should be callable" do
      result = goback
      result.should == '<input type="button" onclick="history.go(-1);" value="Go Back" />'
    end
  end

  context "Amazoni" do
    should "search_aaws should be callable" do
      stub_get(%r|http://ecs\.amazonaws\.com/|, "amazon_response.xml")
      result = search_aaws('Books','Ruby Programming')
      assert result.include?('buy')
    end
  end
end
