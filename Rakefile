# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/test_*.rb']
end

require 'rubocop/rake_task'
begin
  RuboCop::RakeTask.new do |t|
    t.options = ['--display-cop-names']
  end
rescue LoadError
end
task default: %i[test rubocop]


