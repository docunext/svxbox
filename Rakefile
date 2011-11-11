require 'rubygems'
require 'rake'
require 'shoulda/tasks'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "svxbox"
    gem.summary = %Q{Miscellaneous Utilities.}
    gem.description = %Q{View the code.}
    gem.email = 'albert.lash@docunext.com'
    gem.homepage = 'http://www.savonix.com'
    gem.authors = ['Albert Lash']
    gem.rubyforge_project = ''
    gem.add_development_dependency 'shoulda'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts 'Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler'
end


task :default => :spec
