require File.join(File.dirname(__FILE__), '..', 'lib/svxbox.rb')

require 'test/unit'
require 'pathname'

require 'shoulda'
require 'matchy'
require 'mocha'
require 'fakeweb'

require File.join(File.dirname(__FILE__), '..', 'conf.rb')

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'svxbox'


class Test::Unit::TestCase
  include SvxBox::SupaBali
  include SvxBox::Amazoni
end


FakeWeb.allow_net_connect = false


def fixture_file(filename)
  return '' if filename == ''
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
  File.read(file_path)
end

def amazon_url(url)
  url =~ /^http/ ? url : "http://ecs.amazonaws.com/onca/xml#{url}"
end

def stub_request(method, url, filename, status=nil)
  options = {:body => ""}
  options.merge!({:body => fixture_file(filename)}) if filename
  options.merge!({:body => status.last}) if status
  options.merge!({:status => status}) if status

  FakeWeb.register_uri(method, url, options)
end

def stub_get(*args); stub_request(:get, *args) end
def stub_post(*args); stub_request(:post, *args) end
