require 'rubygems'
require 'bundler/setup'
require 'bundler/gem_tasks'

require 'rake'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RuboCop::RakeTask.new
RSpec::Core::RakeTask.new(:spec)

desc 'Default'
task default: [:spec, :rubocop]
