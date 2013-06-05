require 'spec_helper'

describe SvxBox do
  include SvxBox::Amazoni
  include SvxBox::Lexicali

  context "Amazoni" do
    it "search_aaws should be callable" do
      stub_get(%r|http://ecs\.amazonaws\.com/|, "amazon_response.xml")
      result = search_aaws('Books','Ruby Programming')
      #assert result.include?('buy')
    end
  end
  context "Lexicali" do
    it "search_aaws return a simple array" do
      sample_text = fixture_file('sample_text.txt')
      search = svxwc(sample_text, 2)
      search.should == "application video"
    end
  end
end
