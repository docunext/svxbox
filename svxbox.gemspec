Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  s.name = "svxbox"
  s.version = "0.3.1"

  s.authors = ["Albert Lash"]
  s.date = "2012-09-01"
  s.description = "View the code."
  s.summary = "Miscellaneous Utilities."
  s.email = "albert.lash@docunext.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.mkdn"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "README.mkdn",
    "Rakefile",
    "lib/svxbox.rb",
    "lib/svxbox/amazoni.rb",
    "lib/svxbox/lexicali.rb",
    "lib/svxbox/roary.rb",
    "spec/fixtures/amazon_response.xml",
    "spec/fixtures/sample_text.txt",
    "spec/spec_helper.rb",
    "spec/svxbox_spec.rb"
  ]
  s.homepage = "http://www.savonix.com"
  s.require_paths = ["lib"]
  s.rubyforge_project = ""

  s.add_dependency(%q<amazon_product>, [">= 0"])
  s.add_development_dependency(%q<rspec>, [">= 2"])
  s.add_development_dependency('rake')
  s.add_development_dependency('shoulda')
  s.add_development_dependency('fakeweb')
end
