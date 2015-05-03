gem 'rspec', '~>3'
require 'rspec/core/rake_task'

task :default => :spec

desc "Running tests"
RSpec::Core::RakeTask.new do |task|
	lab = Rake.application.original_dir
	task.pattern = "#{lab}/*_spec.rb"
	task.rspec_opts = [ "-I#{lab}", "-I#{lab}", '-f documentation', '-r ./rspec_config']

	task.verbose = false
end
