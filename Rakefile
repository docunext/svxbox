require 'rubygems'
require 'rake'
require 'shoulda/tasks'


task :pushit do
  system('git commit -m "pushing" -a && git push origin master')
end
task :pullgit do
  system('git pull origin master')
end
task :pulltest => [:pullgit, :test]

task :testroll => [:versioncheck, :gemspec]
task :rollgem => [:testroll, :buildgem, :pushgem]

task :versioncheck do
  @nv = File.open('VERSION') {|f| f.read }.chop
  @ov = File.open('OLDVERSION') {|f| f.read }.chop
  raise if @nv == @ov
end

task :buildgem do
  system('gem1.9.1 build svxbox.gemspec')
end

task :pushgem do
  cmd = 'gem1.8 push svxbox-' << @nv + '.gem'
  system(cmd)
  cmd = 'sudo gem1.9.1 install svxbox-' << @nv + '.gem'
  system(cmd)
  system('cp VERSION OLDVERSION')
  cmd = 'rm svxbox-' << @nv + '.gem'
  system(cmd)
end

task :pushgem => [:versioncheck]

task :frankup do
  system('ssh 192.168.8.103 "sudo gem1.9.1 install svxbox"')
end

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
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = 'rdoc'
  end
rescue LoadError
  puts 'Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler'
end


require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.ruby_opts = ['-rubygems'] if defined? Gem
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end


task :default => :test
task :spec => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION')
    version = File.read('VERSION')
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "svxbox #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
