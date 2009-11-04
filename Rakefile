require 'rake/testtask'

desc 'Run all tests'
task :default => :test

desc 'Run all tests'
task :test => ['test:units', 'test:functionals']

desc 'Load environment'
task :environment do
  require 'environment'
end

namespace :test do
  desc 'Prepare test environment'
  task :prepare do
    ENV['RACK_ENV'] = 'test'
  end

  Rake::TestTask.new(:units => :prepare) do |test|
    test.libs << 'test'
    test.pattern = 'test/units/**/*_test.rb'
    test.verbose = true
  end
  Rake::Task['test:units'].comment = 'Run the unit tests in test/units'

  Rake::TestTask.new(:functionals => :prepare) do |test|
    test.libs << 'test'
    test.pattern = 'test/functionals/**/*_test.rb'
    test.verbose = true
  end
  Rake::Task['test:functionals'].comment = 'Run the functional tests in test/functionals'
end
