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
  context "Lexicali" do
    should "search_aaws return a simple array" do
      sample_text = fixture_file('sample_text.txt')
      search = svxwc(sample_text)
      assert_equal search, "application test"
    end
  end
  context "Sinatricus" do
    should "put msg when in development mode" do
      ENV['RACK_ENV'] = 'development'
      result = copy_stdout do
        svx_debug('testing')
      end
      assert_equal "testing\n", result.string
    end
    
    should "process block as debug output" do
      ENV['RACK_ENV'] = 'development'
      result = copy_stdout do
        svx_debug { 'testing' }
      end
      assert_equal "testing\n", result.string
    end
    should "process block as debug output via chain" do
      ENV['RACK_ENV'] = 'development'
      result = copy_stdout do
        svx_debug_t { 'testing' }
      end
      assert_equal "testing\n", result.string
    end
    
    should "not put msg when in production mode" do
      ENV['RACK_ENV'] = 'production'
      result = copy_stdout do
        svx_debug('testing')
      end
      assert_equal '', result.string
    end
  end
end
