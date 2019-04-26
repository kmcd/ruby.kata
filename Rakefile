require 'erb'
require "rake/testtask"

# TODO: remove these & we don't need bundler
require 'active_support/all'
require "yard"

desc "Generate file from template"
task :generate do
  @kata     = ENV['kata']
  template  = ERB.new File.read('template.erb')
  file_name = @kata.gsub(/\s/, '_') + '.rb'

  File.write file_name, template.result(binding)
end

desc "Generate documentation"
YARD::Rake::YardocTask.new do |t|
  t.files = ['*.rb']
end

desc "Run tests"
Rake::TestTask.new do |t|
  t.test_files = FileList['*.rb'] #my directory to tests is 'tests' you can change at you will
end
