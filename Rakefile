require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "connie"
  gem.summary = %Q{Little compact library to synthesise data that does not load big files in memory}
  gem.description = %Q{Heavily based on Forgery it uses the same word sources. It's built to be a bit more customisable and allows you to define new strategies and styles both using ruby modules or big text lists.}
  gem.email = "ilpoldo@gmail.com"
  gem.license = "MIT"
  gem.email = "ilpoldo@gmail.com"
  gem.authors = ["ilpoldo"]
  
  gem.homepage = "http://github.com/ilpoldo/connie"
  gem.authors = ["Leandro Pedroni"]

end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "examplegem #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
