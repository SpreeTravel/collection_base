require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new

task :default do
  Rake::Task[:spec].invoke
end

desc 'Run specs'
RSpec::Core::RakeTask.new do |t|
  t.pattern = './spec/**/*_spec.rb'
end

desc 'Generate code coverage'
RSpec::Core::RakeTask.new(:coverage) do |t|
  t.rcov = true
  t.rcov_opts = ['--exclude', '/gems/,spec']
end
