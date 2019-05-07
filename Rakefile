require 'active_support/all'
require 'erb'
require 'rake/testtask'
require 'yard'
require 'pry'

desc 'Generate file from template'
task :generate do
  @kata     = ENV['kata']
  template  = ERB.new File.read('template.erb')
  file_name = @kata.gsub(/\s/, '_') + '.rb'

  File.write file_name, template.result(binding)
end

desc 'Generate documentation'
YARD::Rake::YardocTask.new do |t|
  t.files = ['*.rb']
end

desc 'Run tests'
Rake::TestTask.new do |t|
  t.test_files = FileList['*.rb'].
    reject {|_| _[/foo/] }
end

task :default => [:test]
