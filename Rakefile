require 'bundler'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

desc 'Test the svxbox lib.'
RSpec::Core::RakeTask.new('spec') do |t|
  t.pattern   = FileList['spec/**/*_spec.rb']
end
